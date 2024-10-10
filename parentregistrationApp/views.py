from django.contrib.auth import get_user_model, logout, update_session_auth_hash
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render,redirect, HttpResponse, resolve_url
from django.urls import reverse
from django.views.generic.base import View
from .otp_conf import sentotp
from django.contrib import messages
from .models import(   AdministrativePost, 
                        Municipality, Parent,
                      Parentcode, Student, 
                      Suco, User, Village)
from .forms import (LoginForm, 
                    ParentForm, 
                    ParentFormUpdate, 
                    StudentForm, 
                    ParentFormRegist, 
                    AddressForm,
                    VillageForm, 
                    CustomPasswordChangeForm)

from django.contrib.auth.views import LoginView
from django.contrib.auth.decorators import login_required

def send_otp_view(request):
    if request.method == 'POST':
        phone_numb = request.POST.get('phone')  # Use get() for safer key access
        #phone_numb = phone_numb.strip()  # Strip any leading/trailing spaces
        print("Your phone number is:", phone_numb)  # Debug print

        # if not phone_numb:
        #     messages.error(request, "Please enter a valid phone number.")
        #     return redirect('send_otp')  # Replace with your actual view name or URL pattern

        try:
            # Debug: check if the phone exists
            parent_code = User.objects.get(username=phone_numb)
            print("Parent code retrieved:", parent_code)  # Debug print

            # Sending the OTP
            sentotp(phone_numb, parent_code.code)
            messages.success(request, 'OTP code has been sent to your phone number.')
            return redirect('verify_otp')  # Replace with your actual success page or URL pattern
        except Parentcode.DoesNotExist:
            messages.error(request, "The phone number was not found.")
            
            return HttpResponse(f"<p>Ami husu deskulpa maibe ita bot nia numeru la rejistu iha ami nia sistema</p>\
                     <a href='{reverse('send_otp')}'>Click</a>")#eplace with your actual view name or URL pattern
    
    return render(request, 'otp/otp_code.html')

def otp_verify(request):
    if request.method == 'POST':
        otp_number = request.POST['otp']
        try :
            parent_code = Parentcode.objects.get(code = otp_number)
            messages.success(request,"OTP has verified ")
            return redirect('/')
        except Parentcode.DoesNotExist:
        
            messages.error('Invalid OTP CODE')
    return render(request, 'otp/verify_otp.html')
    
class Login_View(LoginView):
    model = get_user_model()
    form_class = LoginForm
    template_name = 'registration/login.html'

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            messages.success(request,"Ita Login ho susesu")
            return redirect(resolve_url('parent-dashboard'))
        return super().dispatch(request, *args, **kwargs)

    def get_success_url(self):
        if self.request.user.is_authenticated:
            messages.success(self.request,"Ita Login ho susesu")
            return resolve_url('parent-dashboard')
        return super().get_success_url()
    
    def form_invalid(self, form):
        messages.error(self.request, "Kredensiais la diak. Tenta fali.")
        return super().form_invalid(form)
    
class Logout_View(View):
    def get(self,request):
        logout(self.request)
        messages.success(request, "ita Logout ho susesu adeus")
        return redirect ('login',permanent=True)

def registration_parent_view(request):
    if request.method == 'POST':
        add_form = AddressForm(request.POST)
        form = ParentForm(request.POST)
        parent_add = ParentFormRegist(request.POST)
        
        # Debugging prints
        print("Bug", parent_add.is_valid())
        print("Second bug", form.is_valid())
        
        if form.is_valid() and parent_add.is_valid():
            user = form.save()
            parent = Parent.objects.get(user=user)
            parent.municipality = parent_add.cleaned_data['municipality']
            parent.administrative_post = parent_add.cleaned_data['administrative_post']
            parent.suco = parent_add.cleaned_data['suco']
            parent.village = parent_add.cleaned_data['village']
            parent.save()
            messages.success(request, "Ita nia rejistu halo ho susesu")
            return redirect('/login')
        else:
            # If forms are invalid, add error message
            messages.error(request, "Rejistu falta buat ruma ou karik. Favór, hare erro sira iha kraik.")
    
    else:
        form = ParentForm()
        parent_add = ParentFormRegist()
        add_form = AddressForm()

    return render(request, 'registration/register.html', {
        'form': form, 
        'parent_add': parent_add, 
        'add_form': add_form
    })
    
def parent_update(request):
    id = request.user.id
    print(id)
    parent = get_object_or_404(Parent, user=id)
    print(parent.id)
   # user = get_object_or_404(User, pk=id)
    if request.method == 'POST':
        form = ParentFormUpdate(request.POST, instance=parent)
        if form.is_valid():
            user = User.objects.get(id=id)
            user.first_name = form.cleaned_data['first_name']
            user.last_name = form.cleaned_data['last_name']
            user.email = form.cleaned_data['email']
            user.save()
            form.save()
            return redirect('parent-dashboard')
    else:
        form =ParentFormUpdate(instance=parent)
    return render(request, 'parent/parent_edit.html', {'form': form})

@login_required
def parent_home(request):
    id = request.user.id
    parent = get_object_or_404(Parent, user=id)
    print("parent:", parent.id)
    
    students = Student.objects.filter(parent=parent).select_related('code')
    
    if request.method == 'POST':
        """Create New Student Logic"""
        form = StudentForm(request.POST)
        if form.is_valid():
            student = form.save(commit=False)
            student.parent = parent
            student.save()
            return redirect('parent-dashboard')
        
        """Edit Parent Logic"""
        parent_edit = ParentFormUpdate(request.POST, instance=parent)
        if parent_edit.is_valid():
            user = User.objects.get(id=id)
            user.first_name = parent_edit.cleaned_data['first_name']
            user.last_name = parent_edit.cleaned_data['last_name']
            user.email = parent_edit.cleaned_data['email']
            user.save()
            parent_edit.save()
            return redirect('parent-dashboard')
        
        """Change Password"""
        chang_pass = CustomPasswordChangeForm(request.user, request.POST)
        if chang_pass.is_valid():
            user = chang_pass.save()
            update_session_auth_hash(request, user)  # Important!
            return redirect('parent-dashboard')
    
    else:
        form = StudentForm()
        parent_edit = ParentFormUpdate(instance=parent)
        chang_pass = CustomPasswordChangeForm(request.user)

    context = {
        'students': students,
        'form': form,
        'parent_edit': parent_edit,
        'chang_pass': chang_pass,
      #  'student_form': student_edit,
    }

    return render(request, 'parent/home_parent.html', context=context)

def student_edit_view(request, id):
    student = get_object_or_404(Student, id=id)
    if request.method == 'POST':
        form = StudentForm(request.POST, instance=student)
        if form.is_valid():
            form.save()
            messages.success(request,"Naran labarik update ho susesu!")
            return redirect('parent-dashboard')
    else:
        form = StudentForm(instance=student)
        return render(request, 'childreen/student_edit.html', {'form_edit': form})


def student_delete_view(request, id):
    student = get_object_or_404(Student, id=id)
    student.delete()

    if request.headers.get('HX-Request'):
        # Return a JSON response telling HTMX to redirect
        return JsonResponse({'redirect': True, 'url': '/'})

    #return redirect('parent-dashboard')


def reset_password(request):
    id = request.user.id
    user = get_object_or_404(User,id= id)
    if request.method=='POST':
        chang_pass = CustomPasswordChangeForm(request.user, request.POST)
        if chang_pass.is_valid():
            user = chang_pass.save()
            update_session_auth_hash(request, user)  # Important!
            return redirect('parent-dashboard')
    else:
        chang_pass = CustomPasswordChangeForm(request.user)
    return render (request, 'parent/change_password.html', {'change_password':chang_pass})

def chang_password(request, id):
    user = get_object_or_404(User, id=id)
    if request.method =='POST':
        pass
    return render(request, 'dashboard/change_passsword.html', {})

@login_required
def list_user(request):
    id = request.user.id
    print("user:",id)
    parent = get_object_or_404(Parent, user=id)
    print("parent:",parent.id)

    user =User.objects.all()
    return render(request, 'dashboard/users.html', {'user':user,'parent':parent})

def disable_user(request):
    pass
def activate_user(request):
    pass

def list_municipality_view(request):
    village = Village.objects.all()
    if request.method == 'POST':
        add_village = VillageForm(request.POST)
        if add_village.is_valid():
            add_village.save()
            return redirect('parent-dash')
    else:
        add_village= VillageForm()
    
    return render(request, 'municipality/municipality.html', {'add_village':add_village,'village':village, })

def list_posto_administrative(request):
    municipality_id = request.GET.get('municipality')
    print(municipality_id)
    print(municipality_id)
    posto  = AdministrativePost.objects.filter(municipality_id =municipality_id)
    return render(request, 'municipality/posto_option.html', {'postos':posto} )
    

def list_suco(request):
    administrative_id = request.GET.get('administrative_post')
    print(administrative_id)
    sucos = Suco.objects.filter(posto_id = administrative_id)
    print(sucos)
    return render(request, 'municipality/suco_option.html', {'sucos':sucos} )

def list_village(request):
    sucos_id = request.GET.get('suco')
    print(sucos_id)
    village = Village.objects.filter(suco_id = sucos_id)
    print(village)
    return render(request, 'municipality/aldea_option.html', {'village':village} )

def parent_update(request):
    id = request.user.id
    print(id)
    parent = get_object_or_404(Parent, user=id)
    print(parent.id)
   # user = get_object_or_404(User, pk=id)
    if request.method == 'POST':
        form = ParentFormUpdate(request.POST, instance=parent)
        if form.is_valid():
            user = User.objects.get(id=id)
            user.first_name = form.cleaned_data['first_name']
            user.last_name = form.cleaned_data['last_name']
            user.email = form.cleaned_data['email']
            user.save()
            form.save()
            return redirect('parent-dashboard')
    else:
        form =ParentFormUpdate(instance=parent)
    return render(request, 'parent/parent_edit.html', {'form': form})

def register_student_view(request, id):
    parent = get_object_or_404(Parent, id=id)
    if request.method == 'POST':
        form = StudentForm(request.POST)
        if form.is_valid():
            student = form.save(commit=False)
            student.parent = parent
            student.save()
            return redirect('parent-dashboard')  # Redirect to a view displaying the list of students
    else:
        form = StudentForm()
    return render(request, 'childreen/student-form.html', {'form': form})

def phone_num_val(request):
    phone_nums = request.POST.get('username')
   # print(f"Input phone number: {phone_nums}")  # Debugging output
    print(phone_nums)

    if Parent.objects.filter(phone__iexact=phone_nums).exists():
        print(True)
        return HttpResponse(" <p class='errors' id='phoneError'>Phone Number ne rejistadu tena</p> \
                <button type='submit' class='btn btn-secondary' id='submitBtn' disable> submit</button>")
    else:
        return HttpResponse("<p class='errors' id='phoneError'></p> \
                <button type='submit' class='btn btn-primary' id='submitBtn'> submit</button> ")


def all_parents(request):
    parents = Parent.objects.all()
    count_parents = Parent.objects.count()
    children = Student.objects.count()
    context ={
        'parents':parents,
        'counts_parents':count_parents,
        'child':children
    }
    return render(request, 'parent/all_parents.html',context=context)

class PhoneValidation(View):

    def get(self, request, *args, **kwargs):
        username = request.GET.post("username")
        if Parent.objects.filter(phone=username).exists():
            return HttpResponse(" <p class='errors' id='phoneError'>The phone number already exists</p> \
                <button type='submit' class='btn btn-secondary' id='submitBtn' disable>Submit</button>")
        else:
            return HttpResponse("<p class='errors' id='emailError'></p> \
                <button type='submit' class='btn btn-primary' id='submitBtn'>Submit</button> ")

    #     # Phone number is taken
    #     message = True
    # else:
    #     # Phone number is available
    #     message = False
    # print(message)
    # # Render the message in the 'municipality/phone.html' template
    # return render(request, 'municipality/phone.html', {'message': message})
def all_child(request):
    student = Student.objects.all()
    return render(request, 'municipality/home.html', {'student': student})
