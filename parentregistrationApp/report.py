from django.contrib.auth import get_user_model, logout, update_session_auth_hash
from django.http import JsonResponse
from django.shortcuts import get_object_or_404, render,redirect, HttpResponse, resolve_url
from django.urls import reverse
from django.views.generic.base import View
from .otp_conf import sentotp
from django.contrib import messages
from .models import Student

def all_child(request):
    all_child = Student.objects.all()
    context ={
        'all_child ': all_child
    }
    templates_render ='admin_report/admin_report.html'

    return render(request, context=context, template_name=templates_render)