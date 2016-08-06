/*
 * 消息系统前端交互
 * 消息模块交互比较复杂，为保障未来的可维护性，需要采用面向对象的方式来实现
 * 将消息与页面进行抽象，页面中分为聊天容器、会话窗口、输入器、事件监听器、调试器、表情等主要对象
 * 通过与服务端通信，出发相应的事件来实现与服务端数据的交互，然后通过调用页面中的其他对象来实现数据的显示
 * @author jiangsf
 */

define(function(require, exports, module){
    require('common');

	require('/microCourse/resources/lib/jquery/plugin/jquery.timeago');
	require('/microCourse/resources/lib/jquery/plugin/jquery.ext');
    require('Module-layer');

    require('chat');
$('#upLoadForm').attr('action','/message/upload?' + new Date().getTime());
//用户信息
var uinfo = {
	type : 'chat',
	from : 'web',
	nickname : OP_CONFIG.userInfo.nickname,
	uid : OP_CONFIG.userInfo.uid,
	head : OP_CONFIG.userInfo.head,
	img : u_Info.img,
	sex : u_Info.sex,
	age : u_Info.age,
	teacher : u_Info.teacher,
	token : token
};
//消息全局配置
var msgConfig = {
	maxHistory 	: 50,	//聊天窗口保留的最大历史消息条数
	maxLength	: 300,	//消息体正文最大长度
	showTime	: 2000,	//错误提示信息显示时间 时间过后自动淡出
	//vipUser : 11294,
	vipUser:10000,
	text_null : 	'信息不能为空',
	text_toolong : 	'文本内容不能超过300个字符',
	text_toofast :	'对不起，你说话的速度太快了'
}


var _msgBox_h;

var numb = 1;
//对需要用到全局对象进行预先定义
$.container = {};		//聊天容器
$.chatListener = {};	//聊天事件监听器
$.chatInput = {};		//聊天输入器
$.debug = {};			//调试器


//输入框高度控制
var methods = {
        init: function(options){
            var main_opts = $.extend({}, $.fn.textareaHeightAuto.defaults, options);
            return this.each(function(){
                var $this = $(this);

                var opts = main_opts;
                $this.data('textareaHeightAuto', opts);
                $this.on(opts.eventName, function(){

                    var $target = $(this);
                    $target.height(opts.minHeight - opts.bottomHeight);
                    var scrollHeight = $target[0].scrollHeight + opts.bottomHeight;
					var scrollHerght_Array = ['28','42','58'];
					var editorHeight=$('#chat_editor').outerHeight()
                    if((scrollHeight) > opts.minHeight){
                        if(scrollHeight < opts.maxHeight){
                            $target.css({'overflow-y': 'hidden'}).height(scrollHeight);
							if($('#face_panel').css('display') != 'block'){
								for (var i=0;i<scrollHerght_Array.length;i++) {
									if(scrollHeight == scrollHerght_Array[i]){

										//$('#chat_content').height(_msgBox_h - i*16-editorHeight);
									}
								}
							}

                        }else{
                            $target.css({'overflow-y': 'auto'}).height(opts.maxHeight);
                        }
                    }else{
                        $target.css({'overflow-y': 'hidden'}).height(opts.minHeight);
                    }

                });
            });
        },
        destroy: function(){
            return this.each(function(){
                var $this = $(this),
                    data = $this.data('textareaHeightAuto');
                $this.off(data.eventName);
                $this.css({height: data.minHeight});
                $this.removeData('textareaHeightAuto');
            });
        }
    };

    $.fn.textareaHeightAuto = function(method){
        if(methods[method]){
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }else if(typeof method === 'object' || !method){
            return methods.init.apply(this, arguments);
        }else{
            $.error('Method '+ method + ' does not exist on jQuery.textareaHeightAuto');
        }

    };

    $.fn.textareaHeightAuto.defaults = {
        maxHeight: 42,
        minHeight: 18,
        bottomHeight: 0,
        eventName: 'paste cut keydown keyup focus blur'
    };


//表情
function openFace(event, textareaId, iconURL) {
	$('#sendEmojiIcon').addClass('sendEmojiIcon_ac');
	$('.chat_upImg').removeClass('chat_upImg_ac');
	var faceLib=[
			{title:'[微笑]',pic:iconURL+'1.png' },
			{title:'[不]',pic:iconURL+'2.png' },
			{title:'[亲亲]',pic:iconURL+'3.png' },
			{title:'[无聊]',pic:iconURL+'4.png' },
			{title:'[鼓掌]',pic:iconURL+'5.png' },
			{title:'[伤心]',pic:iconURL+'6.png' },
			{title:'[害羞]',pic:iconURL+'7.png' },
			{title:'[闭嘴]',pic:iconURL+'8.png' },
			{title:'[耍酷]',pic:iconURL+'9.png' },
			{title:'[无语]',pic:iconURL+'10.png' },
			{title:'[发怒]',pic:iconURL+'11.png' },
			{title:'[惊讶]',pic:iconURL+'12.png' },
			{title:'[委屈]',pic:iconURL+'13.png' },
			{title:'[酷]',pic:iconURL+'14.png' },
			{title:'[汗]',pic:iconURL+'15.png' },
			{title:'[闪]',pic:iconURL+'16.png' },
			{title:'[放屁]',pic:iconURL+'17.png' },
			{title:'[洗澡]',pic:iconURL+'18.png' },
			{title:'[偶耶]',pic:iconURL+'19.png' },
			{title:'[困]',pic:iconURL+'20.png' },
			{title:'[咒骂]',pic:iconURL+'21.png' },
			{title:'[疑问]',pic:iconURL+'22.png' },
			{title:'[晕]',pic:iconURL+'23.png' },
			{title:'[衰]',pic:iconURL+'24.png' },
			{title:'[装鬼]',pic:iconURL+'25.png' },
			{title:'[受伤]',pic:iconURL+'26.png' },
			{title:'[再见]',pic:iconURL+'27.png' },
			{title:'[抠鼻]',pic:iconURL+'28.png' },
			{title:'[心寒]',pic:iconURL+'29.png' },
			{title:'[怒]',pic:iconURL+'30.png' },
			{title:'[凄凉]',pic:iconURL+'31.png' },
			{title:'[悄悄]',pic:iconURL+'32.png' },
			{title:'[奋斗]',pic:iconURL+'33.png' },
			{title:'[哭]',pic:iconURL+'34.png'},
			{title:'[赞]',pic:iconURL+'35.png' },
			{title:'[开心]',pic:iconURL+'36.png'}
	];

	event.stopPropagation();
	var position = {
		/*left: event.pageX - 10,
		top: event.pageY - 300*/
		//left: $('#chat_content').offset().left + 22,
		//top: $('#chat_editor').offset().top -241
	}
	if ($('#face_panel').size() > 0) {
		$('#face_panel').fadeIn(function() {
			hidePanel();
		});

	} else {

		var $textInput = $(textareaId)[0];

		$('<div id="face_panel" style="display:block; z-index:99999999"><div id="choose_face"></div></div>').appendTo($('.attach'));

		for (var i = 0; i < faceLib.length; i++) {

			var _faceTitle = faceLib[i].title.substr(1).replace(']','');

			$('<a title="'+faceLib[i].title+'" href="javascript:;"><img class="ph_face_s" src=' + faceLib[i].pic + '><p>'+_faceTitle+'</p></a>').appendTo($('#choose_face')).on('click',
			function(event) {
				event.stopPropagation();
				$textInput.focus();
				insertFaceIcion($(this).attr('title'));
				$('#face_panel').hide();
				$('#sendEmojiIcon').removeClass('sendEmojiIcon_ac');

				//$('#chat_content').height(_msgBox_h);
			});

		}
		hidePanel();

		//插入表情转换函数
		function insertFaceIcion(text) {

			if (document.selection) {
				$textInput.focus();
				var cr = document.selection.createRange();
				cr.text = text;
				cr.collapse();
				cr.select();
			} else if ($textInput.selectionStart || $textInput.selectionStart == '0') {
				var start = $textInput.selectionStart,
				end = $textInput.selectionEnd;
				$textInput.value = $textInput.value.substring(0, start) + text + $textInput.value.substring(end, $textInput.value.length);
				$textInput.selectionStart = $textInput.selectionEnd = start + text.length;
			} else {
				$textInput.value += text;
			}
		}

	}

	function hidePanel() {

		$(document).on("click",
		function(event) { //对document绑定一个影藏Div方法
			if (event.target.id !== 'face_panel') {
				$('#face_panel').hide();
				$('#sendEmojiIcon').removeClass('sendEmojiIcon_ac');
			} else {
				var $textInput = $(textareaId)[0];
				$textInput.focus();
			}

		//$('#chat_content').height(_msgBox_h);

		});

	}

}

var userlink = function(uid, name) {
		return '<a target="_blank" href="/space/u/uid/'+uid+'">'+name+'</a>';
	}
var courselink = function(id, name) {
	return '<a target="_blank" href="/view/'+id+'">'+name+'</a>';
}
var planlink = function(info){
	var html = '';
	for(var i in info){
		html += '<br>'+'<a target="_blank" href="/course/programdetail/pid/'+info[i].id+'">'+info[i].name+'</a>';
	}
	return html;
}
//未读消息标题闪动

var documentfocusState=true; //是否为当前活动页面 通过改变它来判断是否为活动页面
var documentTit=document.title;
$(window,document,'body').on('focus',function(){
	documentfocusState=true;

});

$(window).on('blur',function(){
		documentfocusState=false;
	$(document).one('click',function(){
			documentfocusState=true;
		})
});

var FlashTitle={
	   timer:null,
	   step:0,
	   init:function(){

		   if(documentfocusState==false){
			   if(FlashTitle.timer) { window.clearInterval(FlashTitle.timer); };
				FlashTitle.timer = window.setInterval(function(){
				   FlashTitle.step++;
				   if(  FlashTitle.step>=3) { FlashTitle.step=1};
				   if(  FlashTitle.step==1) {document.title='【您有新的消息】'};
				   if(  FlashTitle.step==2) {document.title='【　　　　　　】'};

				 }
				 ,400);
				  $(window,document,'body').on('focus',function(){
					 documentfocusState=true;
					 if(FlashTitle.timer) { window.clearInterval(FlashTitle.timer); };
					document.title=documentTit;
					});

			  }
			}

     }



//IE浏览器的判断
$.testing = document.location.href.toLowerCase().indexOf('www-') > -1;

//调试器
/*$.debug = {
	debug : true,

	log : function() {
		if (this.debug && $.testing) {
			for(var i = 0; i < arguments.length; i++) {
				console.log(arguments[i]);
			}
		}
	}
}*/

//dom模板转换器 将格式化HTML转换成jquery对象
$.parseHtml = function(tmpl, data) {

	var html = tmpl.replace(/\{\$([a-zA-Z0-9_\.]+)\}/ig, function(key) {
		key = key.substring(2, key.length-1);
		if(data[key]) {	//直接的属性变量
			return data[key];
		} else {
			key = key.split('.');	//对子对象的处理
			if (key.length == 2) {
				if (data[key[0]][key[1]]) {
					return data[key[0]][key[1]];
				}
			}
		}
		return '';
	});

	return $(html);
}

//聊天容器
$.container = {
	convers : [],	//会话总数
	current : null,	//当前会话
	friends : [],	//好友列表
	userinfos : [],	//用户资料列表，用户前端缓存已经查看过的好友资料

	//初始化聊天面板
	init : function() {

		this.resize();

		$(window).on('resize',function(){
			$.container.resize();
		})
	},

	//重设好友列表高度和聊天信息窗口高度
	resize:function(){
		/*
			var winHeight=$(window).height();
			var footerHeight=$('#footer').outerHeight() - 175;
			var headerHeight=$('#header').outerHeight();
			var myinfoH=$('.my_info').outerHeight();
			var left_panel_navH=$('#left_panel_nav').outerHeight();
			var chateditorH=$('#chat_editor').outerHeight();
			$('#list_waper').height(winHeight-footerHeight-headerHeight-myinfoH-left_panel_navH);
			$('#chat_content').height(winHeight-footerHeight-headerHeight-chateditorH-95)
		*/

		//判断输入区域隐藏时，高度不再减去其高度 yangmy 2014 04-08
		var winHeight=$(window).height();
		var footerHeight=$('#footer').outerHeight()-200;
		footerHeight=0;
		var headerHeight=$('#header').outerHeight();
		var myinfoH=$('.my_info').outerHeight();
		var left_panel_navH=$('#left_panel_nav').outerHeight();
		var chateditorH=$('#chat_editor').outerHeight();
		var h=winHeight-footerHeight-headerHeight-40
		h=h<341?341:h
		$('#list_waper').height(h);

		if(($("#chat_editor").is(":hidden"))&&($("#nofriendbox").is(":hidden"))){
			var h=(winHeight-footerHeight-headerHeight-70)
			h=h<311?311:h
			$('#chat_content').height(h) //判断输入区域隐藏时，高度不再减去其高度 yangmy 2014 04-08
			//console.log(h+"_______")
		}else{

			var h=(winHeight-footerHeight-headerHeight-chateditorH-70)
			h=h<(311-chateditorH)?(311-chateditorH):h
			$('#chat_content').height(h) //上下40空白,footer10,chat_content padding上下15
			//console.log(h)
			//$('#chat_content').height(winHeight-footerHeight-headerHeight-chateditorH-95)
		}

		var _h=winHeight-footerHeight-headerHeight-40
		$('#main').css("minHeight",_h-50<311?311:_h)

		$('#chat_content').scrollTop(999999);

	},

	//添加会话
	add : function(conver) {
		this.convers.push(conver);
		var panel = $('#lastChat')
		this.appendLastChat(panel, conver);
		//this.refreshLatest();
	},

	//更改最近联系人顺序
	moveFirst : function(conver) {
		var data = [conver];
		$.each(this.convers, function(i, con) {
			if (con.uid != conver.uid) {
				data.push(con);
			}
		});
		this.convers = data;
	},

	//通过用户uid查找会话窗口
	find : function(uid) {
		var conver;
		$.each(this.convers, function(i, c) {
			if (c.uid == uid) {
				conver = c;
				return false;
			}
		});
		return conver;
	},

	//激活某个会话窗口
	active : function(conver) {
		this.current = conver;
		$('#lastChat'+conver.uid).addClass('active').siblings('li').removeClass('active');	//标记选中状态
		conver.active();
	},


	//刷新好友列表
	refreshFriends : function(_data) {
		var panel = $('#friends').html('');
		/*$.each(this.friends, function(k, v){
			 var html = '<p class="groupChar">{$first}</p> \
							<li id="friends{$uid}" uid="{$uid}" data-group="{$first}"> \
								<img src="{$head}" alt="{$name}" width="40" height="40" /> \
								<div class="info"><h5>{$name}</h5><p>{$job_title}</p></div> \
							</li>';
			 var $friend = $.parseHtml(html, v);
			 if(v.uid=="106938"){
				 $friend.prependTo(panel);
			}else{
				$friend.appendTo(panel);
			}


			  $friend.on('click',function(){
				  if ($.locker == 1) { return; }
				 $.locker = 1;	//锁定好友信息弹出框 防止并发
				 $(this).addClass('active').siblings('li').removeClass('active');

				 if ($.container.userinfos['u'+v.uid]) {	//前端已经缓存了该用户的信息，则直接弹出
					 $.container.showUserinfo( $.container.userinfos['u'+v.uid] );
					 } else {
					 $.chatListener.send('userinfo', {uid:v.uid});
				 }
				 })




		 });*/

		 /*修改分组方式，慕课女神单独处理*/
		var groupUser=[];
		var oldgroup="A"
		$.each(this.friends, function(k, v){
			if(v.first!==""){
				oldgroup=v.first;
				groupUser[oldgroup]=[]
			}
			groupUser[oldgroup].push(v);
		})

		for(var i in groupUser){
			 var html = '<p class="groupChar">'+i+'</p>';
			 if(!(i=="M"&&groupUser[i].length==1)){
				 $(html).appendTo(panel);
			 }

			 $.each(groupUser[i], function(k, v){
				var firendstr='<li id="friends{$uid}" uid="{$uid}" data-group="{$first}"> \
								<img src="{$head}" alt="{$name}" width="40" height="40" /> \
								<div class="info"><h5>{$name}</h5><p>{$job_title}</p></div> \
							</li>';
				var $friend = $.parseHtml(firendstr, v);

				if(v.uid==msgConfig.vipUser){
					$friend.prependTo(panel);
				}else{
					$friend.appendTo(panel);
				}


			  	$friend.on('click',function(){
				  if ($.locker == 1) { return; }
				 $.locker = 1;	//锁定好友信息弹出框 防止并发
				 $(this).addClass('active').siblings('li').removeClass('active');

				 if ($.container.userinfos['u'+v.uid]) {	//前端已经缓存了该用户的信息，则直接弹出
					 $.container.showUserinfo( $.container.userinfos['u'+v.uid] );
					 } else {
						 $ajax_userinfo(v.uid, function(info){
							 $.container.userinfos['u'+v.uid] = info;
							 $.container.showUserinfo( $.container.userinfos['u'+v.uid] );
						 });
					 //$.chatListener.send('userinfo', {uid:v.uid});
				 }
				 })

			 })

		 };
	},
	//将单个conver附加到联系人列表
	appendLastChat : function( panel, conver ) {
		conver.lastmsg = (conver.lastmsg) ? conver.lastmsg : '';

		 /*<img src="/face.php?uid={$uInfo.uid}&size=small"  width="40" height="40" />
		 if(conver.head==''){conver.head='/face.php?id=1'}*/

		 //if(conver.head==''){conver.head='/face.php?uid={$uid}&size=small'} //无头像用户的默认头像
		//conver.uid=msgConfig.vipUser;
		var msgClose;
		if(conver.uid!=msgConfig.vipUser){
			msgClose='<span class="msg-close"></span>';
		}else{
			msgClose="";
		}
		 var html = '<li id="lastChat{$uid}" uid="{$uid}"> \
						'+msgClose+'<img src="{$head}" alt="{$nickname}" width="40" height="40" /> \
				     	<div class="info"><h5>{$nickname}</h5></div>\
			 		 </li>';
		 var $last = $.parseHtml(html, conver);

		 if (conver.unread > 0) {
			$.parseHtml('<div class="unread_num" style="">{$unread}</div>', conver).appendTo($last);
		}

		var nickname = $last.find('.info h5').html();
		var _lastmsg = '<p class="theLastMsg">'+$.parseHtml('<p class="theLastMsg">{$lastmsg}</p>', conver).html().replace('{$name}', nickname)+'</p>';
		$.parseHtml(_lastmsg, conver).appendTo($last.find('.info'));

		var nofriendbox='<p id="nofriendbox" class="cue">你已经不在对方好友列表中</p>';//提示信息
		//删除对话消息
		$last.find('.msg-close').click(function(e){
			e.preventDefault();
	        if(isAjax){return};
	        var userid = {},isAjax = true,that=$(this);
			userid.rid=that.closest('li').attr('uid');
			$.ajax({
				type: 'post',
				url: '/message/delconhistory',
				dataType: 'json',
				data:userid,
				success: function(data){
					if(data.result == 0){
						that.closest('li').remove();
					}
				},
				error:function(){
					alert('系统繁忙，请稍后再试!');
					isAjax=false;
				}
			})
		})
		$last.click(function(e) {

			e.preventDefault();
			$('#textInput').val('');
			$(this).addClass('active').siblings('li').removeClass('active');	//标记选中状态
			$('#chat_content ul').hide();
			var uid = $(this).attr('uid');
			var agreeEle= $(".act_btn").closest("ul");//找加好友同意的元素
			var conver = $.container.find(uid);
	 		var _isfriend={},
			_isfriend_fruit;//ajax 判断对方是否为好友;

			_isfriend.rid=uid;
			_isfriend_fruit=$ajax_isfriend(_isfriend);

			if (!conver.inited) {
				 conver.initChat();
				 conver.show();
			} else {
				 conver.show();
			}
            //标记为已读
            conver.markUnread();
            var $unread = $(this).find('.unread_num');
            if ($unread.length > 0) {
                $unread.remove();
            }

			$.container.current = conver;
			//判断好友，会话框内发送或提示
			if(_isfriend_fruit==0){
				$.chatInput.hide();
				if($("#nofriendbox").length){
					$("#nofriendbox").show();
					$.container.resize();
				}else{
					$('#chat_container').append(nofriendbox);
				}
				//如果是加好友同意，就不显示提示信息
                if (conver.lastmsg.indexOf('好友请求：') == 0) {
                    $("#nofriendbox").hide();
                }
				/*for(var i=0,j=agreeEle.length;i<j;i++){
					if($(agreeEle[i]).attr('id')==("userchatUl"+uid)){
						$("#nofriendbox").hide()
					}
				}*/
			}else{
				$("#nofriendbox").hide();
				$.chatInput.active();	//激活输入框
			}
		 });
		$last.appendTo(panel);
	},

	//刷新最近联系人列表
	refreshLatest : function() {

		var panel = $('#lastChat').html('');

		if(!this.convers.length){
			panel.html('<div class="no_message" ></div>');
		}
		$.each(this.convers, function(k, conver){

			$.container.appendLastChat( panel, conver );
			//$.container.refreshUnread(conver);

		 });


	},

	//刷新未读消息
	refreshUnread : function(conver) {
		var uid = conver.uid;
		var $last = $('#lastChat'+uid);
		var $unread = $last.find('.unread_num');

		if ($unread.length > 0) {
			$unread.remove();
		}
		if (conver.unread > 0) {

			$.parseHtml('<div class="unread_num" style="">{$unread}</div>', conver).appendTo($last);
		}

		$last.find('.theLastMsg').remove();
		var nickname = $last.find('.info h5').html();

		var _lastmsg = '<p class="theLastMsg">'+$.parseHtml('<p class="theLastMsg">{$lastmsg}</p>', conver).html().replace('{$name}', nickname)+'</p>';
		$.parseHtml(_lastmsg, conver).appendTo($last.find('.info'));
		if (conver.unread > 0) {
			$last.parent().prepend($last);
		};

		//如果活动窗口就是当前窗口，则标记未读为已读
		if ($.container.current && $.container.current.uid == conver.uid) {
			$.chatListener.send('haveread', {uid: conver.uid});
			var $unread = $last.find('.unread_num');

			if ($unread.length > 0) {
				$unread.remove();
			}
		}
	},

	//刷新最近联系中显示最后发送的消息并置顶
	refreshRelate : function(msg) {
		var uid = msg.uid;
		var $last = $('#lastChat'+uid);
		$last.find('.theLastMsg').remove();
		$.parseHtml('<p class="theLastMsg">{$lastmsg}</p>', msg).appendTo($last.find('.info'));
		$last.parent().prepend($last);
	},

	//查看用户资料
	showUserinfo : function(userinfo) {
		if(userinfo.sign){
			userinfo.sign=$('<div/>').text(userinfo.sign).html()
		}
		$('.xubox_layer').remove(); //清除所以弹出层

		var _sign = $.parseHtml('<p class="sign">{$sign}</p>', userinfo).html();

		if(_sign == ""){
			_sign = '<p>这位同学很懒，什么也没有留下 - - !</p>';
		}else{
			_sign = '<p class="sign">{$sign}</p>';
		}

        //除慕课女神外，其它需要删除好友按钮
		var rmfriend='<a id="rmfriend" class="btn btn-red" href="javascript:;">删除好友</a>';
		if(userinfo.uid==msgConfig.vipUser){
			rmfriend="";
		}
		//如果没有删除该好友提示信息
		var errorNote='<div class="error-note">系统繁忙，请稍后再试!</div>';
        var layerHtml ='<div><div class="userinfo_layer"> \
        					<p class="headpic"><img src="{$head}" width="130" height="130" /></p> \
							<p class="name">{$name}</p>\
							<p class="job">{$job_title}</p>\
							<p>{$sex},{$location}</p> ' + _sign + ' <div class="btn_area"> \
						   <a href="/space/u/uid/{$uid}" class="btn btn-blue" target="_blank">访问主页</a>\
						   <a id="gotoSend" uid="{$uid}" class="btn btn-green" href="javascript:;">发消息</a>'+rmfriend+'</div> \
						</div></div>';

						//	<dt>主页：</dt> <dd><a href="/space/course/id/{$uid}" target="_blank">http://www.mukewang.com/space/course/id/{$uid}</a></dd></dl> \

        layerHtml = $.parseHtml(layerHtml, userinfo).html();
        var poplayer='<div><div class="pop-layer"> \
							<p class="icon-point-revert warning-pic"></p> \
        					<p class="remove-note">好友删除将无法恢复，<br />您确定要删除这位好友吗？</p> \
        					<div id="btn_wrap" class="btn_area"> \
						   	<a id="sure-remove" uid={$uid} class="btn btn-green" href="javascript:;">确定</a><a href="javascript:;" id="not-remove" class="btn btn-white">取消</a></div>\
        					</div></div>';

        poplayer = $.parseHtml(poplayer, userinfo).html();
		$('.userinfo_layer').remove();
		$('#chat_content ul').hide();
		/*$('#chat_editor').css('visibility','hidden');*/

		$(layerHtml).appendTo('#chat_content');

		$('#gotoSend').click(function(){
			/*layer.close(msgLayer);*/
			$('.userinfo_layer').remove();
			$('#chat_content ul').hide();
			$.container.prepareChat(userinfo);
			$.container.changePanel(0);
		})

		$("#rmfriend").click(function(){
			// 删除好友询问框
			var msgLayer = $.layer({
				type : 1,
				//shade : [0.5 , '#000' , false],
				title : false ,
				border : [ 1, 1, '#b1b1b1', true ],
				closeBtn : [ 0, false ],
				area : [ '300px', 'auto' ],
				page : {
					html :poplayer
				}
			});
			//删除好友
			$("#sure-remove").click(function(){
		        if(this.isSubmitting){return};
		        var friendrid = {},isSubmitting = true,that=$(this);
				friendrid.rid=that.attr('uid');

				$.ajax({
					type: 'post',
					url: '/message/delfriend',
					dataType: 'json',
					data:friendrid,
					success: function(data){
						if(data.result == 0){
							layer.close(msgLayer);
							$("#friends"+friendrid.rid).remove();
							$('.userinfo_layer').remove();
							$("#list_waper").load();
							//$("msg_friends").find("a").addClass("active");
						}else{
							$("#btn_wrap").append(errorNote);
						}
					},
					error:function(){
						$("#btn_wrap").append(errorNote);
						isSubmitting=false;
					}
				})
			})
			$("#not-remove").click(function(){
				layer.close(msgLayer);
			})
		})

		$.locker = 0; //已完成一个展示 解锁好友信息框
	},

	//准备跟好友聊天
	prepareChat : function(userinfo) {
		 var conver = $.container.find(userinfo.uid);
		 //如果用户不是最近联系人
		 if (!conver) {
			 conver = new Conver(userinfo.uid, userinfo.name, userinfo.head);
			 $.container.add(conver);
		 }
		 //初始化聊天窗口
		 if (!conver.inited) {
			 conver.initChat();
			 conver.show();
		 } else {
			 conver.show();
		 }
		$.container.moveFirst(conver);
		$.container.refreshLatest();
		$("#nofriendbox").hide();
		$.container.active(conver);

	},

	//更改好友或最近联系人列表
	changePanel : function(i) {
		if (i == 0) {
			$('#lastChat').show();
			$('#friends').hide();
			$('#left_panel').find('i').animate({'left':'82'},150);
		} else {
			$('#lastChat').hide();
			$('#friends').show();
			$('#left_panel').find('i').animate({'left':'269'},150);

		}
		$('#left_panel_nav').find('a').removeClass('active').eq(i).addClass('active');
	}
};
function $ajax_userinfo(uid, fn){
	var info;
	var async = typeof fn == 'function';
	$.ajax({
		 type: 'get',
		 async: async,
		 url: '/message/userinfo?uid='+uid,
		 dataType: 'json',
		 success: function(data){
			if(data.result == 1){
				fn && fn(data.data);
				info = data.data;
			};
		 }
	})
	return info;
}
function $ajax_friends(callback){
	$.ajax({
		 type: 'post',
		 url: '/message/friends',
		 dataType: 'json',
		 success: function(data){
			if(data.result == 1){
				var _data = data.data;
				$.container.friends = _data;
				$.container.refreshFriends(_data);
				callback && callback();
			};
		 }
	})
}
$ajax_friends();
function $ajax_isfriend(rid){
	var backValue;
	$.ajax({
		type: 'post',
		async: false,
		url: '/message/isfriend',
		dataType: 'json',
		data:rid,
		success: function(data){
			if(data.result == 0){
				if(data.data==true){//1为好友
					backValue=1;
				}else{//0为非好友
					backValue=0;
				}
			};
		}
	})
	return backValue;
}
$('#left_panel_nav a').each(function(i, btn) {

	$(this).click(function() {
		var _this = $(this);
		$.chatInput.hide();
		$('.user_list').find('li').removeAttr('class');
		$('.userinfo_layer').remove();
		$('#chat_content ul').hide();
		$.container.current = null;
		$.container.changePanel(i);
		$.container.resize();

		if(_this.closest('li').attr('id') == 'msg_friends'){

			$('#chat_editor').css('display','none');
			$ajax_friends(function(){
				setTimeout(function() {
					$('#friends li:eq(0)').trigger("click");
				}, 200);
			});
		}else{
			latestCallback();
		}


		if($("#nofriendbox").length){
			$("#nofriendbox").hide();
		}
	})

});

function latestCallback(){
	if( $.container.current ) {
		var uid = $.container.current.uid;
		setTimeout(function() {
			$('#lastChat' + uid).trigger("click");
		}, 1000);
	}else{
		setTimeout(function() {
			$('#lastChat li:eq(0)').trigger("click");
		}, 200);
	}
}

function $ajax_latest(){
	$.ajax({
		 type: 'post',
		 url: '/message/latest',
		 dataType: 'json',
		 success: function(data){
			if(data.result == 1){
				_data = data.data;

				var users = _data;

				$.container.convers = [];
				$.each(users, function(i, user) {
					if (user.uid != uinfo.uid) {
						conver = new Conver(user.uid, user.name, user.head);
						conver.unread = user.unread;
						conver.lastmsg = user.lastmsg;
						conver.lastmsg = user.msgtype != 2 ?  $('<div/>').text(user.lastmsg).html(): user.lastmsg;

						$.container.add(conver);
					}
				});
				$.container.refreshLatest();

				/*$($.container.convers).each(function(index, element) {
					this.initChat();
				});*/
				latestCallback();
			};
		 }
	})
}

$ajax_latest();


function $ajax_msg(_uid){
	var _data;
	$.ajax({
		async:false,
		 type: 'post',
		 url: '/message/readmsg?rid='+_uid,//+'&page='+_page,
		 dataType: 'json',
		 success: function(data){
			if(data.result == 1){
				_data = data.data;
			};
		 }
	});
	return _data;
}



var formatList = {};

formatList = {

	type_1:function(msg){
		var line = '',_head;

		if(msg.create_date.length > 0){
			_line = '<li><div class="timeLine"> <strong style="width:130px;">'+msg.create_date+'</strong></div> </li>'
		}else{
			_line = ''
		};

		if(msg.youorme == 'you'){
			_head = msg.headicon;
		}else if (msg.youorme == 'me'){
			_head = '<a><img width="40" height="40" class="img_border_one" src="'+uinfo.head+'"></a>';
		}

		var _html = _line+'<li class="'+msg.youorme+' '+msg.issystem+'"> \
						<div class="chat_avata">'+_head+'</div> \
						<div class="a_msg_info" id="'+msg.id+'"><pre>'+$.chatInput.filterFace(msg.content.replace(/</g,'&lt;').replace(/>/g,'&gt;'))+'</pre><i class="arrow_left_b"></i></div> \
						<small class="time">'+$.datetime(msg.create_time)+'</small> \
					</li>';
		return _html;
	},

	type_2:function(_who,_headicon,_id,_content,_sendtime,_timeline){

		var line = '',_head;

		if(_timeline.length > 0){
			_line = '<li><div class="timeLine"> <strong style="width:130px;">'+_timeline+'</strong></div> </li>'
		}else{
			_line = ''
		};

		if(_who == 'you'){
			_head = _headicon;
		}else if (_who == 'me'){
			_head = '<a><img width="40" height="40" class="img_border_one" src="'+uinfo.head+'"></a>';
		}

		var _html = _line+'<li class="'+_who+'"> \
						<div class="chat_avata">'+_head+'</div> \
						<div class="a_msg_info" id="'+_id+'"><span class="chat_ph">'+_content+'</span><small class="time">'+_sendtime+'</small> \
						<i class="arrow_left_b"></i> \
					</li>';
		return _html;
	},

	type_5:function(msg, conver){

		if (msg.info.status == 1) {
			/*if( msg.status == 9 ) {

				if (msg.info.uid == uinfo.uid) {
					msg.content = userlink(msg.info.friend_uid, msg.info.friend_name)+'同意了你的好友请求，你们现在可以对话啦！';

					//msg.headicon = this.headicon(msg.info.friend_uid);
				} else {
					msg.youorme = 'me';
					msg.content = '你已同意了{$sender_name}为好友，你们现在可以对话啦！';


					//msg.headicon = this.headicon(msg.info.friend_uid);
				}
			}*/

			return formatList.type_1(msg).replace('{$name}',userlink(conver.uid, conver.nickname));

		}else{
				$("#nofriendbox").hide();
			/*if (msg.info.status == 2) {
				if (msg.sender == uinfo.uid) {
					return '';	//被对方忽略了不显示
				} else {
					msg.content = '您忽略了'+this.nickname+'的好友请求';
					$.chatInput.hide();
				}
			};*/


			var line = '',_head;

			if(msg.create_date.length > 0){
				_line = '<li><div class="timeLine"> <strong style="width:130px;">'+msg.create_date+'</strong></div> </li>'
			}else{
				_line = ''
			};

			if(msg.youorme == 'you'){
				_head = msg.headicon;
			}else if (msg.youorme == 'me'){
				_head = '<a><img width="40" height="40" class="img_border_one" src="'+uinfo.head+'"></a>';
			}

			var _job;

			if(msg.info.job_title == ""){
				_job = '<pre class="comInfo">地球人、自由职业者、保密</pre>';
			}else{
				_job = '<pre class="comInfo">'+msg.info.job_title+','+msg.info.sex+','+msg.info.location+'</pre>';
			}

			var html = _line + '<li class="'+msg.youorme+' '+msg.issystem+' JaddFriend'+msg.id+'" msgId="'+msg.id+'"> \
							<div class="chat_avata">'+_head+'</div> \
							<div class="a_msg_info"><p><strong>'+msg.info.name+'</strong></p>'+_job+'<p>请求加你为好友</p><pre>附加消息：'+msg.content+'</pre> \
								<div class="act_btn"><a href="/space/u/uid/'+msg.sender+'" class="btn btn-large btn-blue" target="_blank">访问主页</a> <button  id="agree'+msg.id+'" msgId="'+msg.id+'" class="btn btn-green btn-agree">同意</button></div>\
								<i class="arrow_left_b"></i> \
							</div> \
							<small class="time">'+$.datetime(msg.create_time)+'</small> \
						</li>';

			return html;
		}
	},
	type_8:function(msg){
		return formatList.type_1(msg).replace(/{\$name}/, courselink(msg.info.id, msg.info.name));
	},
	type_9:function(msg){
		return formatList.type_1(msg).replace(/{\$planlist}/, planlink(msg.info));
	}
}

//聊天事件监控器
$.chatListener = {
	init : function() {
		//socket已建立连接 @ 因为socket建立连接是在 chat.js文件中，服务端在建立连接后，此处不能马上绑定到socket并接收到服务器发送过来的事件， login将失败。socket重连后将成功
		//下面加载后如已经建立连接，将login操作
		$.chat.bindEvent('connect', function() {
			$.chat.login(uinfo);
			$.chat.checkUnreads();
		});
		//这样在网速快的时候会发送两次，需要处理避免
		if($.chat.iosocket){
			$.chat.login(uinfo);
		}

		//接收消息事件
		$.chat.bindEvent('chat',function(msg) {
			//未读监听
			FlashTitle.init();
			//$.debug.log('chat', msg);
			var relate = $.chatListener.relate(msg);
			var conver = $.container.find(relate);
			if (!conver) {
				msg.head = '/face.php?uid='+relate+'&size=small';
				conver = new Conver(relate, msg.sendername, msg.head);
				$.container.add(conver);
			}
			if(conver.inited==0&&msg.clear){
				conver.inited = 1;
				conver.$chatBox = $.parseHtml('<ul id="userchatUl{$uid}" uid="{$uid}" class="userchatUl" style="display:none;"></ul>', conver).appendTo(conver.$panel);
			}
			if(!conver.nickname&&msg.sendername) {
				conver.nickname=msg.sendername;
				$("#lastChat"+conver.uid).find("h5").html(msg.sendername)
			}
			if (conver.inited) {
				conver.appendMsg(msg); //对于已经初始化的窗口，则将消息附加到窗口中
			} else {
				conver.initChat();	//对于首次受到消息的会话先初始化会话窗口，会自动加载历史记录
			}
		});

		//好友列表消息
		/*$.chat.bindEvent('friends', function(users) {
			//$.debug.log('friends', users);
			$.container.friends = users;
			$.container.refreshFriends();
		});*/
		//最近联系人列表消息
		/*$.chat.bindEvent('latest', function(users) {

			$.container.convers = [];
			$.each(users, function(i, user) {
				if (user.uid != uinfo.uid) {
					conver = new Conver(user.uid, user.name, user.head);
					conver.unread = user.unread;
					conver.lastmsg = user.lastmsg;
					conver.lastmsg = user.msgtype != 2 ?  $('<div/>').text(user.lastmsg).html(): user.lastmsg;

					$.container.add(conver);
				}
			});
			$.container.refreshLatest();

			$($.container.convers).each(function(index, element) {
				this.initChat();

            });

			if( $.container.current ) {
				var uid = $.container.current.uid;
				setTimeout(function(){$('#lastChat'+uid).trigger("click")},1000);
			}

		});*/
		//未读消息
		$.chat.bindEvent('unread', function(data) {

			var relate = data.uid;
			var conver = $.container.find(relate);

			if (!conver) {
				data.head = '/face.php?uid='+relate+'&size=small';
				conver = new Conver(relate, data.sendername, data.head);
				$.container.add(conver);
			}
			conver.unread = data.unreads;

			if(data.msgtype!=2){
				data.lastmsg = $('<div/>').text(data.lastmsg).html();
				conver.lastmsg = $.chatInput.filterFace(data.lastmsg);
				if(data.msgtype==8){
					conver.lastmsg = conver.lastmsg.replace(/{\$name}/, data.info.name);
				}
			}else{
				conver.lastmsg = data.lastmsg;
			}

			$.container.refreshUnread(conver);	//刷新未读数

		});
		/*//用户信息
		$.chat.bindEvent('userinfo', function(userinfo) {
			$.container.userinfos['u'+userinfo.uid] = userinfo;	//缓存userinfo信息
			$.container.showUserinfo(userinfo);
		});
		//增加监听是否冻结事件
		$.chat.bindEvent('checkfrozen', function(data) {
			//冻结跳转到提示页面
			if( data.status = 1 ) {
				window.location.href='/user/userfrozen';
			}

		});*/
	},

	//取得关联用户
	relate : function(msg) {
	    var relate = (msg.sender == uinfo.uid) ? msg.receiver : msg.sender;
	    return relate;
	},

	//发送消息
	send : function(type, msg) {
		$.chat.send(type, msg);
	}
}
var faceText = new Array('[微笑]','[不]','[亲亲]','[无聊]','[鼓掌]','[伤心]','[害羞]','[闭嘴]','[耍酷]','[无语]','[发怒]','[惊讶]','[委屈]','[酷]','[汗]','[闪]','[放屁]','[洗澡]','[偶耶]','[困]','[咒骂]','[疑问]','[晕]','[衰]','[装鬼]','[受伤]','[再见]','[抠鼻]','[心寒]','[怒]','[凄凉]','[悄悄]','[奋斗]','[哭]','[赞]','[开心]');

var loadFlag = 1;


//聊天输入器
$.chatInput = {
	$input : $('#textInput'),	//聊天输入框
	$sendBtn : $('.chatSend'),	//发送按钮
	$emoBtn : $('#sendEmojiIcon'), //表情按钮
	$uploadImgBox: $('#msg_upImg_box'),
	$imgDel: $('#imgDel'),
	$facePanel : $('#face_panel'), //表情面板
	$editorAlert : $('#editor_msg'), //输入框提示信息

	faceLib :faceLib={
		'[微笑]':'/static/img/smiley/64/1.png',
		'[不]':'/static/img/smiley/64/2.png',
		'[亲亲]':'/static/img/smiley/64/3.png' ,
		'[无聊]':'/static/img/smiley/64/4.png' ,
		'[鼓掌]':'/static/img/smiley/64/5.png' ,
		'[伤心]':'/static/img/smiley/64/6.png' ,
		'[害羞]':'/static/img/smiley/64/7.png' ,
		'[闭嘴]':'/static/img/smiley/64/8.png' ,
		'[耍酷]':'/static/img/smiley/64/9.png' ,
		'[无语]':'/static/img/smiley/64/10.png' ,
		'[发怒]':'/static/img/smiley/64/11.png' ,
		'[惊讶]':'/static/img/smiley/64/12.png' ,
		'[委屈]':'/static/img/smiley/64/13.png' ,
		'[酷]':'/static/img/smiley/64/14.png' ,
		'[汗]':'/static/img/smiley/64/15.png' ,
		'[闪]':'/static/img/smiley/64/16.png' ,
		'[放屁]':'/static/img/smiley/64/17.png' ,
		'[洗澡]':'/static/img/smiley/64/18.png' ,
		'[偶耶]':'/static/img/smiley/64/19.png' ,
		'[困]':'/static/img/smiley/64/20.png' ,
		'[咒骂]':'/static/img/smiley/64/21.png' ,
		'[疑问]':'/static/img/smiley/64/22.png' ,
		'[晕]':'/static/img/smiley/64/23.png' ,
		'[衰]':'/static/img/smiley/64/24.png' ,
		'[装鬼]':'/static/img/smiley/64/25.png' ,
		'[受伤]':'/static/img/smiley/64/26.png' ,
		'[再见]':'/static/img/smiley/64/27.png' ,
		'[抠鼻]':'/static/img/smiley/64/28.png' ,
		'[心寒]':'/static/img/smiley/64/29.png' ,
		'[怒]':'/static/img/smiley/64/30.png' ,
		'[凄凉]':'/static/img/smiley/64/31.png' ,
		'[悄悄]':'/static/img/smiley/64/32.png' ,
		'[奋斗]':'/static/img/smiley/64/33.png' ,
		'[哭]':'/static/img/smiley/64/34.png',
		'[赞]':'/static/img/smiley/64/35.png' ,
		'[开心]':'/static/img/smiley/64/36.png'
	},	//表情库对象
	lastsend : 0, 	//上次发消息时间

	init : function() {
		//表情按钮点击事件
		this.$emoBtn.click(function(event) {
			$('#textInput').focus();
			if($('#face_panel').is(":visible")){
				$('#sendEmojiIcon').removeClass('sendEmojiIcon_ac');
				$('#face_panel').hide();
			}else{
				if($('#face_panel').length==0){
					openFace(event,$('#textInput'),'/static/img/smiley/');
				}else{
					$('#sendEmojiIcon').addClass('sendEmojiIcon_ac');
					$('#face_panel').show();
				}
			}





			//$('#chat_content').height(_msgBox_h -240);
			//$.chatInput.toggelEmo();
							//$('#face_panel').hide();

			return false;
		});

		$(document).click(function() {
			$.chatInput.$facePanel.hide();
		});

       //点击发送按钮事件
		this.$sendBtn.click(function() {

			loadFlag = 0;
			$.chatInput.send();
			return;
/*			$.ajax({
				 type: 'post',
				 url: '/user/ajaxcheckfrozen',
				 dataType: 'json',
				 success: function(data){
					if(data.result == 1){
						$.chatInput.send();
					};
					if(data.result < 0){
						alert(data.msg);
					};
				 }
			})*/

		});






		this.$imgDel.click(function(){
			$('#msg_upImg_box').hide();
			$('#imgDel').hide();
			$('#textInput').show().val('');
			$('#msgUploadImg').val('').css('display','block');
			$('#msg_upImg_box').find('img').remove();
			$('.chat_upImg').removeClass('chat_upImg_ac');
		});


		//回车发送消息事件
		this.$input.keypress(function(event) {
			if (event.which == 13) {
				event.preventDefault();
				$.chatInput.send();
			}
		})
	},

	//激活输入框
	active : function() {

		//如果不是好友就不出现消息框，提示即可
		if ($.container.current && $.container.current.isFriend()) {
			if($('.userinfo_layer').length == 0){
				$('#chat_editor').css('display','block');
			};
			$('#textInput').focus();
		}else{
			this.hide();
		}
		$.container.resize(); //重新设置窗口高度 yangmy 2014 04-08
		//this.$input.focus();
	},

	//隐藏输入框
	hide : function() {
		/*$('#chat_editor').css('visibility','hidden');*/
		$('#chat_editor').css('display','none');
		this.$input.focus();
	},

	//发送消息
	send : function() {
		//$.debug.log(this.$input.val());

		$("#nofriendbox").hide()
		$.chatInput.active();

		switch($('#textInput').css('display')){
			case 'none':


					$('#upLoadForm').submit();


					$.container.current.sendMsgAjax();


			break;

			default:

				/*if ($.time() - this.lastsend < 1) {
					this.$editorAlert.text(msgConfig.text_toofast).show();

					var container_h = $('#list_waper').height(),
						errorBox_w = this.$editorAlert.width(),
						errorBox_h = this.$editorAlert.height();

					this.$editorAlert.css('top',container_h/2 - errorBox_h/2 + 'px' );
					this.$editorAlert.css('left',500 - errorBox_w/2 + 'px' );

					setTimeout(function() { $.chatInput.$editorAlert.fadeOut(); }, msgConfig.showTime);
					return;
				} else*/	if ($.trim(this.$input.val()) == '') {

					this.$editorAlert.text(msgConfig.text_null).show();

					var container_h = $('#list_waper').height(),
						errorBox_w = this.$editorAlert.width(),
						errorBox_h = this.$editorAlert.height();
					this.$editorAlert.css({
						'marginTop':errorBox_h/-2,
						'marginLeft':errorBox_w/-2
					});
					setTimeout(function() { $.chatInput.$editorAlert.fadeOut(); }, msgConfig.showTime);
					return;
				} else if ( this.$input.val().length > msgConfig.maxLength ) {

					this.$editorAlert.text(msgConfig.text_toolong).show();

					var container_h = $('#list_waper').height(),
						errorBox_w = this.$editorAlert.width(),
						errorBox_h = this.$editorAlert.height();
					this.$editorAlert.css({
						'marginTop':errorBox_h/-2,
						'marginLeft':errorBox_w/-2
					});
					setTimeout(function() { $.chatInput.$editorAlert.fadeOut(); }, msgConfig.showTime);

					return;
				} else {
					//var newVal = this.$input.val().replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
					//$.container.current.sendMsg($.chatInput.filterScript(this.$input.val())); //发送输入的信息并过滤脚本标签
					var newVal = this.$input.val();
					$.container.current.sendMsg(newVal);
				}

				this.clear();

		}



		this.lastsend = $.time();

	},

	//清空输入框
	clear : function() {
		this.$input.val('');
		this.$input.focus();
	},

	//切换表情显示
	toggelEmo : function() {
		$.chatInput.$facePanel.toggle();
	},

/*	//在输入框中插入文本
	insertText : function(text) {
		var input = this.$input[0];
		if (document.selection) {
			input.focus();
			var cr = document.selection.createRange();
			cr.text = text;
			cr.collapse();
			cr.select();
		} else if (input.selectionStart || input.selectionStart == '0') {
			var start = input.selectionStart, end = input.selectionEnd;
			input.value = input.value.substring(0, start) + text + input.value.substring(end, input.value.length);
			input.selectionStart = input.selectionEnd = start + text.length;
		} else {
			input.value += text;
		}
	},
	*/
	//过滤表情显示
	filterFace : function(text) {
		//过滤html标签

		for(var i=0;i<=faceText.length;i++){
			if(text.match(faceText[i])){
				var text = text.replace(faceText[i],'<img class="ph_face" src="'+ $.chatInput.faceLib[faceText[i]] +'"/>');
			}
		}

		//var urlreg = /((www|https?:\/\/)[-\w.\/?%(&amp;)=]+)(\s|$|[u4e00-u9fa5])/gi;//url正则
		//var reg = /(www|(https|http):\/\/)[a-zA-Z0-9\-\.]+(\/\w+)*\.*(\w)*/g;

		//url正则
		//以空格或者逗号或者制表符或者中文字符作为终止符号；
		//以http(s)://或者www开头，后面至少一个字符（最后一个符号不能是.）
		var urlreg = /((www|https?:\/\/)[-\w.\/?%(&amp;)=]+)((^.\s)$|[u4e00-u9fa5])/gi;
		var nntext=text.replace(urlreg, function(url){
			if (url.indexOf('http')!=-1){
				if(text.indexOf('<img')!=-1){
					return url;
				}else{
					return '<a href="'+url+'" target="_blank" >'+url+'</a>'
				}

			}else{

				 return '<a href="http://'+url+'" target="_blank" >'+url+'</a>'
			}
         });

		 return nntext
	},

  filterScript :function(text){
	  var text=text.replace(/</g,'&lt;').replace(/>/g,'&gt;');
	  return text
	  }

 }

//聊天会话类
var Conver = function(uid, nickname, head) {
	this.uid = uid;
	this.nickname = nickname;
	this.head = head;
	this.unread = 0;	//当前的未读消息数
	this.inited = 0;	//是否初始化
	this.$panel = $('#chat_content');
	this.$chatBox = null;
	this.action = {'accept':1, 'refuse':2};	//好友消息操作事件码
	this.isfriend = false;
    this.needClear=false;


	//初始化会话窗口 会忽略当前该条消息，因为初始化的时候会获取历史记录，其中包含当前消息
	this.initChat = function() {
		var _this = this;
		this.inited = 1;
		this.$chatBox = $.parseHtml('<ul id="userchatUl{$uid}" uid="{$uid}" class="userchatUl" style="display:none;"></ul>', this).appendTo(this.$panel);
		//$.chatListener.send('readmsg', {uid:this.uid, msg:1});

		var _data = $ajax_msg(this.uid);

		var cutline='',headPart;

		$(_data).each(function(index, e) {

			if(e.type == '2') {
				$(formatList.type_2(e.youorme,e.headicon,e.id,e.content,$.datetime(e.create_time),e.create_date)).appendTo(_this.$chatBox);
			}else if(e.type == '5'){

			$.chatInput.hide();
			var obj = $(formatList.type_5(e, _this)).appendTo(_this.$chatBox);

			obj.find('#agree'+e.id).click(function(){
                $("#nofriendbox").hide();
                //重新调用ajax_msg，把消息重新拉出来
                var appendValue=$ajax_msg(_this.uid);
                    var appendHtml;
	                for(var i=0,l=appendValue.length;i<l;i++){
	                    var singleEle =appendValue[i];
	                    function appendString(info){
	                        if(singleEle.create_date.length > 0){
                                _line = '<li><div class="timeLine"> <strong style="width:130px;">'+singleEle.create_date+'</div>'
	                        }else{
                                _line = ''
	                        };

	                        if(singleEle.youorme == 'you'){
                                _head = singleEle.headicon;
	                        }else if (singleEle.youorme == 'me'){
                                _head = '<a><img width="40" height="40" class="img_border_one" src="'+uinfo.head+'"></a>';
	                        }
	                        appendHtml = '<li class="'+singleEle.youorme+' '+singleEle.issystem+'"> \
                                        <div class="chat_avata">'+_head+'</div> \
	                        <div class="a_msg_info" id="'+singleEle.id+'"><pre>'+$.chatInput.filterFace(singleEle.content.replace(/</g,'&lt;').replace(/>/g,'&gt;'))+'</pre><i class="arrow_left_b"></i></div> \
                                        <small class="time">'+$.datetime(singleEle.create_time)+'</small> \
	                        	        </li>';
	                        return appendHtml;
	                    }
	                    $(appendString(singleEle).replace('{$name}',userlink(singleEle.uid, singleEle.nickname))).appendTo($("#userchatUl"+_this.uid));
	           		}
                _this.friendAction(e, 'accept');
                $('#chat_editor').css('display','block');
                $('#textInput').focus();
                $.container.resize();
        	});
            }else if(e.type == '8'){
				$(formatList.type_8(e)).appendTo(_this.$chatBox);
			}else if(e.type == '9'){
				$(formatList.type_9(e)).appendTo(_this.$chatBox);
			}else{
				$(formatList.type_1(e)).appendTo(_this.$chatBox);
			};
		})


	}

	//将消息附加到当前会话窗口中
	this.appendMsg = function(msg) {

		msg.status = msg.status || 0;
		//历史数据分割线

		if (msg.id == 0 && msg.senddate != '') {
			if(msg.clear) {
				if(this.needClear==false){//点击同意好友把以前历史消息不清除
                    this.$chatBox.html('');
                }
			}
			var sendtime= jQuery.timeago(new Date(msg.sendtime*1000));
			/*$('<li><div class="timeLine"> <strong style="width:130px;">'+sendtime+'</strong></div> </li>').appendTo(this.$chatBox);*/
			$('<li><div class="timeLine"> <strong style="width:130px;">'+msg.senddate+'</strong></div> </li>').appendTo(this.$chatBox);
			this.$panel.scrollTop(999999);
			return;
		}

		//好友请求消息
		if (msg.type == 5 && msg.status < 9) {
			$.chatInput.hide();

			return this.dealFriend(msg);
		}

		//常规消息处理
		this.filterMsg(msg);

		if( msg.type == 8 ){
			msg.content = msg.content.replace(/{\$name}/,courselink(msg.info.id, msg.info.name));
		}
		if( msg.type == 9 ){
			msg.content = msg.content.replace(/{\$planlist}/,planlink(msg.info));
		}

		var html = '<li class="{$youorme} {$isSystem}"> \
						<div class="chat_avata">{$headicon}</div> \
						<div class="a_msg_info"  id="' + msg.id + '"><pre>{$content}</pre><i class="arrow_left_b"></i></div> \
						<small class="time">{$sendtime}</small> \
					</li>';
		if( msg.type == 2 ){
			html = '<li class="{$youorme} {$isSystem}"> \
						<div class="chat_avata">{$headicon}</div> \
						<div class="a_msg_info" id="' + msg.id + '"><span class="chat_ph">{$content}</span><small class="time">{$sendtime}</small> \
						<i class="arrow_left_b"></i> \
					</li>';
		}

		$.parseHtml(html, msg).appendTo(this.$chatBox);
		//$.chatInput.active();

		this.afterAppend(msg);
		_msgBox_h = $('#chat_content').height();

	}

	//处理好友消息
	this.dealFriend = function(msg) {
		//如果消息已经处理，则进行回馈显示

		if (msg.info.status == 1) {
			msg.content = msg.content.replace(/{\$name}/, this.userlink(this.uid, this.nickname));
			this.isfriend = true;$("#nofriendbox").hide();
			$.chatInput.active();
			msg.headicon = this.headicon(msg.sender);
			/*
			if (msg.info.uid == uinfo.uid) {
				msg.content = this.userlink(this.uid, this.nickname)+'同意了你的好友请求，你们现在可以对话啦！';
				$.chatInput.active();
				msg.headicon = this.headicon(msg.info.friend_uid);
			} else {
				msg.content = '你已同意了'+this.userlink(this.uid, this.nickname)+'为好友，你们现在可以对话啦！';
				$.chatInput.active();
				msg.headicon = this.headicon(msg.info.friend_uid);
			}*/
			msg.status = 9;
			return this.appendMsg(msg);


		}
		if (msg.info.status == 2) {
			if (msg.sender == uinfo.uid) {
				return ;	//被对方忽略了不显示
			} else {
				msg.content = '您忽略了'+this.userlink(this.uid, this.nickname)+'的好友请求';
					$.chatInput.hide();
				msg.status = 9;
				return this.appendMsg(msg);

			}
		}
		this.filterMsg(msg);
		if(!msg.info.job_title){
			var oldinfo = msg.info;
			msg.info = $ajax_userinfo(msg.sender); //或者this.uid
			msg.status = oldinfo.status;
			msg.friend_uid = oldinfo.friend_uid;
		}

		var _job = $.parseHtml('<pre class="comInfo">{$info.job_title}</pre>', msg).html();

		if(_job == ""){
			_job = '<pre class="comInfo">地球人、自由职业者、保密</pre>';
		}else{
			_job = '<pre class="comInfo">{$info.job_title},{$info.sex},{$info.location}</pre>';
		}

		var html = '<li class="you {$isSystem} JaddFriend{$id}" msgId="{$id}"> \
						<div class="chat_avata">{$headicon}</div> \
						<div class="a_msg_info"><p><strong>{$info.name}</strong></p>'+_job+'<p>请求加你为好友</p><pre>附加消息：{$content}</pre> \
							<div class="act_btn"><a href="/space/u/uid/{$info.uid}" class="btn btn-large btn-blue" target="_blank">访问主页</a> <button  id="agree{$id}" msgId="{$id}" class="btn btn-green btn-agree">同意</button></div>\
							<i class="arrow_left_b"></i> \
						</div> \
						<small class="time">{$sendtime}</small> \
					</li>';
					/*<button id="disAgree{$id}" msgId="{$id}" class="btn btn-gray btn-large btn-disAgree">忽略</button> */
		var obj = $.parseHtml(html, msg).appendTo(this.$chatBox);
		$.chatInput.hide();



		var that = this;
		obj.find('#agree'+msg.id).click(function(){
        //重新调用ajax_msg，把消息重新拉出
        var appendValue=$ajax_msg(that.uid);
        that.needClear=true;//标识历史消息是否需要清除
        var appendHtml,_imgurl,_maintxt;
            for(var i=0,l=appendValue.length;i<l;i++){
                var singleEle =appendValue[i];
                function appendString(info){
	                if(singleEle.create_date.length > 0){
                        _line = '<li><div class="timeLine"> <strong style="width:130px;">'+singleEle.create_date+'</div>'
	                }else{
                        _line = ''
	                };

	                if(singleEle.youorme == 'you'){
                        _head = singleEle.headicon;
	                }else if (singleEle.youorme == 'me'){
                        _head = '<a><img width="40" height="40" class="img_border_one" src="'+uinfo.head+'"></a>';
	                }
	                if(singleEle.image_url){
				        _imgurl='<span class="chat_ph">'+singleEle.content+'</span>';
				        _maintxt='';
				    }else{
				        _imgurl='';
				        _maintxt='<pre>'+$.chatInput.filterFace(singleEle.content.replace(/</g,'&lt;').replace(/>/g,'&gt;'))+'</pre>';
					}
					appendHtml = _line+'<li class="'+singleEle.youorme+' '+singleEle.issystem+'"> \
		                        <div class="chat_avata">'+_head+'</div> \
							<div class="a_msg_info" id="'+singleEle.id+'">'+_imgurl+_maintxt+'<i class="arrow_left_b"></i></div> \
	                        <small class="time">'+$.datetime(singleEle.create_time)+'</small> \
							</li>';
	                return appendHtml;
            	}
                $(appendString(singleEle).replace('{$name}',userlink(singleEle.uid, singleEle.sendername))).appendTo(that.$chatBox);
        	}
            that.friendAction(msg, 'accept');
            that.isfriend = true;
            $("#nofriendbox").hide();
            $.chatInput.active();

            });
		/*obj.find('#disAgree'+msg.id).click(function(){
			that.friendAction(msg, 'refuse');
			$.chatInput.hide();

		});*/
		this.afterAppend(msg);
	}

	//处理好友消息
	this.friendAction = function(msg, action) {
		var _this = this;
		$('.JaddFriend'+msg.id).each(function(index, element) {
				var msgid=$(element).attr('msgId');
				$.chatListener.send('friend', {action:action, msgid:msgid, fuid:msg.sender});
				$(element).remove()
            });

		/*msg.info.status = this.action[action];
		msg.sendtime = $.time();

		if( msg.create_date ) {
			msg.status = 9;
			$(formatList.type_5(msg, conver)).appendTo(_this.$chatBox);
		} else {
			this.appendMsg(msg);
		}*/
	}

	//对消息体进行过滤与预处理
	this.filterMsg = function(msg) {
		msg.headicon = msg.headicon ? msg.headicon : this.headicon(msg.sender);
		msg.sendtime = $.datetime(msg.sendtime);
		/*msg.youOrme = (function(){
			var youOrme;
			if (msg.type==5){

			    // youOrme=(msg.sender == uinfo.uid) ? 'you' : 'me'
				youOrme=(msg.info.uid == uinfo.uid) ? 'you' : 'me'
			}
			else{
				 youOrme=(msg.sender == uinfo.uid) ? 'me' : 'you'
				}
			 return youOrme
			})()*/


		msg.isSystem =(msg.type==5)?'system':'';
		if (msg.type != 2) {
			if( msg.status != 9 ) {
				msg.content = $('<div/>').text(msg.content).html();
			}
			msg.content = $.chatInput.filterFace(msg.content);
		}
		return msg;
	}

	//处理聊天框的后续动作
	this.afterAppend = function(msg) {
		//删除过多的聊天记录
		if (this.$chatBox.find('li').length > msgConfig.maxHistory) {
			this.$chatBox.find('li:first').remove();
		}

		this.$panel.scrollTop(999999);
		//如果活动窗口就是当前窗口，则标记未读为已读
		/*if ($.container.current == this) {
			$.chatListener.send('haveread', {uid:this.uid});
		}//在绑定的unread事件时已经标记了*/
	}

	//发送消息
	this.sendMsg = function(content) {
		var msg = {
			receiver : this.uid,
			content : content,
			type : 1,
			dayfirst: null
		};
		//增加慕课女神时间戳判断  yangmy 2014-04-09
		var dayFirstCk = $(this.$chatBox[0]).find('li').last().find('small').html();

		if(dayFirstCk){
			if(dayFirstCk.split('-').length > 1){
				msg.dayfirst = 1;
			};
		}else{
			msg.dayfirst = 1;
		}

		$.chatListener.send('chat', msg);	//发送到服务器

		$.extend(msg, {id:1, sender:uinfo.uid, receiver:this.uid, sendtime:$.time(), status:1} );
		//this.appendMsg(msg);	//将当前消息显示到聊天窗口中 //修改为从服务器返回消息再显示(by wp 2013/10/09)

		msg = this.filterMsg(msg);

		$.extend(msg, {lastmsg:msg.content});

		$.container.refreshRelate(msg);

	}

	this.sendMsgAjax = function() {

		var _this = this;
		$('.chat_upImg').removeClass('chat_upImg_ac');

		$("#imageFrame").load(function() {
			if (loadFlag === 0){

			var uploadResultJson = $(this).contents().find("*").first().text()
			var data ="";

			try{
			 	data = $.parseJSON(uploadResultJson);
			}catch(e){
				data = $.parseJSON($("#imageFrame").contents().find("body").html());
			}


			switch (data.error){
				case 0:


					$('#msg_upImg_box').hide();
					$('#imgDel').hide();
					$('#textInput').show().val('');

					$('#msgUploadImg').remove();
					$('<input type="file" name="imgFile" id="msgUploadImg" data="2" accept="image/jpeg,image/gif,image/x-png" title=" " >').appendTo('.chat_upImg');

					$('#msg_upImg_box').find('img').remove();

					var msg = {
						receiver : _this.uid,
						content : data.key,
						type : 2,
						dayfirst: null
					};

					//var dayFirstCk = $(_this.$chatBox[0]).find('li').last().find('small').html().split('-').length;
					//if(dayFirstCk > 1){
					//	msg.dayfirst = 1;
					//};

					//增加慕课女神时间戳判断  yangmy 2014-04-09
					var dayFirstCk =  $(_this.$chatBox[0]).find('li').last().find('small').html();
					if(dayFirstCk){
						if(dayFirstCk.split('-').length > 1){
							msg.dayfirst = 1;
						};
					}else{
						msg.dayfirst = 1;
					}



					$.chatListener.send('chat', msg);	//发送到服务器

					$.extend(msg, {id:1, sender:uinfo.uid, receiver:this.uid, sendtime:$.time(), status:1} );

					$.extend(msg, {lastmsg:'<img src="http://img.mukewang.com/' + msg.content + '-30-30.jpg" />'});

					$.container.refreshRelate(msg);

					$('#upLoadForm').attr('action','/message/upload?' + new Date().getTime());
					loadFlag = 1;

				break;
				case 1:
					alert('上传失败，请稍后再试!');
				break;
			}

			}

		});


	}

	//标记当前会话的未读消息为已读
	this.markUnread = function() {
		if (this.unread > 0) {
			$.chatListener.send('haveread', {uid:this.uid});
		}
	}

	//激活当前的会话窗口
	this.active = function() {
        this.$panel.find('.userchatUl').hide();
		$.chatInput.active();
		this.show();
	}

	//获取用户名称链接
	this.userlink = function(uid, name) {
		return '<a target="_blank" href="/space/u/uid/'+uid+'">'+name+'</a>';
	}

	//图标头像链接
	this.headicon = function(uid) {
		var head = uid == this.uid ? this.head : uinfo.head;
		return '<a target="_blank" href="/space/u/uid/'+uid+'"><img width="40" height="40" class="img_border_one" src="'+head+'"></a>';
	}

	//显示当前聊天窗口
	this.show = function() {
		var _this = this;
		_this.$chatBox.show();
		_this.$panel.scrollTop(999999);

		/*function showSlow(){
			_this.$chatBox.css('opacity','1');
			//_this.$chatBox.css('filter','alpha(opacity=100)');
		}
		setTimeout(showSlow(),2000);*/
	}

	//隐藏当前聊天窗口
	this.hide = function() {
		this.$chatBox.hide();
	}

	//是否是好友
	this.isFriend = function() {
		if(this.isfriend){
			return true;
		}
		if(uinfo.uid==msgConfig.vipUser){
			this.isfriend = true;
			return true;
		}
		for(var i = 0; i < $.container.friends.length; i++) {
			if ($.container.friends[i].uid == this.uid) {
				this.isfriend = true;
				return true;
			}
		}
		return false;
	}
}

//获取当前时间
$.time = function(){
	return Math.floor((new Date()).valueOf()/1000);
}

//获取智能的格式化时间
$.datetime = function(time) {
	var date = new Date(time*1000);
	var today = new Date();
	if (date.imoocFormatDate('yyyy-MM-dd') == today.imoocFormatDate('yyyy-MM-dd')) {
		return date.imoocFormatDate('hh:mm');
		/*return date.format('hh:mm:ss'); 二期修改前*/
	}
	return date.imoocFormatDate();
}

//扩展日期格式化方法
Date.prototype.imoocFormatDate = function(format) {
	format = (!format) ? 'yyyy-MM-dd hh:mm' : format;
	/*format = (!format) ? 'yyyy-MM-dd hh:mm:ss' : format; 二期修改前*/
	var o = {
		"M+" : this.getMonth() + 1,
		"d+" : this.getDate(),
		"h+" : this.getHours(),
		"m+" : this.getMinutes(),
		"s+" : this.getSeconds()
	}

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "") . substr(4 - RegExp.$1.length));
	}

	for ( var k in o ) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
}

//进行必要的初始化
//$.debug.log('chat started');
$.container.init();
$.chatListener.init();
$.chatInput.init();
$.chatImgView('chatPhoto');

var intH_t = $('#chat_content').height(),
	intH_b = $('#chat_editor').height(),
	intH_e = $('#textInput').height(),intS=1,cHight = 100;

$(document).delegate('.chat_ed_exp','click',function(){
	switch (intS) {
		case 1:
			$('#chat_editor').height(intH_b + cHight);
			$('#chat_content').height(intH_t - cHight);
			$('#textInput').height(intH_e + cHight);
			intS = 2;
		break;
		case 2:
			$('#chat_editor').height(intH_b);
			$('#chat_content').height(intH_t);
			$('#textInput').height(intH_e);
			intS = 1;
		break;
	}
})

function imagepreview(file, view, call) {

	var maxHeight = $(view).height(),
		maxWidth = $(view).width(),
		doc = document;

	function setsize(info, img){
		var iwidth, iheight;

		/*
		if((info.width / maxWidth) > (info.height / maxHeight)){
			iwidth =  maxWidth;
			iheight = Math.round(iwidth * info.height / info.width);
		} else {
			iheight = maxHeight;
			iwidth = Math.round(iheight * info.width / info.height);
		}
		*/

		iheight = maxHeight;
		iwidth = Math.round(iheight * info.width / info.height);

		with(view.style){
			height = iheight + "px";
			//width = iwidth + "px";
			overflow = "hidden";
		}

		if(img){

			with(img.style){
				height = width = "100%";
			}

			/*
			view.innerHTML = "";
			view.appendChild(img);
			*/

			view.innerHTML = '<img id="tempViewImg" src="' + img.src + '" />';
			$('#msgUploadImg').css('display','none');
			$('.chat_upImg').addClass('chat_upImg_ac');
			$('#msg_upImg_box').show();



			if($('#msg_upImg_box img').width() > 332){
				$('#imgDel').css({'position':'absolute','top':'0','left':'322px'}).show();
			}else{
				$('#imgDel').css({'position':'absolute','top':'0','left':$('#msg_upImg_box img').width()-10}).show();
			};
			$('#textInput').hide();

		}

	}

	try{
		new FileReader();
		file.addEventListener("change", function(e){

			var image = this.files[0];
			function fireError(){
				var evObj = doc.createEvent('Events');
				evObj.initEvent( 'error', true, false );
				file.dispatchEvent(evObj);
				file.value = "";
			}
			if(!/^image\//.test(image.type)){
				e.stopPropagation();
				e.preventDefault();
				fireError();
				alert('请上传正确的图片文件');
				return false;
			}
			var reader = new FileReader(),
				img = new Image();
			reader.onerror = img.onerror = fireError;
			img.onload = function(){
				var info = {
					height: img.height,
					width: img.width,
					name: image.name,
					size: image.size
				};
				if( call(info) !== false ){
					setsize(info, img);
				}
				img.onload = img.onerror = null;
			}
			reader.onload = function (){
				img.src = reader.result;

			}
			reader.readAsDataURL(image);
		}, false);
	}catch(ex){
		file.attachEvent("onchange", function() {


			var path = file.value;

			file.select();
			file.blur();

			path = doc.selection.createRange().text;

			view.innerHTML = '<img id="tempViewImg" src="' + path + '" />';

/*			//to be continue

			var path = file.value,
				tt = doc.createElement("div"),
				name = path.slice(path.lastIndexOf("\\") + 1 );

			if("XMLHttpRequest" in window){
				file.select();
				file.blur();
				path = doc.selection.createRange().text;
				doc.selection.empty();
			}

			function imgloader (mode){
				return "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='" + mode + "',src='" + path + "')";
			}

			document.getElementById('msg_upImg_box').appendChild(tt);

			with(tt.runtimeStyle){
				filter = imgloader("image");
				zoom = width = height = 1;
				position = "absolute";
				right = "9999em";
				top = "-9999em";
				border = 0;
			}

			alert(tt.runtimeStyle.filter);

			var info = {
				height: tt.offsetHeight,
				width: tt.offsetWidth,
				name: name
			};

			if( info.height > 1 || info.width > 1 ){
				if(call(info) !== false ){
					view.style.filter = imgloader("scale");
					setsize(info);
				}
			} else {
				file.fireEvent("onerror");
				event.cancelBubble = true;
				event.returnValue = false;
				this.value = "";
			}
			tt.parentNode.removeChild(tt);

			*/



			$('#msg_upImg_box').show();
			$('#imgDel').css({'position':'absolute','top':'0','left':$('#msg_upImg_box img').width()-10}).show();
			$('#textInput').hide();

			$('#msgUploadImg').css('display','none');


		})

	}

}
/*$(document).delegate('#msgUploadImg','mouseover',function(){
$('.chat_upImg').addClass('chat_upImg_ac');
})
$(document).delegate('#msgUploadImg','mouseout',function(){
$('.chat_upImg').addClass('chat_upImg_ac');
})*/
$(document).delegate('#msgUploadImg','click',function(){

		var obj = document.getElementById('msgUploadImg') ;
		//obj.outerHTML=obj.outerHTML;

		imagepreview(obj, document.getElementById("msg_upImg_box"), function(info){});
})

$(document).ready(function(){
    $('#textInput').textareaHeightAuto();
    $('#J_Btn').on('click', function(){
		$('#textInput').val('');
        $('#textInput').textareaHeightAuto('destroy');
		$('#textInput').textareaHeightAuto();

    });
});
});
