<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>学习计划_微课程</title>
	
	<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/plan.css" />
	
</head>
<body  id="List_courseId">
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	
	<div id="main">
		<div class="program-wrap clearfix">
        <div class="program-main">
            <div class="program-category">
                <h2>求职路线</h2>
            </div><!--program-category end-->
            <div class="course-list job-route-list">
                <ul class="clearfix">
                	<c:forEach items="${planList}" var="plan">
                		<c:choose><c:when test="${plan.type eq 1}">
                			<li id="program_${plan.planId}">
                    	<a href="/microCourse/plan/detail/${plan.planId}" title="${plan.name}">
                        <div class="course-list-img">
                        	<img width="240" height="180" alt="${plan.name}" 
                                 src="<%=request.getContextPath()%>/${plan.logo }">
                        </div>
                        <h5>
                            <span>
                            <c:choose>
                            	<c:when test="${learned eq 1}"><i class="learned">已参加</i>
                           		</c:when>
                            </c:choose>
                            ${plan.name}</span>
                        </h5>
                        	<div class="tags">
                            	 <c:forEach items="${plan.tags}" var="tag">
                                	<span>${tag.name}</span>
                                </c:forEach> 
                            </div>
                            <div class="tips">
                                <span class="l">${plan.courseCount }门课程</span>                               
                                <span class="l ml20">${plan.learnCount }人学习</span>
                            </div>
                            </a>
                        </li>
                		</c:when></c:choose>
                      
                        </c:forEach>
                                            <!-- <li id="program_33">
                            <a href="/course/programdetail/pid/33" title="Android工程师">
                            <div class="course-list-img">
                                <img width="240" height="180" alt="Android工程师" src="http://img.mukewang.com/5567c0a50001538002400180-240-180.jpg">
                            </div>
                            <h5>
                                <span>Android工程师</span>
                            </h5>
                            <div class="tags">
                                                                <span>Android</span>
                                                                <span>求职</span>
                                                                <span>实战</span>
                                                            </div>
                            <div class="tips">
                                <span class="l">20门课程</span>                               
                                <span class="l ml20">7137人学习</span>
                            </div>
                            </a>
                        </li>
                                            <li id="program_34">
                            <a href="/course/programdetail/pid/34" title="PHP工程师">
                            <div class="course-list-img">
                                <img width="240" height="180" alt="PHP工程师" src="http://img.mukewang.com/5567c0af0001487a02400180-240-180.jpg">
                            </div>
                            <h5>
                                <span>PHP工程师</span>
                            </h5>
                            <div class="tags">
                                                                <span>PHP</span>
                                                                <span>求职</span>
                                                                <span>实战</span>
                                                            </div>
                            <div class="tips">
                                <span class="l">29门课程</span>                               
                                <span class="l ml20">5744人学习</span>
                            </div>
                            </a>
                        </li>
                                            <li id="program_31">
                            <a href="plan/detail" title="Java工程师">
                            <div class="course-list-img">
                                <img width="240" height="180" alt="Java工程师" src="http://img.mukewang.com/5567c0bb00013ef702400180-240-180.jpg">
                            </div>
                            <h5>
                                <span><i class="learned">已参加</i>Java工程师</span>
                            </h5>
                            <div class="tags">
                                                                <span>Java</span>
                                                                <span>小白</span>
                                                                <span>求职</span>
                                                            </div>
                            <div class="tips">
                                <span class="l">37门课程</span>                               
                                <span class="l ml20">8751人学习</span>
                            </div>
                            </a>
                        </li> -->
                                    </ul>
            </div>
            <div class="program-category">
                <h2>加薪利器</h2>
            </div>
            <div>
                <div class="course-nav-row clearfix">
                    <span class="hd l">方向：</span>
                    <div class="bd">
                        <ul class="">
							<li class="course-nav-item on"><a href="/microCourse/course/list">全部</a>
							</li>
							<li class="course-nav-item"><a href="/microCourse/course/list">全部</a>
							</li>
							</ul>
						</div>
					</div>
                            <!-- <li class="course-nav-item on">
                                <a href="/microCourse/course/list">全部</a>
                            </li>
                                                    <li class="course-nav-item ">
                                <a href="/course/program?c=fe">前端开发</a>
                            </li>
                                                    <li class="course-nav-item ">
                                <a href="/course/program?c=be">后端开发</a>
                            </li>
                                                    <li class="course-nav-item ">
                                <a href="/course/program?c=mobile">移动开发</a>
                            </li>
                                                    <li class="course-nav-item ">
                                <a href="/course/program?c=fsd">整站开发</a>
                            </li>
                                                </ul>
                    </div>
                </div> -->
                <div class="course-tool-bar clearfix">
                    
                    <div class="tool-left l">
                            <a href="/course/program?sort=last" class="sort-item active">最新</a>
                            <a href="/course/program?sort=pop" class="sort-item">最热</a>
                              
                    </div> 
                    <div class="tool-right r">
                        <span class="tool-item">隐藏已参加计划</a></span>
                        	<span class="tool-item total-num">共<b>24</b>个计划</span>
                        <span class="tool-item tool-pager">
                            <span class="pager-num">
                            <b class="pager-cur">1</b>/<em class="pager-total">2</em>
                            </span>
                            	<a href="javascript:void(0)" class="pager-action pager-prev hide-text disabled">上一页</a>
                                <a href="/course/program?page=2" class="pager-action pager-next hide-text">下一页</a>
                            </span>
                    </div>
                </div>
            </div>
            
            <div class="course-list salary-raise program-medias">
                <ul class="clearfix">
                	<c:forEach items="${planList}" var="plan">
                		<c:choose><c:when test="${plan.type eq 2}">
                                    <li class="course-one">
                        <a href="/microCourse/plan/detail/${plan.planId}" title="${plan.name}">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="${plan.name}" 
                                 src="<%=request.getContextPath()%>/${plan.logo }">
                        </div>
                        <h5>
                            <span>
                            <c:choose>
                            	<c:when test="${learned eq 1}"><i class="learned">已参加</i></c:when>
                            </c:choose>${plan.name}
                        </h5>
                        <div class="tags">
                            <span>C++基础</span>
                        </div>
                        <div class="tips">
                            <span class="l">${plan.courseCount }门课程</span>                               
                            <span class="l ml20">${plan.learnCount }人学习</span>
                        </div>
                        </a>
                    </li>
                         <!--           <li class="course-one">
                        <a href="/course/programdetail/pid/40" title="Oracle数据库开发必备利器">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Oracle数据库开发必备利器" src="http://img.mukewang.com/55a6338f00019d6002400180.jpg">
                        </div>
                        <h5>
                            <span>Oracle数据库开发必备利器</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>Oracle</span>
                                                                                                                                <span>数据库开发</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">6门课程</span>                               
                            <span class="l ml20">307人学习</span>
                        </div>
                        </a>
                    </li>
                                     <li class="course-one">
                        <a href="/course/programdetail/pid/39" title="Swift加薪利器-iOS动画特辑">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Swift加薪利器-iOS动画特辑" src="http://img.mukewang.com/559628bd00012a1502400180.jpg">
                        </div>
                        <h5>
                            <span>Swift加薪利器-iOS动画特辑</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>加薪</span>
                                                                                                                                <span>动画特辑</span>
                                                                                                                                <span>swift</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">7门课程</span>                               
                            <span class="l ml20">259人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/37" title="C语言学习攻略">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="C语言学习攻略" src="http://img.mukewang.com/557133ad000112c302400180.jpg">
                        </div>
                        <h5>
                            <span>C语言学习攻略</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>编程基础</span>
                                                                                                                                <span>零基础</span>
                                                                                                                                <span>C语言基础</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">4门课程</span>                               
                            <span class="l ml20">1637人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/35" title="前端经典案例集萃之 &quot;网页常用特效&quot;">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="前端经典案例集萃之 &quot;网页常用特效&quot;" src="http://img.mukewang.com/5583738e00013e3902400180.jpg">
                        </div>
                        <h5>
                            <span>前端经典案例集萃之 "网页常用特效"</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>职业必备</span>
                                                                                                                                <span>必备技能</span>
                                                                                                                                <span>实践</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">7门课程</span>                               
                            <span class="l ml20">1081人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/38" title="Tony老师聊shell">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Tony老师聊shell" src="http://img.mukewang.com/557159b70001d44602400180.jpg">
                        </div>
                        <h5>
                            <span>Tony老师聊shell</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>Linux</span>
                                                                                                                                <span>shell入门</span>
                                                                                                                                <span>加薪利器</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">6门课程</span>                               
                            <span class="l ml20">698人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/36" title="Android加薪利器——断点续传">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Android加薪利器——断点续传" src="http://img.mukewang.com/5570196a00012c1102400180.jpg">
                        </div>
                        <h5>
                            <span>Android加薪利器——断点续传</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>热门技术</span>
                                                                                                                                <span>升职加薪</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">11门课程</span>                               
                            <span class="l ml20">375人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/29" title="高德开发者必由之路——Android SDK篇">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="高德开发者必由之路——Android SDK篇" src="http://img.mukewang.com/55aef90d0001f2a502400180.jpg">
                        </div>
                        <h5>
                            <span>高德开发者必由之路——Android SDK篇</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>地图开发</span>
                                                                                                                                <span>定位检索</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">12门课程</span>                               
                            <span class="l ml20">803人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/28" title="高德开发者必由之路——JS API篇">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="高德开发者必由之路——JS API篇" src="http://img.mukewang.com/55aef9380001ebf802400180.jpg">
                        </div>
                        <h5>
                            <span>高德开发者必由之路——JS API篇</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>从基础到实践</span>
                                                                                                                                <span>地图开发</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">6门课程</span>                               
                            <span class="l ml20">925人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/26" title="前端经典案例集萃之“图片、信息展示”">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="前端经典案例集萃之“图片、信息展示”" src="http://img.mukewang.com/5567d4a900015f2b02400180.jpg">
                        </div>
                        <h5>
                            <span>前端经典案例集萃之“图片、信息展示”</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>经典案例</span>
                                                                                                                                <span>职业必备</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">8门课程</span>                               
                            <span class="l ml20">1801人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/24" title="Android加薪利器--自定义View">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Android加薪利器--自定义View" src="http://img.mukewang.com/5567d4be000168c702400180.jpg">
                        </div>
                        <h5>
                            <span>Android加薪利器--自定义View</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>Android自定义View</span>
                                                                                                                                <span>升职加薪</span>
                                                                                                                                <span>热门效果</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">7门课程</span>                               
                            <span class="l ml20">1262人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/23" title="搞定Java加解密">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="搞定Java加解密" src="http://img.mukewang.com/5567ca940001817002400180.jpg">
                        </div>
                        <h5>
                            <span>搞定Java加解密</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>Java开发</span>
                                                                                                                                <span>加密解密</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">5门课程</span>                               
                            <span class="l ml20">984人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/22" title="响应式布局那些事">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="响应式布局那些事" src="http://img.mukewang.com/5567cad70001113202400180.jpg">
                        </div>
                        <h5>
                            <span>响应式布局那些事</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>升职利器</span>
                                                                                                                                <span>bootstrap</span>
                                                                                                                                <span>前端趋势</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">4门课程</span>                               
                            <span class="l ml20">3357人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/20" title="jQuery源码探索之旅">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="jQuery源码探索之旅" src="http://img.mukewang.com/55aef92c0001bce602400180.jpg">
                        </div>
                        <h5>
                            <span>jQuery源码探索之旅</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>高手锻造</span>
                                                                                                                                <span>jQuery高手</span>
                                                                                                                                <span>框架初探</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">5门课程</span>                               
                            <span class="l ml20">2844人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/18" title="模式宗师养成宝典之Java版">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="模式宗师养成宝典之Java版" src="http://img.mukewang.com/55aefbb50001500c02400180.jpg">
                        </div>
                        <h5>
                            <span>模式宗师养成宝典之Java版</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>java</span>
                                                                                                                                <span>加薪利器</span>
                                                                                                                                <span>模式认知</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">8门课程</span>                               
                            <span class="l ml20">2394人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/17" title="从0开始学习制作QQ侧滑菜单">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="从0开始学习制作QQ侧滑菜单" src="http://img.mukewang.com/5567cb0400012b9e02400180.jpg">
                        </div>
                        <h5>
                            <span>从0开始学习制作QQ侧滑菜单</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>侧滑菜单</span>
                                                                                                                                <span>热门应用</span>
                                                                                                                                <span>Android</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">4门课程</span>                               
                            <span class="l ml20">1656人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/27" title="从零开始学习ThinkPHP框架">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="从零开始学习ThinkPHP框架" src="http://img.mukewang.com/5567d4a00001dded02400180.jpg">
                        </div>
                        <h5>
                            <span>从零开始学习ThinkPHP框架</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>职场必备</span>
                                                                                                                                <span>热门框架</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">9门课程</span>                               
                            <span class="l ml20">1872人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/25" title="Java攻城狮养成计划（入门篇）">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Java攻城狮养成计划（入门篇）" src="http://img.mukewang.com/55aefbc70001bb4802400180.jpg">
                        </div>
                        <h5>
                            <span>Java攻城狮养成计划（入门篇）</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>Java入门</span>
                                                                                                                                <span>零基础</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">9门课程</span>                               
                            <span class="l ml20">5344人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/3" title="Web前端工程师成长第一阶段(基础篇)">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Web前端工程师成长第一阶段(基础篇)" src="http://img.mukewang.com/55aef94f0001efa702400180.jpg">
                        </div>
                        <h5>
                            <span>Web前端工程师成长第一阶段(基础篇)</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>求职必备</span>
                                                                                                                                <span>前端基础</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">10门课程</span>                               
                            <span class="l ml20">24836人学习</span>
                        </div>
                        </a>
                    </li>
                                    <li class="course-one">
                        <a href="/course/programdetail/pid/14" title="Web前端工程师成长第二阶段(布局篇)">
                        <div class="course-list-img">
                            <img width="240" height="180" alt="Web前端工程师成长第二阶段(布局篇)" src="http://img.mukewang.com/5567ca0b00014b6902400180.jpg">
                        </div>
                        <h5>
                            <span>Web前端工程师成长第二阶段(布局篇)</span>
                        </h5>
                        <div class="tags">
                                                                                                <span>网页布局</span>
                                                                                                                                <span>求职必备</span>
                                                                                                                                <span>html css实战</span>
                                                                                    </div>
                        <div class="tips">
                            <span class="l">12门课程</span>                               
                            <span class="l ml20">7915人学习</span>
                        </div>
                        </a>
                    </li> -->
                   </c:when></c:choose>
                  </c:forEach>
            	</ul>
            </div>
            <div class="page">
            	<span class="disabled_page">首页</span>
            	<span class="disabled_page">上一页</span>
            		<a href="javascript:void(0)#raises" class="active">1</a><a href="/course/program?page=2#raises">2</a><a href="/course/program?page=2#raises">下一页</a><a href="/course/program?page=2#raises">尾页</a></div>
           		<ul class="program-list clearfix hide"></ul><!--program end-->
            <div class="bg-loading"></div>
        </div><!--program-main end-->
    </div>	
	</div>

	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	
</script>
</div>
</body>
</html>
    