from django.db.models import Count, Q

def search_by(search_str, querysets, search_fields):
    '''
    description: 过滤搜索
    param {*}
    return {*}
    '''
    if search_str:
        q_obj = Q()
        q_obj.connector = 'OR'
        
        for q_field in search_fields:
            q_obj.children.append(("%s__contains" % q_field, search_str))

        return querysets.filter(q_obj)
    else:
        return querysets

def get_orderby(request, model_objs, admin_form):
    orderby_field = request.GET.get('orderby', '')
    if orderby_field:
        orderby_field = orderby_field.strip()
        orderby_column_index = admin_form.list_display.index(orderby_field.strip('-'))
        objs = model_objs.order_by(orderby_field)
        if orderby_field.startswith('-'):
            orderby_field = orderby_field.strip('-')
        else:
            orderby_field = '-%s' % orderby_field
        return [objs, orderby_field, orderby_column_index]
    
    else:
        return [model_objs, orderby_field, None]

        
def table_filter(request, model_admin, models_class):
    # filter data
    filter_conditions = {}
    if hasattr(model_admin, 'list_filter'):
        for condition in model_admin.list_filter:
            if request.GET.get(condition):
                filed_type_name = models_class._meta.get_field(condition).__repr__()
                
                if 'ForeignKey' in filed_type_name:
                    filter_conditions['%s_id' % condition] = request.GET.get(condition)
                elif 'DateField' in filed_type_name or 'DateTimeField' in filed_type_name:
                    filter_conditions['%s__gt' % condition] = request.GET.get(condition)
                else:
                    filter_conditions[condition] = request.GET.get(condition)
    
    return models_class.objects.filter(**filter_conditions)


def query_filter(conditions, model_class, querysets):
    '''
    description: 条件过滤
    param {*}
        conditions = {
            'create_time': "2020-01-01 00:00",
        }
    return {*}
    '''
    filter_conditions = {}
    for condition, value in conditions.items():
        filed_type_name = model_class._meta.get_field(condition).__repr__()
        if 'ForeignKey' in filed_type_name:
            filter_conditions['%s_id' % condition] = value
        elif 'DateField' in filed_type_name or 'DateTimeField' in filed_type_name:
            filter_conditions['%s__gt' % condition] = value
        else:
            filter_conditions[condition] = value

    return querysets.filter(**filter_conditions)



