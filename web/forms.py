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

    # def clean_password(self):
    #     # Regardless of what the user provides, return the initial value.
    #     # This is done here, rather than on the field, because the
    #     # field does not have access to the initial value
    #     return self.initial["password"]
    
    

