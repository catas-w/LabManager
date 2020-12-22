"""LabManager URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from web import views
from django.conf.urls.static import static
from LabManager import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path("", views.index),
    path("home/", views.index),
    path("login/", views.acc_login),
    path("logout/", views.acc_logout),
    path("register/", views.acc_register),
    path("order/myorder/", views.myorder),
    path("order/myorder/create/", views.create_order),
    path("order/add-goods/", views.add_goods),
    path("order/myorder/<int:order_id>/", views.order_detail),
    path("order/check/", views.unchecked_order),
    path("order/check/<int:order_id>/", views.check_order, name="check_order"),
    path("order/history/", views.history_orders),
    path("order/history/<int:order_id>", views.history_order_detail, name="history_order_detail"),
    path("order/history/output/", views.output_history_order),
    path("userinfo/", views.user_info),
    path("userinfo/<int:user_id>", views.user_edit, name="user_edit"),

    path("get_notice/", views.get_notice),

] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
