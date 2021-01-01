'''
Date: 2020-12-28 22:10:34
LastEditTime: 2020-12-31 23:51:22
Author: catas
LastEditors: catas
Description: 
'''
from web import models
from django.forms import ModelForm
from django.shortcuts import HttpResponse
import json


def process_order(request, data, form_class, order_obj=None):
    '''
    description: 处理订单 post 请求
    param {
        data: post数据 querydict
        order_obj: order 对象
    }
    return {
        httpResponse: json
    }
    '''    
    # 此处不允许后2操作
    status_dict = {
        "save": 0,
        "submit": 1,
        "reject": 2,
        "pass": 3,
    }
    append_dict = {
        "user": request.user.id,
        "status": status_dict[data.get("type")],
    }
    data.update(append_dict)
    if order_obj:
        form = form_class(data, instance=order_obj)
    else:
        form = form_class(data)

    if form.is_valid():
        print(form.cleaned_data)
        form.save()
        return HttpResponse(json.dumps({"status": "success",}))
    else:
        return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))


def clean_user(self):
        value = self.cleaned_data.get("user")
        if self.instance.id is not None:
            # 非创建禁止修改用户
            return self.initial["user"]
        return value

def default_clean(self):
    if self.instance.id is not None:
        for field in self.Meta.readonly_fields:
            val = self.initial[field]
            if val != self.cleaned_data.get(field):
                self.add_error(field, "此字段不可修改")
    
def __new__(cls, *args, **kwargs):
    for field_name in cls.base_fields:
        field = cls.base_fields[field_name]
        attr_dict = {"class": ""}
        
        if "BooleanField" not in field.__repr__():
            attr_dict.update({"class": "form-control"})
            # attr_dict["class"] += " form-control"
        # if field_name in cls.Meta.readonly_fields:
        #     attr_dict["disabled"] = True
        # if field_name in cls.Meta.hide_fields:
        #     attr_dict["hide"] = True
        if "CharField" in field.__repr__():
            attr_dict.update({"rows": 5})
        if "ModelChoiceField" in field.__repr__():
            attr_dict["class"] += " chosen-style"
        
        # 所有字段必填
        field.required = True
        cls.Meta.error_messages.update({
            field_name: {
                "required": "字段不能为空",
                "invalid": "字段无效",
            }
        })

        field.widget.attrs.update(attr_dict)
    
    setattr(cls, "clean_user", clean_user)
    setattr(cls, "clean", default_clean)

    return ModelForm.__new__(cls)

class OrderFormBuilder():
    # 生产各种 orderform 
    fields = ["order_type", "user", "status", "company", "unit_price", "count", "total_price", "memo"]

    class Meta:
        model = models.Order

        error_messages = {
            "order_type": {
                "required": "字段不能为空",
                "invalid": "字段无效",
            },
            "company": {
                "required": "字段不能为空",
                "invalid": "字段无效",
            },
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
            
    def create_order(self, fields, readonly_fields=[], hide_fields=[]):
        '''
        description: 生产 order form 类
        param {
            fields: 
            readonly_fields: 只读字段
            hide_fields: 只读, 隐藏
        }
        return {
            modelform
        }
        '''        
        
        setattr(self.Meta, "fields", fields)
        setattr(self.Meta, "readonly_fields", readonly_fields)
        setattr(self.Meta, "hide_fields", hide_fields)
        
        attrs = {"Meta": self.Meta}
        name = "DynamicOrderForm"
        baseclass = (ModelForm, )
        
        model_form = type(name, baseclass, attrs)
        setattr(model_form, "__new__", __new__)
        return model_form        

    def get_add_fields(self, order_type):
        '''
        description: 
        param {
            order_type: 订单类型 (0, "试剂购买"),
                                (1, "基因测序"),
                                (2, "引物合成"),
        }
        return {*}
        '''
        add_fields = []
        if order_type == 0:
            add_fields = ["detail"]
        elif order_type == 1:
            add_fields = ["gene_name"]
        elif order_type == 2:
            add_fields = ["gene_name", "primer1", "primer2"]
        return add_fields
    
    def create_new_order(self, order_type):
        # 创建 order 时的form
        add_fields = self.get_add_fields(order_type)
        all_fields = self.fields[0:3] + add_fields + self.fields[3:]
        hide_fields = ["user", "status"]
        return self.create_order(all_fields, hide_fields=hide_fields)
    
    def create_edit_order(self, order_type):
        # 自己修改的 form
        add_fields = self.get_add_fields(order_type)
        all_fields = self.fields[0:3] + add_fields + self.fields[3:]
        hide_fields = ["user", "status"]
        return self.create_order(all_fields, hide_fields=hide_fields)
    
    

    
         


