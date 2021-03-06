/*
 * @Date: 2020-12-18 11:49:17
 * @LastEditTime: 2021-04-26 17:41:54
 * @Author: catas
 * @LastEditors: catas
 * @Description: 
 */

    $(function() {

        // 激活标志
        InitTag();

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
        BindClickButton("#add-gene_info", BindCreateGene);
        BindClickButton("#order-save", BindSaveOrder);
        BindClickButton("#order-delete", BindDeleteOrder);
        BindClickButton("#order-reject", BindReject);
        BindClickButton("#order-pass", BindPass);
        BindClickButton("#user-save", BindUserEdit);
        BindClickButton("#reset-passwd", BindResetPasswd);
        BindClickButton("#admin-reset-pwd", BindAdminResetPwd);
        
        BindClickButton("#hist-order-submit", BindOrderSubmit, jump_url="/order/history/");
        BindClickButton("#hist-order-delete", BindDeleteOrder, jump_url="/order/history/");
        BindClickButton("#withdraw-order", BindWithrawOrder);
    }) ;

    function InitTag() {
        $('#mainnav-menu li').removeClass('active-link');
        
        $("li.order").addClass("active");
        $('.order ul').attr({'class': 'collapse in', 'aria-expanded': "true"});
         // 激活标志
        var task_type = window.location.pathname.split('/')[2];
         
        $(`li.${task_type}`).addClass('active-link');
    }

    function BindCreateGoods(e) {
        var form_content = '<div class="form-group"> ' +
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
        '</div> ';
        AddForeignKeyItems(e, form_content, "detail", "添加商品", "/order/add-goods/");
    }

    function BindCreateCompany(e) {
        var form_content = '<div class="form-group"> ' +
        '<label class="col-md-4 control-label text-bold" for="name">名称:</label> ' +
        '<div class="col-md-4"> ' +
        '<input name="name" type="text" placeholder="" required class="form-control input-md"> ' +
        '<span class="help-block name hide"><small>Here goes your name</small></span> </div> ' +
        '</div> ';
        
        AddForeignKeyItems(e, form_content, "company", "添加公司", "/order/add-company/");
    }

    function BindCreateGene(e) {
        var form_content = `
        <div class="form-group"> 
            <label class="col-md-4 control-label text-bold" for="name">基因名:</label> 
            <div class="col-md-4">
                <input name="name" type="text" placeholder="" required="" class="form-control input-md"> 
                <span class="help-block name hide"><small>Here goes your name</small></span> 
            </div> 
        </div>
        <div class="form-group"> 
            <label class="col-md-4 control-label text-bold" for="name">物种:</label> 
            <div class="col-md-4">
                <input name="species" type="text" placeholder="" required="" class="form-control input-md"> 
                <span class="help-block species hide"><small>Here goes your name</small></span> 
            </div> 
        </div> 
        `;
        AddForeignKeyItems(e, form_content, "gene_info", "添加基因", "/order/add-gene/");
    }

    function AddForeignKeyItems(e, form_content, item_type, title, url) {
        /**
         * @description: 添加外键信息
         * @param {*} form_content: html
         *            item_type: company, gene_type...
         *            title: 基因信息, 公司...
         * @return {*}
         */
        e.preventDefault();
        var dialog = bootbox.dialog({
            title: title,
            onEscape: true,
            message:`
                <div class="row"> 
                    <div class="col-md-12"> 
                        <form class="form-horizontal add-foreignkey-items"> 
                            ${form_content}
                        </form> 
                    </div> 
                </div>
            `,
            buttons: {
                success: {
                    label: "保存",
                    className: "btn-purple",
                    callback: function() {
                        $.ajax({
                            url: "/order/add-items/",
                            type: "post",
                            dataType: "JSON",
                            data: GetAddForeignKeyFormData(item_type),
                            success: function(res) {
                                // console.log(res);
                                if(res.status == "success") {
                                    // 更新 select
                                    var add_id = res.add_item[0];
                                    var add_name = res.add_item[1];
                                    $(`select[name='${item_type}']`).append(`<option value="${add_id}">${add_name}</option>`);
                                    $(`select[name='${item_type}']`).val(add_id);
                                    $(`select[name='${item_type}']`).trigger("chosen:updated");
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
                                        $(`.add-foreignkey-items span.${res_keys[i]}`).removeClass('hide');
                                        $(`.add-foreignkey-items span.${res_keys[i]}`).html(res.errors[res_keys[i]]);
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
    
    function GetAddForeignKeyFormData(item_type) {        
        var form_data = getOrderInfo(".add-foreignkey-items");
        form_data['csrfmiddlewaretoken'] = csrf_token;
        form_data['item_type'] = item_type;
        return form_data;
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
                return;
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

    function getOrderInfo(form_class="") {
        var data = {};
        var form_items = $(`${form_class} .form-control`);
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
                        submitOrder("edit_user", "/userinfo");
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

    function BindAdminResetPwd(e) {
        // 管理员重置密码
        e.preventDefault();
        // submitOrder("admin-reset-pwd")        
        var dialog = bootbox.dialog({
            title: '<label class="text-bold"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;警告</label>',
            onEscape: true,
            message: "<label class='text-sm'>确认重置? 该用户密码将配重置为 123456 </label>",
            
            buttons: {
                default: {
                    label: "Cancel",
                    className: "btn-default",
                },
                danger: {
                    label: "确认",
                    className: "btn-danger",
                    callback: function() {
                        adminResetPwd();
                    },
                },
            },
        });
    }
    
    function adminResetPwd() {
        console.log("reset pwd");
        data = {};
        data.csrfmiddlewaretoken = csrf_token;
        $.ajax({
            url: window.location.pathname + "/reset-pwd/",
            type: "post",
            dataType: "JSON",
            data: data,
            // data: JSON.stringify(data),
            success: function(res) {
                if(res.status=="success") {
                    $.niftyNoty({
                        type: 'success',
                        icon : 'fa fa-check',
                        message : "密码重置" +  ".<br> " + "成功 <strong>" + "</strong>",
                        container : 'floating',
                        timer : 3000
                    });
                }else if(res.status=="failed") {
                    $.niftyNoty({
                        type: 'danger',
                        icon : 'fa fa-check',
                        message : "数据错误 " +  ".<br> " + " <strong>" + "</strong>",
                        container : 'floating',
                        timer : 7000
                    });                                        
                }
            },

            error: function() {
                $.niftyNoty({
                    type: 'danger',
                    icon : 'fa fa-check',
                    message : "请求失败" +  ".<br> " + " <strong>" + "</strong>",
                    container : 'floating',
                    timer : 5000
                });
            }
        });
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
   