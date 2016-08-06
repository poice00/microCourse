<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>各种叨逼叨-微课程</title>
<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/video.css">

<script>
	/*学习页通用配置*/
	var GC = {
		course : {
			id : 486,
			name : 'IOS基础教程之界面初体验',
			pic : 'http://img.mukewang.com/55ea64dc0001197b06000338-240-135.jpg',
			video_url : ''
		},
		classmates : 20
	// 你的同学一页显示数量
	};
</script>
<script>
  function AjaxGetData() {
		var content = $("#js-pl-textarea").val();
		var sectionId = 1;
		alert(content);
		$.ajax({
			url : "/microCourse/course/videoCommentAddAjax",
			type : "post",
			data : "sectionId=1" + "&content=" + content,
			success : function(response) {
				alert("发布成功");
				$("#js-pl-textarea").val("");
				$("#plLoadList").html(response);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest);
				alert(textStatus);
				alert(errorThrown);
			}
		});
	}
  function AjaxGetWendaData() {
		var sectionId = 1;
		$.ajax({
			url : "/microCourse/course/videoCommentAjax",
			type : "post",
			data : "sectionId=1" + "&content=" + content,
			success : function(response) {
				alert("发布成功");
				$("#js-pl-textarea").val("");
				$("#plLoadList").html(response);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest);
				alert(textStatus);
				alert(errorThrown);
			}
		});
	}
  function AjaxGetNoteData() {
		var content = $("#js-pl-textarea").val();
		var sectionId = 1;
		alert(content);
		$.ajax({
			url : "/microCourse/course/videoCommentAddAjax",
			type : "post",
			data : "sectionId=1" + "&content=" + content,
			success : function(response) {
				alert("发布成功");
				$("#js-pl-textarea").val("");
				$("#plLoadList").html(response);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest);
				alert(textStatus);
				alert(errorThrown);
			}
		});
	}
</script>

<script type="text/javascript">

 window.onload=function(){
	var sectionId=${section.sectionId}
	var myVid=document.getElementById("video-player");
	myVid.currentTime=${lastPlayTime};
	myVid.play();
	myVid.addEventListener("ended", function()
	  {
		var experience=${section.experience}
		var sectionId=${section.sectionId}
		$.ajax({
	    	 type : "post",
	 		 url : "/microCourse/course/videoComplete",
	 		 data : {
	 			experience:experience,
	 			sectionId:sectionId
	 		},
				success : function(data) {

	                alert("学习完毕，经验值+"+data+"!");
				   }
				});
	  }
	);
}  
function vidplay() {
    var video = document.getElementById("video-player");
    var button = document.getElementById("play");
    if (video.paused) {
       video.play();
       button.textContent = "暂停";
    } else {
       video.pause();
       button.textContent = "播放";
    }
 }

 function restart() {
     var video = document.getElementById("video-player");
     video.currentTime = 0;
     video.play();
     var button = document.getElementById("play");
     button.textContent = "播放";
 }
 
 function skip(value) {
     var video = document.getElementById("video-player");
     video.currentTime += value;
 } 
 window.onbeforeunload = screen;
 function screen() {
     var video = document.getElementById("video-player");
     video.pause();
     var vTime = video.currentTime;
     var userId=${currentUser.userId};
     var sectionId=${section.sectionId};
	 var userId=${currentUser.userId};
     $.ajax({
    	 type : "post",
 		 url : "/microCourse/course/videoClose",
 		 async : false, 
 		 data : {
 			userId:userId,
 			sectionId:sectionId,
 			currentTime:vTime
 		},
			success : function(data) {
			   }
			}); 
 }
 function commentView() {
	 //var plMenu=document.getElementById("plMenu");
	 $("#CommentMenu").addClass("active");
	 $("#WendaMenu").removeClass("active");
	 $("#notegoodMenu").removeClass("active");
	 var sectionId = 1;
	 document.getElementById("pl-content").style.display="block";
	 document.getElementById("note-content").style.display="none";
	 document.getElementById("qa-content").style.display="none";
		$.ajax({
			url : "/microCourse/course/videoCommentView",
			type : "post",
			data : "sectionId=1",
			success : function(response) {
				$("#qaLoadListData").html(response);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest);
				alert(textStatus);
				alert(errorThrown);
			}
		}); 
 }
 function wendaView() {
	 //var plMenu=document.getElementById("plMenu");
	 $("#WendaMenu").addClass("active");
	 $("#CommentMenu").removeClass("active");
	 $("#notegoodMenu").removeClass("active");
	 var sectionId = 1;
	 document.getElementById("pl-content").style.display="none";
	 document.getElementById("note-content").style.display="none";
	 document.getElementById("qa-content").style.display="block";
		$.ajax({
			url : "/microCourse/course/videoWendaView",
			type : "post",
			data : "sectionId=1",
			success : function(response) {
				$("#qaLoadListData").html(response);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest);
				alert(textStatus);
				alert(errorThrown);
			}
		});
	}
 function noteView() {
	 $("#notegoodMenu").addClass("active");
	 $("#WendaMenu").removeClass("active");
	 $("#CommentMenu").removeClass("active");
	 var sectionId = ${section.sectionId};
	 document.getElementById("pl-content").style.display="none";
	 document.getElementById("qa-content").style.display="none";
	 document.getElementById("note-content").style.display="block";
	 $.ajax({
			url : "/microCourse/course/videoNoteView",
			type : "post",
			data : {
				sectionId:sectionId
			},
			success : function(response) {
				$("#noteLoadListData").html(response);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest);
				alert(textStatus);
				alert(errorThrown);
			}
		});
 };
 function chapterView() {
	 var width=document.getElementById("section-list").style.right;
	 if(width=="0px"){
		 document.getElementById("section-list").style.right="-360px";
		 document.getElementById("video-view").style.width="100%";
	 }else
		 {
		 document.getElementById("section-list").style.right="0px";
		 document.getElementById("video-view").style.width="887px";
     }
 };
 function notesTanchu() {
	 var myvid=document.getElementById("video-player");
	 myvid.pause();
	 document.getElementById("js-note-textarea").value="";
	 document.getElementById("note-publist").style.display="block";
 };
 function note_publist_close() {
	 document.getElementById("note-publist").style.display="none";
	 var myvid=document.getElementById("video-player");
	 myvid.play();
 };
 
 function screenshotOn() {
	 var sc=document.getElementById("screen_btn").className;
	 if(sc.indexOf("on")>0){
		 $("#screen_btn").removeClass("on");
	 }else
		 {
		 $("#screen_btn").addClass("on");
	 }
 };
 
  function notesAdd() {
	 var sectionId=${section.sectionId};
	 var sc=document.getElementById("screen_btn").className;
	 if(sc.indexOf("on")>0){
		 var video = document.getElementById("video-player");
	     var canvas = document.createElement("canvas");
	     var ctx = canvas.getContext('2d');
	     canvas.width = video.videoWidth;
	     canvas.height = video.videoHeight;
	     ctx.drawImage(video, 0, 0, canvas.width, canvas.height);  // 将video中的数据绘制到canvas里
	     var img = new Image;
	     var videoTime=video.currentTime;
	     //img.crossOrigin = "Anonymous";
	     img.crossOrigin = "*";
	     var data= canvas.toDataURL("png");
	     var b64 = data.substring(22);
	 }else
		 {
		 var b64="";
		 var videoTime=0;
		 }
	 var checkbox = document.getElementById("js-isshare");//
	 if(checkbox.checked){
		    var type=1;
		  }else{
		     var type=0;
	 } 
	 var content=$("#js-note-textarea").val();
     $.ajax({
    	 type : "post",
 		 url : "/microCourse/course/videoNoteAdd",
 		 data : {
 			img : b64,
 			sectionId:sectionId,
 			content:content,
 			type:type,
 			videoTime:videoTime
 		},
			success : function(data, textStatus) {
				note_publist_close();
                alert("发布成功！");
			   }
			});
 };
 function discus_publish() {
	 var myvid=document.getElementById("video-player");
	 myvid.pause();
	 document.getElementById("js-question-textarea").value="";
	 document.getElementById("js-qa-title").value="";
	 document.getElementById("discus_publish").style.display="block";
 };
 function discus_publish_close() {
	 var myvid=document.getElementById("video-player");
	 myvid.play();
	 document.getElementById("discus_publish").style.display="none";
 };
 function questionScreenshotOn() {
	 var sc=document.getElementById("js_shot_video_screen_btn").className;
	 if(sc.indexOf("on")>0){
		 $("#js_shot_video_screen_btn").removeClass("on");
	 }else
		 {
		 $("#js_shot_video_screen_btn").addClass("on");
	 }
 };
 function questionAdd() {
	 var sectionId=${section.sectionId};
	 var sc=document.getElementById("js_shot_video_screen_btn").className;
	 if(sc.indexOf("on")>0){
		 var video = document.getElementById("video-player");
	     var canvas = document.createElement("canvas");
	     var ctx = canvas.getContext('2d');
	     canvas.width = video.videoWidth;
	     canvas.height = video.videoHeight;
	     ctx.drawImage(video, 0, 0, canvas.width, canvas.height);  // 将video中的数据绘制到canvas里
	     var img = new Image;
	     //img.crossOrigin = "Anonymous";
	     img.crossOrigin = "*";
	     var data= canvas.toDataURL("png");
	     var b64 = data.substring(22);
	     var videoTime=video.currentTime;
	 }else
		 {
		 var b64="";
		 var videoTime=0;
		 }
	 var title = $("#js-qa-title").val();
	 var content=$("#js-question-textarea").val();
     $.ajax({
    	 type : "post",
 		 url : "/microCourse/course/videoWendaAdd",
 		 data : {
 			img : b64,
 			sectionId:sectionId,
 			content:content,
 			title:title,
 			videoTime:videoTime
 		},
			success : function(data, textStatus) {
				discus_publish_close();
                alert("发布成功！");
			   }
			});
 };
</script>
<%-- <script charset="utf-8" async="" src="<%=request.getContextPath()%>/resources/js/guideLayer.js"></script>
 --%>
</head>
<body onunload="leaves()">


	<!--导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/study_header.jsp"></jsp:include>

	<div id="studyMain">

		<div class="next-box J_next-box hide" id="divcomplete">
			<div class="next-box-inner">
				<div class="course-tip-layer J-next-course">
					<c:choose>
						<c:when test="${status eq 'haveNext' }">
							<h2>
								<a href="/microCourse/course/video/${nextSection.sectionId }"
									class="">${nextSection.name }:${nextSection.description }</a> <span
									class="course-duration"> ${nextSection.duration }</span>
							</h2>
							<a href="/microCourse/course/video/${section.sectionId }"
								class="">重新观看</a>
						</c:when>
						<c:otherwise>
							<h2>恭喜你学习完了最后一个章节~</h2>
							<a href="/video/1459/0" class="review-course">重新观看</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>


		<div style="width: 100%; height: 816px;" id="video-view">
			<video id="video-player" controls="controls" preload="preload"
				poster="<%=request.getContextPath()%>/resources/video/videoload.png"
				style="width: 100%; height: 816px;"
				src="<%=request.getContextPath()%>/${section.videoPath}"
				x-webkit-airplay="allow"></video>
		</div>

		<!--此处结构为练习题，视频，编程公用的侧栏-->
		<div class="section-list" id="section-list" style="right: -360px;">
			<div class="operator">
				<div class="op chapter " onclick="chapterView()">
					<em class="icon-menu"></em>章节
				</div>
				<div class="op notes" id="notes-view" onclick="notesTanchu()">
					<em class="icon-note"></em>笔记
				</div>
				<div class="op question" onclick="discus_publish()">
					<em class="icon-addques"></em>提问
				</div>
			</div>
			<div class="nano has-scrollbar">
				<div class="nano-content" tabindex="0" style="right: -21px;">
					<h3>IOS基础教程之界面初体验...</h3>
					<ul>
						<li class="sec-title"><span>第1章 大V有话说</span></li>
						<li data-id="9552"><a href="/video/9552"><em
								class="icon-video"></em>1-1 各种叨逼叨(04:47)</a> <i class="">正在学 <em
								class="icon-clock"></em>
						</i></li>
					</ul>
					<ul>
						<li class="sec-title"><span>第2章 UIWindow－界面来了</span></li>
						<li data-id="9553"><a href="/video/9553"><em
								class="icon-video"></em>2-1 UIWindow1(08:40)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9554"><a href="/video/9554"><em
								class="icon-video"></em>2-2 UIWindow2(06:30)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
					</ul>
					<ul>
						<li class="sec-title"><span>第3章 UIView－所有控件的载体</span></li>
						<li data-id="9555"><a href="/video/9555"><em
								class="icon-video"></em>3-1 UIView-1(08:59)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9556"><a href="/video/9556"><em
								class="icon-video"></em>3-2 UIView-2(08:39)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9557"><a href="/video/9557"><em
								class="icon-video"></em>3-3 UIView-3(05:53)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9569"><a href="/video/9569"><em
								class="icon-video"></em>3-4 UIView-4(13:06)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9570"><a href="/video/9570"><em
								class="icon-video"></em>3-5 UIView-5(09:10)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9571"><a href="/video/9571"><em
								class="icon-video"></em>3-6 UIView-6(09:03)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
					</ul>
					<ul>
						<li class="sec-title"><span>第4章 UILable－千变万幻的文字...</span></li>
						<li data-id="9558"><a href="/video/9558"><em
								class="icon-video"></em>4-1 UILabel-1(10:07)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9559"><a href="/video/9559"><em
								class="icon-video"></em>4-2 UILabel-2(13:20)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
						<li data-id="9560"><a href="/video/9560"><em
								class="icon-video"></em>4-3 UILabel-3(06:21)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
					</ul>
					<ul>
						<li class="sec-title"><span>第5章
								UIImageView-iOS显示图片的利器...</span></li>
						<li data-id="9561"><a href="/video/9561"><em
								class="icon-video"></em>5-1 UIImageView-1加载...(10:37)</a> <i
							class=""> <em class="icon-nolearn"></em>
						</i></li>
						<li data-id="9562"><a href="/video/9562"><em
								class="icon-video"></em>5-2 UIImageView-2内容...(05:09)</a> <i
							class=""> <em class="icon-nolearn"></em>
						</i></li>
						<li data-id="9563"><a href="/video/9563"><em
								class="icon-video"></em>5-3 UIImageView-3(08:36)</a> <i class="">
								<em class="icon-nolearn"></em>
						</i></li>
					</ul>
					<ul>
						<li class="sec-title"><span>第6章 总结和预告</span></li>
						<li data-id="9568"><a href="/video/9568"><em
								class="icon-video"></em>6-1 总结(02:59)</a> <i class=""> <em
								class="icon-nolearn"></em>
						</i></li>
					</ul>

				</div>
				<div class="nano-pane">
					<div class="nano-slider"
						style="height: 635px; -webkit-transform: translate(0, 0px);"></div>
				</div>
			</div>
		</div>

		<div class="maybe-wenda" id="maybe-wenda" style="display: none;">
			<i class="icon-chat"></i>
			<p class="text">
				你发的评论可能会是问题？<br>是否将他发到问答中
			</p>
			<input class="btn ok" type="button" value="好的" id="wenda-ok">
			<input class="btn no" type="button" value="不用" id="wenda-no">
		</div>


		<div id="buttonbar" align="center">
			<button id="jietu" onclick="screen()">截图</button>
			<button id="restart" onclick="restart();">回到开头</button>
			<button id="rew" onclick="skip(-10)">后退</button>
			<button id="play" onclick="vidplay()">暂停</button>
			<button id="fastFwd" onclick="skip(10)">前进</button>
		</div>
		<div class="course-subcontainer ">
			<div class="course-left">
				<ul class="course_menu" style="position: absolute; left: 0px;">
					<li class=""><a href="javascript:;" onclick="commentView()"
						id="CommentMenu" class="active">评论</a></li>
					<li class=""><a href="javascript:;" onclick="wendaView()"
						id="WendaMenu" class="">问答</a></li>
					<li class=""><a href="javascript:;" onclick="noteView()"
						id="notegoodMenu" class="">笔记</a></li>
				</ul>

				<div id="disArea" class="lists-container list-wrap">
					<div id="pl-content" class="list-tab-con" style="">
						<div class="publish clearfix" id="discus-publish">
							<div class="publish-wrap publish-wrap-pl">
								<div class="pl-input-wrap">
									<div id="js-pl-input-fake" class="pl-input-inner">
										<textarea id="js-pl-textarea" class="js-placeholder"
											placeholder="扯淡、吐槽、表扬、鼓励……想说啥就说啥！"></textarea>
										<span class="num-limit"><span id="js-pl-limit">0</span>/300</span>
									</div>
									<div class="pl-input-btm input-btm clearfix">
										<div class="verify-code l"></div>
										<input type="button" id="js-pl-submit" class="r course-btn"
											onclick="AjaxGetData()" value="发表评论">
									</div>
								</div>

							</div>
						</div>
						<div id="plLoadList">
						<div class="pl-container">
						${commentstatus }
						</div>
						<div class="page pl-list-page"></div> 
						</div>
					</div>
					<div id="qa-content" class="list-tab-con" style="display: none;">
						<div id="qaLoadListData">
							
							<div class="page discuss-list-page"></div>
						</div>
					</div>
					<div id="note-content" class="list-tab-con" style="display: none;">
						<div id="noteLoadListData">
							
							<div class="page note-list-page"></div>
						</div>
					</div>
					<div id="mate-content" class="list-tab-con" style="display: none;">
						<div id="mateLoadListData">
							<div class="othterscode-container"></div>
							<div class="page othterscode-list-page"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="course-right clearfix">
				<div class="classmate fl">
					<h3>
						你的同学<span>1605人</span><a href="javascript:void(0);"
							class="js-ch-mate ch-classmate">换一批</a>
					</h3>
					<div class="users_wrap">
						<div id="js-class-mate" class="users clearfix">
							<a class="mate-avator" href="/space/u/uid/116578" target="_blank"><img
								src="http://img.mukewang.com/user/533e4d5b0001d57502200203-80-80.jpg"
								title="pocket"></a><a class="mate-avator"
								href="/space/u/uid/217986" target="_blank"><img
								src="http://img.mukewang.com/user/53b56a4e0001e54401800180-80-80.jpg"
								title="Rlim_林"></a><a class="mate-avator"
								href="/space/u/uid/221152" target="_blank"><img
								src="http://img.mukewang.com/user/53b8adef00010c5901800180-80-80.jpg"
								title="少无大志"></a><a class="mate-avator"
								href="/space/u/uid/234084" target="_blank"><img
								src="http://img.mukewang.com/user/53c6617d0001586c01000100-80-80.jpg"
								title="MrToms"></a><a class="mate-avator"
								href="/space/u/uid/327064" target="_blank"><img
								src="http://img.mukewang.com/user/541ae0ce000101d901800180-80-80.jpg"
								title="wtowto7207"></a><a class="mate-avator"
								href="/space/u/uid/337597" target="_blank"><img
								src="http://img.mukewang.com/user/5458676e0001af7702200220-80-80.jpg"
								title="千魔"></a><a class="mate-avator"
								href="/space/u/uid/437809" target="_blank"><img
								src="http://img.mukewang.com/user/533e4d510001c2ad02000200-80-80.jpg"
								title="reg8888"></a><a class="mate-avator"
								href="/space/u/uid/470854" target="_blank"><img
								src="http://img.mukewang.com/user/544a8b610001dde201800180-80-80.jpg"
								title="__Jolly__"></a><a class="mate-avator"
								href="/space/u/uid/471696" target="_blank"><img
								src="http://img.mukewang.com/user/544b2f510001e1e001000100-80-80.jpg"
								title="高山流水_0010"></a><a class="mate-avator"
								href="/space/u/uid/473625" target="_blank"><img
								src="http://img.mukewang.com/user/544c48740001467406400640-80-80.jpg"
								title="仲哒哒"></a><a class="mate-avator"
								href="/space/u/uid/483447" target="_blank"><img
								src="http://img.mukewang.com/user/545104840001314001000099-80-80.jpg"
								title="北城以北1991"></a><a class="mate-avator"
								href="/space/u/uid/1002602" target="_blank"><img
								src="http://img.mukewang.com/user/545b09ab000194a001800180-80-80.jpg"
								title="huaganshang"></a><a class="mate-avator"
								href="/space/u/uid/1004529" target="_blank"><img
								src="http://img.mukewang.com/user/533e51f30001edf702000200-80-80.jpg"
								title="西楼听雨"></a><a class="mate-avator"
								href="/space/u/uid/1019747" target="_blank"><img
								src="http://img.mukewang.com/user/54630d210001b75401000100-80-80.jpg"
								title="刻骨铭心的爱"></a><a class="mate-avator"
								href="/space/u/uid/1044818" target="_blank"><img
								src="http://img.mukewang.com/user/5333a08f0001700202000200-80-80.jpg"
								title="小二减一"></a><a class="mate-avator"
								href="/space/u/uid/1099019" target="_blank"><img
								src="http://img.mukewang.com/user/548a4a0c00010da400990100-80-80.jpg"
								title="心言"></a><a class="mate-avator"
								href="/space/u/uid/1109810" target="_blank"><img
								src="http://img.mukewang.com/user/545861f00001be3402200220-80-80.jpg"
								title="renwj0322"></a><a class="mate-avator"
								href="/space/u/uid/1115772" target="_blank"><img
								src="http://img.mukewang.com/user/549407320001b9cf01800180-80-80.jpg"
								title="HANSHI2014"></a><a class="mate-avator"
								href="/space/u/uid/1116518" target="_blank"><img
								src="http://img.mukewang.com/user/54584f540001558402200220-80-80.jpg"
								title="战神XT"></a><a class="mate-avator"
								href="/space/u/uid/1117467" target="_blank"><img
								src="http://img.mukewang.com/user/54934b5f0001d5c201800180-80-80.jpg"
								title="文茜茜茜"></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 笔记弹出框 -->
		<div class="publish clearfix note-pop" id="note-publist"
			style="display: none;">
			<div
				class="publish-wrap publish-wrap-note video-publish-note pop-con">
				<div class="pop-title">
					<h3>笔记</h3>
					<span class="icon-close" onclick="note_publist_close()"></span>
				</div>
				<div id="js-note-input-fake" class="textarea-wrap">
					<textarea data-maxlength="1000" id="js-note-textarea"
						class="js-placeholder" name="" placeholder="请输入笔记内容..."></textarea>
					<p class="note-text-counter">
						<span id="js-note-limit">0</span>/1000
					</p>
				</div>
				<div class="publish-note-btns input-btm clearfix pop-footer">
					<div class="verify-code clearfix"></div>
					<div title="截图" class="js-shot-video screen-btn" id="screen_btn"
						onclick="screenshotOn()" data-type="note">
						<span>截图</span>
					</div>
					<input type="button" title="发表" value="保存" id="js-note-submit"
						class="course-btn r" onclick="notesAdd()"> <label
						for="js-isshare" class="label-checked r"><input
						type="checkbox" checked="checked" id="js-isshare" class="checked">
						公开</label>
				</div>
			</div>
		</div>


		<!-- 提问弹出框 -->
		<div class="publish clearfix qa-pop" id="discus_publish" style="display: none;">
			<div
				class="publish-wrap publish-wrap-disucss video-publish-qa pop-con">
				<div class="pop-title">
					<h3>提问</h3>
					<span class="icon-close" onclick="discus_publish_close()"></span>
				</div>
				<div class="qa-control-wrap clearfix">
					<div class="question-area">
						<div class="qa-control qa-ipt-title">
							<input type="text" id="js-qa-title" maxlength="255"
								class=" js-placeholder autocomplete" placeholder="请输入问题标题">
						</div>
						<dl class="send-area-result">
						</dl>
					</div>
				</div>
				<div id="js-note-input-fake" class="textarea-wrap"
					style="margin-bottom: 20px;">
					<textarea style="height: 200px;" data-maxlength="1000"
						id="js-question-textarea" class="js-placeholder" name=""
						placeholder="请输入笔记内容..."></textarea>
					<p class="note-text-counter">
						<span id="js-note-limit">0</span>/1000
					</p>
				</div>
				<div title="截图" class="js-shot-video screen-btn on"
					id="js_shot_video_screen_btn" onclick="questionScreenshotOn()"
					data-type="qa">
					<span>截图</span>
				</div>
				<input id="js-discuss-submit" class="r course-btn" type="button"
					onclick="questionAdd()" value="发布">
			</div>
		</div>



		<div class="course-about">
			<div class="course-about-tit clearfix">
				<h3>学过该课的人还学过</h3>
				<span class="on">课程</span> <span>计划</span>
			</div>
			<ul class="con-wrap clearfix" style="display: block;">
				<li><a href="/view/9" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/529dc3380001379906000338.jpg"
						alt="HTML+CSS基础课程">
						<p>HTML+CSS基础课程</p>
				</a></li>
				<li><a href="/view/173" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/5481656e000147ef06000338.jpg"
						alt="使用Swift开发iOS8 App实战">
						<p>使用Swift开发iOS8 App实战</p>
				</a></li>
				<li><a href="/view/218" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/5450a1980001941606000338.jpg"
						alt="征战Objective-C">
						<p>征战Objective-C</p>
				</a></li>
				<li><a href="/view/420" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/557903f20001edda06000338.jpg"
						alt="iOS基础入门之Foundation框架初体验">
						<p>iOS基础入门之Foundation框架初体验</p>
				</a></li>
				<li><a href="/view/127" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/53966c2c00018bed06000338.jpg"
						alt="玩儿转Swift">
						<p>玩儿转Swift</p>
				</a></li>
			</ul>
			<ul class="con-wrap clearfix" style="display: none;">
				<li><a href="/course/programdetail/pid/39" class="img-box"
					target="_blank"> <img
						src="http://img.mukewang.com/559628bd00012a1502400180.jpg"
						alt="Swift加薪利器-iOS动画特辑">
						<p>Swift加薪利器-iOS动画特辑</p>
				</a></li>
			</ul>
		</div>
	</div>
	<%-- 	<!-- 学过该课的人还学过 -->
	<jsp:include page="/WEB-INF/jsps/common/other_learned.jsp"></jsp:include> --%>

	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>

	<script type="text/javascript">
		(function() {
			var imgPic = GC.course.pic
					|| 'http://img.mukewang.com/static/img/common/logo.png', text = '我正在#慕课网#学习一门很不错的课程【'
					+ GC.course.name + '】,如果想在IT技能上赶超我，快来挑战吧！', //节名称
			url = 'http://www.mukewang.com' + window.location.pathname;

			window._bd_share_config = {
				"common" : {
					"bdUrl" : url,
					"bdSnsKey" : {
						'tsina' : '2788596354'
					},
					"bdText" : text,
					"bdMini" : "2",
					"bdMiniList" : false,
					"bdPic" : imgPic,
					"bdStyle" : "0",
					"bdSize" : "16"
				},
				"share" : {}
			};
			with (document)
				0[(getElementsByTagName('head')[0] || body)
						.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
						+ ~(-new Date() / 36e5)];
		})();
	</script>
	<div class="mask"></div>


	<div style="display: none">
		<script type="text/javascript">
			var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
					: " http://");
			document
					.write(unescape("%3Cscript src='"
							+ _bdhmProtocol
							+ "hm.baidu.com/h.js%3Ff0cfcccd7b1393990c78efdeebff3968' type='text/javascript'%3E%3C/script%3E"));
			(function(d) {
				window.bd_cpro_rtid = "rHT4P1c";
				var s = d.createElement("script");
				s.type = "text/javascript";
				s.async = true;
				s.src = location.protocol + "//cpro.baidu.com/cpro/ui/rt.js";
				var s0 = d.getElementsByTagName("script")[0];
				s0.parentNode.insertBefore(s, s0);
			})(document);
		</script>
	</div>
</body>
</html>
