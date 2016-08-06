define(function(require, exports, module){
	require('common');
	require('/microCourse/resources/lib/layer/1.6.0/layer.min.js');
	require('/microCourse/resources/lib/layer/1.6.0/skin/layer.css');
	$("#js-newques").click(function(e){
		e.preventDefault();
		//用cookie判断是否登录，避免其它tab页退出页当前没更新user信息
		var cookie=document.cookie,
			loginstate=cookie.match(/(?:;|^)\s*login_state=([^;])/);
		if(loginstate&&loginstate[1]&&loginstate[1]!="0"){
			window.location.href="/microCourse/wenda/publish";
		}
		else{
			seajs.use("login_sns",function(login){
				login.init();
			})
			
			//暂时不用自带的login，回头再学习
			//window.location.href = "/microCourse";
		}
	})

	var eventFun = {//事件集合
		keywordClick:function(){
			var obj=$(this)
			if(obj.hasClass('curr')){
				obj.removeClass('curr')
			}else{
				obj.addClass('curr')
			}
			if($(".js-keyword.curr").length==0){
				$("a.js-all-keyword").addClass('curr');
			}else{
				$("a.js-all-keyword").removeClass('curr');
			}
		},
		allKeywordClick:function(){
			$(this).addClass('curr')
			$("a.js-keyword").removeClass('curr');
		},
		setCustom:function(){
			var ids=[];
			$.each($(".js-keyword.curr"), function(index, val) {
				 ids.push($(val).data("id"));
			});
			var len=ids.length;

			$.ajax({
				url:"/wenda/customtag",
				type:"post",
				dataType:"json",
				data:{tagIds:ids.join(",")},
				success:function(data){
				if(data.result==0){
					window.location="/wenda";				
				}
				$(".js-custom-layout").hide()
				}
			})

		},
		cancelCustom:function(){
			var temparr=[];
			if(initHotLabel!==''){
				temparr = initHotLabel.split(',');
			}
			//console.log(temparr);
			$(".js-keyword.curr").removeClass('curr');
			if(temparr.length!=0){
				$.each($(".js-keyword"),function(index,elem){
					for(var i= 0,len=temparr.length;i<len;i++){
						if($(elem).attr('data-id')==temparr[i]){
							$(elem).addClass('curr');
						}
					}
				});
			}else{
				$(".js-all-keyword").addClass('curr');
			}
			$(".js-custom-layout").hide();
		}
	}

	var bindEvent = function(){//绑定自定义事件
		$('.js-keyword-list').on("click","a.js-keyword",eventFun.keywordClick).
		on("click","a.js-all-keyword",eventFun.allKeywordClick);

		$(".js-btn-custom-show").click(function(){
			$(".js-custom-layout").show()
		})
		$(".js-btn-custom-hide").click(function(){
			$(".js-custom-layout").hide()
		})

		$(".js-custom-save").click(eventFun.setCustom);
		$(".js-custom-cancel").click(eventFun.cancelCustom);
	}

	var bindDom=function(){
	}
	//初始化
	var init = function(){
		bindEvent();
		bindDom();
	}
	init();
	//左边导航固定
	var setFix=function(){
		var distance = $(document).scrollTop();
		if($(document).width()<980){
			$(".wenda-sidebar").hide();
			return;
		}else{
			$(".wenda-sidebar").show();
			if(distance>70){
				$(".wenda-sidebar").addClass("fixed");
			}else{
				$(".wenda-sidebar").removeClass("fixed");
			}
		}
	}
	$(window).scroll(setFix);
	setFix();
	//用户吐槽
	var isAjax=0;
	$('.js-user-tc').on('click',function(){
		

		if(isAjax) return;
		isAjax=1;
		var obj=$(this);
		var id=obj.attr("data-id");
		var act="show";
		if(obj.html() == "数据删除"){
			act="hide"
		}
		var url="/wenda/audit";
		$.ajax({
			type: "get",
			url: url,
			dataType:"json",
			data: {
				quesId:id,
				act:act
			},
			success: function(res){
				isAjax=0;
				if(res.result==0){
					if(act=="show"){
						obj.html("数据删除");
					}else{
						obj.html("恢复上架");
					}					
				}else{
					layer.msg('操作失败，请稍后再试', 1, 1);
				}
			},
			error:function(){
				layer.msg('网络错误，请稍后再试', 1, 1);
            	isAjax=0
        	}
		});
	});

})