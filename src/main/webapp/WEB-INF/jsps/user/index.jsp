<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/login-regist.js"></script>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/saved_resource.css" />
	<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/registandlogin.css" />
</head>  
<body>  
<div align="center">
	<c:if test="${currentUser.loginName != null}">
	    <!-- 头像信息 -->
		<div id="login-area">
	            <ul class="clearfix">
	                <li class="set_btn user-card-box">
	                   <a id="header-avator" class="user-card-item"><img id="img_user" src="/microCourse/resources/images/course-img.jpg" alt="nim" class="img-circle" style="height:30px; width:30px;">
	                        <i class="myspace_remind" style="display: none;"></i>
	                        <span style="display: none;">动态提醒</span>
	                    </a>
	                    <div class="g-user-card">
	                        <div class="card-inner">
	                            <div class="card-top">
	                                <img src="/microCourse/resources/images/course-img.jpg" alt="ssy110" class="l">
	                                <span class="name text-ellipsis">${currentUser.loginName}</span>
	                                <p class="meta">
	                                    <span>经验<b id="js-user-mp">${currentUser.experienceValues}</b></span>
	                                </p>
	                            </div>
	                            <div class="card-links">
	                                <a href="#" class="my-mooc l">我的慕课<i class="dot-update"></i><span style="display: none; font-size: 12px; color: rgb(255, 255, 255); border-radius: 50%; width: 16px; height: 16px; vertical-align: middle; line-height: 16px; margin: -5px 0px 0px 5px; text-align: center; font-weight: normal; background: rgb(240, 20, 0);">0</span></a>
	                                <span class="split l"></span>
	                                <a href="#" class="my-sns l">我的社区<span style="display: none; font-size: 12px; color: rgb(255, 255, 255); border-radius: 50%; width: 16px; height: 16px; vertical-align: middle; line-height: 16px; margin: -5px 0px 0px 5px; text-align: center; font-weight: normal; background: rgb(240, 20, 0);">0</span></a>
	                            </div>
	                                                        <div class="card-history">
	                                <span class="history-item">
	                                    <span class="tit text-ellipsis">jQuery插件——Validation Plugin</span>
	                                    <span class="media-name text-ellipsis">1-1 课程介绍</span>
	                                    <i class="icon-clock"></i>
	                                    <a href="#" class="continue">继续</a>
	                                </span>
	                            </div>
	                                                        <div class="card-sets clearfix">
	                                <a href="#" class="l">个人设置</a>
	                                <a href="/microCourse/user/logout" class="r">退出</a>
	                            </div>
	                        </div>
	                        <i class="card-arr"></i>
	                    </div>
	                </li>
	            </ul>
	        </div>
		<!-- 显示信息内容 -->
    </c:if>
    
    <c:if test="${currentUser.loginName == null}">
	<!-- 登陆注册按钮 -->
	<div id="loginandregist">
		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		  登陆/注册
		</button>
	</div>
	</c:if>
	
	<!-- 登录注册模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		    <h1>
				<!-- <a href="#signin" data-toggle="tab"><span class="active-title">登录</span></a>  -->
				<a id="logina" href="#signin" data-toggle="tab"><span class="active-title" id="login">登录</span></a> 
				<a id="logupa" href="#signup" data-toggle="tab"><span id="logup">注册</span></a>
		    </h1>
	      </div>
	      
	      <div class="modal-body">
	        <!-- Tab panes -->
			<div class="tab-content">
			  <!-- 登陆 -->
			  <div class="tab-pane active" id="signin">
				<form id="signin-form" action="/microCourse/user/login">
					<!-- 用户名 -->
					<div class="rlf-group">
						<input type="text" name="loginName" id="loginName" onblur="validateLoginName()" autocomplete="off" class="ipt ipt-email" placeholder="请输入用户名">
						<p class="rlf-tip-wrap"><span id="validateLoginName"></span></p>
					</div>
					<!-- 密码 -->
					<div class="rlf-group">
						<input type="password" name="password" id="loginPassword" onblur="validateLoginPassword()" autocomplete="off" class="ipt ipt-pwd" placeholder="请输入密码">
						<p class="rlf-tip-wrap"><span id="validateLoginPassword"></span></p>
					</div>
					<!-- 忘记密码 -->
					<div class="rlf-group rlf-appendix clearfix">
						<label for="auto-signin" class="l" hidefocus="true"><input type="checkbox" checked="checked" id="auto-signin">自动登录</label>
						<a href="/user/newforgot" class="rlf-forget r" target="_blank" hidefocus="true">忘记密码 </a>
					</div>
					<!-- 登陆 -->
					<div class="rlf-group clearfix">
						<p class="rlf-tip-wrap "><span id="signin-globle-error" ></span></p>
						<input type="button" id="signin-btn" onclick="signin()" value="登录" hidefocus="true" class="btn-red btn-full">
					</div>
			    </form>
			  </div>
			  
			   <!-- 注册 -->
			  <div class="tab-pane" id="signup">
				<form id="signup-form" action="/microCourse/user/add" method="post">
					<!-- 用户名 -->
					<div>
						<input type="text" id="inputName" name="loginName" onblur="validateName()" class="ipt ipt-emai" autocomplete="off" placeholder="请输入用户名">
						<p class="rlf-tip-wrap"><span id="username_validate"></span></p>
					</div>
					<!-- 密码-->
					<div>
						<input type="password" id="password" name="password" onblur="validatePassword()" class="ipt ipt-pwd js-pass-pwd" placeholder="6-16位密码，区分大小写，不能用空格">
				        <p class="rlf-tip-wrap"><span id="password_validate"></span></p>
					</div>
					<!-- 昵称-->
					<div>
						<input type="text" name="nick" id="nick" onblur="validateNick()" class="ipt ipt-nick" placeholder="昵称为2-18位，中英文、数字及下划线">
						<p class="rlf-tip-wrap"><span id="nick_validate" ></span></p>
					</div>
					<!-- 验证码-->
					<div>
					    <input type="text" name="verify" id="verify" onblur="validateVerify()" class="ipt ipt-verify l" placeholder="请输入验证码">
					    <img class="verify-img" id="code" src="/microCourse/user/ImageCode" onclick="javascript:this.src='/microCourse/user/ImageCode?'+Math.random()">
						<p class="rlf-tip-wrap"><span id="verify_validate"></span></p>
					</div>
					<!-- 注册-->
					<div>
						<input type="button" onclick="signup()" id="signup-btn" value="注册" hidefocus="true" class="btn-red btn-full r">
					</div>
		    	</form>
			  </div>
			  
			</div>
		  </div>
		  
		  
		   <div class="modal-footer">
		   </div>
	      
	    </div>
	  </div>
	 </div>
</div>
</body>
  
</html>