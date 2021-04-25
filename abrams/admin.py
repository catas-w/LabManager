from django.contrib import admin
from abrams import models
# Register your models here.


class ShareDocsAdmin(admin.ModelAdmin):
    list_display = ("upload_date", "user")

admin.register(models.ShareDocs)


