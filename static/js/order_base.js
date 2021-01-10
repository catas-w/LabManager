/*
 * @Date: 2020-12-18 11:49:17
 * @LastEditTime: 2021-01-10 19:10:49
 * @Author: catas
 * @LastEditors: catas
 * @Description: 
 */

    $(function() {

        // 激活标志
        $('#mainnav-menu li').removeClass('active-link');
        
        $("li.order").addClass("active");
        $('.order ul').attr({'class': 'collapse in', 'aria-expanded': "true"});
         // 激活标志
        var task_type = window.location.pathname.split('/')[2];
         
        $(`li.${task_type}`).addClass('active-link');        

        // 更改Ordertype 跳转页面
        BindOrderTypeOnChange();
        
        // 只读 form
        ProcessReadonlyFields();
        
        // 初始化数字input
        InitNumberInput();
        // 启动单选框
        // $('#chosen-select').chosen({width: "50%"});
        $(".form-group select.chosen-style:visible").chosen({width:"50%"});
        
        // 绑定点击函数
        BindClickButton("#order-submit", BindOrderSubmit);
        BindClickButton("#add-detail", BindCreateGoods);
        BindClickButton("#add-company", BindCreateCompany);
        BindClickButton("#order-save", BindSaveOrder);
        BindClickButton("#order-delete", BindDeleteOrder);
        BindClickButton("#order-reject", BindReject);
        BindClickButton("#order-pass", BindPass);
        BindClickButton("#user-save", BindUserEdit);
        BindClickButton("#reset-passwd", BindResetPasswd);
        
        BindClickButton("#hist-order-submit", BindOrderSubmit, jump_url="/order/history/");
        BindClickButton("#hist-order-delete", BindDeleteOrder, jump_url="/order/history/");
        BindClickButton("#withdraw-order", BindWithrawOrder);
    }) ;

    function BindCreateGoods(e) {
            var dialog = bootbox.dialog({
                title: "新建商品",
                onEscape: true,
                message:'<div class="row"> ' + '<div class="col-md-12"> ' +
                    '<form class="form-horizontal"> ' +
                    '<div class="form-group"> ' +
                    '<label class="col-md-4 control-label text-bold" for="name">名称:</label> ' +
                    '<div class="col-md-4"> ' +
                    '<input name="name" type="text" placeholder="" required class="form-control input-md"> ' +
                    '<span class="help-block name hide"><small>Here goes your name</small></span> </div> ' +
                    '</div> ' + 

                    '<div class="form-group"> ' +
                    '<label class="col-md-4 control-label text-bold" for="name">品牌/型号:</label> ' +
                    '<div class="col-md-4"> ' +
                    '<input name="brand" type="text" placeholder="" required class="form-control input-md"> ' +
                    '<span class="help-block brand hide"><small>Here goes your name</small></span> </div> ' +
                    '</div> ' +  

                    '<div class="form-group"> ' +
                    '<label class="col-md-4 control-label text-muted" for="name">数量规格:</label> ' +
                    '<div class="col-md-4"> ' +
                    '<input name="specification" type="text" placeholder="如50ml/瓶, 150pc/盒..."  class="form-control input-md"> ' +
                    '<span class="help-block specification hide"><small>Here goes your name</small></span> </div> ' +
                    '</div> ' +  

                    '<div class="form-group"> ' +
                    '<label class="col-md-4 control-label text-muted" for="name">CAS号:</label> ' +
                    '<div class="col-md-4"> ' +
                    '<input name="CAS_number" type="text" placeholder=""  class="form-control input-md"> ' +
                    '<span class="help-block CAS_number hide"><small>Here goes your name</small></span>' + 
                    '<span class="help-block __all__ hide"><small>Here goes your name</small></span></div> ' +
                    '</div> ' +  

                    '</form> </div> </div>',
                buttons: {
                    success: {
                        label: "保存",
                        className: "btn-purple",
                        callback: function() {

                            var name = $("input[name='name']").val();
                            var brand = $("input[name='brand']").val();
                            var specification = $("input[name='specification']").val();
                            var CAS_number = $("input[name='CAS_number']").val();
                            
                            $.ajax({
                                url: "/order/add-goods/",
                                type: "post",
                                dataType: "JSON",
                                data: {
                                    csrfmiddlewaretoken: csrf_token,
                                    name: name,
                                    brand: brand,
                                    specification: specification,
                                    CAS_number: CAS_number
                                },
                                success: function(res) {
                                    // console.log(res);
                                    // console.log(JSON.stringify(res));
                                    if(res.status == "success") {
                                        // 
                                        // 更新 select
                                        var add_id = res.add_item[0];
                                        var add_name = res.add_item[1];
                                        $("select[name='detail']").append(`<option value="${add_id}">${add_name}</option>`);
                                        $("select[name='detail']").val(add_id);
                                        $("select[name='detail']").trigger("chosen:updated");
                                        // noty
                                        $.niftyNoty({
                                            type: 'success',
                                            icon : 'fa fa-check',
                                            message : "Success " +  ".<br> 添加成功 <strong>" + "</strong>",
                                            container : 'floating',
                                            timer : 5000
                                        });

                                        dialog.modal('hide');
                                        

                                    }else if(res.status == "failed") {
                                        // 添加失败
                                        $("span.help-block").addClass('hide');
                                        var res_keys = Object.keys(res.errors);
                                        for (i in res_keys) {
                                            $(`span.${res_keys[i]}`).removeClass('hide');
                                            $(`span.${res_keys[i]}`).html(res.errors[res_keys[i]]);
                                        }
                                    }
                                }
                            });

                            return false;
                        }
                    }
                }
            });
            
            dialog.init(function() {
                //console.log("AAAAA");
            });
    }

    function BindCreateCompany(e) {
        /**
         * @description: 懒得重构代码直接拷贝上面, 请勿模仿
         * @param {*}
         * @return {*}
         */
        var dialog = bootbox.dialog({
            title: "添加公司",
            onEscape: true,
            message:'<div class="row"> ' + '<div class="col-md-12"> ' +
                '<form class="form-horizontal"> ' +
                '<div class="form-group"> ' +
                '<label class="col-md-4 control-label text-bold" for="name">名称:</label> ' +
                '<div class="col-md-4"> ' +
                '<input name="name" type="text" placeholder="" required class="form-control input-md"> ' +
                '<span class="help-block name hide"><small>Here goes your name</small></span> </div> ' +
                '</div> ' + 
                                
                '</form> </div> </div>',
            buttons: {
                success: {
                    label: "保存",
                    className: "btn-purple",
                    callback: function() {

                        var name = $("input[name='name']").val();
                        
                        $.ajax({
                            url: "/order/add-company/",
                            type: "post",
                            dataType: "JSON",
                            data: {
                                csrfmiddlewaretoken: csrf_token,
                                name: name,
                            },
                            success: function(res) {
                                // console.log(res);
                                // console.log(JSON.stringify(res));
                                if(res.status == "success") {
                                    // 
                                    // 更新 select
                                    var add_id = res.add_item[0];
                                    var add_name = res.add_item[1];
                                    $("select[name='company']").append(`<option value="${add_id}">${add_name}</option>`);
                                    $("select[name='company']").val(add_id);
                                    $("select[name='company']").trigger("chosen:updated");
                                    // noty
                                    $.niftyNoty({
                                        type: 'success',
                                        icon : 'fa fa-check',
                                        message : "Success " +  ".<br> 添加成功 <strong>" + "</strong>",
                                        container : 'floating',
                                        timer : 5000
                                    });

                                    dialog.modal('hide');
                                    

                                }else if(res.status == "failed") {
                                    // 添加失败
                                    $("span.help-block").addClass('hide');
                                    var res_keys = Object.keys(res.errors);
                                    for (i in res_keys) {
                                        $(`span.${res_keys[i]}`).removeClass('hide');
                                        $(`span.${res_keys[i]}`).html(res.errors[res_keys[i]]);
                                    }
                                }
                            }
                        });

                        return false;
                    }
                }
            }
        });
}

    function BindDeleteOrder(e, jump_url) {
        e.preventDefault();
        
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;警告</label>',
            onEscape: true,
            message: "<label class='text-sm'>确认删除? 此操作不可撤销</label>",
            
            buttons: {
                default: {
                    label: "Cancel",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-danger",
                    callback: function() {
                        submitOrder("delete", jump_url);
                    },
                },
            },
            // animateIn: 'bounceIn',
            // animateOut : 'bounceOut',
        });

    }

    function BindCalculatePrice() {
        $("#get-price").click(function(e) {
            e.preventDefault();
            var price = $("input[name='unit_price']").val();
            var count = $("input[name='count']").val();
            if (price < 0 || count <0) {
                alert("不能小于0!");
            }
            
            var total_price = Number(price) * Number(count);
            $("input[name='total_price']").val(total_price.toFixed(2));
        })
    }

    function BindOrderSubmit(e, jump_url) {
        // 提交业务
        e.preventDefault();
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Alert</label>',
            onEscape: true,
            message: "<label class='text-sm'>确认要提交吗?</label>",
            
            buttons: {
                default: {
                    label: "Cancel",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-danger",
                    callback: function() {
                        submitOrder("submit", jump_url); 
                    },
                },
            },
        });          
    }

    function BindSaveOrder(e) {
        e.preventDefault();            
        submitOrder("save");
    }

    function submitOrder(type, jump_url) {
        var data = getOrderInfo();
        data.csrfmiddlewaretoken = csrf_token;
        data.type = type;
        // console.log(data);
        // return;
        $.ajax({
            url: "",
            type: "post",
            dataType: "JSON",
            data: data,
            // data: JSON.stringify(data),
            success: function(res) {
                if(res.status=="success") {
                    $.niftyNoty({
                        type: 'success',
                        icon : 'fa fa-check',
                        message : "Success " +  ".<br> " + type + "成功 <strong>" + "</strong>",
                        container : 'floating',
                        timer : 3000
                    });
                    // 跳转前一界面
                    if (jump_url)
                        setTimeout(function() {window.location.pathname = jump_url}, 750);
                    else {
                        var next_path = window.location.pathname.split("/").slice(0, -2).join("/");
                        setTimeout(function() {window.location.pathname = next_path}, 750);
                    }
                    // setTimeout(function() {window.location.pathname = "/order/myorder/"}, 750);

                }else if(res.status=="failed") {
                    $.niftyNoty({
                        type: 'danger',
                        icon : 'fa fa-check',
                        message : "数据错误 " +  ".<br> " + " <strong>" + "</strong>",
                        container : 'floating',
                        timer : 7000
                    });
                    
                    $("span.help-block").addClass('hide');
                    if (res.errors) {
                    var res_keys = Object.keys(res.errors);
                        for (i in res_keys) {
                            $(`span.${res_keys[i]}`).removeClass('hide');
                            $(`span.${res_keys[i]}`).html(res.errors[res_keys[i]]);
                        }
                    }
                }
            },

            error: function() {
                $.niftyNoty({
                    type: 'danger',
                    icon : 'fa fa-check',
                    message : "请求失败 (网络错误或订单已被删除, 撤回)" +  ".<br> " + " <strong>" + "</strong>",
                    container : 'floating',
                    timer : 5000
                });
            }
        });
    }

    function getOrderInfo() {
        // var detail = $("#chosen-select").val();
        // var company = $("input[name='company']").val();
        // var unit_price = $("input[name='unit_price']").val();
        // var count = $("input[name='count']").val();
        // var total_price = $("input[name='total_price']").val();
        // var memo = $("textarea[name='memo']").val();
        // var review = $("input[name='review']").val();

        // var data = {
        //     detail: detail,
        //     company: company,
        //     unit_price: unit_price,
        //     count: count,
        //     total_price: total_price,
        //     memo : memo,
        //     review: review,
        // }
        var data = {};
        var form_items = $(".form-control");
        for (var i =0; i<form_items.length; i++) {
            data[$(form_items[i]).attr('name')] = $(form_items[i]).val();
        }
        // console.log(data);
        return data;
    }
    
    function BindClickButton(item, func, jump_url) {
        // 绑定点击事件
        $(item).click(function (e) {
            $(item).attr("disabled", true);
            // console.log("run function...")
            // 执行绑定函数
            // e.preventDefault
            func(e, jump_url);
            
            // 1秒后启用点击事件
            setTimeout(function(){
                $(item).removeAttr("disabled");
            },1000);
        });        
    }

    function BindReject(e) {
        // 驳回订单
        e.preventDefault();
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Alert</label>',
            onEscape: true,
            message: 
                    "<label class='text-sm '>&nbsp;&nbsp;确认驳回此订单?</label>" +
                     '<div class="form-group">' +
                     '<label class="col-sm-2 control-label">原因(选填)</label>' +
                     '<div class="col-sm-10">' +
                         '<input type="text" name="review" placeholder="" class="form-control">'+
                        //  '<textarea name="review" placeholder="原因(选填)" cols="40" rows="2" style="width:100%;border-color: #acacac;" class="vLargeTextField"></textarea>'+
                     '</div>' +
                 '</div>',
            
            buttons: {
                default: {
                    label: "取消",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-danger",
                    callback: function() {
                        submitOrder("reject");
                    },
                },
            },
        });
    }

    function BindPass(e) {
        // 通过订单
        e.preventDefault();
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Alert</label>',
            onEscape: true,
            message: "<label class='text-sm'>确认审核通过?</label>",
            
            buttons: {
                default: {
                    label: "取消",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-success",
                    callback: function() {
                        submitOrder("pass");
                    },
                },
            },
        });
    }

    function BindUserEdit(e) {
        // 修改个人信息--管理员
        e.preventDefault();
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Alert</label>',
            onEscape: true,
            message: "<label class='text-sm'>确认修改?</label>",
            
            buttons: {
                default: {
                    label: "取消",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-success",
                    callback: function() {
                        submitOrder("edit_user");
                    },
                },
            },
        });
    }
    
    function InitNumberInput() {
        $(".form-group input[type='number']:visible").css({"width": "50%", "display": "inline-block"});
        $(".form-group input[name='total_price']:visible").after('<i class="fa fa-md fa-pencil" id="get-price" aria-hidden="true">&nbsp;计算</i>');
        BindCalculatePrice();        
    }

    function BindOrderTypeOnChange() {
        $(".form-group select[name='order_type']").change(function(e) {
            // console.log($(this).val());
            var order_type = $(this).val();
            window.location.search = `type=${order_type}`;
        })
    }

    function ProcessReadonlyFields() {
        $('.form-group .readonly').each(function() {
            var val = $(this).val();
            console.log(val);            
            if ($(this)[0].tagName == "SELECT") {
                val = $(this).find($(`option[value=${val}]`)).html();
                // console.log(val);
            }
            $(this).after(`<label class="order-info ">${val}</label>`);
            $(this).addClass("hide");
        })
    }

    function BindResetPasswd(e) {
        e.preventDefault();
        submitOrder("reset_passwd");
    }

    function BindWithrawOrder(e, jump_url) {
        // 撤回订单
        e.preventDefault();
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;Alert</label>',
            onEscape: true,
            message: "<label class='text-sm'>确认要撤回吗?</label>",
            
            buttons: {
                default: {
                    label: "Cancel",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-info",
                    callback: function() {
                        submitOrder("withdraw", window.location.pathname); 
                    },
                },
            },
        });          
    }
   