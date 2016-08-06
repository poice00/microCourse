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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/course-list.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/teacher.css" type="text/css">
	
</head>
<body id="List_courseId">

	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	<div id="main">
		

<div class="container clearfix">
    <div class="myClassPageHead">
        <table cellpadding="0" cellspacing="0">
            <tbody><tr>
                <th> <img src="http://img.mukewang.com/user/535f03950001915501400140-220-220.jpg" width="220" height="220"></th>
                <td>
                    <dl>
                        <dt>
                            <span>${teacher.nickname }</span>
                            <span class="teacher_icon"></span>
                            <span class="teacher_iden" style="display: none;"></span>
                        </dt>

                                                <dd>${teacher.title.name }</dd>
                        
                        <dd style="min-height:70px">${teacher.introduction }</dd>

                        <dd>
                        
                        <c:choose><c:when test="${teacher.gender eq 0 }">
                                                                 男
                        </c:when>
                        <c:otherwise>
                                                              女
                        </c:otherwise>
                        </c:choose>
                                                              ，来自地球
                        </dd>

                    </dl>
                </td>
            </tr>
        </tbody></table>
    </div>

        <div class="course-list-new teacherlist">
        <ul class="clearfix"> 	
    	<c:forEach items="${coursesList}" var="item">					
		<li>
        <a href="/microCourse/course/view/${item.courseId }" target="_blank">
            <div class="course-list-img">
                <img width="280" height="160" src="<%=request.getContextPath()%>/${item.logo }" alt="${item.name }">
             </div>
            <h5><span>${item.name }</span></h5>
                            <div class="intro"><p>${item.slogan }</p><span class="l">共5章9节</span> <span class="r">课程时长：${item.duration }</span></div>
                <div class="tips"><span class="l">${item.status }</span> <span class="r">${item.learnCount }人学习</span></div>            
        </a>
        </li>
		</c:forEach>
      </ul>
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
