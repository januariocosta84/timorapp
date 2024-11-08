from django.apps import AppConfig


class ParentregistrationappConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'parentregistrationApp'
    
    def ready(self):
        import parentregistrationApp.signals  # Replace 'users' with your app name

# class UsersConfig(AppConfig):
#     name = 'parentregistrationApp'

#     def ready(self):
#         import parentregistrationApp.signals  # Replace 'users' with your app name