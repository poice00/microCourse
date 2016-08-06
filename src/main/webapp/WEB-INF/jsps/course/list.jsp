<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>实战开发课程_IT培训精品课程_微课程</title>

	<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/course-list.css" />

</head>
<body id="List_courseId">

	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	<div id="main">
		<div class="container">
			<div class="course-content">
				<div class="course-nav-box">
					<div class="course-nav-hd">
						<span>全部课程</span> 
						
						 <p:permission operateID="/join_lecture">
							<a href="/microCourse/user/join_lecture"
								class="for-teacher hide-text" title="应聘讲师" target="_blank">应聘讲师</a>
							</p:permission>
						 <p:permission operateID="/course/add">
							<a href="#"  class="" title="上传课程" target="_blank">上传课程</a>
							</p:permission>

					</div>
					<div class="course-nav-row clearfix">
						<span class="hd l">方向：</span>
						<div class="bd">
							<ul class="">
							<c:choose><c:when test="${orientationId eq 0 }">
								<li class="course-nav-item on"><a href="/microCourse/course/list">全部</a>
								</li>
								</c:when>
								<c:otherwise>
								<li class="course-nav-item"><a href="/microCourse/course/list">全部</a>
								</li>
								</c:otherwise>
							</c:choose>

								<c:forEach items="${orientationslist}" var="orientation">
								<c:choose><c:when test="${orientationId eq orientation.orientationId }">
								<li class="course-nav-item on">
									<a href="/microCourse/course/list?c=${orientation.hrefName}" >${orientation.name}</a>
								</li>
								</c:when>
								<c:otherwise>
								<li class="course-nav-item">
									<a href="/microCourse/course/list?c=${orientation.hrefName}" >${orientation.name}</a>
								</li>
								</c:otherwise>
								</c:choose>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="course-nav-row clearfix">
						<span class="hd l">分类：</span>
						<div class="bd">
							<ul class="">
								<c:choose>
							    <c:when test="${classifyId eq 0 }">
							    <li class="course-nav-item on">
							    </c:when>
							    <c:otherwise>
							    <li class="course-nav-item ">
							    </c:otherwise>
							    </c:choose>
							    <c:choose>
							    <c:when test="${orientationName eq null && is_easy eq 0}">
							    <a href="/microCourse/course/list?c=">全部</a>
							    </c:when>
							    <c:otherwise>
							    <a href="/microCourse/course/list?c=${orientationName }&is_easy=${is_easy } ">全部</a>
							    </c:otherwise>
							    </c:choose>
								
								<c:forEach items="${classifieslist}" var="classify">
								<c:choose>
							    <c:when test="${classifyId eq classify.classifyId }">
							    <li class="course-nav-item on">
							    </c:when>
							    <c:otherwise>
							    <li class="course-nav-item ">
							    </c:otherwise>
							    </c:choose>
							    <c:choose>
							    <c:when test="${is_easy eq 0 }">
							    <a href="/microCourse/course/list?c=${classify.hrefName}" id="${classify.classifyId}" data-ct="fe">${classify.name}</a>
							    </c:when>
							    <c:otherwise>
							    <a href="/microCourse/course/list?c=${classify.hrefName}&is_easy=${is_easy}" id="${classify.classifyId}" data-ct="fe">${classify.name}</a>
							    </c:otherwise>
							    </c:choose>
								</c:forEach>
								
								
							</ul>
						</div>
					</div>
					<div class="course-nav-row clearfix">
						<span class="hd l">难度：</span>
						<div class="bd">
							<ul class="">
							<c:choose>
							<c:when test="${is_easy eq 0 }">
							<li class="course-nav-item on">
							</c:when>
							<c:otherwise>
							<li class="course-nav-item ">
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${classifyRealName eq null && orientationName eq null}">
							<a href="/microCourse/course/list?is_easy=0">全部</a></li>
							</c:when>
							<c:when test="${classifyRealName eq null && orientationName != null}">
							<a href="/microCourse/course/list?is_easy=0&c=${orientationName}">全部</a></li>
							</c:when>
							<c:otherwise>
							<a href="/microCourse/course/list?is_easy=0&c=${classifyRealName}">全部</a></li>
							</c:otherwise>
							</c:choose>						
							<c:choose>
							<c:when test="${is_easy eq 1 }">
							<li class="course-nav-item on">
							</c:when>
							<c:otherwise>
							<li class="course-nav-item ">
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${classifyRealName eq null && orientationName eq null}">
							<a href="/microCourse/course/list?is_easy=1">初级</a></li>
							</c:when>
							<c:when test="${classifyRealName eq null && orientationName != null}">
							<a href="/microCourse/course/list?is_easy=1&c=${orientationName}">初级</a></li>
							</c:when>
							<c:otherwise>
							<a href="/microCourse/course/list?is_easy=1&c=${classifyRealName}">初级</a></li>
							</c:otherwise>
							</c:choose>
					
							<c:choose>
							<c:when test="${is_easy eq 2 }">
							<li class="course-nav-item on">
							</c:when>
							<c:otherwise>
							<li class="course-nav-item ">
							</c:otherwise>
							</c:choose>
							<c:choose>
                            <c:when test="${classifyRealName eq null && orientationName eq null}">
							<a href="/microCourse/course/list?is_easy=2">中级</a></li>
							</c:when>
							<c:when test="${classifyRealName eq null && orientationName != null}">
							<a href="/microCourse/course/list?is_easy=2&c=${orientationName}">中级</a></li>
							</c:when>
							<c:otherwise>
							<a href="/microCourse/course/list?is_easy=2&c=${classifyRealName}">中级</a></li>
							</c:otherwise>
							</c:choose>							
							<c:choose>
							<c:when test="${is_easy eq 3 }">
							<li class="course-nav-item on">
							</c:when>
							<c:otherwise>
							<li class="course-nav-item ">
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${classifyRealName eq null && orientationName eq null}">
							<a href="/microCourse/course/list?is_easy=3">高级</a></li>
							</c:when>
							<c:when test="${classifyRealName eq null && orientationName != null}">
							<a href="/microCourse/course/list?is_easy=3&c=${orientationName}">高级</a></li>
							</c:when>
							<c:otherwise>
							<a href="/microCourse/course/list?is_easy=3&c=${classifyRealName}">高级</a></li>
							</c:otherwise>
							</c:choose>
							
							</ul>
						</div>
					</div>
				</div>
				<!-- <div class="course-tool-bar clearfix">
					<div class="tool-left l">
						<a href="/microCourse/course/view" class="sort-item active">最热</a>
						<a href="/microCourse/course/orientation" class="sort-item active">单方向</a>
						<a href="/course/list?sort=pop" class="sort-item">最热</a>
					</div>
					<div class="l">
						<span class="tool-item" style="display: none;"> <a
							class="follow-learn tool-chk" href="javascript:void(0);">跟我学</a>
						</span>
					</div>
					<div class="tool-right r">
						<span class="tool-item total-num"> 共<b>401</b>个课程
						</span> <span class="tool-item tool-pager"> <span
							class="pager-num"> <b class="pager-cur">1</b>/<em
								class="pager-total">21</em>
						</span> <a href="javascript:void(0)"
							class="pager-action pager-prev hide-text disabled">上一页</a> <a
							href="/course/list?page=2"
							class="pager-action pager-next hide-text">下一页</a>
						</span>
					</div>
				</div> -->
				<div class="course-list">
					<div class="js-course-lists">
						<ul>
						<%-- <c:choose><c:when test="${coursesinitList.size()==0 }">
						<p class="no-course-helper" style="text-align: center">
                            <span>精彩课程制作中，敬请期待！</span>
                        </p>
						</c:when><c:otherwise>
						
							<c:forEach items="${coursesinitList}" var="item">
								<li class="course-one">
								<a href="/microCourse/course/view/${item.courseId }"
									target="_self">
										<div class="course-list-img">
											<img width="240" height="135" alt="${item.name }"
												src="<%=request.getContextPath()%>/${item.logo }">
										</div>
										<h5>
										<c:choose>
										<c:when test="${couser. }">
										</c:when>
										</c:choose>
										   <i class="learned">已学</i>
											<span>${item.name }</span>
										</h5>
										<div class="tips">
											<p class="text-ellipsis">${item.slogan }</p>
												<span class="l">${item.status }</span> <span class="l ml20">
													${item.learnCount } 人学习</span>
										</div> <span class="time-label">${item.duration }</span> 
										<b class="follow-label">跟我学</b>
								</a></li>
							</c:forEach>
							</c:otherwise>
							</c:choose>	 --%>	
							${courselist }				
						</ul>
					</div>
					<div class="page">
						${pageInfo }
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>

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
