from django import forms
from web import models
from django.core.exceptions import NON_FIELD_ERRORS

class GoodsDetailForm(forms.ModelForm):

    class Meta:
        model = models.GoodsDetail
        fields = ('name', 'brand', 'specification', 'CAS_number')

        error_messages = {
            
            "name": {
                "required": "字段不能为空",
            },
            "brand": {
                "required": "字段不能为空",
            },
            NON_FIELD_ERRORS: {
                'unique_together': "商品已存在!",
            },
        }

class CompanyForm(forms.ModelForm):

    class Meta:
        model = models.CompanyInfo
        fields = ("name",)

        error_message = {
            "name": {
                "required": "名称不能为空",
            }
        }
    
    def clean_name(self):
        name = self.cleaned_data.get("name")
        if not name.strip():
            raise forms.ValidationError("名称不能为空!")

        all_companys = models.CompanyInfo.objects.all()
        if (name, ) in all_companys.values_list("name"):
            raise forms.ValidationError("公司已存在")
        
        return name


class UserEditForm(forms.ModelForm):
    """
        用户信息编辑--管理员
    """
    # password = ReadOnlyPasswordHashField()

    class Meta:
        model = models.UserProfile
        fields = ('email', 'name', 'user_type', 'is_active', 'is_admin', "user_permissions", "stu_number")

        error_messages = {            
            "name": {
                "required": "字段不能为空",
            },
            "email": {
                "required": "字段不能为空",
                "invalid": "格式不正确",
            },
        }


    
class PasswordForm(forms.ModelForm):
    """A form for creating new users. Includes all the required
    fields, plus a repeated password."""
    password1 = forms.CharField(label='请输入新密码', widget=forms.PasswordInput)
    password2 = forms.CharField(label='确认密码', widget=forms.PasswordInput)

    class Meta:
        model = models.UserProfile
        fields = ('password', )
        widgets = {
            "password1": forms.widgets.PasswordInput(attrs={"class": "form-control"}),
            "password2": forms.widgets.PasswordInput(attrs={"class": "form-control"}),
        }


    def clean_password2(self):
        # Check that the two password entries match
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("两次输入密码不一致!")
        return password2

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user    

