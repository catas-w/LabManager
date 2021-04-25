'''
Date: 2020-12-28 22:10:34
LastEditTime: 2021-04-23 14:10:22
Author: catas
LastEditors: catas
Description: 
'''
from web import models
from django import forms
from django.forms import ModelForm
from django.shortcuts import HttpResponse
import json
import re
import datetime
from django.db.models import Sum, Count

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
        # "user": data.get("user"),
        "status": status_dict[data.get("type")],
    }
    data.update(append_dict)
    if order_obj:
        form = form_class(data, instance=order_obj)
    else:
        form = form_class(data)

    if form.is_valid():
        # print(form.cleaned_data)
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

def clean_primer1(self):
    seq = self.cleaned_data.get("primer1", "").strip().upper()
    if seq:
        if re.search(r'[^ACGT]', seq):
            # 序列不正确
            raise forms.ValidationError("序列只能包含 A,C,G,T (不区分大小写)")
        else:
            return seq

def clean_primer2(self):
    seq = self.cleaned_data.get("primer2", "").strip().upper()
    if seq:
        if re.search(r'[^ACGT]', seq):
            raise forms.ValidationError("序列只能包含 A,C,G,T (不区分大小写)")
        else:
            return seq            

def default_clean(self):    
    if self.instance.id is not None:
        for field in self.Meta.readonly_fields:
            if field == "status":
                # 这个可以修改, 不可修改时在 views 验证
                continue
            else:
                old_field_val = getattr(self.instance, field)
                form_val = self.cleaned_data.get(field)
                
                if old_field_val != form_val:
                    self.add_error(field, "此字段不可修改")
    
def __new__(cls, *args, **kwargs):
    for field_name in cls.base_fields:
        field = cls.base_fields[field_name]
        attr_dict = {"class": ""}
        
        attr_dict.update({"class": "form-control"})
            # attr_dict["class"] += " form-control"
        if field_name in cls.Meta.readonly_fields:
            attr_dict["disabled"] = True
            if "BooleanField" not in field.__repr__():
                attr_dict["class"] += " readonly"
                
        # if field_name in cls.Meta.hide_fields:
        #     attr_dict["hide"] = True
        if "CharField" in field.__repr__():
            attr_dict.update({"rows": 5})
        if "ModelChoiceField" in field.__repr__():
            attr_dict["class"] += " chosen-style"
        
        # 所有字段必填
        if field_name in cls.Meta.unrequired_fields:
            field.required = False
        else:
            field.required = True
                    
        cls.Meta.error_messages.update({
            field_name: {
                "required": "字段不能为空",
                "invalid": "字段无效",
            }
        })

        field.widget.attrs.update(attr_dict)
    
    # setattr(cls, "clean_user", clean_user)
    setattr(cls, "clean", default_clean)
    setattr(cls, "clean_primer1", clean_primer1)
    setattr(cls, "clean_primer2", clean_primer2)

    return ModelForm.__new__(cls)

class OrderFormBuilder():
    # 生产各种 orderform 
    fields = ["order_type", "user", "status", "company", "unit_price", "count", "total_price", "memo"]

    class Meta:
        model = models.Order        
        error_messages = {} 
            
    def create_order(self, fields, readonly_fields=[], hide_fields=[], unrequired_fields=[]):
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
        setattr(self.Meta, "unrequired_fields", unrequired_fields)
        
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
            add_fields = ["gene_info"]
        elif order_type == 2:
            add_fields = ["gene_info", "primer1", "primer2", "primer_product_length"]
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
        all_fields = self.fields[0:3]  + [] + add_fields + self.fields[3:]
        readonly_fields = ["order_type", "user", "status", ]
        return self.create_order(all_fields, readonly_fields=readonly_fields)
    
    def create_readonly_order(self, order_type):
        # 只读自己的 form
        add_fields = self.get_add_fields(order_type)
        all_fields = self.fields[0:3] + add_fields + self.fields[3:]
        readonly_fields = all_fields.copy()
        return self.create_order(all_fields, readonly_fields=readonly_fields)
    
    def create_check_order(self, order_type):
        # 审核订单 form
        add_fields = self.get_add_fields(order_type)
        all_fields = self.fields[0:3] + add_fields + self.fields[3:]
        readonly_fields = all_fields.copy()
        return self.create_order(all_fields, readonly_fields=readonly_fields)
    
    def create_view_hist_order(self, order_type):
        # 查看历史订单 form
        add_fields = self.get_add_fields(order_type)
        all_fields = self.fields[0:3] + add_fields + self.fields[3:] + ["bill_received"]
        readonly_fields = all_fields.copy()
        return self.create_order(all_fields, readonly_fields=readonly_fields)

    def create_edit_hist_order(self, order_type):
        # 修改历史订单 form
        add_fields = self.get_add_fields(order_type)
        all_fields = self.fields[0:3] + add_fields + self.fields[3:] + ["bill_received"]
        readonly_fields = ["order_type", "status", "user", ]
        unrequired_fields = ["memo", "bill_received"]
        return self.create_order(all_fields, readonly_fields=readonly_fields, unrequired_fields=unrequired_fields)



def get_statistic_data(conditions):
    '''
    description: 获取统计数据
    param {*}
        conditions = {
            'time_scale': 6/12,
        }
    return {*}
        {
            dataset: {
                    source: [
                        ['product', '6月', '7月', '8月', '9月', '10月', '11月'],
                        ['试剂购买', 41.1, 30.4, 65.1, 53.3, 83.8, 98.7],
                        ['测序', 86.5, 92.1, 85.7, 83.1, 73.4, 55.1],
                        ['引物合成', 24.1, 67.2, 79.5, 86.4, 65.2, 82.5],
                    ]
                },
            lastmonth: "month",
        }
    '''
    time_scale = int(conditions.get("time_scale"))
    today = datetime.datetime.now()
    month_count = 12
    # time scale 的日期
    if time_scale == 12:
        # 最近一年
        if today.month == 12:
            from_date = datetime.datetime(today.year, 1, day=1)
        else:
            from_date = datetime.datetime(today.year-1, today.month+1, day=1)
    else:
        # 最近半年
        month_count = 7
        if today.month >6:
            from_date = datetime.date(today.year, today.month-6, day=1)
        else:
            from_date = datetime.date(today.year-1, today.month+6, day=1)

    order_objs = models.Order.objects.filter(status=3).filter(create_date__gt=from_date)

    # 月份列表
    source = [
        ["product"] + [""] * month_count,
        ["试剂/耗材购买"] + [0] * month_count,
        ["基因测序"] + [0] * month_count,
        ["引物合成"] + [0] * month_count,
    ]
    month = from_date.month
    for i in range(month_count):
        # month = init_month + i
        month += 1
        if (month>12):
            month = 1
        source[0][i+1] = str(month) + "月"
        orders_in_cur_month = order_objs.filter(create_date__month=month)
        query_set = orders_in_cur_month.values("order_type").annotate(expense=Sum("total_price"))
        for item in query_set:
            source[item["order_type"]+1][i+1] = float(item["expense"])
    
    res = {
        "dataset": {
            "source": source
        },
        "lastmonth": source[0][-1],
    }
    return res
        
    
    
    

