<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
	<title>微课程-专注IT学习</title>
	
	<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/index.css">
	
</head>
<body  id="index">
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>

	<!-- 大广告 -->
	<div class="g-banner">
	  <div class="g-banner-content">
	    <div class="banner-slide" style="background-image: url(<%=request.getContextPath() %>/resources/images/index/banner2.jpg); display:block;">
	      <a href="javascript:;" style="cursor: default" class="click-help"></a>
	      <div class="inner">
	          <h3 class="banner-tit"></h3>
	          <a href="javascript:void(0);" id="js-play-video" class="more" style="background:none;">
	          	  点击观看视频，带你走进微课程
                  <img src="/microCourse/resources/images/play.png" alt=" "/>
              </a>
	      </div>
	    </div>
	  </div>
	  <div class="banner-dots"></div>
	  <a href="javascript:;" class="banner-anchor prev" style="display: none">上一张</a>
	  <a href="javascript:;" class="banner-anchor next" style="display: none">下一张</a>
	</div>
	<div id="js-index-video" class="video-container">
	  <div class="video-wrap" id="js-video-wrap">
	    <div id="js-video"></div>
	  </div>
	  <div class="video-mask"></div>
	  <div id="js-video-close" class="video-close"></div>
	</div>
	<div id="characters" class="characters idx-minwidth">
	  <div class="idx-width">
	    <div class="characters-wrap">
	      <span class="char-icon1 hide-text" >专注IT学习</span>
	      <span class="char-icon2 hide-text" >聚焦实战开发</span>
	      <span class="char-icon3 hide-text" >课程完全免费</span>
	    </div>
	  </div>
	</div>
	
	
	<div id="intro1" class="intro intro1 bg-grey idx-minwidth">
	  <div class="intro1-wrap idx-width">
	    <div class="intro1-star" ></div>
	    <div class="intro1-video-wrap">
	      <div class="intro1-video" ></div>
	    </div>
	    <div class="intro1-text hide-text" >精心制作的视频课程。老师都技术大牛实战派。课程内容接地气，实际工作用得着。</div>
	  </div>
	</div>
	<div id="intro2" class="intro intro2 bg-white idx-minwidth">
	  <div class="intro2-wrap idx-width">
	    <div class="intro2-text hide-text" >实时交互的在线编程，无需配置任何编程环境，直接就能在线学习编程。省时省力省心。</div>
	    <div class="intro2-computer1" ></div>
	    <div class="intro2-computer2" ></div>
	  </div>
	</div>
	<div id="intro3" class="intro intro3 bg-grey idx-minwidth">
	  <div class="intro3-wrap idx-width">
	    <div class="intro3-calendar" ></div>
	    <div class="intro3-smoke" ></div>
	    <div class="intro3-rockets" ></div>
	    <div class="intro3-text hide-text" >循序渐近的学习计划，专治各种学习编程迷茫症。有目标有路径，一切尽在掌握中。</div>
	  </div>
	</div>
	<div id="intro4" class="intro intro4 bg-white idx-minwidth">
	  <div class="intro4-wrap idx-width">
	    <div class="intro4-text hide-text" >互帮互助的问答社区，有问有答有分享。老师学员同交流，高手小白共进步。</div>
	    <div class="intro4-hand" ></div>
	    <div class="intro4-icon" ></div>
	  </div>
	</div>

	<div id="mooc-dynamic" class="dynamic bg-grey idx-minwidth">
	  <div id="dynamic-wrap" class="dynamic-wrap idx-width">
	    <div id="dynamic-left" class="dynamic-left"></div>
	    <div id="dynamic-right" class="dynamic-right"></div>
	      <ul class="dynamic-group clearfix">
	        <li>
	        	<a href="http://www.imooc.com/activity/javaerindex" target="_blank">
	        		<img src="http://img.mukewang.com/55682623000179d404000200.jpg" alt="java学习专题">
	        	</a>
	        </li>
	        <li>
	        	<a href="http://www.imooc.com/mobile/app">
	        		<img src="http://img.mukewang.com/55dfcb37000114b104000200.jpg" alt="慕课网APP" />
	        	</a>
	        </li>
	                
	        <li>
	        	<a href="http://www.ituring.com.cn/book/1605" target="_blank">
	        		<img src="http://img.mukewang.com/556e52720001505804000200.jpg" alt="图灵合作图书推广" />
	        	</a>
	        </li>
	       </ul>
	  </div>
	</div>
	
	<div class="icourse" class="idx-minwidth">
	  <div class="incourse-wrap idx-width">
	    <h2 class="icourse-title hide-text">课程</h2>
	    <ul class="icourse-course clearfix">
	          <li>
	                <a href="/view/436">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/55cc0b070001efb706000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>Sass使你摆脱重复编写css代码的工作。</p>
	            <span class="l icourse-new">
	                              更新至5-7
	                          </span>
	            <span class="r">
	              课程时长： 4小时55分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>sass进阶篇</h2>
	            <span class="l icourse-new">3小时前更新</span>
	            <span class="r">4430人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/486">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/55ea64dc0001197b06000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>看了这么久的控制台，该换换口味了</p>
	            <span class="l icourse-new">
	                              更新至6-1
	                          </span>
	            <span class="r">
	              课程时长： 2小时12分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>IOS基础教程之界面初体验</h2>
	            <span class="l icourse-new">5小时前更新</span>
	            <span class="r">387人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/478">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/55d18ecd00016ca606000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>应用事务解决银行转账中数据不一致问题！</p>
	            <span class="l icourse-new">
	                              更新至7-1
	                          </span>
	            <span class="r">
	              课程时长： 2小时 0分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>Spring事务管理</h2>
	            <span class="l icourse-new">7小时前更新</span>
	            <span class="r">4866人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/484">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/55d6ca740001f2ad06000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>重点概念、常见问题及解决方案</p>
	            <span class="l ">
	                              更新至6-1
	                          </span>
	            <span class="r">
	              课程时长： 2小时22分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>Android-屏幕适配全攻略</h2>
	            <span class="l ">1天前更新</span>
	            <span class="r">9211人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/489">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/55e3bbf90001bb3706000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>实现微信APP中的图片选择器，综合案例不容错过！</p>
	            <span class="l ">
	                              更新至8-1
	                          </span>
	            <span class="r">
	              课程时长： 3小时 1分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>Android-仿微信图片选择器</h2>
	            <span class="l ">1天前更新</span>
	            <span class="r">3764人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/269">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/549bbf110001019406000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>JSP课程的姐妹篇，JAVA Web开发的核心。</p>
	            <span class="l ">
	                              更新至2-13
	                          </span>
	            <span class="r">
	              课程时长： 3小时10分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>JAVA遇见HTML——Servlet篇</h2>
	            <span class="l ">2天前更新</span>
	            <span class="r">22814人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/166">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/53e815520001911306000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>带你轻松的学习JSP基础知识，开启JAVA WEB开发的大门。</p>
	            <span class="l ">
	                              更新至8-8
	                          </span>
	            <span class="r">
	              课程时长： 7小时 0分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>JAVA遇见HTML——JSP篇</h2>
	            <span class="l ">2天前更新</span>
	            <span class="r">35438人学习</span>
	          </div>
	        </a>
	      </li>
	          <li>
	                <a href="/view/493">
	          <div class="icourse-img">
	            <img src="http://img.mukewang.com/55ed400f000103a406000338-280-160.jpg" alt="">
	          </div>
	                  <div class="icourse-intro clearfix">
	            <p>APP中的熟面孔，索引列表的实现！</p>
	            <span class="l ">
	                              更新至3-2
	                          </span>
	            <span class="r">
	              课程时长： 1小时42分
	            </span>
	          </div>
	          <div class="icourse-tips clearfix">
	            <h2>Android高级特效-索引</h2>
	            <span class="l ">2天前更新</span>
	            <span class="r">1553人学习</span>
	          </div>
	        </a>
	      </li>
	        </ul>
	    <div class="icourse-footer">
	      <a href="/course/list">全部课程</a>
	    </div>
	  </div>
	</div>

	<div class="footer bg-white idx-minwidth">
	  <div class="container">
	    <div class="footer-wrap idx-width">
	      <div class="footer-sns">
	        <a href="http://weibo.com/u/3306361973" class="footer-sns-weibo hide-text" target="_blank" title="新浪微博">新浪微博</a>
	        <a href="javascript:void(0);" class="footer-sns-weixin" target="_blank" title="微信">
	          <i class="footer-sns-weixin-expand"></i>
	        </a>
	        <a href="http://t.qq.com/mukewang999" class="footer-sns-qqweibo hide-text" target="_blank" title="腾讯微博">腾讯微博</a>
	        <a href="http://user.qzone.qq.com/1059809142/" class="footer-sns-qzone hide-text" target="_blank" title="QQ空间">QQ空间</a>
	      </div>
	    </div>
	    <div class="footer-link">
	      <a href="/about/us" title="关于我们">关于我们</a>
	      <a href="/about/job" title="人才招聘">人才招聘</a>
	      <a href="/about/recruit" title="讲师招募">讲师招募</a>
	      <a href="/about/contact" title="联系我们">联系我们</a>
	      <a href="/user/feedback" title="意见反馈">意见反馈</a>
	    </div>
	        <div class="friendly-link">
	      <span>友情链接：</span>
	            <a href="http://hao.360.cn" target="_blank" title="360导航">360导航</a>
	            <a href="http://www.php-z.com/" target="_blank" title="PHP站中文网">PHP站中文网</a>
	            <a href="http://www.hao123.com" target="_blank" title="hao123">hao123</a>
	            <a href="http://www.lagou.com" target="_blank" title="拉勾网">拉勾网</a>
	            <a href="http://www.admin10000.com/" target="_blank" title="web开发者">web开发者</a>
	            <a href="/about/friendly" title="友情链接">更多...</a>
	    </div>
	        <div class="footer-copyright">
	      		Copyright © 2015 社会计算组  All Rights Reserved
	    	</div>
	  </div>
	</div>

</body>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/login-regist.js"></script>

  	<script type="text/javascript" src="/microCourse/resources/sea-modules/seajs/seajs/2.1.1/sea.js"></script>
	<script type="text/javascript" src="/microCourse/resources/sea_config.js"></script>
	<script type="text/javascript">seajs.use("/microCourse/resources/page/index/index");</script>
  	
</html>