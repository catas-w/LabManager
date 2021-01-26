'''
Date: 2021-01-05 22:31:27
LastEditTime: 2021-01-26 17:35:58
Author: catas
LastEditors: catas
Description: 
    批量导入历史信息
'''

 
import os
import django 
import datetime

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "LabManager.settings")
django.setup()

from web import models 

base_path = "C:\\Users\\catas\\Desktop"

file_ls = ["测序明细表(1).csv", "试剂耗材登记(1).csv", "引物合成明细.csv"]


def import_data_1():
    with open(os.path.join(base_path, file_ls[0]), 'r', encoding="UTF-8") as f:
        content = f.readlines()
        data_list = []
        for line in content[1: ]:
            info = line.strip().split(",")
            raw_time = info[0]
            user_name = info[1]
            gene_name = info[2]
            count = int(info[3])
            memo = info[4]
            unit_price = 10.0

            create_date = datetime.datetime.strptime(raw_time, "%Y.%m.%d")
            checked_date = datetime.datetime.strptime(raw_time + " 12:00", "%Y.%m.%d %H:%M")
            user = models.UserProfile.objects.filter(name=user_name)[0]
            company = models.CompanyInfo.objects.filter(name="其他")[0]
            total_price = round(count * unit_price, 2)

            order_obj = models.Order(
                order_type = 1,
                company = company,
                gene_name = gene_name,
                unit_price = unit_price, 
                count = count,
                total_price = total_price,
                create_date = create_date,
                checked_date = checked_date,
                status = 3,
                user = user,
                memo = memo,
            )
            data_list.append(order_obj)
        models.Order.objects.bulk_create(data_list)
            
            
def import_data_2():
    with open(os.path.join(base_path, file_ls[2]), 'r', encoding="UTF-8") as f:
        content = f.readlines()
        data_list = []
        for line in content[1: ]:
            info = line.strip().split(",")
            raw_time = info[0]
            user_name = info[1]
            gene_name = info[2]
            count = int(info[3]) + int(info[4])
            memo = info[5]
            unit_price = 0.5

            create_date = datetime.datetime.strptime(raw_time, "%Y.%m.%d")
            checked_date = datetime.datetime.strptime(raw_time + " 12:00", "%Y.%m.%d %H:%M")
            user = models.UserProfile.objects.filter(name=user_name)[0]
            company = models.CompanyInfo.objects.filter(name="其他")[0]
            total_price = round(count * unit_price, 2)

            order_obj = models.Order(
                order_type = 2,
                company = company,
                gene_name = gene_name,
                unit_price = unit_price, 
                count = count,
                total_price = total_price,
                create_date = create_date,
                checked_date = checked_date,
                status = 3,
                user = user,
                memo = memo,
            )
            data_list.append(order_obj)
        models.Order.objects.bulk_create(data_list)
            

def import_data_3():
    with open(os.path.join(base_path, file_ls[1]), 'r', encoding="UTF-8") as f:
        content = f.readlines()
        data_list = []
        for line in content[1: ]:
            info = line.strip().split(",")
            raw_time = info[0]
            user_name = info[1]
            goods_name = info[2]
            goods_brand = info[3] if info[3] else "默认"
            company_name = info[4] if info[4] else "其他"
            count = int(info[5])
            goods_specification = info[6]            
            unit_price = float(info[7])

            create_date = datetime.datetime.strptime(raw_time, "%Y.%m.%d")
            checked_date = datetime.datetime.strptime(raw_time + " 12:00", "%Y.%m.%d %H:%M")
            user = models.UserProfile.objects.filter(name=user_name)[0]
            total_price = round(count * unit_price, 2)

            company_ls = models.CompanyInfo.objects.filter(name=company_name)
            if company_ls:
                company = company_ls[0]
            else:
                company = models.CompanyInfo.objects.create(name=company_name)
                
            goods_ls = models.GoodsDetail.objects.filter(name=goods_name, brand=goods_brand)
            if goods_ls:
                goods_obj = goods_ls[0]
            else:
                goods_obj = models.GoodsDetail.objects.create(name=goods_name, 
                                                            brand=goods_brand, 
                                                            specification=goods_specification)

            order_obj = models.Order(
                order_type = 0,
                company = company,
                detail = goods_obj,
                unit_price = unit_price, 
                count = count,
                total_price = total_price,
                create_date = create_date,
                checked_date = checked_date,
                status = 3,
                user = user,
            )
            data_list.append(order_obj)
        models.Order.objects.bulk_create(data_list)


def create_geneinfo():
    # 添加 gene_info
    all_genes = models.Order.objects.all().values_list("gene_name")
    data_ls = []
    name_set = set()
    for item in all_genes:
        gene_name = item[0]
        
        if not gene_name or (gene_name in name_set):
            continue
        name_set.add(gene_name)
        
        obj = models.GeneInfo(
            name = gene_name,
            species = "人类"
        )
        data_ls.append(obj)
    
    models.GeneInfo.objects.bulk_create(data_ls)

def edit_gene_info():
    all_orders = models.Order.objects.filter(order_type__gt=0)
    for order in all_orders:
        gene_name = order.gene_name
        gene_obj = models.GeneInfo.objects.get(name=gene_name)
        order.gene_info = gene_obj
        order.save()
    pass

if __name__ == "__main__":
    # import_data_1()
    create_geneinfo()
    edit_gene_info()
    pass

