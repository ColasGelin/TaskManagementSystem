from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User

@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = ['email', 'first_name', 'last_name', 'is_staff', 'is_active', 'created_at']
    list_filter = ['is_staff', 'is_active', 'created_at']
    search_fields = ['email', 'first_name', 'last_name']
    ordering = ['-created_at']
    
    fieldsets = UserAdmin.fieldsets + (
        ('Timestamps', {'fields': ('created_at', 'updated_at')}),
    )
    readonly_fields = ['created_at', 'updated_at']