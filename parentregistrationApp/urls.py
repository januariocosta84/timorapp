from .views import( PhoneValidation, check_phone_number, delete_student_view, list_suco, list_village, 
                   register_student_view, reset_password_and_send_sms, 
                   student_edit_view,
                   send_otp_view, otp_verify, 
                   registration_parent_view, 
                   list_municipality_view,
                   student_delete_view,
                  all_parents,
                 
                   parent_home,
                  
                   parent_update,
                   phone_num_val,
                  
                   list_posto_administrative,
                  
                     Login_View,
                     Logout_View,
                     reset_password,
                     list_user,
                     
)
from django.contrib.auth import views as auth_views
from .report import all_child
from django.urls import path
urlpatterns = [
    path('', parent_home, name ='parent-dashboard'),
  #  path('send-otp/', send_otp_view, name='send_otp'),
    path('verify-otp/', otp_verify, name='verify_otp'),
    path('parent-regist/', registration_parent_view, name='regist'),
    path('login/', Login_View.as_view(), name='login'),
    path('logout/', Logout_View.as_view(), name='logout'),
    path('password-reset-sms/', reset_password_and_send_sms, name='reset_password_sms'),
    path('all-child/', all_child, name= 'all-child'),

    path('users/', list_user, name ='users'),
    path('reset-password/', reset_password, name ='reset'),
    path('municipality/', list_municipality_view, name = 'municipality'),
    path('parent-update/',parent_update, name= 'update' ),

    path('student-add/<int:id>/',register_student_view, name='add-student'),
    path('student-edit/<int:id>/', student_edit_view,name ='edit-student'),
    path('student-delete/<int:id>/', student_delete_view,name ='delete-student'),
    
    path('student-deletes/<int:id>/', delete_student_view,name ='deletes-student'),
    path('students/parent/', parent_home, name='parent-dash'),
    path('load-administrative-posts/', list_posto_administrative, name='load-administrative-posts'),
    path('load-sucos/', list_suco, name='load-sucos'),
    path('load-village/', list_village, name='load-village'),
    path('load-num/',PhoneValidation.as_view(), name ='load-num'),
    
    path('parents/', all_parents, name='all-parents'),
    path('all-student/', all_child, name='all-student'),

    path('check-phone/', check_phone_number, name='check-phone'),

      # Password Reset
    path('password-reset/', 
         auth_views.PasswordResetView.as_view(template_name='registration/password_reset.html'), 
         name='password_reset'),
    path('password-reset/done/', 
         auth_views.PasswordResetDoneView.as_view(template_name='registration/password_reset_done.html'), 
         name='password_reset_done'),
    path('reset/<uidb64>/<token>/', 
         auth_views.PasswordResetConfirmView.as_view(template_name='registration/password_reset_confirm.html'), 
         name='password_reset_confirm'),
    path('reset/done/', 
         auth_views.PasswordResetCompleteView.as_view(template_name='registration/password_reset_complete.html'), 
         name='password_reset_complete'),
]