<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<title>很抱歉_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/not-found.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">
			<div class="wrong-warp">
				<div class="broken-imgs">
					<img src="/microCourse/resources/images/besorry.png" alt="抱歉">
				</div>
				<div class="msg-wrap l">
					<em class="errorInfo l">此页面无法访问</em>
					<a href="/microCourse" class="beback">返回首页</a>
			
				</div>
			</div>
	  	</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		 
	</body>  
</html>