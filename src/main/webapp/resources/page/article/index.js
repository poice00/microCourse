define(function(require, exports, module){
    require('common');
    require('Module-layer');

    //点击全部
    $("#js-columall").on('click',function(e){
        e.stopPropagation();
        var jsicon=$(this).find(".icon"),
            jscolumbd=$(this).siblings("#js-columbd"),
            jscoluall=$(this).find(".all-status");
        jscolumbd.css("marginLeft",-(jscolumbd.width())/2);

        if(jsicon.hasClass("icon-down")){
            jscolumbd.show();
            jsicon.removeClass("icon-down").addClass("icon-top");
            jscoluall.addClass("on");
        }else{
            jscolumbd.hide();
            jsicon.removeClass("icon-top").addClass("icon-down");
            jscoluall.removeClass("on");
        }
    })
    //点击全部弹层以外消失弹层
    $(document).mouseup(function(e) {
        var _con=$("#js-columbd");
        if(!_con.is(e.target)&&_con.has(e.target).length==0){
            $("#js-columbd").hide();
            $("#js-columall").find(".icon").removeClass("icon-top").addClass("icon-down")
            $("#js-columall .all-status").removeClass("on");
        }
    });
})
