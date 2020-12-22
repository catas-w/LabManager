'''
Date: 2020-12-15 10:24:28
LastEditTime: 2020-12-22 18:38:56
Author: catas
LastEditors: catas
Description: 
'''
from django.shortcuts import render, redirect
from django.shortcuts import HttpResponse
from django.contrib.auth import authenticate, login, logout
from web import models
from django.contrib.auth.decorators import login_required
import json
from web import forms
from django.core.exceptions import ObjectDoesNotExist
from django.utils import timezone
import datetime
from web.permissions import check_permission
from web.permission_list import perm_dict

# Create your views here.


@login_required
def index(request):
    return render(request, 'web/home.html')


def acc_login(request):
    errors = {}
    if request.method == 'POST':
        _email = request.POST.get('email')
        _password = request.POST.get('password')

        user = authenticate(request, username=_email, password=_password)
        
        if user:
            login(request, user)
            next_url = request.GET.get('next', '/')
            return redirect(next_url)
        else:
            errors['error'] = '(账户名或密码不正确!)'

    return render(request, 'web/login.html', {'errors': errors})

@login_required
def acc_logout(request):
    logout(request)
    return redirect("/login")

def acc_register(request):
    errors = r"{}"
    if request.method == 'POST':
        from web.admin import UserCreationForm
        form_obj = UserCreationForm(request.POST)
        if form_obj.is_valid():
            form_obj.save()

            # print(form_obj.cleaned_data)
            user = authenticate(request, username=form_obj.cleaned_data['email'], password=form_obj.cleaned_data['password1'])
            login(request, user)
            return redirect('/')
        else:
            errors = form_obj.errors.as_json()
            
    return render(request, 'web/register.html', {'errors': json.loads(errors)})

@login_required
def myorder(request):
    '''
    description: 查看自己订单
    param {*}
    return {*}
    '''
    cur_user_id = request.user.id
    cur_orders = models.Order.objects.filter(user_id=cur_user_id).order_by("create_date").reverse()
    order_type = "personal"
    
    return render(request, "web/orders.html", {"my_orders": cur_orders, "order_type": order_type})


def process_order(request, data, order_obj=None):
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
        form = forms.OrderForm(data, instance=order_obj)
    else:
        form = forms.OrderForm(data)

    if form.is_valid():
        print(form.cleaned_data)
        form.save()
        return HttpResponse(json.dumps({"status": "success",}))
    else:
        return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))
    

@login_required
def create_order(request):
    
    if request.method == "POST":
        # 提交新订单
        data = request.POST.copy()
        if data.get("type") != "save" and data.get("type") != "submit":
            # 不是提交或者保存
            return HttpResponse(status=403)
        return process_order(request, data)

    goods = models.GoodsDetail.objects.all()
    return render(request, "web/neworder.html", {"goods": goods, })

    

@login_required
def add_goods(request):
    # 添加新商品
    if request.method == "POST":
        # print(request.POST)
        form = forms.GoodsDetailForm(request.POST)

        if form.is_valid():
            add_obj = form.save()
            return HttpResponse(json.dumps({"status": "success", "add_item": [add_obj.id, add_obj.__str__()]}))

        else:
            return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))

@login_required
def order_detail(request, order_id):
    order_obj = models.Order.objects.filter(id=order_id)
    if order_obj and (order_obj[0] in models.Order.objects.filter(user_id=request.user.id)):
        # 验证权限
        if request.method == "POST":
            # 修改数据
            if order_obj[0].status == 1 or order_obj[0].status == 3:
                # status 是已提交或已完成
                return HttpResponse(status=403)
                
            data = request.POST.copy()
            if data.get("type") == "delete":
                # 状态为删除订单
                order_obj[0].delete()
                return HttpResponse(json.dumps({"status": "success", }))
            
            return process_order(request, data, order_obj[0])

        # GET
        goods = models.GoodsDetail.objects.all()
        editabl = False
        if order_obj[0].status == 0 or order_obj[0].status == 2:
            # 订单未提交或未通过, 可修改
            editabl = True
        return render(request, "web/order_edit.html", {"order_obj": order_obj[0],
                                                         "goods": goods,
                                                         "editable": editabl,
                                                         })
    else:
        return HttpResponse(status=404)


@login_required
def unchecked_order(request):
    '''
    description: 未审核表单
    param {*}
    return {*}
    '''    
    order_type = "unchecked"
    order_objs = models.Order.objects.filter(status=1).order_by("create_date").reverse()
    
    return render(request, "web/orders.html", {"order_type": order_type, "order_objs": order_objs})


@login_required
@check_permission
def check_order(request, order_id):
    '''
    description: 检查订单
    param {*}
        order_id: 订单id
    return {*}
    '''    
    try:
        order_obj = models.Order.objects.get(id=order_id)
    except ObjectDoesNotExist:
        return HttpResponse(404)
    # if order_obj.status != 1 and request.user.is_admin != True:
    if order_obj.status != 1:
        return HttpResponse(403)

    if request.method == "POST":
        data = request.POST.copy()
        print(data)
        status_dict = {
        "save": 0,
        "submit": 1,
        "reject": 2,
        "pass": 3,
        }
        review = data.get("review", "")
        if review:
            order_obj.review = review
        order_obj.status = status_dict[data.get("type")]
        if order_obj.status == 3:
            # 通过
            order_obj.checked_date = timezone.now()
            
        order_obj.save()
        
        return HttpResponse(json.dumps({"status": "success"}))
    
    has_check_perm = request.user.has_perm("web__check_orders")
    return render(request, "web/order_check.html", {"order_obj": order_obj, 
                                                    "has_check_perm": has_check_perm,
                                                    })
        
    

@login_required
def history_orders(request):
    '''
    description: 历史订单列表
    param {*}
    return {*}
    '''    
    order_type = "history"
    order_objs = models.Order.objects.filter(status=3).order_by("create_date").reverse()
    
    return render(request, "web/orders.html", {"order_type": order_type,
                                             "order_objs": order_objs,
                                             })


@login_required
def history_order_detail(request, order_id):    
    '''
    description: 历史订单详情
    param {*}
    return {*}
    '''    
    order_obj = models.Order.objects.get(id=order_id)
    if request.method == 'POST':
        # 提交修改
        data = request.POST.copy()
        data["type"] = "pass" # 不允许修改状态
        print(data)
        if data.get("type") == "delete":
            # 状态为删除订单
            order_obj.delete()
            return HttpResponse(json.dumps({"status": "success", }))
        # return HttpResponse(json.dumps({"status": "failed", }))
        return process_order(request, data, order_obj)

    page_type = "history"
    has_edit_perm = request.user.has_perm("web__edit_history_orders")
    show_edit = True
    editable = False
    goods = None
    if request.GET.get("type", "") and has_edit_perm:
        # 编辑模式
        show_edit = False
        editable = True
        goods = models.GoodsDetail.objects.all()
        
    return render(request, "web/order_edit.html", {"order_obj": order_obj,
                                                         "editable": editable,
                                                         "page_type": page_type,
                                                         "has_edit_perm": has_edit_perm,
                                                         "show_edit": show_edit,
                                                         "goods": goods,
                                                         })


@login_required
def output_history_order(request):
    '''
    description: 返回excel
    param {*}
    return {*}
    '''    
    import xlwt
    from io import BytesIO

    order_objs = models.Order.objects.filter(status=3).order_by("create_date").reverse()
    #设定编码类型为utf8
    wb = xlwt.Workbook(encoding = 'utf-8')
    #excel里添加类别
    sheet = wb.add_sheet(u'历史订单')
    columns = ["订单id", "创建日期", "批准日期", "申请人", "商品", "单价", "数量", "总价", "收到底单"]
    for i in range(len(columns)):
        sheet.write(0, i, columns[i])

    for j in range(len(order_objs)):
        sheet.write(j+1, 0, order_objs[j].id)
        sheet.write(j+1, 1, order_objs[j].create_date.strftime("%Y-%m-%d  %H:%M"))
        sheet.write(j+1, 2, order_objs[j].checked_date.strftime("%Y-%m-%d  %H:%M"))
        sheet.write(j+1, 3, order_objs[j].user.name)
        sheet.write(j+1, 4, order_objs[j].detail.__str__())
        sheet.write(j+1, 5, order_objs[j].unit_price.__str__())
        sheet.write(j+1, 6, order_objs[j].count)
        sheet.write(j+1, 7, order_objs[j].total_price.__str__())
        sheet.write(j+1, 8, "是" if order_objs[j].bill_received else "否")
    
    output = BytesIO()
    wb.save(output)
    # 设置文件读取的偏移量，0表示从头读起
    output.seek(0)
    #指定返回为excel文件
    response = HttpResponse(content_type='application/vnd.ms-excel')
    #指定返回文件名
    response['Content-Disposition'] = 'attachment;filename="历史订单.xls"'
    response.write(output.getvalue())
    return response
        
    
    
@login_required
def user_info(request):
    user_objs = models.UserProfile.objects.all()
    return render(request, "web/user_info.html", {"user_objs": user_objs})


@check_permission
@login_required
def user_edit(request, user_id):
    '''
    description: 管理员编辑用户信息
    param {*}
    return {*}
    '''
    user_obj = models.UserProfile.objects.get(id=user_id)
    if request.method == "POST":
        data = request.POST.copy()
        data['is_admin'] = data.get("is_admin").capitalize()
        data['is_acitve'] = data.get("is_active").capitalize()
        # data["user_permissions"] = data.get("user_permissions[]")
        data.setlist("user_permissions", data.getlist("user_permissions[]"))
        print(data)
        print(data.getlist("user_permissions"))
        form = forms.UserEditForm(data, instance=user_obj)
        if form.is_valid():
            print(form.cleaned_data)
            form.save()
            return HttpResponse(json.dumps({"status": "success"}))
        else:
            return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))

    user_perms = user_obj.user_permissions.all().values_list("id", "name")
    # 所有自定义权限
    all_perms = user_obj.user_permissions.model.objects.filter(codename__contains="web__").values_list("id", "name")
    has_edit_perm = request.user.has_perm("web__edit_user_info")
    return render(request, "web/user_info_edit.html", {"user": user_obj,
                                                        "user_types": user_obj.user_type_choices,
                                                        "user_perms": user_perms,
                                                        "all_perms": all_perms,
                                                        "has_edit_perm": has_edit_perm,
                                                        })


@login_required
def get_notice(request):
    '''
    description: 首页通知
    param {*}
    return {*}
    '''
    has_check_orders_perm = request.user.has_perm("web__check_orders")
    if has_check_orders_perm:
        unchecked_order_objs = models.Order.objects.filter(status=1)
        unchecked_num = len(unchecked_order_objs)
        return HttpResponse(json.dumps({"status": "success", 
                                        "has_check_orders_perm": has_check_orders_perm,
                                        "unchecked_num": unchecked_num,
                                        }))
    else:
        return HttpResponse(json.dumps({"status": "success", 
                                        "has_check_orders_perm": has_check_orders_perm,
                                        }))




