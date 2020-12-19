# Generated by Django 2.2.12 on 2020-12-19 12:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0004_auto_20201217_1626'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='bill_received',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='order',
            name='review',
            field=models.CharField(blank=True, max_length=128, null=True),
        ),
    ]