<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>管理员入口</title>  
<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/index.css">
<style type="text/css">
.error {
	color: red
}
.btn1{
	color: #FFF;
	background-color: #F00000;
	cursor: pointer;
	}
</style>
</head> 
<body>  

<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/headeradmin.jsp"></jsp:include>
	
	 <c:if test="${currentAdmin.loginName == null}">
		<!-- 管理员登录界面 -->
		<div class="container" style="margin-top:200px;margin-bottom: 400px">  
	     <form id="adminLogin" action="login"  class="well" style="width:400px;margin:0px auto;">
	      	<h3 align="center">管理员登录</h3>
			
			
			<div class="input-group">
			  <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
			  <input type="text" class="form-control" name="loginName" id="username" placeholder="用户名" onblur="validateU()" >
			</div>
			  <span id="uTip" class="error" ></span>
			
			
			<div class="input-group" style="margin-top: 10px">
			  <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
			  <input type="password" class="form-control" name="password" id="pwd" placeholder="密码"  onblur="validateP()">
			</div>
			  <span id="pTip" class="error"></span>
			
			
			<div align="center">
			<span id="signin-error" class="error"></span>
			</div>
			
			<div align="center">
			<button type="button" class="btn btn-danger" onclick="login()" style="margin-top: 10px">登陆系统</button>
			</div>
		   	</form>
	 	</div>
	</c:if>
	
	
	
	
	<!-- 管理员管理界面-->
	 <c:if test="${currentAdmin.loginName != null}">
			<jsp:include page="/WEB-INF/jsps/admin/show.jsp"></jsp:include>
				
				
	</c:if> 
	 
	 <jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 <script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/adminlogin.js"></script>
</body>  
</html>