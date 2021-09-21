from django.contrib import admin
from django.urls import path

from abrams import views

urlpatterns = [
    path("docs/", views.share_docs),
    path('common/settings', views.get_settings_page),

    path("live/", views.live_test),
]










