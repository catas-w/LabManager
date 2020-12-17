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

            print(form_obj.cleaned_data)
            user = authenticate(request, username=form_obj.cleaned_data['email'], password=form_obj.cleaned_data['password1'])
            login(request, user)
            return redirect('/index/?from=sign_success')
        else:
            errors = form_obj.errors.as_json()
            
    return render(request, 'web/register.html', {'errors': json.loads(errors)})


def myorder(request):
    cur_user_id = request.user.id
    cur_orders = models.Order.objects.filter(user_id=cur_user_id).order_by("create_date").reverse()
    
    return render(request, "web/orders.html", {"my_orders": cur_orders,})


def create_order(request):
    goods = models.GoodsDetail.objects.all()
    return render(request, "web/neworder.html", {"goods": goods, })


def add_goods(request):
    if request.method == "POST":
        print(request.POST)
        form = forms.GoodsDetailForm(request.POST)

        if form.is_valid():
            add_obj = form.save()
            return HttpResponse(json.dumps({"status": "success", "add_item": [add_obj.id, add_obj.name]}))

        else:
            return HttpResponse(json.dumps({"status": "failed", "errors": form.errors}))




