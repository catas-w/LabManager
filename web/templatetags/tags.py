'''
Date: 2020-12-17 10:28:38
LastEditTime: 2020-12-31 23:08:10
Author: catas
LastEditors: catas
Description: 
'''
from django import template
from django.utils.safestring import mark_safe
import datetime

register = template.Library()

@register.simple_tag
def get_order_status(order_obj):
    html = '''
        <td><a href="{order_id}"><span class="label label-table {button}">{text}</span></a></td>
    '''
    status_dict = {
        0: ["未提交", "label-default"],
        1: ["待审核", "label-warning"],
        2: ["审核未通过", "label-danger"],
        3: ["已批准", "label-success"],
    }
    status = order_obj.status
    res = html.format(button=status_dict[status][1], text=status_dict[status][0], order_id=order_obj.id)
    return mark_safe(res)

@register.simple_tag
def get_create_date(order_obj):
    html = "<td><a href='{order_id}'>{time}</a></td>"
    # create_date = order_obj.create_date + datetime.timedelta(hours = 8)
    create_date = order_obj.create_date
    time_toshow = create_date.strftime("%Y-%m-%d  %I:%M %p")
    res = html.format(time=time_toshow, order_id=order_obj.id)
    # print(res)
    return mark_safe(res)

@register.simple_tag
def get_date(order_obj):
    create_date = order_obj.create_date
    time_toshow = create_date.strftime("%Y-%m-%d  %I:%M %p")
    return time_toshow


@register.simple_tag
def get_checked_date(order_obj):
    date = order_obj.checked_date
    time_toshow = date.strftime("%Y-%m-%d  %I:%M %p")
    
    return time_toshow


@register.simple_tag
def get_order_items(form_obj):
    base_html = '''
    <div class="form-group">
        <label for="" class="col-sm-3 control-label text-bold">{label}</label>
        <div class="col-sm-4">
            {form_ele}
            {append_ele}
            <span class="help-block {field_name} hide"><small></small></span>
        </div>
    </div>
    '''
    html = ""
    for field_name in form_obj.base_fields:
        if field_name not in form_obj.Meta.hide_fields:
            field = form_obj.base_fields[field_name]
            
            # verbose_name
            label = form_obj.Meta.model._meta.get_field(field_name).verbose_name
            # print(field.__repr__())
            if "ModelChoiceField" in field.__repr__():
                append_ele = '''<a href="#"><i class="fa fa-md fa-plus add-items" id="add-{field_name}" aria-hidden="true">&nbsp;添加</i></a>'''.format(field_name=field_name)
            else:
                append_ele = ""

            form_ele = field.widget.render(name=field_name, value=form_obj[field_name].value())
            html += base_html.format(label=label, form_ele=form_ele, append_ele=append_ele, field_name=field_name)
    
    return mark_safe(html)
    
