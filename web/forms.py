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


class OrderForm(forms.ModelForm):
    bill_received = forms.BooleanField(label="收到底单", required=False)

    class Meta:
        model = models.Order
        fields = ("company", "unit_price", "count", "total_price", "user", "status", "memo", "detail")

        error_messages = {
            "unit_price": {
                "required": "字段不能为空",
                "invalid": "字段无效",
            },
            "count": {
                "required": "字段不能为空",
                "invalid": "字段无效",
            },
            "total_price": {
                "required": "字段不能为空",
                "invalid": "字段无效",
            }
        }

    def clean_user(self):
        value = self.cleaned_data.get("user")
        # print(value)
        # print(self.instance.id)
        # print(type(self.instance))
        if self.instance.id:
            return self.instance.user
        return value
    
    # def clean_bill_received(self):
    #     return self.cleaned_data.get("bill_received", False)

    def save(self, commit=True):
        # Save the provided password in hashed format
        order_obj = super().save(commit=False)
        if self.cleaned_data.get("bill_received", ""):
            order_obj.bill_received = self.cleaned_data["bill_received"]
        if commit:
            order_obj.save()
        return order_obj

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
    
    

