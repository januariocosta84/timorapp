from django import forms
from django.urls import reverse, reverse_lazy
from .models import Student, User, Village, Suco, AdministrativePost, Municipality,Parent
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm, PasswordChangeForm
from django.contrib.auth import get_user_model
import datetime
from django.contrib.auth.models import User
import re
from twilio.rest import Client
import random
import string
from django.core.exceptions import ValidationError
import datetime
import os
import re
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
import json
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

now = datetime.datetime.now()

class OTPForm(forms.Form):
    phone = forms.CharField(max_length=250)
    otp = forms.CharField(max_length=6)


class LoginForm(AuthenticationForm):
   username = forms.CharField(widget=forms.TextInput(attrs={'autofocus':True, 'placeholder':'Phone Number ', 'class':'form-control'}))
   password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control', 'placeholder':'********'}))


class ParentForm(forms.ModelForm):
    username = forms.CharField(
        label="Numeru Telephone",
        widget=forms.TextInput(attrs={
            'class': 'form-control',
                                   
            'placeholder': "Numeru telfone",
                                    #  'hx-trigger': 'change',
                                     # 'hx-target': '#phoneError',
                                     # 'hx-indicator': '#loading',
                                     # 'hx-swap': 'innerHTML'}),
                                }),
        help_text="Phone number must start with +670 and have 8 digits starting with 7."
    )
    first_name = forms.CharField(
        label="Naran Dahuluk",
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'placeholder': "Naran Primeiro"}),
    )
    last_name = forms.CharField(
        label="Naran Ikus",
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'placeholder': "Naran Ikus"}),
    )

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')
        labels = {
            'email': 'Email'
        }
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'jcosta@yahoo.com'}),
        }

    def clean_username(self):
        username = self.cleaned_data.get('username')
        pattern = re.compile(r'^\+6707\d{7}$')
        if not pattern.match(username):
            raise ValidationError("Phone number must start with +670 and have 8 digits starting with 7.")

        # Check if the username (phone number) already exists
        if User.objects.filter(username=username).exists():
            raise ValidationError("This phone number is already taken.")

        return username

    def save(self, commit=True):
        user = super().save(commit=False)

        # Generate a random password
        password = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        user.set_password(password)  # Set the generated password

        if commit:
            user.save()  # Save the user to the database

            # Send the OTP (password) to the user's phone number
            message = f": {password}"
            print(message)
            send_otp(user.username, message)  # Assuming username is the phone number
        return user

def send_otp(phone_number, message):
    account_sid = os.getenv('ACCOUNT_SID')
    auth_token = os.getenv('AUTH_TOKEN')
    from_number = os.getenv('FROM_WHATSAPP_NUMBER')
    content_sid = os.getenv('CONTENT_SID')

    client = Client(account_sid, auth_token)
    phone_number = f"whatsapp:{phone_number}"
    
    try:
        message = client.messages.create(
            from_=from_number,
            to=phone_number,
            content_sid=content_sid,
            content_variables=json.dumps(
                {
                    "1": phone_number,
                    "2": message,
                }
            ),
        )
        print(f"Message sent successfully. SID: {message.sid}")
        print(message.body)
    except Exception as e:
        print(f"Error: {e}")
        

class ParentFormRegist(forms.ModelForm):
    class Meta:
        model = Parent
        fields = [
            'municipality',
            'administrative_post',
            'suco',
            'village'
        ]
        labels = {
            'first_name': 'Naran dahuluk',
            'last_name': 'Naran Ikus',
            'email': 'Contact Email',
            'municipality': 'Munisipiu',
            'administrative_post': 'Posto administrativo',
            'suco': 'Suco',
            'village': 'Aldeia',
        }
        
        widgets = {
           # 'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            #'last_name': forms.TextInput(attrs={'class': 'form-control'}),
           # 'full_name': forms.TextInput(attrs={'class': 'form-control'}),
           # 'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'municipality': forms.Select(attrs={'class': 'form-control ','hx-get':'/load-administrative-posts/', 'hx-target':'#id_administrative_post'}),
            'administrative_post': forms.Select(attrs={'class': 'form-control','hx-get':'/load-sucos/', 'hx-target':'#id_suco'}),
            'suco': forms.Select(attrs={'class': 'form-control','hx-get':'/load-village/', 'hx-target':'#id_village'}),
            #'suco': forms.Select(attrs={'class': 'form-control','hx-get':'/load-village/', 'hx-target':'#id_village'}),
            'village': forms.Select(attrs={'class': 'form-control'}),
        }

class ParentFormUpdate(forms.ModelForm):
    class Meta:
        model = Parent
        fields = [
           'first_name',
            'last_name',
            'email',
            'municipality',
            'administrative_post',
            'suco',
            'village'
        ]
        labels = {
            'first_name': 'Naran dahuluk',
            'last_name': 'Naran Ikus',
            'email': 'Contact Email',
            'municipality': 'Munisipiu',
            'administrative_post': 'Posto administrativo',
            'suco': 'Suco',
            'village': 'Aldeia',
        }
        widgets = {
           'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control'}),
           'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'municipality': forms.Select(attrs={'class': 'form-control ','hx-get':'/load-administrative-posts/', 'hx-target':'#id_administrative_post'}),
            'administrative_post': forms.Select(attrs={'class': 'form-control','hx-get':'/load-sucos/', 'hx-target':'#id_suco'}),
            'suco': forms.Select(attrs={'class': 'form-control','hx-get':'/load-village/', 'hx-target':'#id_village'}),
            'village': forms.Select(attrs={'class': 'form-control'}),
        }

class CustomPasswordChangeForm(PasswordChangeForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})


# Calculate year of four_years_ago
year_four_years_ago = now.year - 6

# Adjust for leap years and ensure the month and day are valid
try:
    four_years_ago = now.replace(year=year_four_years_ago)
except ValueError:
    # Handle leap year adjustment if the current date is February 29
    four_years_ago = now.replace(year=year_four_years_ago, day=28)

print(four_years_ago.year)


YEAR_CHOICES = [(year, year) for year in range(four_years_ago.year, datetime.datetime.now().year + 1)]
class StudentForm(forms.ModelForm):
    year_birth = forms.ChoiceField(choices=YEAR_CHOICES, widget=forms.Select(attrs={'class': 'form-control'}), label='Tinan moris')
    class Meta:
        model = Student
        fields = [
                    'first_name', 
                    'last_name', 
                    'year_birth'
                ]
        labels = {
                'first_name':'Naran dahuluk',
                'last_name': 'Naran ikus',
                'year_birth': 'Tinan moris',
        }
        
        
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control'}),
            'year_birth': forms.TextInput(attrs={'class': 'form-control'}),
        }

class VillageForm(forms.ModelForm):
    class Meta:
        model = Village
        fields = ['name', 'suco']

class SucoForm(forms.ModelForm):
    class Meta:
        model = Suco
        fields = ['name', 'posto']

class AdministrativePostForm(forms.ModelForm):
    class Meta:
        model = AdministrativePost
        fields = ['name', 'municipality']

class MunicipalityForm(forms.ModelForm):
    class Meta:
        model = Municipality
        fields = ['name', ]

class AddressForm(forms.Form):
    municipiu = forms.ModelChoiceField(
        queryset=Municipality.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control','hx-get':'/load-administrative-posts/', 'hx-target':'#id_posto'})
    )
    posto = forms.ModelChoiceField(
        queryset=AdministrativePost.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control '})
    )
    suco = forms.ModelChoiceField(
        queryset=Suco.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    aldeia = forms.ModelChoiceField(
        queryset=Village.objects.none(),
        widget=forms.Select(attrs={'class': 'form-control'})
    )