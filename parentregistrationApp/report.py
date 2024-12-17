from django.contrib.auth import get_user_model, logout, update_session_auth_hash
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render,redirect, HttpResponse, resolve_url
from django.urls import reverse
from django.views.generic.base import View
#from .otp_conf import sentotp
from django.contrib import messages
from .models import Student
from parentregistrationApp.decorators import group_required

@group_required("Parents")
def all_child(request):
    all_child = Student.objects.all()
    is_admin = request.user.groups.filter(name='Administrator').exists()
    context ={
        'student': all_child,
        'child' : Student.objects.all().count(),
        'is_admin': is_admin,  # Pass group membership to the template
    }
    print(context)
    templates_render ='admin_report/all_child.html'

    return render(request,template_name=templates_render, context=context )