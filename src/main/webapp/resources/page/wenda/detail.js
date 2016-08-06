define(function(require, exports, module){
	require('common');
	//require('/static/lib/layer/1.6.0/layer.min.js');
	require("/microCourse/resources/lib/ueditor/ueditor.parse.js");
	require("/microCourse/resources/page/wenda/index.js");
	require('/microCourse/resources/lib/layer/1.6.0/layer.min.js');
	require('/microCourse/resources/lib/layer/1.6.0/skin/layer.css');
 	var	cutil=require("/microCourse/resources/page/wenda/detail-common");

 	/*layer.calert=function(alertMsg,callback){	//普通对话框，类似系统默认的alert()
		return $.layer({
			dialog : {msg : alertMsg, type : 9,yes:function(){callback&&callback();}},
			title : "成功 ",
			area: ['auto', 'auto'],
			close:function(index){
				layer.close(index);
				callback&&callback();
			}
		});
	}*/
	//shCore codehightlight inner get
	uParse("body",{
        rootPath : '/microCourse/resources/component/base/ueditor/',
        chartContainerHeight:500
    });
	var util={
		msg:function(msg,isRight){
            var $ctx=$(this).closest(".js-msg-context"),
                m=msg?"addClass":"removeClass",
                c=isRight?"qa-tips-ok":"qa-tips-error";
            $ctx.find(".qa-tips").removeClass("qa-tips-ok qa-tips-error")[m](c).html(msg||"");
        }
	}

	var opts={
		initialFrameHeight:100
		//initialFrameWidth:766
	}
	var cueditor=UE.getEditor("js-reply-editor-box",opts);

	if(!OP_CONFIG.userInfo){
		cueditor.addListener("ready",function(){
			cueditor.setDisabled('fullscreen');
		});
		$("#js-reply-editor-box").css({position:"relative"}).append("<div class='js-wdu' style='position:absolute;top:0;left:0;width:100%;height:100%;z-index:1000'>")
		.find(".js-wdu").click(function(){
			seajs.use("login_sns",function(login){
				login.init();
			});
		});
	}
	cueditor.addListener("focus",function(){
		util.msg.call($("#js-reply-editor-box"));
	});
	$('#js-qa-wenda a').attr('target','_blank');
	$('.qa-comment-c a').attr('target','_blank');
	
/*========================================================提交对问题的回答========================================================*/
	
	$("#js-wenda-ci-submit").click(function(e){
		e.preventDefault();
		var $this=$(this),
			$foot,
			$vbox,
			data,
			v,
			content;

		if ($this.hasClass("disabled")) return ;
		content=UE.getEditor("js-reply-editor-box").getContent();
		data={};
		if($.trim(UE.getEditor("js-reply-editor-box").getContentTxt()).length<3){
			util.msg.call($this,"回答字数不少于3个！");
			return ;
		}
		if(content.length>20000){
			util.msg.call($this,"回答字数不大于20000个！");
			return ;
		}

		$foot=$("#js-qa-ci-footer");
		if(($vbox=$foot.find(".verify-code")).length){
            v=$vbox.find("input").val();
            if(v.length==0){
                util.msg.call(this,"请输入验证码");
                return ;
            }
            if(v.length!=4){
                util.msg.call(this,"请输入正确的验证码");
                return ;
            }
            data.verify_code=v;
		}
		data.content=content;
		data.ques_id=$this.attr("data-qid"); 
		data.user_id = $("#user_id").val();			//回复人的ID
		util.msg.call(this);
		$this.addClass("disabled").text("回答...");
		$.ajax({
			url:"/microCourse/wenda/save_reply",
			type:"post",
			dataType:"json",
			data:{
				reply:JSON.stringify(data)		//怎么发送数据,还要好好研究
			},
			success:function(data){
				if(data.result==0){
					util.msg.call($this,"回答成功！",1);
					//return
					setTimeout(function(){location.reload()},1000);
					/*layer.calert("回答成功！  ",function(){
						window.location.reload();
					});*/

				}
				else if(data.data === 1 && data.result === -1){
					if($foot.find(".verify-code").length) return ;
                    $foot.prepend(cutil.getVerifyCodeBlock());
                    util.msg.call($this,"请输入验证码");
                    return
				}
				else{
					util.msg.call($this,data.msg);
				}
			},
			complete:function(){
				$this.removeClass("disabled").text("回答");
			}
		})
	});

	//reedit

/*========================================================编辑按钮被点击========================================================*/
	
	var isEditorReady;
	$("#js-edit").click(function(){
		var $ctn=$("#js-content-main"),
			editor;

		if($("#js-wenda-editor").is(":visible")) return ;
		$ctn.hide();
		$("#js-wenda-editor-title").val($ctn.find(".js-qa-wenda-title").text());
		//$("#js-editor-content-dup").val()
		if(!isEditorReady){
			isEditorReady=1;
			editor=UE.getEditor("js-wenda-editor-content");
			editor.addListener("ready",function(){
				isEditorReady=2;
				UE.getEditor("js-wenda-editor-content").setContent($("#js-editor-content-dup").html())
			})
			editor.addListener("focus",function(){
				util.msg.call($("#js-wenda-editor"));
			});
		}

		if(isEditorReady==2){
			UE.getEditor("js-wenda-editor-content").setContent($("#js-editor-content-dup").html());
		}
		//duplicate div may use textare instead of;
		$("#js-wenda-editor").show();
	});

	$("#js-wenda-editor-cancel").click(function(){
		$("#js-wenda-editor").hide();
		$("#js-content-main").show();
	});
	
/*========================================================提交对原问题的修改========================================================*/
	
	$("#js-wenda-editor-submit").click(function(){
		var $this=$(this),title,content,minLength;

		if($this.hasClass("disabled")) return ;
		title=$("#js-wenda-editor-title").val();
		if(title.length<3){
			util.msg.call(this,"标题不能少于3个字！");
			return ;
		}
		if(title.length>255){
			util.msg.call(this,"标题不能大于255个字！");
			return ;
		}
		content=UE.getEditor("js-wenda-editor-content").getContent();
		minLength=$.trim(UE.getEditor("js-wenda-editor-content").getContentTxt()).length;
		//console.log(minLength)
		if(minLength<3){
			util.msg.call(this,"内容不能少于3个字！");
			return ;
		}
		if(content.length>20000){
			util.msg.call(this,"内容不能超过20000个字！");
			return ;
		}
		util.msg.call();
		$this.addClass("disabled").text("保存...");
		$.ajax({
			url:"/microCourse/wenda/edit_wenda",
			data:{
				title:title,
				content:content,
				id:$this.attr("data-id")
			},
			dataType:"json",
			type:"post",
			success:function(data){
				if(data.result==0){
					//cutil.msgComment("回答成功",1);
					util.msg.call($this,"修改成功！",1);
					setTimeout(function(){location.reload()},1000);
					/*layer.calert("修改成功！  ",function(){
						window.location.reload();
					});*/
				}
				else{
					util.msg.call($this,data.msg);
				}
			},
			error:function(){
				util.msg.call($this,"服务错误，请稍后重试！");
			},
			complete:function(){
				$this.removeClass("disabled").text("保存");
			}

		});
	});
	
	
/*========================================================添加关注or取消关注========================================================*/
	
	var isAjax=0;
	$('.js-collection-btn').on('click',function(){
        if (!OP_CONFIG.userInfo) {
            function popLogin() {
                require.async('login_sns',
                function(login) {
                    login.init();
                });
            };
            popLogin();
            return;
        }
		if(isAjax) return;
		isAjax=1;
		var obj=$(this);
		var id=obj.attr("data-id");
		var act="add";
		if(obj.attr('title') === '取消关注'){
			act="del"
		}

		var url="/microCourse/wenda/follow";
		$.ajax({
			type: "get",
			url: url,
			dataType:"json",
			data: {
				id:id,
				act:act
			},
			success: function(res){
				isAjax=0;
				if(res.result==0){
					if(act=="add"){
						obj.attr('title','取消关注').find('i').removeClass('icon-heart').addClass('icon-heart-revert');
						layer.msg('关注成功', 1, 10);
					}else{
						obj.attr('title','添加关注').find('i').removeClass('icon-heart-revert').addClass('icon-heart');
						layer.msg('取消成功', 1, 1);
					}
				}else{
					layer.msg('操作失败，请稍后再试', 1, 8);
				}
			},
			error:function(){
				layer.msg('网络错误，请稍后再试', 1, 8);
            	isAjax=0;
        	}
		});
	});

/*========================================================分享到第三方========================================================*/
	
	var quesname=$(".qa-content-inner h3").text();   //问答名称
		//console.log(quesname);
	var html = quesname+""+"_@慕课网";    //分享文案
	var url = 'http://www.mukewang.com' + window.location.pathname;
	window._bd_share_config={
	   	"common":{
	   		"bdUrl": url,
			"bdSnsKey": {
				'tsina':'2788596354'
	        },
			"bdText":html,
	   		"bdMini":"2",
	   		"bdMiniList":false,
	   		"bdPic":"",
	   		"bdStyle":"0",
	   		"bdSize":"16"
   		},
   		"share":{}
   	};
   	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
});
