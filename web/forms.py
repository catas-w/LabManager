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



