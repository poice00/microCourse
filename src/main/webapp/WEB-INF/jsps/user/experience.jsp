<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<title>${currentUser.nickname }</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/experience.css" />
		
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div class="main-body container clearfix">
  <div class="l">
                  <div class="sider">
    <div class="user-info">
        <span class="user-pic">
              <c:choose>
				<c:when test="${currentUser.avatar==null }">
					<img src="<%=request.getContextPath() %>/resources/images/default.jpg" width="220" height="220">
				</c:when>
				<c:otherwise>
					<img src="${currentUser.avatar}" width="220" height="220">
				</c:otherwise>
			</c:choose>
        </span>
        <ul class="user-lay">
            <li class="mynick-name">
                <span class="user-name">${currentUser.nickname }</span>
            </li>
            <li>
                <span class="user-site"> 学生 </span>
            </li>
                        <li><a href="/user/userinfo" class="user-setup">设置</a></li>
                                </ul>
    </div>
    <div class="user-desc">
        <div class="sign-wrap">
                        <p id="signed" class="signed">
                <strong>这位童鞋很懒，什么也没有留下～～！</strong>
                <em class="publish-sign" id="publishsign"></em>
            </p>
            <textarea class="sign-editor" id="js-sign-editor">这位童鞋很懒，什么也没有留下～～！</textarea>
            <p id="rlf-tip-wrap" class="rlf-tip-wrap"></p>
                    </div>
    </div>
    <ul class="mp clearfix">
        <li class="l mp-item">
          <span class="mp-atag">
            <p class="mp-num">132小时22分</p>
            <p class="mp-title">学习</p>
          </span>
        </li>
        <li class="mp-item">
          <a class="mp-atag" href="/space/experience">
                        <span class="mp-num mp-hover">
                5166            </span>
                        <span class="mp-title mp-hover">经验</span>
          </a>
        </li>
    </ul>
    <ul class="nav">
        <li>
            <a class="js-count-course " href="/space/index"><i class="icon-nav icon-tick"></i>我的课程<em class="got-num">32</em></a>
                    </li>
        <li>
            <a class="js-count-plan " href="/space/program"><i class="icon-nav icon-plan"></i>我的计划<em class="got-num">3</em></a>
        </li>
        <li>
            <a class="js-count-note " href="/space/note"><i class="icon-nav icon-note"></i>我的笔记<em class="got-num">0</em></a>
        </li>
                <li>
            <a class="" href="/space/code"><i class="icon-nav icon-code"></i>我的代码<em class="got-num">193</em></a>
        </li>
        <li class="rd-dissu">
            <a class="read-mine" href="/myclub/myquestion/t/ques">查看我的社区</a>
            <p class="read-notice">看看里面有什么好玩的事情吧～～</p>
        </li>
            </ul>
        <div class="recent-visitors">
        <h4>最近访客</h4>
        <div class="visitors-box clearfix">
                                    <a href="/space/u/uid/1042189" class="visitor-pic" target="_blank">
                <img src="http://img.mukewang.com/55926a620001f45801600210-80-80.jpg" title="黑店老板">
            </a>
                                </div>
    </div>
    </div><!--sider end-->
  </div>
  <div class="r space-main">
    
<div class="family">
        <h1 class="family-hd">经验</h1>
    </div>

    
<div id="js-grade-scroll" class="myspace-courselist myspace-bg r experience_content">
    <div class="experience_head clearfix">
        <div class="block mp">
            <div class="num">5166</div>
            <p>您当前的经验</p>
        </div>
        <div class="block percent">
            <span>您比昨天</span>
            <em class="num">
                                    <i class="down">↓</i>
                                                <var class="n-grading">50</var>
            </em>
            <span>位</span>
        </div>
    </div>
    <div class="grade-title">好好学习，天天向上！</div>
    <div class="grade-wrap">
        <div id="js-space-grade" class="space-grade">
            <ul class="slide-grade" style="width: 1450px;">
                                <li class="pro-statu-high">
                    <div class="space-process">
                                                                                    <i class="icon icon-greydot"></i>
                                                                        </div>
                    <div class="grade-bd">
                        <p class="now-grade">5400</p>
                        <a href="/space/u/uid/105553">
                            <img src="http://img.mukewang.com/532e8a0f00011ffd01000100-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">我就不信这...</p>
                    </div>
                </li>
                                <li class="pro-statu-high">
                    <div class="space-process">
                                                                                    <i class="icon icon-greydot"></i>
                                                                        </div>
                    <div class="grade-bd">
                        <p class="now-grade">5328</p>
                        <a href="/space/u/uid/110765">
                            <img src="http://img.mukewang.com/53fc8487000122e604500528-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">海绵宝宝11...</p>
                    </div>
                </li>
                                <li class="pro-statu-high">
                    <div class="space-process">
                                                                                    <i class="icon icon-greydot"></i>
                                                                        </div>
                    <div class="grade-bd">
                        <p class="now-grade">5290</p>
                        <a href="/space/u/uid/115453">
                            <img src="http://img.mukewang.com/5501390c0001ef7402400240-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">一寺一僧...</p>
                    </div>
                </li>
                                <li class="pro-statu-high">
                    <div class="space-process">
                                                                                    <i class="icon icon-greydot"></i>
                                                                        </div>
                    <div class="grade-bd">
                        <p class="now-grade">5237</p>
                        <a href="/space/u/uid/111555">
                            <img src="http://img.mukewang.com/5357d3fd0001115601000100-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">may123</p>
                    </div>
                </li>
                                <li class="pro-statu-high">
                    <div class="space-process">
                                                                                    <i class="icon icon-greydot"></i>
                                                                        </div>
                    <div class="grade-bd">
                        <p class="now-grade">5181</p>
                        <a href="/space/u/uid/112240">
                            <img src="http://img.mukewang.com/5333a01a0001ee5302000200-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">amibeo</p>
                    </div>
                </li>
                                <li class="pro-statu-my">
                    <div class="space-process">
                                                                                    <i class="icon icon-larrow"></i>
                                                                        </div>
                    <div class="grade-bd">
                        <p class="now-grade">5166</p>
                        <a href="/space/index">
                            <img src="http://img.mukewang.com/5333a1a90001c8d802000200-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">monkey_92</p>
                    </div>
                </li>
                                <li class="pro-statu-low">
                    <div class="space-process">
                                                <i class="icon icon-mdone"></i>
                                            </div>
                    <div class="grade-bd">
                        <p class="now-grade">5144</p>
                        <a href="/space/u/uid/114752">
                            <img src="http://img.mukewang.com/536b04800001115601000100-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">子非鱼_000...</p>
                    </div>
                </li>
                                <li class="pro-statu-low">
                    <div class="space-process">
                                                <i class="icon icon-mdone"></i>
                                            </div>
                    <div class="grade-bd">
                        <p class="now-grade">5100</p>
                        <a href="/space/u/uid/115044">
                            <img src="http://img.mukewang.com/53b767420001788202200220-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">黑白蓝</p>
                    </div>
                </li>
                                <li class="pro-statu-low">
                    <div class="space-process">
                                                <i class="icon icon-mdone"></i>
                                            </div>
                    <div class="grade-bd">
                        <p class="now-grade">5041</p>
                        <a href="/space/u/uid/101507">
                            <img src="http://img.mukewang.com/53fdb2af0001521706110669-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">mmnini</p>
                    </div>
                </li>
                                <li class="pro-statu-low">
                    <div class="space-process">
                                                <i class="icon icon-mdone"></i>
                                            </div>
                    <div class="grade-bd">
                        <p class="now-grade">4959</p>
                        <a href="/space/u/uid/101533">
                            <img src="http://img.mukewang.com/52c75ef10001a96401800180-100-100.jpg" width="40" height="40" alt="">
                        </a>
                        <p class="grade-name">no哚咪</p>
                    </div>
                </li>
                            </ul>
                        <a id="backward" href="javascript:;" class="backto icon-left js-set-grey"></a>
            <a id="foreward" href="javascript:;" class="foreto icon-right"></a>
                    </div>
    </div>
    <p class="explain">经验是您在慕课网学习获得的，记录点滴努力和成长。一起来做经验土豪吧：）</p>
    <table>
                <tbody><tr>
            <td class="score" width="17%">+60</td>
            <td width="25%">2015-08-29 11:47</td>
            <td width="24%">完成一门课程</td>
            <td class="link" width="34%">
                <a target="_blank" href="/learn/47">Spring MVC起步</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 11:47</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/8656">5-1 总结</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 11:44</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/8655">4-9 JSON（下）</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 11:34</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/8595">4-8 JSON（中）</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 11:28</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/8602">4-7 JSON（上）</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 11:24</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/8413">4-6 FileUpload--单文件上...</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 11:11</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/8358">4-5 Binding</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:56</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7684">4-4 Controller-传统方式</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:51</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7683">4-3 Controller-现代方式</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:42</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7682">4-2 Controller-基础代码</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:36</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7681">4-1 从配置文件开始</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:28</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7533">3-5 Hello Spring MVC</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:14</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7531">3-4 用Maven创建项目</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 10:08</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7419">3-3 Maven的配置</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 09:53</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7418">3-2 Maven的安装</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 09:49</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7417">3-1 Maven介绍</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 09:41</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7530">2-2 动态概念</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 09:34</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7501">2-1 静态概念</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 09:25</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7165">1-3 MVC概念</a>
            </td>
        </tr>
                <tr>
            <td class="score" width="17%">+10</td>
            <td width="25%">2015-08-29 09:20</td>
            <td width="24%">看完一节视频</td>
            <td class="link" width="34%">
                <a target="_blank" href="/video/7126">1-2 前端控制器</a>
            </td>
        </tr>
            </tbody></table>
    <div class="page"><span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a href="javascript:void(0)" class="active">1</a><a href="/space/experience/page/2">2</a><a href="/space/experience/page/3">3</a><a href="/space/experience/page/4">4</a><a href="/space/experience/page/5">5</a><a href="/space/experience/page/6">6</a><a href="/space/experience/page/7">7</a><a href="/space/experience/page/2">下一页</a><a href="/space/experience/page/23">尾页</a></div>
</div>

  </div>
</div>
	
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
	 
</body>  
</html>