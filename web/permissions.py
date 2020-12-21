
from django.urls import resolve
from django.shortcuts import render, redirect, HttpResponse
from web.permission_list import perm_dict
from LabManager import settings


def perm_check(*args, **kwargs):
    request = args[0]
    resolve_url_obj = resolve(request.path)
    current_url_name = resolve_url_obj.url_name
    match_flag = False
    match_key = None
    
    if not request.user.is_authenticated:
        return redirect(settings.LOGIN_URL)
    for per_key, per_val in perm_dict.items():
        per_url_name, per_meth, per_arg = per_val
        if per_url_name == current_url_name:
            if per_meth == request.method:
                if not per_arg:
                    match_flag = True
                    match_key = per_key
                else:
                    for item in per_arg:
                        request_method_fun = getattr(request, request.per_meth)
                        if request_method_fun.get(item, None):
                            match_flag = True
                        
                        else:
                            match_flag = False
                            break
                    
                    if match_flag == True:
                        match_key = per_key
                        break
    if match_flag:
        app_name, per_name = match_key.split('__')
        print("checl: " + per_name + request.user.name)
        # perm_obj = '%s.%s' % (app_name, match_key)
        perm_obj = '%s.%s' % (app_name, per_name)
        if request.user.is_admin or request.user.has_perm(match_key):
            
            print('----------Current user has permission')
            return True
        else:
            print('----------Current has not permission')
            return False
    else:
        # print("not match")
        return True


def check_permission(func):
    def inner(*args, **kwargs):
        if not perm_check(*args, **kwargs):
            # request = args[0]
            return HttpResponse(status=403)
        return func(*args, **kwargs)
    
    return inner
