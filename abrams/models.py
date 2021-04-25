from django.db import models

# Create your models here.

class ShareDocs(models.Model):
    # 上传文档
    objects = models.Manager()
    title = models.CharField(max_length=64, blank=True, null=True)
    package = models.CharField(max_length=32, default="", verbose_name="文件夹")
    file = models.FileField(upload_to="uploads/", verbose_name="文件 ")
    user = models.ForeignKey("web.UserProfile", on_delete=models.CASCADE, verbose_name="上传用户")
    upload_date = models.DateTimeField(auto_now_add=True, verbose_name="上传日期")

    class Meta:
        verbose_name = "文档"
        verbose_name_plural = "文档"

    def __str__(self):
        return self.document






