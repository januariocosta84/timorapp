from .views import( PhoneValidation, list_suco, list_village, 
                   register_student_view, 
                   student_edit_view,
                   send_otp_view, otp_verify, 
                   registration_parent_view, 
                   list_municipality_view,
                   student_delete_view,

                   #home,
                   #get_administrative_posts,
                   #get_sucos,
                  #get_municipalities,
                   parent_home,
                   #form_view, 
                   parent_update,
                   phone_num_val,
                   #load_sucos,
                   list_posto_administrative,
                   #  load_municipalities,
                     Login_View,
                     Logout_View,
                     reset_password,
                     list_user
)
from .report import all_child
from django.urls import path
urlpatterns = [
    path('', parent_home, name ='parent-dashboard'),
    path('send-otp/', send_otp_view, name='send_otp'),
    path('verify-otp/', otp_verify, name='verify_otp'),
    path('parent-regist/', registration_parent_view, name='regist'),
    path('login/', Login_View.as_view(), name='login'),
    path('logout/', Logout_View.as_view(), name='logout'),

    path('all-child/', all_child, name= 'all-child'),

    path('users/', list_user, name ='users'),
    path('reset-password/', reset_password, name ='reset'),
    path('municipality/', list_municipality_view, name = 'municipality'),
    path('parent-update/',parent_update, name= 'update' ),

    path('student-add/<int:id>/',register_student_view, name='add-student'),
    path('student-edit/<int:id>/', student_edit_view,name ='edit-student'),
    path('student-delete/<int:id>/', student_delete_view,name ='delete-student'),

    path('students/parent/', parent_home, name='parent-dash'),
    path('load-administrative-posts/', list_posto_administrative, name='load-administrative-posts'),
    path('load-sucos/', list_suco, name='load-sucos'),
     path('load-village/', list_village, name='load-village'),
     path('load-num/',PhoneValidation.as_view(), name ='load-num')
   #path('load-municipalities/', load_municipalities, name='load-municipalities'),
   

   # path('home', home, name='home'),
    #path('get-sucos/', get_sucos, name='get_sucos'),
    #path('get-administrative-posts/', get_administrative_posts, name='get_administrative_posts'),
    #path('get-municipalities/', get_municipalities, name='get_municipalities'),

]