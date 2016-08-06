define(function(require, exports, module){
require('autocomplete');
require('/microCourse/resources/lib/ueditor/ueditor.final.min.js');

var verifyCode = require('../common/verify-code.js');
var util = {
    error: function(selector,msg) {
        if(arguments.length < 2) {
            msg = selector;
            selector= $(this).next('.errortip');
        }
        if (msg) {
            $(selector).html('<i class="icon-point"></i> ' + msg);
        }
        else {
            $(selector).empty();
        }
    }
};

window.UEDITOR_HOME_URL="/microCourse/resources/lib/ueditor/";
UE.getEditor("ques-editor",{
  enableAutoSave: true,
  saveInterval: 2e3
})
.on('ready', function(){
  var editor = this;
  setTimeout(function() {
    editor.execCommand('drafts')
  });
});
	verifyCode.renderVerifyCodeBlock('.verify-code','/microCourse/user/ImageCode');
var $title=$("#ques-title");
if($title[0].placeholder===undefined){
	$title.focus(function(){
		var $this=$(this);
		if($this.val()===$this.attr("placeholder")){
			$this.val("").removeClass("placeholder");
		}
	})
	.blur(function(){
		var $this=$(this);
		if(!$this.val().length){
			$this.val($this.attr("placeholder")).addClass("placeholder");
		}
    });
}

var gerror=(function(){
	var $p=$(".js-global-error");
	return {
		hide:function(){
			$p.hide();
		},
		show:function(t){
			$p.text(t).show();
		}
	}
})();


$title.blur(checkTitle);/*.focus(function(){
	$(this).removeClass("error").next("p").hide();
	gerror.hide();
});*/

var $label_ids=$("#tagcontent");
UE.getEditor("ques-editor").addListener("focus", function() {
    util.error('#editor-wrap .errortip','');
    //gerror.hide();
});

$("#ques-submit-btn").click(function(e){
	e.preventDefault();
	var editor,
		$this=$(this),
		contentLength,
		content,
		data;

	if($this.hasClass("ques-loading")){
		return ;
	}

	data = {};
	if (checkTitle.call($title) === false) {
		return ;
	}
	editor = UE.getEditor("ques-editor");
	if ((contentLength = $.trim(editor.getContentTxt()).length) < 5) {
        util.error('#editor-wrap .errortip','内容不能少于5个字！');
		return ;
	}

	content = editor.getContent();
	if (content.length > 20000) {
        util.error('#editor-wrap .errortip','内容长度不能超过20000个字符！建议您分多次发布！');
		return ;
	}
	if($("#tagcontent .list-tag").length == 0){
		$("#tagcontent").addClass("error");//.next("p").text("请选择以下标签！");
        util.error('#tagcontent ~ .errortip','请选择以下标签！');
		return;
	}else{
		//$("#tag-title").removeClass("error").next("p").empty();
         util.error('#tagcontent ~ .errortip');
	}
    //var $v,c;
    //if (($v=$("#js-inputques .verify-code")).length) {
    //    c = $v.find("input").val();
    //    if (c.length==0) {
		//	   alert("请输入验证码");
    //        return ;
    //    }
    //    if (c.length != 4) {
    //        alert("请输入正确的验证码");
    //        return ;
    //    }
    //    data.verify_code = c;
    //}
	//判断是否需要验证码验证
	if($(this).parent().prev('.verify-code').find('.verify-code-around').length!==0){
		var verifyVal = $.trim(verifyCode.getResult('.verify-code'));
		if(verifyVal.length==0){
			$('.verify-code').trigger('fail',"请输入验证码");
			return ;
		}else{
			data.verify = verifyVal;
		}
	}

	data.cat_id = $(".js-ques-category .onactive").attr("data-type");
	data.title = $title.val();
	data.content=content;
	//data._rnd = $("#put_rnd").val();
	var arr = [];
	$('#tagcontent .list-tag').each(function(index,obj){
		arr.push($(obj).attr("data-id"));
	});

	data.label_ids=arr.join(",");
	data.user_id = $("#user_id").val();
	
	//editor.sync();
	$this.addClass("ques-loading").text("正在发布...");
	$('.verify-code').trigger('succ');
	$.ajax({
		url:"/microCourse/wenda/save",
		type:"post",
		dataType:"json",
		data:{
			topic:JSON.stringify(data)
		},
		success:function(data){
			//console.log(data);
			if(data.result===0){
        		editor.execCommand('clearlocaldata');
				window.location.href="/microCourse/wenda/publish_success/" + data.id;
				return ;
			}else if(data.result==-103002){
				$('.verify-code').trigger('fail',data.msg);
			}else{
				alert(data.msg);
				//dia.open('fail',data.msg,function(){});
			}
			//else if(data.result==-103002){
				//verifyCode
                //if($("#js-inputques .verify-code").length) return ;
                //$("#js-inputques").append([
					//'<div class="verify-code">',
					//	'<input type="text" maxlength="4" class="verify-code-ipt">',
					//	'<img src="/wenda/getverifycode?',Math.random(),'" >',
					//	'<em class="verify-code-around">看不清换一换</em>',
					//'</div>'
        		//].join(""));
        		//return ;
			//}
			//gerror.show(data.msg||data.data);
			//alert(data.msg||data.data);
		},
		error:function(){
			//gerror.show("服务器错误，请稍后重试！");
			alert("服务器错误，请稍后重试！");
		},
		complete:function(){
			$this.removeClass("ques-loading").text("发布");
		}
	})


});

function checkTitle() {
	var $this = $(this),
        val;
	if ((val=$.trim($this.val())).length < 5) {
		$this.addClass("ipt-error");
        util.error.call(this,'标题不能少于5个字符！');
		return false;
	}
	else if (val.length > 255) {
        $this.addClass("ipt-error");
        util.error.call(this,'标题不能大于255个字符！');
		return false;
	}
	else {
		$this.removeClass("ipt-error");
        util.error.call(this,'');
	}
}

//verify code
//$(document).on("click",".verify-code-around",function(){
//    var $img=$(this).prev("img");
//    $img.attr("src",$img.attr("src").replace(/\?\S*/,"?"+Math.random()));
//});

$(".js-ques-category a").click(function(e){
	e.preventDefault();
	var $this;
	if(($this=$(this)).hasClass(".onactive")) return ;
	$this.siblings(".onactive").removeClass("onactive").end().addClass("onactive");
});
/*标签*/
$("#js-tags").on('click', '.list-tag', function() {
	var $this = $(this),
        id = $this.attr('data-id'),
        $tagcontainer;
    $("#label-default").hide();
    util.error('#tagcontent ~ .errortip','');
    if (!$this.hasClass("onactive")) {
        if ($("#tagcontent .list-tag").length > 2) {
            return;
        }
        $(this.cloneNode(true)).append('<i class="icon-close"></i>').appendTo('#tagcontent');
        //$("#tagcontent").append($("<li class='associated-labe' data-id='" + dataid + "'>" + tagcontent + "<em class='tag-close'></em></li>"));
    } else {
        $tagcontainer = $('#tagcontent');
        $tagcontainer.find("[data-id='" + id + "']").remove();
        !$tagcontainer.find('.list-tag').length && $("#label-default").show();
    }
    $this.toggleClass("onactive");
});

$("#tagcontent").on('click','.list-tag',function() {
    var $this = $(this),
        id = $this.attr('data-id');
    $this.remove();
    $('#js-tags [data-id="' + id + '"]').removeClass('onactive');
    if ($("#tagcontent .list-tag").length === 0) {
        $("#label-default").show();
    }
});

});

