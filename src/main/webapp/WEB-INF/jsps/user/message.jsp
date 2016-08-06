<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>消息-微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/message.css" />
		
		<style type="text/css">
			html, body { width: 100%;height: 100%;overflow: auto; }
			#main { padding:40px 0 0;min-height:700px;}
			@media screen and (-moz-images-in-menus:0) { #main { min-height:690px;} }
			@media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution: .001dpcm) { #main { min-height:740px;} }
			/*框架css*/
			div { zoom: 1 }
			div:after { content: '\20'; display: block; clear: both }
			.container { width: 1200px; background: url(<%=request.getContextPath() %>/resources/images/msgbg.jpg) no-repeat; position: relative }
			#list_waper { margin: 0 }
			#left_panel { width: 400px; border: 0; background: none }
			#left_panel_nav { border: 0; float: left; margin: 0; width: 80px; }
			#left_panel_nav li { float: none; width: 80px; height: 70px; }
			#left_panel_nav li a { width: 80px; height: 70px; background: url(<%=request.getContextPath() %>/resources/images/msg2_lnav_icon.png) no-repeat; }
			#left_panel_nav li#msg_new a, #left_panel_nav li#msg_new a:hover { background-position: 0 -70px; }
			#left_panel_nav li#msg_new a.active { background-color: #464A4D; background-position: -80px -70px; }
			#left_panel_nav li#msg_friends a { background-position: 0 0; }
			#left_panel_nav li#msg_friends a.active { background-color: #464A4D; background-position: -80px 0; }
			.left_panel_content { width: 320px; float: right; /*filter:alpha(opacity=50);opacity:0.5;*/ }
			.theLastMsg { width: 215px; padding: 0; color: #1F2427; height:27px; line-height:25px; }
			@media screen and (-moz-images-in-menus:0) { .theLastMsg { height: 25px;line-height:25px; } }
			@media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution: .001dpcm) { .theLastMsg { height: 25px;line-height:25px; } }
			#lastChat .theLastMsg img { border-radius: 0; border: 0; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; float: left;width:20px;height:20px;margin-top:4px; }
			#lastChat li { margin-bottom: 0 }
			.user_list li { height: 40px; border-bottom: 1px solid #A59D9A; color: #1F2427 }
			.user_list li.active { background: #D5D7D6 }
			.user_list li .info { width: 215px; height: 44px; overflow: hidden; }
			.user_list li h5 { height: 22px; }
			.user_list .msg-close{display:block;width:16px;height:16px;position: absolute;top:30px;right:7px;background:url(<%=request.getContextPath() %>/resources/images/msg_close.png) -70px 0 no-repeat;}
			.user_list li:hover .msg-close{background:url(<%=request.getContextPath() %>/resources/images/msg_close.png) 0 0 no-repeat;}
			.user_list li:hover .msg-close:hover{background:url(<%=request.getContextPath() %>/resources/images/msg_close.png) 0 -16px no-repeat;}
			@media screen and (-moz-images-in-menus:0) { .user_list li h5 { height: 21px; } }
			@media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution: .001dpcm) { .user_list li h5 { height: 21px; } }
			.user_list li img { border-radius: 22px; border: 2px solid #FFF; -moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; }
			#chat_container { width: 800px; border: none; background: none; min-height:341px;overflow:hidden }
			#lastChat li .unread_num { left: 45px; top: 6px; }
			#msg_new a .unread_num { display: block; left: 43px; top: 10px; background: #c9394a; color: #FFFFFF; display: inline-block; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 15px; font-weight: 100; height: 20px; line-height: 20px; padding: 0 6px; position: absolute; vertical-align: baseline; white-space: nowrap; }
			/*错误信息提示*/
			#editor_msg { position: absolute;top:50%;left:50%; border: 3px solid #FFF; background: #C35762; padding: 10px 20px; color: #FFF; font-size: 18px; -moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; }
			/*消息区css*/
			.time { background: none; color: #919496; text-shadow: none; padding: 8px 0 }
			.chat_avata img { border-radius: 22px; border: 2px solid #FFF; -moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; }
			.a_msg_info pre,.me.system .a_msg_info pre { -moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; color: #1F2427; min-height: 28px; margin-bottom: 10px; padding: 8px 15px; }
			
			.you .a_msg_info,.me.system .a_msg_info { background: none;-moz-box-shadow:none; -webkit-box-shadow:none; box-shadow:none; }
			.me .a_msg_info { background: none; }
			.a_msg_info img { cursor:url(http://www.imooc.com/static/img/zbig.cur),url(http://www.imooc.com/static/img/zbig.cur),auto!important;; }
			.you .a_msg_info img.chatPhoto { float: none; margin:0;border:0 }
			.me .a_msg_info img.chatPhoto { float: none; margin:0;border:0 }
			.you .a_msg_info span.chat_ph { width:150px;height:150px;display:block;border: 4px solid #DEEDFF; float: left; margin-bottom: 10px; margin-right: 10px;-moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; }
			.me .a_msg_info span.chat_ph { width:150px;height:150px;display:block;border: 4px solid #FFF; float: right; margin-bottom: 10px; margin-left: 10px;-moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999;  }
			.you .a_msg_info pre,.me.system .a_msg_info pre { background: #DEEDFF }
			.me .a_msg_info pre { background: #FFF; }
			
			.you .time { float: left }
			.me .time { float: right }
			.you .arrow_left_b, .you.system .arrow_left_b { border: 6px solid #DEEDFF; border-color: transparent #DEEDFF transparent transparent; border-style: dashed solid dashed dashed; top: 16px; }
			.me .arrow_left_b { border: 6px solid #FFF; border-color: transparent transparent transparent #FFF; border-style: dashed dashed dashed solid; top: 16px; }
			.me.system .arrow_left_b { border: 6px solid #DEEDFF;border-color: transparent transparent transparent #DEEDFF; border-style: dashed dashed dashed solid; top: 16px; }
			#chat_content { margin: 0 }
			#chat_content .timeLine { border: 0; text-align: center; background: url(data:image/gif;base64,R0lGODlhTgIBANUAAL+9vr69u729vb+9wL68vby8vLy8vrm9wLu7vbq8u7q7v7u8vr27vLi8v7i8vbq7vbm6vri6ubm5ubm5u7m6vLa6u7i5u7i3vLS4u7e4urW2urO3urS3vLa2uLa3ubW2uLW1t7O1tLG1trS1t7OztbO0tv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEHACYALAAAAABOAgEAAAaAQI1wSCwaj0eMMsNsOp8ZinRKpSyu2Kz2+uh6v18o80P+jM7odGPNbrvfjrg8Dq7bvdqCfs/v+wsEgYKBAIWGAIOJg4eHAY6OJpGSk5SVlpeYmZqbnJ2emUqhoqOkpaanGBuqq6tIrq+wRaFiGbG2r7O0YlW8W75Zd3W0ZWZpaEEAOw==) no-repeat center center; }
			#chat_content .timeLine strong {  }
			.upLayer { border: 5px solid #FFF; overflow: visible }
			.close_upLyr { border: 2px solid #FFF; border-radius: 22px; top: -20px; right: -20px; }
			/*输入区域*/
			#chat_editor { background: none; border-top: 1px solid #AEAEAC; padding: 0; visibility: visible; display: none; height: 70px; position: absolute; bottom: 0; right: 21px;width:760px; }
			.chatSend.btn-green { background-color: #03B81B; padding: 1px 40px;margin:0 0 0 10px; }
			@media all and (-moz-images-in-menus:0) and (min-resolution: .001dpcm) {  .chatSend.btn-green { margin-top: 4px; } }
			@media screen and (min-width:0\0) { .chatSend.btn-green { margin-top: 8px; } }
			#chat_editor table td, #chat_editor table th { vertical-align: middle }
			#chat_editor table { margin: 0 auto 0; padding: 5px 0 10px; }
			.chatInput { width: 455px; border: 1px solid #8A8A8A; background: #f8f8f8; height: 28px; padding: 5px; font: 14px/1.2em Helvetica, "微软雅黑", "黑体", Arial, Tahoma;overflow:hidden }
			#sendEmojiIcon { width: 38px; height: 38px; background-repeat: no-repeat; background-image: url(<%=request.getContextPath() %>/resources/images/msg2_icon_fp.png); background-position: 3px 3px; display: block; cursor: pointer; text-indent: -100%; overflow: hidden; margin: 0; }
			#sendEmojiIcon.sendEmojiIcon_ac { background-position: -81px 3px; }
			.chat_upImg { position: relative; background: none; width: 38px; height: 38px; background-repeat: no-repeat; background-image: url(<%=request.getContextPath() %>/resources/images/msg2_icon_fp.png); background-position: 3px -40px; margin: 0 30px; }
			.chat_upImg_ac { background-position: -81px -40px; }
			#msgUploadImg { position: absolute; top: 0; left: 0; width: 32px; height: 32px; filter: alpha(opacity=0); opacity: 0; cursor: pointer }
			/*加好友消息框*/
			.act_btn { padding-top: 10px; }
			.act_btn button.btn { padding: 0 44px; margin: 0 0 0 15px;width: auto; background-color: #03B81B }
			a.btn.btn-blue { text-decoration: none; background-color: #2EA7E0; }
			.system .a_msg_info { background: #DEEDFF; width: auto; -moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; margin-bottom: 10px; }
			.system .a_msg_info pre.comInfo { border-bottom: 1px solid #B3BBBE; margin: 0 15px 5px; padding: 0 }
			.system .a_msg_info p { padding: 0 15px;  color: #090D0C }
			
			.system .a_msg_info p strong { font-size: 25px; padding-top: 10px; display: block; }
			.system .a_msg_info pre { margin: 0; padding: 0 15px; color: #7E878C;  -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; background: none }
			.you.system .a_msg_info { background: #DEEDFF; }
			.you.system .a_msg_info pre{  color: #1F2427;  margin-bottom: 10px; padding: 8px 15px 0; }
			
			.you.system .a_msg_info pre.comInfo { padding:5px 0;color: #7E878C;margin-bottom:5px; }
			/*表情*/
			.attach{ position:relative}
			#face_panel { background: #eae2df; border: 1px solid #9476519;  border-radius: 4px; bottom: -42px; box-shadow: none; left: 0px; margin-bottom: 80px; overflow-y: hidden; padding: 0; width: 595px; z-index: 999; position: absolute; height: 240px; }
			#choose_face a { border: 0; padding: 4px; height: 65px; color: #4D5558 }
			#choose_face a:hover { background: #E1DCD6; color: #4D5558 }
			#face_panel #choose_face { border-width: 0; width: 580px; margin: 10px auto 0 }
			#face_panel #choose_face a p { line-height: 8px; display: block; text-align: center }
			/*用户资料页*/
			.userinfo_layer { text-align: center; padding: 80px 20px; }
			.userinfo_layer p { color: #1F2427; font-size: 14px; line-height: 30px; }
			.userinfo_layer p.name { font-size: 20px; }
			.userinfo_layer p.sign { color: #4D5558; padding: 10px 0; word-break:break-all; word-wrap:break-word; }
			.userinfo_layer p.job { font-size: 16px; padding-top: 15px; }
			.userinfo_layer .headpic { float: none; display: block; }
			.userinfo_layer .headpic img { border-radius: 67px; border: 5px solid #FFF; -moz-box-shadow: 2px 2px 3px #999; -webkit-box-shadow: 2px 2px 3px #999; box-shadow: 2px 2px 3px #999; }
			.userinfo_layer .btn_area { padding: 10px 0 }
			.userinfo_layer a.btn-green { background-color: #03B81B; margin:0 10px; }
			.groupChar { padding:0 10px;color:#000;background:#7B787D; filter:alpha(opacity=30);opacity:0.3; }
			/*删除好友询问框*/
			.pop-layer{padding:45px 40px 40px;text-align: center;}
			.icon-point-revert{font-size: 60px;color: #d0d6d9;}
			.warning-pic{*background:url(<%=request.getContextPath() %>/resources/images/msg_warning.png) 80px 0 no-repeat;*height: 60px;}
			.remove-note{line-height: 28px;padding:15px 0 22px;}
			.pop-layer .btn-green{width:100px;margin-right:18px;}
			.btn-white:link,.btn-white:visited{width:98px;height: 38px;line-height: 38px;border:1px solid #98a1a6;color:#969b9e;}
			.btn-white:hover,.btn-white:active{background: #edf1f2;color:#787d82;}
			.cue{font-size: 14px;text-align: center;border-top: 1px solid #aeaeac;bottom: 0;height: 70px;line-height: 70px;padding: 0;position: absolute;right: 21px;visibility: visible;width: 760px;}
			.error-note{color:#be3948;font-size: 12px;padding-top:5px;}
			/*滚动条
			
			body { SCROLLBAR-ARROW-COLOR: #B6B6B6; SCROLLBAR-FACE-COLOR: #B6B6B6; SCROLLBAR-DARKSHADOW-COLOR: #B6B6B6; SCROLLBAR-HIGHLIGHT-COLOR: #B6B6B6; SCROLLBAR-3DLIGHT-COLOR: #B6B6B6; SCROLLBAR-SHADOW-COLOR: #B6B6B6; SCROLLBAR-TRACK-COLOR: #C6C1BE; }
			
			::-webkit-scrollbar { width:10px;height:10px }
			::-webkit-scrollbar-button:vertical { display:none }
			::-webkit-scrollbar-track:vertical { background-color:black }
			::-webkit-scrollbar-track-piece { background:#C6C1BE; }
			::-webkit-scrollbar-thumb:vertical { background-color:#B6B6B6;border-radius:0 }
			::-webkit-scrollbar-thumb:vertical:hover { background-color:#B6B6B6 }
			::-webkit-scrollbar-corner:vertical { background-color:#535353 }
			::-webkit-scrollbar-resizer:vertical { background-color:#FF6E00 }
			*/
			.msg-loading{ margin: 48px 0; text-align: center; }
			.msg-loading-icon{height: 52px;width:52px;margin:0 auto;background: url(/static/img/course/loading.gif) no-repeat center center;}
			#tempViewImg { max-height:52px;height:52px;height:expression(document.body.clientHeight>52"52px":"auto");overflow:hidden }
			#msg_upImg_box label { display:block;overflow:hidden}
			#msgUploadImg { position: absolute; top: 0px; left: 0px; width: 50px; height: 50px; opacity: 0; cursor: default; display: block; }
			#msg_upImg_box { max-width:400px;overflow:hidden }
			
		</style>
	</head>  
	
<body id="index">  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div id="main" style="min-height: 795px;">
		<div class="container clearfix">
		    <div id="left_panel">
		        <ul id="left_panel_nav">
		            <li id="msg_new"> <a class="active" href="#" title="最近"></a> </li>
		            <li id="msg_friends"> <a href="#" title="好友"></a></li>
		        </ul>
		        <div class="left_panel_content">
		            <div id="list_waper" style="height: 795px;">
		                <ul id="lastChat" class="user_list"><li id="lastChat10000" uid="10000" class="active"> 						<img src="http://img.mukewang.com/user/55668b080001803f01800180-40-40.jpg" alt="慕女神" width="40" height="40"> 				     	<div class="info"><h5>慕女神</h5><p class="theLastMsg">感谢~</p></div>			 		 </li></ul>
		                <ul id="friends" class="user_list" style="display:none"><li id="friends10000" uid="10000" data-group="M"> 								<img src="http://img.mukewang.com/user/55668b080001803f01800180-40-40.jpg" alt="慕女神" width="40" height="40"> 								<div class="info"><h5>慕女神</h5><p>我的私人秘书</p></div> 							</li></ul>
		            </div>
		        </div>
		    </div>
		    <div id="chat_container">
		        <div id="chat_content" style="height: 694px;"> <ul id="userchatUl10000" uid="10000" class="userchatUl" style=""><li><div class="timeLine"> <strong style="width:130px;">2015-09-10</strong></div> </li><li class="you "> 						<div class="chat_avata"><a target="_blank" href="/space/u/uid/10000"><img width="40" height="40" class="img_border_one" src="http://img.mukewang.com/user/55668b080001803f01800180-40-40.jpg"></a></div> 						<div class="a_msg_info" id="2948776"><pre>Hi，亲爱的hadoop_tiger，欢迎你来到慕课网，如果你在学习的过程中有任何建议或问题，可以发消息给我！</pre><i class="arrow_left_b"></i></div> 						<small class="time">2015-09-10 10:47</small> 					</li><li class="me "> 						<div class="chat_avata"><a><img width="40" height="40" class="img_border_one" src="http://img.mukewang.com/user/55f0f52b000111b419201200-80-80.jpg"></a></div> 						<div class="a_msg_info" id="2948787"><pre>感谢~</pre><i class="arrow_left_b"></i></div> 						<small class="time">2015-09-10 10:49</small> 					</li></ul></div>
		        <div id="chat_editor" style="display: block;">
		            <form method="post" action="/message/upload?1442062886088" enctype="multipart/form-data" id="upLoadForm" target="imageFrame">
		                <table cellpadding="0" cellspacing="0">
		                    <tbody><tr>
		                        <th> <div class="attach"><a id="sendEmojiIcon" href="javascript:void(0)" onclick="return false" title="表情" style="margin-top:0">表情</a></div>
		                        </th>
		                        <th> <div class="chat_upImg" style="text-align:center">
		                                <input type="file" name="imgFile" id="msgUploadImg" accept="image/jpeg,image/gif,image/x-png" title="图片">
		                            </div>
		                        </th>
		                        <th> <div style="position:relative;width:490px;margin-top:8px;">
		                                <textarea class="chatInput" id="textInput" type="text" maxlength="300" style="height: 28px; overflow-y: hidden;"></textarea>
		                                <div id="msg_upImg_box" style="height:62px;display:none"></div>
		                                <span id="imgDel" style="display:none;width:10px;height:10px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKBAMAAAB/HNKOAAAAA3NCSVQICAjb4U/gAAAAHlBMVEXKytn////z8/bX1+PU1OD19fjb2+Xz8/f19fnZ2ePstdLlAAAACXBIWXMAAAsSAAALEgHS3X78AAAAHHRFWHRTb2Z0d2FyZQBBZG9iZSBGaXJld29ya3MgQ1M26LyyjAAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMS8yNS8xM7kML+MAAAAvSURBVAiZY2AVFBRUYlBTFBQyYhByF1RRZBAsUUoSZBAUMiiEk2ARiGwYWCVYFwDX5gdZj1qR8wAAAABJRU5ErkJggg==) no-repeat 0 0;"></span> </div>
		                        </th>
		                        <th> <a class="chatSend btn btn-large btn-green" href="javascript:;">发送</a> </th>
		                    </tr>
		                </tbody></table>
		            </form>
		            <iframe width="0" height="0" id="imageFrame" name="imageFrame" frameborder="0" scrolling="no"></iframe>
		        </div>
		    </div>
		    <div id="editor_msg"></div>
		</div>
	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
	 
</body>  
</html>