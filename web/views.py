'''
Date: 2020-12-15 10:24:28
LastEditTime: 2021-01-24 16:45:23
Author: catas
LastEditors: catas
Description: 
'''
from django.shortcuts import render, redirect, reverse
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
from web.utils import process_order
from web.utils import OrderFormBuilder
from django.forms import modelform_factory
from web import tables

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
def reset_passwd(request):
    # 修改密码
    if request.method == "POST":
        # print(request.POST)
        errors = {}
        old_password = request.POST.get("password")
        user = authenticate(username=request.user.email, password=old_password)
        if user is not None:
            # 验证成功
            password1 = request.POST.get("password1")
            password2 = request.POST.get("password2")
            if password1 == password2:
                request.user.set_password(password1)
                request.user.save()
                return HttpResponse(json.dumps({"status": "success"}))
            
            else:
                errors["password2"] = "两次密码不一致"
        else:
            errors["password"] = "密码不正确"

        return HttpResponse(json.dumps({"status": "failed",
                                        "errors": errors}))
    return render(request, "web/user_info_passwd.html")



@login_required
def myorder(request):
    '''
    description: 查看自己订单
    param {*}
    return {*}
    '''
    cur_user_id = request.user.id
    cur_orders = models.Order.objects.filter(user_id=cur_user_id).order_by("create_date").reverse()
    order_list_type = "personal"
    scale = request.GET.get("scale", "")
    q = request.GET.get("q", "")
    cur_orders = tables.search_by(q, cur_orders, ["gene_name", "detail__name"])
    
    if scale:
        # 过滤时间
        days = int(scale) * 30
        filter_date = datetime.datetime.now() - datetime.timedelta(days=days)
        conditions = {"create_date": filter_date }
        cur_orders = tables.query_filter(conditions, models.Order, cur_orders)

    return render(request, "web/orders.html", {"my_orders": cur_orders, 
                                            "order_list_type": order_list_type,
                                            "order_type": order_list_type,
                                            "scale": scale,
                                            "q": q
                                            })


   
@login_required
def create_order(request):
    '''
    description: 创建新订单, POST: 提交或保存
    param {*}
    return {*}
    '''
    creater = OrderFormBuilder()
    
    if request.method == "POST":
        data = request.POST.copy()
        # print(data.get("order_type"))
        # print(type(data.get("order_type")))
        data.update({"user": request.user.id})
        # print(data)
        if data.get("type") != "save" and data.get("type") != "submit":
            # 不是提交或者保存
            return HttpResponse(status=403)
        form_class = creater.create_new_order(int(data.get("order_type")))
        return process_order(request, data, form_class)

    order_type_param = request.GET.get("type", "")
    try:
        order_type = int(order_type_param)
    except Exception:
        order_type = 0
    
    form_class = creater.create_new_order(order_type)
    form_obj = form_class(initial={"order_type": order_type})
    
    return render(request, "web/neworder.html", {
                                                "form_obj": form_obj,
                                                })
    

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
def add_company(request):
    if request.method == "POST":
        form = forms.CompanyForm(request.POST)
        if form.is_valid():
            add_obj = form.save()
            return HttpResponse(json.dumps({"status": "success", "add_item": [add_obj.id, add_obj.__str__()]}))
        else:
            return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))


@login_required
def order_detail(request, order_id):
    '''
    description: 查看自己的订单信息
    param {*}
    return {*}
    '''
    creater = OrderFormBuilder()    
    order_obj = models.Order.objects.get(id=order_id)

    if order_obj and (order_obj in models.Order.objects.filter(user_id=request.user.id)):
        # 验证权限
        if request.method == "POST":
            # 修改数据
            if order_obj.status == 3:
                # status 已完成
                return HttpResponse(status=403)
            
            data = request.POST.copy()

            if order_obj.status == 1:
                if data.get("type") == "withdraw":
                    # 撤回订单
                    order_obj.status = 0
                    order_obj.save()
                    return HttpResponse(json.dumps({"status": "success"}))
                else:
                    return HttpResponse(status=403)                    

            if data.get("type") == "delete":
                # 状态为删除订单
                order_obj.delete()
                return HttpResponse(json.dumps({"status": "success", }))

            form_class = creater.create_edit_order(order_obj.order_type)
            return process_order(request, data, form_class, order_obj)

        # GET
        editabl = False
        if order_obj.status == 0 or order_obj.status == 2:
            # 订单未提交或未通过, 可修改
            form_class = creater.create_edit_order(order_obj.order_type)
            editabl = True
        else:
            # 订单不可修改
            form_class = creater.create_readonly_order(order_obj.order_type)
        
        form_obj = form_class(instance=order_obj)        
        return render(request, "web/order_edit.html", {"order_obj": order_obj,
                                                        "editable": editabl,
                                                        "form_obj": form_obj,
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
    # 查询参数
    scale = request.GET.get("scale", "")
    q = request.GET.get("q", "")
    order_objs = models.Order.objects.filter(status=1).order_by("create_date").reverse()
    order_objs = tables.search_by(q, order_objs, ["user__name", "gene_name", "detail__name"])
    
    message = ""
    message = request.GET.get("error-msg", "")

    return render(request, "web/orders.html", {"order_type": order_type, 
                                                "order_objs": order_objs, 
                                                "message": message,
                                                "scale": scale,
                                                "q": q
                                                })


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
        return redirect("/order/check/?error-msg=此订单已被删除或不存在!")
    
    if order_obj.status != 1:
        # return unchecked_order(request, message="此订单已被撤回或不存在!")
        return redirect("/order/check/?error-msg=此订单已被撤回或不存在!")
    
    creater = OrderFormBuilder()        
    order_class = creater.create_check_order(order_type=order_obj.order_type)

    if request.method == "POST":
        data = request.POST.copy()
        # print(data)
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
    
    form_obj = order_class(instance=order_obj)
    has_check_perm = request.user.has_perm("web__check_orders")
    
    return render(request, "web/order_check.html", {"order_obj": order_obj, 
                                                    "has_check_perm": has_check_perm,
                                                    "form_obj": form_obj,
                                                    })
        
    

@login_required
def history_orders(request):
    '''
    description: 历史订单列表
    param {*}
    return {*}
    '''    
    order_type = "history"
    scale = request.GET.get("scale", "")
    q = request.GET.get("q", "")
    order_objs = models.Order.objects.filter(status=3).order_by("create_date").reverse()
    order_objs = tables.search_by(q, order_objs, ["user__name", "gene_name", "detail__name"])
    
    if scale:
        # 过滤时间
        days = int(scale) * 30
        filter_date = datetime.datetime.now() - datetime.timedelta(days=days)
        conditions = {"create_date": filter_date }
        order_objs = tables.query_filter(conditions, models.Order, order_objs)

    return render(request, "web/orders.html", {"order_type": order_type,
                                             "order_objs": order_objs,
                                             "scale": scale,
                                             "q": q
                                             })

@check_permission
@login_required
def history_order_detail(request, order_id):    
    '''
    description: 历史订单详情
    param {*}
    return {*}
    '''    
    order_obj = models.Order.objects.get(id=order_id)
    creater = OrderFormBuilder()        

    if request.method == 'POST':
        # 提交修改
        data = request.POST.copy()
        print(data)
        if data.get("type") == "delete":
            # 状态为删除订单
            order_obj.delete()
            return HttpResponse(json.dumps({"status": "success", }))
        
        # 不允许修改状态
        data["type"] = "pass"
        order_class = creater.create_edit_hist_order(order_type=order_obj.order_type)

        return process_order(request, data, order_class, order_obj)

    page_type = "history"
    has_edit_perm = request.user.has_perm("web__edit_history_orders")
    
    if request.GET.get("type", "") and has_edit_perm:
        # 编辑模式
        show_edit = False
        editable = True
        goods = models.GoodsDetail.objects.all()
        order_class = creater.create_edit_hist_order(order_type=order_obj.order_type)
    else:
        show_edit = True
        editable = False
        goods = None
        order_class = creater.create_view_hist_order(order_type=order_obj.order_type)
    form_obj = order_class(instance=order_obj)
        
    return render(request, "web/order_edit.html", {"order_obj": order_obj,
                                                    "editable": editable,
                                                    "page_type": page_type,
                                                    "has_edit_perm": has_edit_perm,
                                                    "show_edit": show_edit,
                                                    "form_obj": form_obj,
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
    # sheet = wb.add_sheet(u'历史订单')
    # columns = ["订单id", "创建日期", "批准日期", "申请人", "商品", "单价", "数量", "总价", "收到底单"]
    all_cols = [("订单id", "id"), 
                ("订单类型", "get_order_type_display"),  
                ("创建日期", "create_date"), 
                ("批准日期", "checked_date"), 
                ("申请人", "user", "name"), 
                ("商品", "detail"), 
                ("基因", "gene_name"), 
                ("公司", "company", "name"), 
                ("单价", "unit_price"), 
                ("数量", "count"), 
                ("总价", "total_price"), 
                ("收到底单", "bill_received")]
                
    all_sheets = [(u"试剂购买", all_cols[0:6]+all_cols[7:], 0),
                  (u"基因测序", all_cols[0:5]+all_cols[6:], 1), 
                  (u"引物合成", all_cols[0:5]+all_cols[6:], 2), 
                 ]
    
    for item in all_sheets:
        objs = order_objs.filter(order_type=item[2])
        sheet = wb.add_sheet(item[0])
        columns = item[1]
        for i in range(len(columns)):
            # 添加 headers
            sheet.write(0, i, columns[i][0])
        
        for i in range(len(objs)):
            for j in range(len(columns)):
                obj_attr = objs[i]
                for attr in columns[j][1:]:
                    # print(attr)
                    obj_attr = getattr(obj_attr, attr)
                
                if "method" in obj_attr.__repr__():
                    obj_attr = obj_attr()
                elif "time" in obj_attr.__repr__():
                    obj_attr = obj_attr.strftime("%Y-%m-%d  %H:%M")

                value = obj_attr.__str__()
                sheet.write(i+1, j, value)
    
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
    user_objs = models.UserProfile.objects.all().order_by("is_admin").reverse()
    user_type = request.GET.get("user_type", "active")
    if user_type == "active":
        user_objs = tables.query_filter({"is_active": True}, models.UserProfile, user_objs)

    return render(request, "web/user_info.html", {"user_objs": user_objs, 
                                                  "user_type": user_type,
                                                  })


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
        data.setlist("user_permissions", data.getlist("user_permissions[]"))
        form_class = modelform_factory(models.UserProfile, 
                                fields=('name', 'user_type', 'is_active', 'is_admin', "user_permissions", "stu_number"), 
                                )
        form = form_class(data, instance=user_obj)                        
        if form.is_valid():
            # print(form.cleaned_data)
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
def myprofile(request):
    '''
    description: 自己的信息
    param {*}
    return {*}
    '''    
    # user_obj = models.UserProfile.objects.get(id=request.user.id)
    user_obj = request.user
    if request.method == "POST":
        form_class = modelform_factory(models.UserProfile, 
                                    fields=("avatar", "email", 'name', "motto", 'user_type', "stu_number"), 
                                    # widgets={"name": {"required": "字段不能为空",}},
                                    )
        form = form_class(request.POST, instance=user_obj) 
        if form.is_valid():
            # print(form.cleaned_data)..........................
            form.save()
            return HttpResponse(json.dumps({"status": "success"}))
        else:
            return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))

    return render(request, "web/user_info_self.html", {"user": user_obj, 
                                                        "user_types": user_obj.user_type_choices,
                                                        })

@login_required
def update_avatar(request):
    '''
    description: 修改头像
    '''
    if request.method == "POST":
        request.user.avatar = request.FILES.get("file")
        request.user.save()
        return HttpResponse(json.dumps({"status": "success", "img_url": request.user.avatar_url()}))

    return HttpResponse(status=404)


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

@login_required
def statistic(request):
    # 统计图
    if request.method == "POST":
        from web.utils import get_statistic_data
        return HttpResponse(json.dumps(get_statistic_data(request.POST)))

    return render(request, "web/statistic.html")

