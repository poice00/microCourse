<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>邮箱验证-微课程</title>  
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common-less.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/login.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/settings.css" />
		
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div id="main">

<div class="wcontainer set-space-cont clearfix">
  <div class="setting-left l">
    <ul class="wrap-boxes">
      <li>
        <a href="/microCourse/user/profile" class="onactive">个人资料</a>
      </li>
      <li>
         <a href="/microCourse/user/avatar">头像设置</a>
       </li>
      <li class="nav-active">
        <a href="/microCourse/user/email">邮箱验证</a>
      </li>
      <li>
        <a href="/microCourse/user/password">修改密码</a>
      </li>
      <li>
        <a no-pjajx="" href="/microCourse/user/bindsns">绑定帐号</a>
      </li>
    </ul>
  </div>
  <div class="setting-right ">
    <div class="setting-right-wrap wrap-boxes settings">
        
<div class="setting-verify">
	<h1>当前邮箱</h1>
	<p>yanbaobin@yeah.net</p>
		<div class="verify-status verified-status">
		<i class="verify-on-icon"></i>
		<div>邮箱已验证</div>	
	</div>
	<button data-mail="yanbaobin@yeah.net" class="js-resetemail rlf-btn-blue">更改邮箱</button>
	</div>

    </div>
  </div>
</div>

</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>