<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>${course.name }</title>
	<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/learn-less.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/course-commen.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/uediter.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/course-layer.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/course-wenda.css" />
<script>
	/*学习页通用配置*/
	var GC = {
	  course: {
	    id: 486,
	    name: 'IOS基础教程之界面初体验',
	    pic: 'http://img.mukewang.com/55ea64dc0001197b06000338-240-135.jpg',
	    video_url: ''
	  },
	  classmates: 20 // 你的同学一页显示数量
	};
	</script>

</head>
<body>

	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>

	<div id="main">


		<div class="course-infos">
			<div class="w pr">
				<div class="path">
					<a href="/course/list">课程</a> <i class="path-split">\</i><a
						href="/microCourse/course/list?c=${course.classify.orientation.hrefName }">${course.classify.orientation.name }</a>
					<i class="path-split">\</i><a
						href="/microCourse/course/list?c=${course.classify.hrefName }">${course.classify.name }</a>
					<i class="path-split">\</i><span>${course.name }</span>
				</div>
				<div class="hd">
					<h2 class="l">${course.name }</h2>
				</div>
				<div class="statics clearfix">
					<div class="static-item ">
						<span class="meta-value"><strong>${course.level }</strong></span>
						<span class="meta">难度</span> <em></em>
					</div>
					<div class="static-item static-time">
						<span class="meta-value"><strong>${course.duration }</strong></span>
						<span class="meta">时长</span> <em></em>
					</div>
					<div class="static-item">
						<span class="meta-value"><strong>${course.learnCount }</strong></span>
						<span class="meta">学习人数</span> <em></em>
					</div>

				</div>
				<div class="extra">
					<div
						class="share-action r bdsharebuttonbox bdshare-button-style0-16"
						data-bd-bind="1442497997173">
						分享 <a href="javascript:;" class="share wx js-share"
							data-cmd="weixin" title="分享到微信"></a> <a href="javascript:;"
							class="share qq js-share" data-cmd="qzone" title="分享到QQ空间"></a> <a
							href="javascript:;" class="share sina js-share" data-cmd="tsina"
							title="分享到新浪微博"></a>
					</div>
					<i class="split-line r"></i> <a href="javascript:;"
						data-cmd="follow" class="follow-action r js-follow-action"
						data-cid="85"> 关注 </a>
				</div>
			</div>
			<div class="info-bg" id="js-info-bg">
				<div class="cover-img-wrap">
					<img
						data-src="http://img.mukewang.com/55af49c2000117af06000338.jpg"
						alt="" style="display: none" id="js-cover-img">
				</div>
				<div class="cover-mask"></div>
				<canvas width="1899" height="240" class="cover-canvas"
					id="js-cover-canvas"></canvas>
			</div>
		</div>
		<div class="course-info-main clearfix w has-progress">

			<div class="info-bar clearfix">
				<a href="/microCourse/course/video" target="_blank"
					class="btn-red start-study-btn r">继续学习</a> <span
					class="start-study-title"> 1-1 Java简介 </span>
				<div class="exp-progress">
					<span class="exp-txt"> <span class="exp-per"> <strong>${progress }</strong>%
					</span> 用时 <span class="exp-time"><i>${leartTime }</i></span>
					</span>
					<div class="exp-bar">
						<ins style="width: 0%"></ins>
					</div>
				</div> 
			</div>
			<div class="content-wrap clearfix">
				<div class="content">
					<div class="mod-tab-menu">
						<ul class="course-menu clearfix">
						<c:choose>
						<c:when test="${statu eq 'learnOn' }">
						<li><a class="ui-tabs-active active" id="learnOn"
								href="/microCourse/course/learn/${course.courseId }"><span>章节</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a class="" id="learnOn"
								href="/microCourse/course/learn/${course.courseId }"><span>章节</span></a></li>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${statu eq 'commentOn' }">
						<li><a id="commentOn" class="ui-tabs-active active" href="/microCourse/course/comment/${course.courseId }"><span>评论</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a id="commentOn" class="" href="/microCourse/course/comment/${course.courseId }"><span>评论</span></a></li>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${statu eq 'wendaOn' }">
						<li><a id="qaOn" class="ui-tabs-active active" href="/microCourse/course/wenda/${course.courseId }"><span>问答</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a id="qaOn" class="" href="/microCourse/course/wenda/${course.courseId }"><span>问答</span></a></li>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${statu eq 'noteOn' }">
						<li><a id="noteOn" class="ui-tabs-active active" href="/microCourse/course/note/${course.courseId }"><span>笔记</span></a></li>
						</c:when>
						<c:otherwise>
						<li><a id="noteOn" class="" href="/microCourse/course/note/${course.courseId }"><span>笔记</span></a></li>
						</c:otherwise>
						</c:choose>
						</ul>
					</div>



                   <c:choose>
                   <c:when test="${statu eq 'commentOn' }">
                    <!--发布评论-->
					<div id="js-pub-container" class="issques clearfix js-form">
					<span>评论摘要抽取：</span>
						<div class="wgt-ipt-wrap pub-editor-wrap" id="js-pl-input-fake">
							<textarea id="js-pl-textarea" class="" readonly="readonly">${summary }</textarea>
							<!-- <span class="num-limit"><span id="js-pl-limit">0</span>/300</span> -->
						</div>
						<div id="pub-btm" class="pub-btm clearfix">
							<div class="verify-box l js-verify-box" style="display: none">
								<input type="text" class="ipt l" placeholder="请输入验证码"> <a
									href="javascript:;" class="js-verify-refresh"><img
									data-src="/course/getcoursecommentcode" class="verify-media l"></a>
								<span class="verify-help l"> 看不清 <a href="javascript:;"
									class="verify-refresh js-verify-refresh">换一换</a>
								</span>
							</div>
	<!-- 						<input type="button" id="js-pl-submit" class="pub-btn r"
								data-cid="477" value="发表评论"> <span class="errortip r">您还没有填写内容！</span> -->
						</div>
						<p class="global-errortip js-global-error"></p>
					</div>
					
					
					<div id="course_note">
						<ul class="mod-post" id="comment-list">
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/2370047" target="_blank"><img
										src="http://img.mukewang.com/user/55fcf6420001f16001000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/2370047" target="_blank">qq_逗比青年_1</a>
									</div>
									<p class="cnt">这个和还是有差距的</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：1小时前</span> <a
											href="/video/9582" class="from">源自：2-1 友元函数</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113523"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1052530" target="_blank"><img
										src="http://img.mukewang.com/user/54ae5c700001228604000400-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1052530" target="_blank">Pallad</a>
									</div>
									<p class="cnt">开篇的无限循环GIF ... 我的双眼 ...</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：1小时前</span>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113515"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/2313278" target="_blank"><img
										src="http://img.mukewang.com/user/55e6ff8f00019aba01000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/2313278" target="_blank">qq_ning_0</a>
									</div>
									<p class="cnt">两个字：精彩！</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：16小时前</span> <a
											href="/video/9590" class="from">源自：4-3 一元运算符编码实现（二）</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113310"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/427114" target="_blank"><img
										src="http://img.mukewang.com/user/5432a8040001400601000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/427114" target="_blank">井底之蛙_0001</a>
									</div>
									<p class="cnt">
										Coordinate &amp;operator+(Coordinate &amp;c) {<br>
										Coordinate temp(c);<br> temp.m_iX = m_iX + c.m_iX;<br>
										temp.m_iY = m_iY + c.m_iY;<br> return temp;<br> }<br>
										这个代码都能过，你们这个检测有问题！
									</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：18小时前</span> <a
											href="/video/9674" class="from">源自：4-7 综合练习</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113264"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1001711" target="_blank"><img
										src="http://img.mukewang.com/user/545a46bb0001a4e001000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1001711" target="_blank">Giveme5</a>
									</div>
									<p class="cnt">非要用上海北京 缩成S和B么。。哈哈哈</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：19小时前</span> <a
											href="/video/9597" class="from">源自：6-1 标准模板库</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113262"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/427114" target="_blank"><img
										src="http://img.mukewang.com/user/5432a8040001400601000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/427114" target="_blank">井底之蛙_0001</a>
									</div>
									<p class="cnt">在android手机上总是出事！</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：1天前</span> <a
											href="/video/9591" class="from">源自：4-4 二元运算符重载</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113159"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/427114" target="_blank"><img
										src="http://img.mukewang.com/user/5432a8040001400601000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/427114" target="_blank">井底之蛙_0001</a>
									</div>
									<p class="cnt">举报！索引运算符讲解部分木有画面！！！9分12秒之后</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：1天前</span> <a
											href="/video/9591" class="from">源自：4-4 二元运算符重载</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113157"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1969149" target="_blank"><img
										src="http://img.mukewang.com/user/5558acad0001a9c301000100-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1969149" target="_blank">qq_埖澊_0</a>
									</div>
									<p class="cnt">
										Watch(Time &amp;t):m_tTime(t)<br> {<br> }
									</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：1天前</span> <a
											href="/video/9606" class="from">源自：2-7 练习题</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113110"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/2024928" target="_blank"><img
										src="http://img.mukewang.com/user/5573181f0001ca8401800180-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/2024928" target="_blank">一横竖一撇捺</a>
									</div>
									<p class="cnt">这老师是神级的。很赞。</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：1天前</span> <a
											href="/video/9581" class="from">源自：1-1 课程简介</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="113107"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1221330" target="_blank"><img
										src="http://img.mukewang.com/user/55fb729b00011ec306400640-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1221330" target="_blank">星小辰</a>
									</div>
									<p class="cnt">学完了，小功告成！(&nbsp;*・ω・)</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：2天前</span> <a
											href="/video/9672" class="from">源自：6-5 单元巩固</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="112820"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1117727" target="_blank"><img
										src="http://img.mukewang.com/user/54957279000168ac03530353-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1117727" target="_blank">SppDream</a>
									</div>
									<p class="cnt">真棒！！！</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：2天前</span> <a
											href="/video/9581" class="from">源自：1-1 课程简介</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="112798"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/2230691" target="_blank"><img
										src="http://img.mukewang.com/user/55c8813500018efe04800800-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/2230691" target="_blank">寒塘萧瑟</a>
									</div>
									<p class="cnt">开始学习新课程，哈哈</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：2天前</span> <a
											href="/video/9581" class="from">源自：1-1 课程简介</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="112698"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1052530" target="_blank"><img
										src="http://img.mukewang.com/user/54ae5c700001228604000400-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1052530" target="_blank">Pallad</a>
									</div>
									<p class="cnt">擦 这开头...</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：2天前</span> <a
											href="/video/9582" class="from">源自：2-1 友元函数</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="112666"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/1221330" target="_blank"><img
										src="http://img.mukewang.com/user/55fb729b00011ec306400640-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/1221330" target="_blank">星小辰</a>
									</div>
									<p class="cnt">举报！索引运算符讲解部分木有画面！！！9分12秒之后</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：3天前</span> <a
											href="/video/9591" class="from">源自：4-4 二元运算符重载</a>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="112475"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
							<li class="post-row">
								<div class="media">
									<a href="/space/u/uid/2024928" target="_blank"><img
										src="http://img.mukewang.com/user/5573181f0001ca8401800180-40-40.jpg"
										width="40" height="40"></a>
								</div>
								<div class="bd">
									<div class="tit">
										<a href="/space/u/uid/2024928" target="_blank">一横竖一撇捺</a>
									</div>
									<p class="cnt">james_yuan 讲的很好</p>
									<div class="footer clearfix">
										<span title="创建时间" class="l timeago">时间：3天前</span>
										<div class="actions r">
											<a title="赞" href="javascript:;"
												class="js-pl-praise list-praise post-action "
												data-id="112467"> <span class="icon-thumb "></span> <em>0</em>
											</a>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<div class="page">
							<span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a
								href="javascript:void(0)" class="active">1</a><a
								href="/course/comment/id/477?page=2">2</a><a
								href="/course/comment/id/477?page=3">3</a><a
								href="/course/comment/id/477?page=2">下一页</a><a
								href="/course/comment/id/477?page=3">尾页</a>
						</div>
					</div>
                   </c:when>
                   <c:when test="${statu eq 'learnOn' }">
					<div id="notice" class="clearfix">
						<div class="l">
							<strong>课程公告:</strong> <a href="javascript:void(0)">Java
								第二、三季都上线啦</a>
						</div>
					</div>

					<div class="mod-chapters">
						<div class="chapter chapter-active">
							<h3>
								<span class="icon-sub"></span> <strong><i
									class="state-expand"></i>第1章 Java初体验</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/microCourse/course/video/1"
									class="studyvideo">1-1 Java简介 (05:49) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1459"
									class="studyvideo">1-2 Java开发环境搭建 (07:30) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1501"
									class="studyvideo">1-3 使用记事本编写Java程序 (07:00) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/microCourse/course/exercise/6" class="practise">1-4
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1412"
									class="studyvideo">1-5 使用Eclipse开发Java程序 (08:59) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1414"
									class="studyvideo">1-6 MyEclipse的使用简介 (03:53) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1475" class="practise">1-7
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1416"
									class="studyvideo">1-8 程序的移植 (03:08) <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1422"
									class="studyvideo">1-9 经验技巧分享 (01:52) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1423" class="practise">1-10
										练习题 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter chapter-active">
							<h3>
								<span class="icon-sub"></span> <strong><i
									class="state-expand"></i>第2章 变量和常量</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/microCourse/course/code/8" class="programme">2-1
										Java中的关键字 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1177" class="programme">2-2
										认识Java标识符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1180" class="practise">2-3
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1183" class="programme">2-4
										变量是什么 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1221" class="programme">2-5
										如何命名Java变量 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1230" class="programme">2-6
										Java中的数据类型 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1242" class="programme">2-7
										Java中变量的使用规则 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/microCourse/course/exercise" class="practise">2-8
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1236" class="programme">2-9
										Java中的自动类型转换 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1241" class="programme">2-10
										Java中的强制类型转换 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1256" class="programme">2-11
										Java常量的应用 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1274" class="programme">2-12
										如何在Java中使用注释 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1275" class="practise">2-13
										练习题 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter">
							<h3>
								<span class="icon-plus"></span> <strong><i
									class="state-expand"></i>第3章 常用的运算符</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/code/1278" class="programme">3-1
										什么是运算符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1279" class="programme">3-2
										Java中的算术运算符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1298" class="programme">3-3
										Java中的赋值运算符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1299" class="programme">3-4
										Java中的比较运算符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1301" class="programme">3-5
										Java中的逻辑运算符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1302" class="practise">3-6
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1306" class="programme">3-7
										Java中的条件运算符 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1315" class="programme">3-8
										Java中运算符的优先级 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1314" class="practise">3-9
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1352" class="practise">3-10
										练习题 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter">
							<h3>
								<span class="icon-plus"></span> <strong><i
									class="state-expand"></i>第4章 流程控制语句</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/code/1353" class="programme">4-1
										Java条件语句之 if <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1354" class="programme">4-2
										Java条件语句之 if...else <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1355" class="programme">4-3
										Java条件语句之多重 if <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1356" class="programme">4-5
										Java条件语句之嵌套 if <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1421" class="practise">4-6
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1358" class="programme">4-7
										Java条件语句之 switch <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1420" class="programme">4-8
										Java循环语句之 while <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1424" class="programme">4-9
										Java循环语句之 do...while <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1425" class="programme">4-10
										Java循环语句之 for <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1427" class="practise">4-11
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1431" class="programme">4-12
										Java循环跳转语句之 break <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1432" class="programme">4-13
										Java循环跳转语句之 continue <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1433" class="practise">4-14
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1497" class="programme">4-15
										Java 循环语句之多重循环 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/7249" class="programme">4-16
										编程练习 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter">
							<h3>
								<span class="icon-plus"></span> <strong><i
									class="state-expand"></i>第5章 阶段练习</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/code/1554" class="programme">5-1
										编程练习 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1625"
									class="studyvideo">5-2 编程练习解析 (04:40) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1626"
									class="studyvideo">5-3 编程练习优化 (06:10) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1627"
									class="studyvideo">5-4 使用Eclipse调试程序 (05:39) <i
										class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/video/1628"
									class="studyvideo">5-5 进阶练习 (11:40) <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter">
							<h3>
								<span class="icon-plus"></span> <strong><i
									class="state-expand"></i>第6章 数组</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/code/1514" class="programme">6-1
										什么是数组 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1594" class="practise">6-2
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1525" class="programme">6-3
										如何使用 Java 中的数组 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1595" class="practise">6-4
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1531" class="programme">6-5
										使用循环操作 Java 中的数组 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1677" class="programme">6-6
										编程练习 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1556" class="programme">6-7
										使用 Arrays 类操作 Java 中的数组 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1864" class="programme">6-8
										使用 foreach 操作数组 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1571" class="programme">6-9
										Java 中的二维数组 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1596" class="practise">6-10
										练习题 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter">
							<h3>
								<span class="icon-plus"></span> <strong><i
									class="state-expand"></i>第7章 方法</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/code/1577" class="programme">7-1
										如何定义 Java 中的方法 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1578" class="programme">7-2
										Java 中无参无返回值方法的使用 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1579" class="programme">7-3
										Java 中无参带返回值方法的使用 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1634" class="programme">7-4
										编程练习 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1580" class="programme">7-5
										Java 中带参无返回值方法的使用 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1581" class="programme">7-6
										Java 中带参带返回值方法的使用 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/1637" class="practise">7-7
										练习题 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1582" class="programme">7-8
										Java 中方法的重载 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/code/1680" class="programme">7-9
										编程练习 <i class="study-state"></i>
								</a></li>
								<li><a target="_blank" href="/ceping/6977" class="practise">7-10
										练习题 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
						<div class="chapter">
							<h3>
								<span class="icon-plus"></span> <strong><i
									class="state-expand"></i>第8章 编程挑战</strong>
							</h3>
							<ul class="video">
								<li><a target="_blank" href="/code/1598" class="programme">8-1
										编程练习 <i class="study-state"></i>
								</a></li>
							</ul>
						</div>
					</div>
                </c:when>
                
                <c:when test="${statu eq 'wendaOn' }">

							<!--发布问题-->
							<div id="js-pub-container"
								class="issques qa-form no-border clearfix">
								<div class="quesdetail mbottom" id="issuequestitle">
									<span class="ques-label">标题：</span>
									<div class="question-area form-ctrl">
										<input type="text" id="ques-title" maxlength="255"
											name="title" placeholder="请输入问题标题"
											class="autocomplete wgt-ipt block " value="">
										<p class="errortip">您还没有填写标题！</p>
										<dl class="send-area-result">
										</dl>
									</div>
								</div>
								<div class="quesdetail"
									style="overflow: hidden; padding-top: 10px;">
									<span class="ques-label">内容：</span>

									<div id="editor-wrap" class="editor form-ctrl clearfix">
										<div class="textarea-unlogin  ">
											<div class="block block-editor edui-imooc" id="pub-editor"
												style="">
												<div id="edui1" class="edui-editor  edui-imooc"
													style="width: 100%; z-index: 999;">
													<div id="edui1_toolbarbox"
														class="edui-editor-toolbarbox edui-imooc">
														<div id="edui1_toolbarboxouter"
															class="edui-editor-toolbarboxouter edui-imooc">
															<div class="edui-editor-toolbarboxinner edui-imooc">
																<div id="edui2" class="edui-toolbar   edui-imooc"
																	onselectstart="return false;"
																	onmousedown="return $EDITORUI[&quot;edui2&quot;]._onMouseDown(event, this);"
																	style="-webkit-user-select: none;">
																	<div id="edui3"
																		class="edui-box edui-combox edui-for-insertcode edui-imooc">
																		<div title="代码语言" id="edui3_state"
																			onmousedown="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-combox-body edui-imooc">
																				<div id="edui3_button_body"
																					class="edui-box edui-button-body edui-imooc"
																					onclick="$EDITORUI[&quot;edui3&quot;]._onButtonClick(event, this);">代码语言</div>
																				<div class="edui-box edui-splitborder edui-imooc"></div>
																				<div class="edui-box edui-arrow edui-imooc"
																					onclick="$EDITORUI[&quot;edui3&quot;]._onArrowClick();"></div>
																			</div>
																		</div>
																	</div>
																	<div id="edui17"
																		class="edui-box edui-button edui-for-bold edui-imooc">
																		<div id="edui17_state"
																			onmousedown="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui17_body" unselectable="on" title="加粗"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui17&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui17&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui18"
																		class="edui-box edui-button edui-for-italic edui-imooc">
																		<div id="edui18_state"
																			onmousedown="$EDITORUI[&quot;edui18&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui18&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui18&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui18&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui18_body" unselectable="on" title="斜体"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui18&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui18&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui19"
																		class="edui-box edui-button edui-for-underline edui-imooc">
																		<div id="edui19_state"
																			onmousedown="$EDITORUI[&quot;edui19&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui19&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui19&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui19&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui19_body" unselectable="on" title="下划线"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui19&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui19&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui26"
																		class="edui-box edui-button edui-for-insertimage edui-imooc">
																		<div id="edui26_state"
																			onmousedown="$EDITORUI[&quot;edui26&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui26&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui26&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui26&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui26_body" unselectable="on" title="多图上传"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui26&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui26&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																					<div class="edui-box edui-label edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui31"
																		class="edui-box edui-button edui-for-link edui-imooc">
																		<div id="edui31_state"
																			onmousedown="$EDITORUI[&quot;edui31&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui31&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui31&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui31&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui31_body" unselectable="on" title="超链接"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui31&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui31&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																					<div class="edui-box edui-label edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui32"
																		class="edui-box edui-button edui-for-unlink edui-imooc">
																		<div id="edui32_state"
																			onmousedown="$EDITORUI[&quot;edui32&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui32&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui32&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui32&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui32_body" unselectable="on" title="取消链接"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui32&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui32&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui33"
																		class="edui-box edui-button edui-for-insertunorderedlist edui-imooc">
																		<div id="edui33_state"
																			onmousedown="$EDITORUI[&quot;edui33&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui33&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui33&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui33&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui33_body" unselectable="on" title="无序列表"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui33&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui33&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																					<div class="edui-box edui-label edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui34"
																		class="edui-box edui-button edui-for-insertorderedlist edui-imooc">
																		<div id="edui34_state"
																			onmousedown="$EDITORUI[&quot;edui34&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui34&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui34&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui34&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui34_body" unselectable="on" title="有序列表"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui34&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui34&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																					<div class="edui-box edui-label edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui35"
																		class="edui-box edui-button edui-for-blockquote edui-imooc">
																		<div id="edui35_state"
																			onmousedown="$EDITORUI[&quot;edui35&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui35&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui35&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui35&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui35_body" unselectable="on" title="引用"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui35&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui35&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui36"
																		class="edui-box edui-button edui-for-redo edui-imooc">
																		<div id="edui36_state"
																			onmousedown="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui36_body" unselectable="on" title="重做"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui36&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui36&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui37"
																		class="edui-box edui-button edui-for-undo edui-imooc">
																		<div id="edui37_state"
																			onmousedown="$EDITORUI[&quot;edui37&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui37&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui37&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui37&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui37_body" unselectable="on" title="撤销"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui37&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui37&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div id="edui40"
																		class="edui-box edui-button edui-for-preview edui-imooc">
																		<div id="edui40_state"
																			onmousedown="$EDITORUI[&quot;edui40&quot;].Stateful_onMouseDown(event, this);"
																			onmouseup="$EDITORUI[&quot;edui40&quot;].Stateful_onMouseUp(event, this);"
																			onmouseover="$EDITORUI[&quot;edui40&quot;].Stateful_onMouseOver(event, this);"
																			onmouseout="$EDITORUI[&quot;edui40&quot;].Stateful_onMouseOut(event, this);"
																			class="edui-imooc">
																			<div class="edui-button-wrap edui-imooc">
																				<div id="edui40_body" unselectable="on" title="预览"
																					class="edui-button-body edui-imooc"
																					onmousedown="return $EDITORUI[&quot;edui40&quot;]._onMouseDown(event, this);"
																					onclick="return $EDITORUI[&quot;edui40&quot;]._onClick(event, this);">
																					<div class="edui-box edui-icon edui-imooc"></div>
																					<div class="edui-box edui-label edui-imooc"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div id="edui1_toolbarmsg"
															class="edui-editor-toolbarmsg edui-imooc"
															style="display: none;">
															<div id="edui1_upload_dialog"
																class="edui-editor-toolbarmsg-upload edui-imooc"
																onclick="$EDITORUI[&quot;edui1&quot;].showWordImageDialog();">点击上传</div>
															<div class="edui-editor-toolbarmsg-close edui-imooc"
																onclick="$EDITORUI[&quot;edui1&quot;].hideToolbarMsg();">x</div>
															<div id="edui1_toolbarmsg_label"
																class="edui-editor-toolbarmsg-label edui-imooc"></div>
															<div style="height: 0; overflow: hidden; clear: both;"
																class="edui-imooc"></div>
														</div>
														<div id="edui1_message_holder"
															class="edui-editor-messageholder edui-imooc"
															style="top: 42px; z-index: 1000;"></div>
													</div>
													<div id="edui1_iframeholder"
														class="edui-editor-iframeholder edui-imooc"
														style="width: 100%; height: 80px; z-index: 999; overflow: hidden;">
														<iframe id="ueditor_0" width="100%" height="100%"
															frameborder="0"
															src="javascript:void(function(){document.open();document.write(&quot;<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml' class='view' ><head><style type='text/css'>.view{padding:0;word-wrap:break-word;cursor:text;height:90%;}
body{margin:8px;font-family:sans-serif;font-size:16px;}p{margin:5px 0;}</style><link rel='stylesheet' type='text/css' href='http://www.imooc.com/static/lib/ueditor/themes/iframe.css'/><style>p{line-height:1.5em;font-size:13px;color:#444}</style></head><body class='view' ></body><script type='text/javascript'  id='_initialScript'>setTimeout(function(){editor = window.parent.UE.instants['ueditorInstant0'];editor._setup(document);},0);var _tmpScript = document.getElementById('_initialScript');_tmpScript.parentNode.removeChild(_tmpScript);</script></html>&quot;);document.close();}())"></iframe>
													</div>
													<div id="edui1_bottombar"
														class="edui-editor-bottomContainer edui-imooc">
														<table class="edui-imooc">
															<tbody class="edui-imooc">
																<tr class="edui-imooc">
																	<td id="edui1_elementpath"
																		class="edui-editor-bottombar edui-imooc"
																		style="display: none;"></td>
																	<td id="edui1_wordcount"
																		class="edui-editor-wordcount edui-imooc"
																		style="display: none;"></td>
																	<td id="edui1_scale"
																		class="edui-editor-scale edui-imooc"
																		style="display: none;"><div
																			class="edui-editor-icon edui-imooc"></div></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div id="edui1_scalelayer" class="edui-imooc"></div>
												</div>
											</div>
											<textarea name="" cols="30" rows="10"
												class="block block-editor" style="display: none;">请输入问答内容...</textarea>
										</div>
									</div>
									<p class="errortip">您还没有填写内容！</p>
								</div>
								<div id="pub-btm" class="pub-btm clearfix">
									<div class="verify-box l js-verify-box" style="display: none">
										<input type="text" class="ipt l" placeholder="请输入验证码">
										<a href="javascript:;" class="js-verify-refresh"><img
											data-src="/course/getcoursequestioncode"
											class="verify-media l"></a> <span class="verify-help l">
											看不清 <a href="javascript:;"
											class="verify-refresh js-verify-refresh">换一换</a>
										</span>
									</div>
									<input type="button" id="js-pub-btn" class="pub-btn r"
										data-cid="477" value="发布">
								</div>
							</div>


							<div class="comp-filter-bar">
								<a href="/qa/477/t/1" class="bar-item  active">全部</a> <a
									href="/qa/477/t/2" class="bar-item ">精华</a>
							</div>
							<div class="answertabcon">
								<div class="course_quescon">
									<div class="wenda-listcon mod-qa-list clearfix">
										<div class="headslider qa-medias l">
											<a href="/space/u/uid/1033157" class="media" target="_blank"
												title="俊男坊"> <img
												src="http://img.mukewang.com/user/5333a1200001ff5602000200-40-40.jpg"
												width="40" height="40"> <span class="name"> 俊男坊
											</span>
											</a>
										</div>
										<div class="wendaslider qa-content">
											<a href="/qadetail/97363" target="_blank"
												class="replynumber static-count "> <span
												class="static-item answer"> <b class="val">0</b> <span
													class="key">回答</span>
											</span> <span class="static-item"> <b class="val">15</b> <span
													class="key">浏览</span>
											</span>
											</a>
											<h2 class="wendaquetitle qa-header">
												<i class="nofinish"></i>
												<div class="wendatitlecon qa-header-cnt">
													<a href="/qadetail/97363" target="_blank" class="qa-tit">头文件问题</a>
												</div>
											</h2>
											<div class="replycont qa-body clearfix">
												<i class="replyicon l"></i>

												<div class="l replydes">
													<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
												</div>

											</div>
											<div class="replymegfooter qa-footer">
												<div class="wenda-time">
													<em>时间：1天前</em> <a href="/video/9583" target="_blank"
														class="from">源自：2-2 友元函数编码实现</a>
												</div>
											</div>
										</div>
									</div>
									<div class="wenda-listcon mod-qa-list clearfix">
										<div class="headslider qa-medias l">
											<a href="/space/u/uid/1221330" class="media" target="_blank"
												title="星小辰"> <img
												src="http://img.mukewang.com/user/55fb729b00011ec306400640-40-40.jpg"
												width="40" height="40"> <span class="name"> 星小辰
											</span>
											</a>
										</div>
										<div class="wendaslider qa-content">
											<a href="/qadetail/97303" target="_blank"
												class="replynumber static-count  hasanswer"> <span
												class="static-item answer"> <b class="val">1</b> <span
													class="key">回答</span>
											</span> <span class="static-item"> <b class="val">12</b> <span
													class="key">浏览</span>
											</span>
											</a>
											<h2 class="wendaquetitle qa-header">
												<i class="nofinish"></i>
												<div class="wendatitlecon qa-header-cnt">
													<a href="/qadetail/97303" target="_blank" class="qa-tit">运行超时原因？</a>
												</div>
											</h2>
											<div class="replycont qa-body clearfix">
												<i class="replyicon l"></i>
												<div class="l replydes">
													<span class="replysign praise">[最新回答]</span> <a
														href="/space/u/uid/1110034" target="_blank" title="伊兮尘昔"
														class="replyuserhead"><img
														src="http://img.mukewang.com/user/54584db9000199ca02200220-80-80.jpg"
														width="20" height="20"> </a> <a
														href="/space/u/uid/1110034" target="_blank" title="伊兮尘昔"
														class="nickname">伊兮尘昔: </a> <span class="replydet">编辑器编译的问题，你在本地的话就没事出问题的应该在for&nbsp;(;&nbsp;iter&nbsp;!=&nbsp;m.end();&nbsp;iter++)这句话上</span>
												</div>
											</div>
											<div class="replymegfooter qa-footer">
												<div class="wenda-time">
													<em>时间：2天前</em> <a href="/video/9672" target="_blank"
														class="from">源自：6-5 单元巩固</a>
												</div>
											</div>
										</div>
									</div>
									<div class="wenda-listcon mod-qa-list clearfix">
										<div class="headslider qa-medias l">
											<a href="/space/u/uid/1221330" class="media" target="_blank"
												title="星小辰"> <img
												src="http://img.mukewang.com/user/55fb729b00011ec306400640-40-40.jpg"
												width="40" height="40"> <span class="name"> 星小辰
											</span>
											</a>
										</div>
										<div class="wendaslider qa-content">
											<a href="/qadetail/97160" target="_blank"
												class="replynumber static-count  hasanswer"> <span
												class="static-item answer"> <b class="val">1</b> <span
													class="key">回答</span>
											</span> <span class="static-item"> <b class="val">15</b> <span
													class="key">浏览</span>
											</span>
											</a>
											<h2 class="wendaquetitle qa-header">
												<i class="isfinish"></i>
												<div class="wendatitlecon qa-header-cnt">
													<a href="/qadetail/97160" target="_blank" class="qa-tit">void
														change(T a,T b){}为何不行</a>
												</div>
											</h2>
											<div class="replycont qa-body clearfix">
												<i class="replyicon l"></i>
												<div class="l replydes">
													<span class="replysign adopt">[已采纳答案]</span> <a
														href="/space/u/uid/1166363" target="_blank" title="onemoo"
														class="replyuserhead"><img
														src="http://img.mukewang.com/user/54584f6100019caf02200220-80-80.jpg"
														width="20" height="20"> </a> <a
														href="/space/u/uid/1166363" target="_blank" title="onemoo"
														class="nickname">onemoo: </a> <span class="replydet">这样声明a和b的话，在调用函数传参数时是把x和y的值复制给a和b，在change函数中a和b的值确实是交换了，但与外面main中的x
														y没有什么关系啊。应把a和b声明为引用（难道前面的课程中没有讲这个吗！？）</span>
												</div>
											</div>
											<div class="replymegfooter qa-footer">
												<div class="wenda-time">
													<em>时间：2天前</em> <a href="/video/9670" target="_blank"
														class="from">源自：5-4 单元巩固</a>
												</div>
											</div>
										</div>
									</div>
									<div class="wenda-listcon mod-qa-list clearfix">
										<div class="headslider qa-medias l">
											<a href="/space/u/uid/1221330" class="media" target="_blank"
												title="星小辰"> <img
												src="http://img.mukewang.com/user/55fb729b00011ec306400640-40-40.jpg"
												width="40" height="40"> <span class="name"> 星小辰
											</span>
											</a>
										</div>
										<div class="wendaslider qa-content">
											<a href="/qadetail/97130" target="_blank"
												class="replynumber static-count  hasanswer"> <span
												class="static-item answer"> <b class="val">3</b> <span
													class="key">回答</span>
											</span> <span class="static-item"> <b class="val">32</b> <span
													class="key">浏览</span>
											</span>
											</a>
											<h2 class="wendaquetitle qa-header">
												<i class="isfinish"></i>
												<div class="wendatitlecon qa-header-cnt">
													<a href="/qadetail/97130" target="_blank" class="qa-tit">视频有问题？</a>
												</div>
											</h2>
											<div class="replycont qa-body clearfix">
												<i class="replyicon l"></i>
												<div class="l replydes">
													<span class="replysign adopt">[已采纳答案]</span> <a
														href="/space/u/uid/255777" target="_blank" title="偌颜宁"
														class="replyuserhead"><img
														src="http://img.mukewang.com/user/5453449f0001c36e05520522-80-80.jpg"
														width="20" height="20"> </a> <a
														href="/space/u/uid/255777" target="_blank" title="偌颜宁"
														class="nickname">偌颜宁: </a> <span class="replydet">好了，你看看</span>
												</div>
											</div>
											<div class="replymegfooter qa-footer">
												<div class="wenda-time">
													<em>时间：3天前</em> <a href="/video/9591" target="_blank"
														class="from">源自：4-4 二元运算符重载</a>
												</div>
											</div>
										</div>
									</div>
									<div class="wenda-listcon mod-qa-list clearfix">
										<div class="headslider qa-medias l">
											<a href="/space/u/uid/1915727" class="media" target="_blank"
												title="慕课_大白"> <img
												src="http://img.mukewang.com/user/553f1a5800019b5e01000100-40-40.jpg"
												width="40" height="40"> <span class="name">
													慕课_大白... </span>
											</a>
										</div>
										<div class="wendaslider qa-content">
											<a href="/qadetail/96940" target="_blank"
												class="replynumber static-count "> <span
												class="static-item answer"> <b class="val">0</b> <span
													class="key">回答</span>
											</span> <span class="static-item"> <b class="val">18</b> <span
													class="key">浏览</span>
											</span>
											</a>
											<h2 class="wendaquetitle qa-header">
												<i class="nofinish"></i>
												<div class="wendatitlecon qa-header-cnt">
													<a href="/qadetail/96940" target="_blank" class="qa-tit">提问测试22</a>
												</div>
											</h2>
											<div class="replycont qa-body clearfix">
												<i class="replyicon l"></i>

												<div class="l replydes">
													<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
												</div>

											</div>
											<div class="replymegfooter qa-footer">
												<div class="wenda-time">
													<em>时间：4天前</em> <a href="/video/9582" target="_blank"
														class="from">源自：2-1 友元函数</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
                
                 <c:when test="${statu eq 'noteOn' }">
								<div id="course_note">
									<ul id="js-note-container" class="mod-post">
										<li id="492472" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2371050" target="_blank"><img
													src="http://img.mukewang.com/user/55fd48a80001681401800180-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2371050" target="_blank">设计小茨</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">Haijn</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fd4c440001913f07200404-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9581/20" title="回放视频" target="_blank">00:20</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9581/20" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">00:20</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fd4c440001913f07200404-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="19小时前" class="l timeago">时间：19小时前</span> <a
														href="/video/9581" class="from l">源自：1-1 课程简介</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9581|2371050">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9581"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="489626" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">
														Coordinate coor(1,3);<br>
														cout&lt;&lt;(coor++).getX()&lt;&lt;",";<br>
														cout&lt;&lt;(coor++).getY()&lt;&lt;endl;<br>
														//后置++输出（1，4）<br>
														cout&lt;&lt;(coor).getX()&lt;&lt;","&lt;&lt;coor.getY()&lt;&lt;endl;//输出（2，5）
													</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fb7ed70001719d12800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9590/503" title="回放视频" target="_blank">08:23</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9590/503" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">08:23</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fb7ed70001719d12800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9590" class="from l">源自：4-3 一元运算符编码实现（二）</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9590|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9590"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488994" class="post-row">
											<div class="media">
												<a href="/space/u/uid/1131961" target="_blank"><img
													src="http://img.mukewang.com/user/55deda6f00019e9804190419-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/1131961" target="_blank">liantao68</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">友元是封装的一个补充</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55facbd00001635912800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9584/224" title="回放视频" target="_blank">03:44</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9584/224" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">03:44</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55facbd00001635912800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9584" class="from l">源自：2-4 友元类</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9584|1131961">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9584"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488992" class="post-row">
											<div class="media">
												<a href="/space/u/uid/1131961" target="_blank"><img
													src="http://img.mukewang.com/user/55deda6f00019e9804190419-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/1131961" target="_blank">liantao68</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">友元的注意事项</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55facb750001755a12800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9584/186" title="回放视频" target="_blank">03:06</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9584/186" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">03:06</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55facb750001755a12800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9584" class="from l">源自：2-4 友元类</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9584|1131961">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9584"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488605" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">静态成员函数不能用const修饰</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9587" class="from l">源自：3-2 静态编码实现</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9587|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9587"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488431" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">静态成员函数可以调用静态数据成员但不可以调用普通数据成员</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa834600019c9512800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9586/524" title="回放视频" target="_blank">08:44</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9586/524" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">08:44</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa834600019c9512800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9586" class="from l">源自：3-1 静态</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9586|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9586"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488376" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">
														静态数据成员在没有实例化对象时也是存在于内存的，而普通数据成员则只有在实例化对象后才存在；<br>
														静态数据成员初始化 类型 类名::静态数据成员= ；int Tank::s_iCount=0;
													</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa80250001252f12800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9586/189" title="回放视频" target="_blank">03:09</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9586/189" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">03:09</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa80250001252f12800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9586" class="from l">源自：3-1 静态</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9586|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9586"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488301" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">友元只是封装的补充</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa7afb0001635912800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9584/225" title="回放视频" target="_blank">03:45</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9584/225" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">03:45</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa7afb0001635912800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9584" class="from l">源自：2-4 友元类</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9584|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9584"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488295" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">
														友元关系不可传递；<br> 友元关系的单向性；<br> 友元声明的形式和数量不受限制
													</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa7a9a00019ff812800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9584/188" title="回放视频" target="_blank">03:08</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9584/188" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">03:08</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa7a9a00019ff812800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9584" class="from l">源自：2-4 友元类</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9584|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9584"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488273" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2204135" target="_blank"><img
													src="http://img.mukewang.com/user/5458453d0001cd0102200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2204135" target="_blank">人生赢家daru君</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">map代码实例：</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa792b0001784b12800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9599/633" title="回放视频" target="_blank">10:33</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9599/633" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">10:33</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa792b0001784b12800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9599" class="from l">源自：6-3 标准模板库编码实现（二）</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9599|2204135">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9599"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488226" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2316577" target="_blank"><img
													src="http://img.mukewang.com/user/54584c9c0001489602200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2316577" target="_blank">myfly2015</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">友元函数可以访问private变量</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9583" class="from l">源自：2-2 友元函数编码实现</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9583|2316577">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9583"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488176" class="post-row">
											<div class="media">
												<a href="/space/u/uid/288748" target="_blank"><img
													src="http://img.mukewang.com/user/5333a0c40001088802000200-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/288748" target="_blank">guanshijie</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">jsjksakl;aklsjkklajkl;klajklsa</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9586" class="from l">源自：3-1 静态</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9586|288748">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9586"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488110" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2204135" target="_blank"><img
													src="http://img.mukewang.com/user/5458453d0001cd0102200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2204135" target="_blank">人生赢家daru君</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">
														map 映射：<br> 存储数据成对出现（key键，value值），通过键找到值
													</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa6f7300016bfc12800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9597/922" title="回放视频" target="_blank">15:22</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9597/922" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">15:22</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa6f7300016bfc12800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="2天前" class="l timeago">时间：2天前</span> <a
														href="/video/9597" class="from l">源自：6-1 标准模板库</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9597|2204135">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9597"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="488001" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2204135" target="_blank"><img
													src="http://img.mukewang.com/user/5458453d0001cd0102200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2204135" target="_blank">人生赢家daru君</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">vector常用函数</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa65d60001c91812800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9597/241" title="回放视频" target="_blank">04:01</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9597/241" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">04:01</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa65d60001c91812800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="3天前" class="l timeago">时间：3天前</span> <a
														href="/video/9597" class="from l">源自：6-1 标准模板库</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9597|2204135">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9597"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
										<li id="487827" class="post-row">
											<div class="media">
												<a href="/space/u/uid/2204135" target="_blank"><img
													src="http://img.mukewang.com/user/5458453d0001cd0102200220-40-40.jpg"
													width="40" height="40"></a>
											</div>
											<div class="bd">
												<div class="tit">
													<a href="/space/u/uid/2204135" target="_blank">人生赢家daru君</a>
												</div>
												<div class="js-notelist-content notelist-content">
													<p class="autowrap">初始化vector对象的方式：</p>
													<div class="notelist-content-more">
														<a href="javascript:;" class="js-toggle-content">[
															查看全文 ]</a>
													</div>
												</div>
												<div class="answercon">
													<div class="answerImg answer-img js-answer-img-small"
														id="ansmallPic">
														<img
															src="http://img.mukewang.com/55fa57f300019c1712800720-156-88.jpg"
															width="156" height="88">
														<!-- <span class="intertime playtime_AS">
            <a href="/video/9597/136" title="回放视频" target="_blank">02:16</a>
          </span> -->
														<a href="javascript:;" class="ctrl ctrl-img">看截图</a> <a
															href="/video/9597/136" class="ctrl ctrl-video"
															target="_blank">看视频</a> <em class="time">02:16</em>
													</div>
													<div
														class="answerImg answer-img answer-img-big js-answer-img-expand"
														id="anbigPic" style="display: none;">
														<img
															src="http://img.mukewang.com/55fa57f300019c1712800720-500-284.jpg"
															width="500" height="284">
													</div>

												</div>
												<div class="footer clearfix">
													<span title="3天前" class="l timeago">时间：3天前</span> <a
														href="/video/9597" class="from l">源自：6-1 标准模板库</a>
													<div class="actions r">

														<a title="采集" href="javascript:;"
															class="Jcollect post-action " data-mid="9597|2204135">
															<span class="icon-star "></span> <em>0</em>
														</a> <a title="赞" href="javascript:;"
															class="Jpraise post-action " data-mid="9597"> <span
															class="icon-thumb"></span> <em>0</em>
														</a>
													</div>
												</div>
											</div>
										</li>
									</ul>
									<div class="page">
										<span class="disabled_page">首页</span><span
											class="disabled_page">上一页</span><a href="javascript:void(0)"
											class="active">1</a><a href="/course/note/id/477?page=2">2</a><a
											href="/course/note/id/477?page=3">3</a><a
											href="/course/note/id/477?page=2">下一页</a><a
											href="/course/note/id/477?page=3">尾页</a>
									</div>
								</div></c:when>
                </c:choose>
				</div>
				<div class="aside r">
					<div class="bd">
						<div class="box mb40">
							<h4>资料下载</h4>
							<ul class="downlist">
								<li><span><i class="icon icon-folder"></i>第五章参考代码</span> <a
									href="http://img.mukewang.com/down/5385b1cb0001bb7d00000000.rar"
									class="downcode" target="_blank" download="" data-id="19"
									title="">下载</a></li>
								<li><span><i class="icon icon-folder"></i>环境变量配置资料</span> <a
									href="http://img.mukewang.com/down/546d53630001d4e400000000.rar"
									class="downcode" target="_blank" download="" data-id="358"
									title="">下载</a></li>
							</ul>
						</div>
						<div class="box mb40">
							<h4>讲师提示</h4>
							<div class="teacher-info">
								<a href="/space/teacher/id/112258" target="_blank"> <img
									src="${auother.avatar }"
									width="80" height="80">
								</a> <span class="tit"> <a href="/space/teacher/id/112258"
									target="_blank">${auother.nickname }</a><i class="icon-imooc"></i>
								</span> <span class="job">${auother.title.name }</span>
							</div>
							<div class="course-info-tip">
								<dl class="first">
									<dt>课程须知</dt>
									<dd class="autowrap">${course.info }</dd>
								</dl>
								<dl>
									<dt>老师告诉你能学到什么？</dt>
									<dd class="autowrap">${course.learnthing }/dd>
								</dl>
							</div>
						</div>
						<div class="box">
							<div class="box-hd clearfix">
								<a href="javascript:;" class="refresh r js-refresh-classmates">换一批</a>
								<h4>
									你的同学<small>153537人</small>
								</h4>
							</div>
							<div class="users-mini-wrap">
								<ul class="users-mini" id="users-mini">
									<li class=""><a href="/space/u/uid/100095" target="_blank"
										title="user_0004"><img
											src="http://img.mukewang.com/user/533e4c640001354402000200-80-80.jpg"
											width="80" height="80" title="user_0004" alt="user_0004"></a>
									</li>
									<li class=""><a href="/space/u/uid/103574" target="_blank"
										title="遗失在雨季的雨"><img
											src="http://img.mukewang.com/user/530f43e600016a6401800180-80-80.jpg"
											width="80" height="80" title="遗失在雨季的雨" alt="遗失在雨季的雨"></a></li>
									<li class=""><a href="/space/u/uid/104408" target="_blank"
										title="股人禅说"><img
											src="http://img.mukewang.com/user/531f135100011d2d01800180-80-80.jpg"
											width="80" height="80" title="股人禅说" alt="股人禅说"></a></li>
									<li class="row-last"><a href="/space/u/uid/105735"
										target="_blank" title="冰雨"><img
											src="http://img.mukewang.com/user/5330ecf100010e1800980086-80-80.jpg"
											width="80" height="80" title="冰雨" alt="冰雨"></a></li>
									<li class=""><a href="/space/u/uid/106757" target="_blank"
										title="武方博"><img
											src="http://img.mukewang.com/user/533ba3e00001a58b01000100-80-80.jpg"
											width="80" height="80" title="武方博" alt="武方博"></a></li>
									<li class=""><a href="/space/u/uid/108510" target="_blank"
										title="应学"><img
											src="http://img.mukewang.com/user/5333a17a0001592502000200-80-80.jpg"
											width="80" height="80" title="应学" alt="应学"></a></li>
									<li class=""><a href="/space/u/uid/108753" target="_blank"
										title="思凡"><img
											src="http://img.mukewang.com/user/533e4c910001a72d02000200-80-80.jpg"
											width="80" height="80" title="思凡" alt="思凡"></a></li>
									<li class="row-last"><a href="/space/u/uid/110440"
										target="_blank" title="丁小莫"><img
											src="http://img.mukewang.com/user/534ea08e00011aa801000100-80-80.jpg"
											width="80" height="80" title="丁小莫" alt="丁小莫"></a></li>
									<li class=""><a href="/space/u/uid/110559" target="_blank"
										title="墨 城"><img
											src="http://img.mukewang.com/user/534f8c6d000158b601000100-80-80.jpg"
											width="80" height="80" title="墨 城" alt="墨 城"></a></li>
									<li class=""><a href="/space/u/uid/113679" target="_blank"
										title="Chen_Junxian"><img
											src="http://img.mukewang.com/user/533e4cc800016ffd02200220-80-80.jpg"
											width="80" height="80" title="Chen_Junxian"
											alt="Chen_Junxian"></a></li>
									<li class=""><a href="/space/u/uid/114290" target="_blank"
										title="helloboy"><img
											src="http://img.mukewang.com/user/533e4ca50001117901990200-80-80.jpg"
											width="80" height="80" title="helloboy" alt="helloboy"></a>
									</li>
									<li class="row-last"><a href="/space/u/uid/114483"
										target="_blank" title="gang__sun"><img
											src="http://img.mukewang.com/user/5369b95c0001d57801800180-80-80.jpg"
											width="80" height="80" title="gang__sun" alt="gang__sun"></a>
									</li>
									<li class=""><a href="/space/u/uid/114573" target="_blank"
										title="linKB"><img
											src="http://img.mukewang.com/user/5333a0aa000121d702000200-80-80.jpg"
											width="80" height="80" title="linKB" alt="linKB"></a></li>
									<li class=""><a href="/space/u/uid/114976" target="_blank"
										title="潘长宁"><img
											src="http://img.mukewang.com/user/536c3d41000152a001800180-80-80.jpg"
											width="80" height="80" title="潘长宁" alt="潘长宁"></a></li>
									<li class=""><a href="/space/u/uid/116280" target="_blank"
										title="飞飞_0002"><img
											src="http://img.mukewang.com/user/5333a207000118af02200220-80-80.jpg"
											width="80" height="80" title="飞飞_0002" alt="飞飞_0002"></a></li>
									<li class="row-last"><a href="/space/u/uid/117072"
										target="_blank" title="神一般的黑小麦"><img
											src="http://img.mukewang.com/user/5372c4150001caa901800180-80-80.jpg"
											width="80" height="80" title="神一般的黑小麦" alt="神一般的黑小麦"></a></li>
									<li class=""><a href="/space/u/uid/117116" target="_blank"
										title="Bobo117116"><img
											src="http://img.mukewang.com/user/5372cd0e0001949601000100-80-80.jpg"
											width="80" height="80" title="Bobo117116" alt="Bobo117116"></a>
									</li>
									<li class=""><a href="/space/u/uid/117251" target="_blank"
										title="茶韵山色"><img
											src="http://img.mukewang.com/user/5373184b0001cc7301000100-80-80.jpg"
											width="80" height="80" title="茶韵山色" alt="茶韵山色"></a></li>
									<li class=""><a href="/space/u/uid/117896" target="_blank"
										title="史木"><img
											src="http://img.mukewang.com/user/537575440001a1c101000100-80-80.jpg"
											width="80" height="80" title="史木" alt="史木"></a></li>
									<li class="row-last"><a href="/space/u/uid/118273"
										target="_blank" title="natlaw"><img
											src="http://img.mukewang.com/user/533e52b90001456f02000200-80-80.jpg"
											width="80" height="80" title="natlaw" alt="natlaw"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<!-- 学过该课的人还学过 -->
			<jsp:include page="/WEB-INF/jsps/common/other_learned.jsp"></jsp:include>
		</div>

	</div>


	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>

	<script type="text/javascript">
  (function(){
    var imgPic = GC.course.pic || 'http://img.mukewang.com/static/img/common/logo.png',
        text = '我正在#慕课网#学习一门很不错的课程【' + GC.course.name + '】,如果想在IT技能上赶超我，快来挑战吧！', //节名称
        url = 'http://www.mukewang.com' + window.location.pathname;

    window._bd_share_config = {
        "common": {
            "bdUrl": url,
            "bdSnsKey": {
              'tsina':'2788596354'
            },
            "bdText": text,
            "bdMini": "2",
            "bdMiniList": false,
            "bdPic": imgPic,
            "bdStyle": "0",
            "bdSize": "16"
        },
        "share": {}
    };
    with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
  })();
</script>

<script>
	$().ready(function() {
		var sta=${statu};
		$("#"+sta).addClass("on");
		alert(sta);
     });
</script>


	</div>
</body>
</html>
