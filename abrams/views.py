from django.shortcuts import render, redirect, HttpResponse
from abrams import models 
from web import models as web_models

# Create your views here.

'''
    @description: 设置文件
    @param {*} request
    @return {*}
'''
def get_settings_page(request):
    return render(request, "common/settings.html")


'''
    @description: sharing docs page
    @param {*} request
    @return {*}
'''
def share_docs(request):
    if request.method == "POST":
        pass
    
    return render(request, "abrams/share_docs.html")



