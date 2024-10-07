
from datetime import *
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
import uuid
from django.utils import timezone
from django.contrib.auth import get_user_model
User = get_user_model()


class Village(models.Model):
    name = models.CharField(max_length=250)
    suco = models.ForeignKey('Suco', on_delete=models.CASCADE, null=True, blank=True)
    def __str__(self):
        return self.name
    
class Suco(models.Model):
    name= models.CharField(max_length=250)
    posto = models.ForeignKey('AdministrativePost', on_delete=models.CASCADE, blank=True, null=True)
    #village = models.ForeignKey(Village, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    
class AdministrativePost(models.Model):
    name = models.CharField(max_length=250)
    municipality = models.ForeignKey('Municipality', on_delete=models.CASCADE, blank=True, null=True)
    #suco = models.ForeignKey(Suco, on_delete=models.CASCADE)
    def __str__(self):
        return self.name
class Municipality(models.Model):
    name = models.CharField(max_length=250)
    #administrative_post = models.ForeignKey(AdministrativePost, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

@receiver(post_save, sender=User)
def create_parent(sender, instance, created, **kwargs):
    if created:
        Parent.objects.create(
            user=instance,
            first_name=instance.first_name,
            last_name=instance.last_name,
            full_name=f"{instance.first_name} {instance.last_name}",
            phone=instance.username,
            email=instance.email,
            municipality=None, 
            administrative_post=None,
            suco=None,
            village=None
        )
class Parent(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='user_parent', null=True, blank=True)
    first_name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)
    full_name = models.CharField(max_length=250, blank=True, null=True)
    phone = models.CharField(max_length=15)
    email = models.EmailField(blank=True, null=True)
    municipality = models.ForeignKey(Municipality, on_delete=models.CASCADE, null=True)
    administrative_post = models.ForeignKey(AdministrativePost, on_delete=models.CASCADE, null=True)
    suco = models.ForeignKey(Suco, on_delete=models.CASCADE, null=True)
    village = models.ForeignKey(Village, on_delete=models.CASCADE, null=True)
    
    def __str__(self):
        return self.full_name or f"{self.first_name} {self.last_name}"


import re

class Parentcode(models.Model):
    code = models.CharField(max_length=250, unique=True, editable=False)
    parent = models.OneToOneField(Parent, on_delete=models.CASCADE, related_name='auth')
    phone = models.CharField(max_length=250)

    def save(self, *args, **kwargs):
        # Normalize the phone number (remove spaces, dashes, etc.)
        self.phone = re.sub(r'\D', '', self.phone)  # Keeps only digits
        
        if not self.code:
            first_name_part = self.parent.first_name[:2].upper()
            last_name_part = self.parent.last_name[:2].upper()
            phone_part = self.phone[-4:]
            self.code = f"{first_name_part}{last_name_part}{phone_part}"
        
        super().save(*args, **kwargs)

    def __str__(self):
        return str(self.code)
    


class Student(models.Model):
    first_name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)
    full_name = models.CharField(max_length=250, blank=True, null=True)
    year_birth = models.IntegerField()

    parent = models.ForeignKey(Parent, on_delete=models.CASCADE)

    def __str__(self):
        return self.full_name or f"{self.first_name} {self.last_name}"

class StudentCode(models.Model):
    code = models.CharField(max_length=250, unique=True, editable=False)
    student = models.OneToOneField(Student, on_delete=models.CASCADE, related_name='code')

    def save(self, *args, **kwargs):
        if not self.code:
            first_name_part = self.student.first_name[:2].upper()
            last_name_part = self.student.last_name[:2].upper()
            self.code = f"{first_name_part}{last_name_part}{self.student.id}"
        super().save(*args, **kwargs)
    def __str__(self):
        return str(self.code)

class StudentActivityLog(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='activity_logs')
    activity_type = models.CharField(max_length=250)
    timestamp = models.DateTimeField(default=timezone.now)
    details = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"{self.student.full_name} - {self.activity_type} at {self.timestamp}"   


@receiver(post_save, sender=Parent)
def create_auth_parent(sender, instance, created, **kwargs):
    if created:
        instance.full_name = f"{instance.first_name} {instance.last_name}"
        instance.save()
        #AuthParent.objects.create(parent=instance)
        Parentcode.objects.create(parent=instance, phone=instance.phone)


@receiver(post_save, sender=Parent)
def save_full_name(sender, instance, **kwargs):
    if not instance.full_name:
        instance.full_name = f"{instance.first_name} {instance.last_name}"
        instance.save()

@receiver(post_save, sender=Student)
def save_full_name(sender, instance, **kwargs):
    if not instance.full_name:
        instance.full_name = f"{instance.first_name} {instance.last_name}"
        instance.save()
        StudentCode.objects.create(student=instance)
