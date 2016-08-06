<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>${course.name }</title>
 	<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common-less.css">
	
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
        <a href="/course/list">课程</a>
                <i class="path-split">\</i><a href="/microCourse/course/list?c=${course.classify.orientation.hrefName }">${course.classify.orientation.name }</a>
                <i class="path-split">\</i><a href="/microCourse/course/list?c=${course.classify.hrefName }">${course.classify.name }</a>
                <i class="path-split">\</i><span>${course.name }</span>
    </div>
    <div class="hd">
      <h2 class="l">${course.name }</h2>
          </div>
    <div class="statics clearfix">
      <div class="static-item ">
        <span class="meta-value"><strong>${course.level }</strong></span>
        <span class="meta">难度</span>
        <em></em>
      </div>
      <div class="static-item static-time">
       <!--  <span class="meta-value"><strong> 2</strong>小时<strong>12</strong>分</span> -->
       <span class="meta-value"><strong>${course.duration }</strong></span>
        <span class="meta">时长</span>
        <em></em>
      </div>
      <div class="static-item">
        <span class="meta-value"><strong>${course.learnCount }</strong></span>
        <span class="meta">学习人数</span>
        <em></em>
      </div>
    </div>
    <div class="extra">
      <div class="share-action r bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1442025873363">
        分享
        <a href="javascript:;" class="share wx js-share" data-cmd="weixin" title="分享到微信"></a>
        <a href="javascript:;" class="share sina js-share" data-cmd="tsina" title="分享到新浪微博"></a>
        <a href="javascript:;" class="share qq js-share" data-cmd="qzone" title="分享到QQ空间"></a>
      </div>
      <i class="split-line r"></i>
            <a href="javascript:;" data-cmd="follow" class="follow-action r js-follow-action" data-cid="486">
        关注
      </a>
          </div>
  </div>
  <div class="info-bg" id="js-info-bg">
    <div class="cover-img-wrap">
      <img data-src="http://img.mukewang.com/55ea64dd0001b56e06000338.jpg" alt="" style="display: none" id="js-cover-img">
    </div>
    <div class="cover-mask"></div>
  <canvas width="1341" height="240" class="cover-canvas" id="js-cover-canvas"></canvas></div>
</div>
<div class="course-info-main clearfix w">
  <div class="info-bar clearfix">
    <c:choose>
    <c:when test="${currentUser==null }">
      <a href="/microCourse/course/learn/${course.courseId }" class="btn-red start-study-btn r js-learn-course">体验学习</a>
    </c:when>
    <c:otherwise>
    <a href="/microCourse/course/learn/${course.courseId }" class="btn-red start-study-btn r js-learn-course">体验学习</a>
    </c:otherwise>
    </c:choose>       
      </div>
  <div class="content-wrap">
    <div class="content">
      <div class="course-brief">
        <h3 class="ctit">课程介绍</h3>
        <p class="auto-wrap">${course.description }</p>
      </div>
      <div class="course-outline">
        <div class="bar clearfix">
          <h3 class="ctit l">课程提纲</h3>
          <ul class="tools l">
            <li class="l">
              ${course.videoCount }<i class="icon-video"></i><span>视频</span>
            </li>
            <li class="l">
              ${course.exerciseCount }<i class="icon-test"></i><span>练习题</span>
            </li>
            <li class="l">
              ${course.practiceCount }<i class="icon-code"></i><span>编程练习</span>
            </li>
          </ul>
        </div>
        <div class="outline-list">
                      <ul>
                  <c:forEach items="${chapterslist}" var="chapter">
                   <li class="chapter clearfix ">
                  <i class="chapter-icon"></i>
                  <div class="chapter-bd l">
                      <h5 class="name">${chapter.name}</h5>
                      <p class="desc">${chapter.chapbrief}</p>
                  </div>
                </li>
                 </c:forEach>
             </ul>
        </div>
      </div>
    </div>
    <div class="aside r">
      <div class="bd">
      <div class="box mb40">
      <h4>讲师提示</h4>
            <div class="teacher-info">
        <a href="/microCourse/course/teacher/${course.user.userId }" target="_blank">
          <img src="http://img.mukewang.com/user/5530d35800013ba305680568-80-80.jpg" width="80" height="80">
        </a>
        <span class="tit">
          <a href="/microCourse/course/teacher" target="_blank">${course.user.nickname }</a><i class="icon-imooc"></i>
        </span>
        <span class="job"></span>
      </div>
                  <div class="course-info-tip">
                <dl class="first">
          <dt>课程须知</dt>
          <dd class="autowrap">${course.info }</dd>
        </dl>
                        <dl>
          <dt>老师告诉你能学到什么？</dt>
          <dd class="autowrap">${course.learnthing }</dd>
        </dl>
              </div>
        </div>
    </div>    </div>
  </div>
  <div class="clear"></div>
  	    
	<!-- 学过该课的人还学过 -->
	<jsp:include page="/WEB-INF/jsps/common/other_learned.jsp"></jsp:include>
  </div>
<!-- 视频介绍 -->
<div id="js-video-wrap" class="video pop-video" style="display:none">
    <div class="video_box" id="js-video"></div>
    <a href="javascript:;" class="pop-close icon-close"></a>
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
<div class="mask"></div>


<div style="display: none">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Ff0cfcccd7b1393990c78efdeebff3968' type='text/javascript'%3E%3C/script%3E"));
(function (d) {
window.bd_cpro_rtid="rHT4P1c";
var s = d.createElement("script");s.type = "text/javascript";s.async = true;s.src = location.protocol + "//cpro.baidu.com/cpro/ui/rt.js";
var s0 = d.getElementsByTagName("script")[0];s0.parentNode.insertBefore(s, s0);
})(document);
</script>
</div>
</body>
</html>
