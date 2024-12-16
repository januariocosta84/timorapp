from django.http import HttpResponseForbidden, HttpResponseNotAllowed, HttpResponseRedirect, HttpResponseServerError
from django.urls import reverse

# """Protection view"""
# class GroupRequiredMixin(AccessMixin): # type: ignore
#     group_names = []
#     def dispatch(self, request, *args, **kwargs):
#         if not request.user.is_authenticated:
#             return self.handle_no_permission()
#         if not any(group.name in self.group_names for group in request.user.groups.all()):
#             return HttpResponseForbidden("you don't have permission to view this page")
#         return super().dispatch(request, *args, **kwargs)

from functools import wraps
def group_required(group_names):
    """Decorator to restrict view access to users in specific groups."""
    def decorator(view_func):
        @wraps(view_func)
        def _wrapped_view(request, *args, **kwargs):
            
            if not request.user.is_authenticated:
                return HttpResponseRedirect(reverse('login'))

            if not any(group.name in group_names for group in request.user.groups.all()):
                return HttpResponseForbidden("you don't have permission to view this page")

            return view_func(request, *args, **kwargs)
        return _wrapped_view
    return decorator