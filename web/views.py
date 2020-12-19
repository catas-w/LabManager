'''
Date: 2020-12-15 10:24:28
LastEditTime: 2020-12-18 18:39:53
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
            next_url = request.GET.get('next', '/index')
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
            return redirect('/index/?from=sign_success')
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


@login_required
def create_order(request):
    
    if request.method == "POST":
        # 提交订单
        data = request.POST.copy()
        if data.get("type") == "submit":
            # 状态为提交
            status = 1
        else:
            # 状态为暂存
            status = 0

        append_dict = {
            "user": request.user.id,
            "status": status,
        }
        data.update(append_dict)
        form = forms.OrderForm(data)
        if form.is_valid():
            form.save()
            return HttpResponse(json.dumps({"status": "success",}))
        else:
            return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))

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
    if order_obj and (request.user.is_admin or (order_obj[0] in models.Order.objects.filter(user_id=request.user.id))):
        # 验证权限
        if request.method == "POST":
            # 修改数据
            data = request.POST.copy()
            if data.get("type") == "delete":
                # 状态为删除订单
                order_obj[0].delete()
                return HttpResponse(json.dumps({"status": "success", }))
            
            elif data.get("type") == "submit":
                # 状态为提交
                status = 1
            else:
                # 状态为暂存
                status = 0
            append_dict = {
                "user": request.user.id,
                "status": status,
                "id": order_id,
            }
            data.update(append_dict)
            form = forms.OrderForm(data, instance=order_obj[0])
            if form.is_valid():
                form.save()
                return HttpResponse(json.dumps({"status": "success",}))
            else:
                return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))

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

