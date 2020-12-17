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



