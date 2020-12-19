/*
 * @Date: 2020-12-18 11:49:17
 * @LastEditTime: 2020-12-18 19:08:19
 * @Author: catas
 * @LastEditors: catas
 * @Description: 
 */

    $(function() {

        // 启动单选框
        $('#chosen-select').chosen({width: "50%"});

        // 激活标志
        $('#mainnav-menu li').removeClass('active-link');
        // $('.hosts').addClass('active-link');
        $("li.order").addClass("active");
        $('.order ul').attr({'class': 'collapse in', 'aria-expanded': "true"});
         // 激活标志
         var task_type = window.location.pathname.split('/')[2];
         // $("li.multi-cmd").addClass('active-link');
         $(`li.${task_type}`).addClass('active-link');

         // 计算总价
        BindCalculatePrice();
        var flag = false;
        
        BindOrderSubmit();
        BindSaveOrder();
        BindCreateGoods(); 
        BindDeleteOrder();
    }) ;

    function BindCreateGoods() {
        $('#add-goods').on('click', function(){
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
                                        $("#chosen-select").append(`<option value="${add_id}">${add_name}</option>`);
                                        $("#chosen-select").trigger("chosen:updated");
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
            
            $(".demo-modal-radio").niftyCheck();
        });

    }

    function BindDeleteOrder() {
        $("#order-delete").click(function(e) {
            e.preventDefault();
            // 禁用点击事件
            $("#order-delete").attr("disabled",true);
            
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
                            submitOrder("delete");
                        },
                    },
                },
                // animateIn: 'bounceIn',
                // animateOut : 'bounceOut',
            });

            // 1秒后启用点击事件
            setTimeout(function(){
                $("#order-delete").removeAttr("disabled");
            },1000);
        })
    }

    function BindCalculatePrice() {
        $("#get-price").click(function() {
            var price = $("input[name='unit_price']").val();
            var count = $("input[name='count']").val();
            
            var total_price = Number(price) * Number(count);
            $("input[name='total_price']").val(total_price);
        })
    }

    function BindOrderSubmit() {
        $("#order-submit").click(function(e) {
            e.preventDefault();
            // 禁用点击事件
            $("#order-submit").attr("disabled",true);

            // 提交业务
            submitOrder("submit");
            
            // 1秒后启用点击事件
            setTimeout(function(){
                $("#order-submitt").removeAttr("disabled");
            },1000);

        })
    }

    function BindSaveOrder() {
        $("#order-save").click(function(e) {
            e.preventDefault();
            // 禁用点击事件
            $("#order-save").attr("disabled",true);
            
            submitOrder("save");

            // 1秒后启用点击事件
            setTimeout(function(){
                $("#order-save").removeAttr("disabled");
            },1000);
        }) 
    }

    function submitOrder(type) {
        var data = getOrderInfo();
            data.csrfmiddlewaretoken = csrf_token;
            data.type = type;
            // console.log(data);
            $.ajax({
                url: "",
                type: "post",
                dataType: "JSON",
                data: data,
                success: function(res) {
                    if(res.status=="success") {
                        $.niftyNoty({
                            type: 'success',
                            icon : 'fa fa-check',
                            message : "Success " +  ".<br> " + type + "成功 <strong>" + "</strong>",
                            container : 'floating',
                            timer : 3000
                        });
                        setTimeout(function() {window.location.pathname = "/order/myorder/"}, 750);

                    }else if(res.status=="failed") {
                        $("span.help-block").addClass('hide');
                        var res_keys = Object.keys(res.errors);
                        for (i in res_keys) {
                            $(`span.${res_keys[i]}`).removeClass('hide');
                            $(`span.${res_keys[i]}`).html(res.errors[res_keys[i]]);
                        }
                    }
                }
            });
    }

    function getOrderInfo() {
        var detail = $("#chosen-select").val();
        var company = $("input[name='company']").val();
        var unit_price = $("input[name='unit_price']").val();
        var count = $("input[name='count']").val();
        var total_price = $("input[name='total_price']").val();
        var memo = $("textarea[name='memo']").val();

        var data = {
            detail: detail,
            company: company,
            unit_price: unit_price,
            count: count,
            total_price: total_price,
            memo : memo
        }
        return data;
    }
    