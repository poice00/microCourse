<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>绑定账号-微课程</title>  
		
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
		        
		<div class="setting-bindsns">
		<p>绑定第三方帐号，可以直接登录，还可以将内容同步到以下平台，与更多好友分享。</p>
		<div class="setting-bindsns-inner clearfix">
				<div class="setting-bindsns-weixin l">
				<i class="icon-weixin"></i>
				<p>未绑定帐号</p>
				<a href="/user/loginweixin?action=bindweixin" aria-role="button" hidefocus="true" class="rlf-btn-green sbtn-green js-bind ">立即绑定</a>
			</div>
					<div class="setting-bindsns-weibo l">
				<i class="icon-weibo"></i>
				<p>未绑定帐号</p>
				<a href="/user/loginweibo?action=bindweibo" aria-role="button" hidefocus="true" class="rlf-btn-green sbtn-green js-bind ">立即绑定</a>
			</div>
			
				<div class="setting-bindsns-qq l">
				<i class="icon-qq"></i>
				<p>未绑定帐号</p>
				<a href="/user/loginqq?action=bindqq" aria-role="button" hidefocus="true" class="rlf-btn-green sbtn-green js-bind">立即绑定</a>
			</div>
			</div>
		</div>
		
		
		    </div>
		  </div>
		</div>
		
	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>