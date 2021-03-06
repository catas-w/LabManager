from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser, PermissionsMixin
)
import os

# Create your models here.


class MyUserManager(BaseUserManager):
    def create_user(self, email, name, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('请输入邮箱')

        user = self.model(
            email=self.normalize_email(email),
            name = name,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, name, password):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email,
            password=password,
            name = name,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user

def user_directory_path(instance, filename):
    # 头像上传路径
    file_type = filename.split('.')[-1]
    filename = 'avatar_{0}.{1}'.format(instance.id, file_type)
    return os.path.join("avatars", filename) # 系统路径分隔符差异，增强代码重用性


class UserProfile(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
        null = True,
    )
    name = models.CharField(max_length=64, )
    password = models.CharField(_("password"), max_length=128)

    user_type_choices = (
        (0, "老师"),
        (1, "博士"),
        (2, "硕士"),
        (3, "本科生"),
        (4, "已毕业"),
        (5, "----")
    )
    user_type = models.SmallIntegerField(choices=user_type_choices, verbose_name="用户类型", null=True, default=5)
    stu_number = models.CharField(max_length=16, blank=True, default="---", verbose_name="学号") 
    avatar = models.ImageField(verbose_name="头像", upload_to = user_directory_path, blank = True, null = True)
    motto = models.CharField(max_length=64, blank=True, default="好好学习, 天天向上", verbose_name="签名")

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name']

    # 这里定义一个方法，作用是当用户注册时没有上传照片，模板中调用 [ModelName].[ImageFieldName].url 时赋予一个默认路径    
    def avatar_url(self):
        if self.avatar and hasattr(self.avatar, 'url'):
            return self.avatar.url
        else:
            return '/media/default/av1.png'

    def __str__(self):
        return "%s" % (self.name, )

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        if self.is_admin:
            return True
        else:
            user_perms_codename = self.user_permissions.all().values_list("codename")
            return (perm, ) in user_perms_codename

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = "用户信息"

        permissions = (
            ("web__check_orders", "审核订单"),
            ("web__edit_history_orders", "修改历史订单"),
            ("web__edit_user_info", "修改用户信息"),
            # ("web__watch_unchecked_order", "查看未审核订单"),
        )
    

class Order(models.Model):
    objects = models.Manager()
    # 订单
    order_type_choices = (
        (0, "试剂购买"),
        (1, "基因测序"),
        (2, "引物合成"),
        # (3, "其他"),
    )
    order_type = models.SmallIntegerField(choices=order_type_choices, default=0, verbose_name="订单类型")
    # company = models.CharField(max_length=64, blank=True, null=True)
    company = models.ForeignKey("CompanyInfo", on_delete=models.SET_NULL, null=True, verbose_name="公司")

    gene_name = models.CharField(max_length=64, blank=True, null=True, verbose_name="基因")
    gene_info = models.ForeignKey("GeneInfo", on_delete=models.SET_NULL, null=True, verbose_name="基因")
    primer_product_length = models.IntegerField(blank=True, null=True, verbose_name="预计产物长度")

    primer1 = models.TextField(blank=True, null=True, verbose_name="引物序列F (5'-3')")
    primer2 = models.TextField(blank=True, null=True, verbose_name="引物序列R (5'-3')")

    unit_price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name="单价")
    count = models.IntegerField(verbose_name="数量")
    total_price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name="总价")
    create_date = models.DateTimeField(auto_now_add=True, verbose_name="创建日期")
    checked_date = models.DateTimeField(verbose_name="批准日期", blank=True, null=True)
    status_choices = (
        (0, "未提交"),
        (1, "待审核"),
        (2, "审核未通过"),
        (3, "已批准"),
    )
    status = models.SmallIntegerField(choices=status_choices, verbose_name="订单状态")
    
    user = models.ForeignKey("UserProfile", on_delete=models.SET_NULL, null=True, verbose_name="用户")
    memo = models.TextField(blank=True, null=True, verbose_name="备注")
    detail = models.ForeignKey("GoodsDetail", on_delete=models.SET_NULL, blank=True, null=True, verbose_name="商品")
    
    bill_received = models.BooleanField(default=False, verbose_name="收到底单")
    review = models.CharField(max_length=128, blank=True, null=True, verbose_name="原因")

    class Meta:
        verbose_name = "订单"
        verbose_name_plural = "订单"

    def __str__(self):
        return "%s-%s-%s" % (self.order_type, self.user, self.create_date)


class GeneInfo(models.Model):
    objects = models.Manager()
    # gene information
    name = models.CharField(max_length=64, verbose_name="基因名")
    species = models.CharField(max_length=64, verbose_name="物种")

    class Meta:
        verbose_name = "基因信息"
        verbose_name_plural = "基因信息"
        unique_together = [["name", "species"]]
    
    def __str__(self):
        return "%s (%s)" % (self.name, self.species)


class CompanyInfo(models.Model):
    objects = models.Manager()
    # 公司信息
    name = models.CharField(max_length=32, verbose_name="公司名称")
    # brief_name = models.CharField(max_length=16, blank=True, default="", verbose_name="简称")

    class Meta:
        verbose_name = "公司"
        verbose_name_plural = "公司"

    def __str__(self):
        return self.name


class GoodsDetail(models.Model):
    objects = models.Manager()
    # 商品详情
    name = models.CharField(max_length=32, verbose_name="名称")
    brand = models.CharField(max_length=32, verbose_name="品牌/型号")
    specification = models.CharField(max_length=32, verbose_name="数量规格", blank=True, null=True)
    CAS_number = models.CharField(max_length=16, verbose_name="CAS号", blank=True, null=True)

    class Meta:
        verbose_name = "商品"
        verbose_name_plural = "商品"

        unique_together = [['name', 'brand']]

    def __str__(self):
        return "%s %s" % (self.name, self.brand)

class Message(models.Model):
    objects = models.Manager()
    
    has_read = models.BooleanField(default=False)
    send_time = models.DateTimeField(auto_now_add=True)
    detail = models.TextField()
    brief = models.CharField(max_length=32)
    to_user = models.ForeignKey("UserProfile", on_delete=models.CASCADE)

    class Meta:
        verbose_name = "消息"
        verbose_name_plural = "消息"

    def __str__(self):
        return "%s-%s-[%s]" % (self.send_time, self.to_user, self.brief)


class DutyTable(models.Model):
    objects = models.Manager()

    duty_type = models.CharField(max_length=16)
    start_date = models.DateField()
    end_date = models.DateField()
    sep_weeks = models.SmallIntegerField(default=1)
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "值日表"
        verbose_name_plural = "值日表"
    
    def __str__(self):
        return "%s[%s-%s]" % (self.duty_type, self.start_date, self.end_date)


class DutyItem(models.Model):
    objects = models.Manager()

    table = models.ForeignKey("DutyTable", on_delete=models.CASCADE)
    user = models.ForeignKey("UserProfile", on_delete=models.CASCADE)
    order = models.SmallIntegerField()

    class Meta:
        verbose_name = "值日人"
        verbose_name_plural = "值日人"
    
    def __str__(self):
        return "%s-%s" % (self.user, self.table)
