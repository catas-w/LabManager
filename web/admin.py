from django import forms
from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from web import models
from LabManager import settings

class UserCreationForm(forms.ModelForm):
    """A form for creating new users. Includes all the required
    fields, plus a repeated password."""
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)
    check_signal = forms.CharField(label='口令', widget=forms.PasswordInput)

    class Meta:
        model = models.UserProfile
        fields = ('email', 'name')

    def clean_password2(self):
        # Check that the two password entries match
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("两次输入的密码不同")
        return password2

    def clean_check_signal(self):
        check_signal = self.cleaned_data.get("check_signal").lower()
        if check_signal != settings.check_signal:
            raise forms.ValidationError("口令不正确")
        return check_signal

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):
    """A form for updating users. Includes all the fields on
    the user, but replaces the password field with admin's
    password hash display field.
    """
    password = ReadOnlyPasswordHashField()

    class Meta:
        model = models.UserProfile
        fields = ('email', 'password', 'name', 'user_type', 'is_active', 'is_admin', "user_permissions")

    def clean_password(self):
        # Regardless of what the user provides, return the initial value.
        # This is done here, rather than on the field, because the
        # field does not have access to the initial value
        return self.initial["password"]


class UserAdmin(BaseUserAdmin):
    # The forms to add and change user instances
    form = UserChangeForm
    add_form = UserCreationForm

    # The fields to be used in displaying the User model.
    # These override the definitions on the base UserAdmin
    # that reference specific fields on auth.User.
    list_display = ('email', 'name', 'is_admin')
    list_filter = ('is_admin', )
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('name', 'user_type')}),
        ('Permissions', {'fields': ('is_admin', 'is_active')}),
        ('Permissions', {'fields': ('user_permissions',)}),
    )
    # add_fieldsets is not a standard ModelAdmin attribute. UserAdmin
    # overrides get_fieldsets to use this attribute when creating a user.
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'name', 'password1', 'password2', 'user_type')}
        ),
    )
    search_fields = ('email', 'name')
    ordering = ('email','name')
    filter_horizontal = ("user_permissions",)

# Now register the new UserAdmin...
admin.site.register(models.UserProfile, UserAdmin)
# ... and, since we're not using Django's built-in permissions,
# unregister the Group model from admin.
admin.site.unregister(Group)


class OrderAdmin(admin.ModelAdmin):
    list_display = ("id", "order_type", "status", "user", "create_date", "checked_date")
    list_filter = ("status", "user")
    readonly_fields = ("create_date", )

class GoodsDetailAdmin(admin.ModelAdmin):
    list_display = ("name", "brand")

admin.site.register(models.Order, OrderAdmin)
admin.site.register(models.DutyTable)
admin.site.register(models.CompanyInfo)

admin.site.register(models.DutyItem)
admin.site.register(models.GoodsDetail, GoodsDetailAdmin)
