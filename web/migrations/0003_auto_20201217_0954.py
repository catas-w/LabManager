# Generated by Django 2.2.12 on 2020-12-17 01:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0002_auto_20201216_1018'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='dutyitem',
            options={'verbose_name': '值日人', 'verbose_name_plural': '值日人'},
        ),
        migrations.AlterModelOptions(
            name='goodsdetail',
            options={'verbose_name': '商品', 'verbose_name_plural': '商品'},
        ),
        migrations.AlterField(
            model_name='order',
            name='memo',
            field=models.TextField(blank=True, null=True, verbose_name='备注'),
        ),
    ]
