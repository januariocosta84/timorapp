from django.shortcuts import redirect

class GroupRedirectMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.user.is_authenticated:
            if request.path == '/':
                if is_in_group(request.user, 'Admin'):
                    return redirect('admin-dashboard')
                elif is_in_group(request.user, 'Parent'):
                    return redirect('parent-dashboard')
                elif is_in_group(request.user, 'Teacher'):
                    return redirect('teacher-dashboard')
        return self.get_response(request)

# Helper function (redefined here for middleware use)
def is_in_group(user, group_name):
    return user.groups.filter(name=group_name).exists()
