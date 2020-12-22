'''
Date: 2020-12-17 10:28:38
LastEditTime: 2020-12-22 21:55:43
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



