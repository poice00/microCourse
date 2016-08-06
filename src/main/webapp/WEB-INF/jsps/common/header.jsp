<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

	<div id="header">
	    <div class="page-container" id="nav">
	        <div id="logo" class="logo"><a href="/microCourse" target="_self" class="hide-text">微课程</a></div>
	        <div class="g-menu-mini l">
	            <a href="#" class="menu-ctrl"><i class="icon-menu"></i></a>
	            <ul class="nav-item l">
	                <li> <a href="/microCourse/course"  target="_self">课程</a></li>
	                <li><a href="/microCourse/plan"  target="_self">计划</a></li>
	                <li><a href="/microCourse/wenda/0"  target="_self">社区</a></li>
	            </ul>
	        </div>
	        <div id="login-area">
	        	<c:if test="${currentUser.loginName == null}">
	        	
	    		<!-- 未登录 -->
	            <ul class="header-unlogin clearfix">
	                <li class="header-signin">
	                    <a href="#" id="js-signin-btn" data-toggle="modal" data-target="#my">登录</a>
	                </li>
	                <li class="header-signup">
	                    <a href="#" id="js-signup-btn" data-toggle="modal" data-target="#my">注册</a>
	                </li>
	                <li class="header-signup">
	                    <a href="/microCourse/admin/index">管理入口</a>
	                </li>
	               
	                
	            </ul>
	            </c:if>
	            
	            <!-- 已登录 -->
	            <c:if test="${currentUser.loginName != null}">
	            	<ul class="clearfix logined">
	            	 <li class="header-signup">
	                    <a href="/microCourse/user/search">搜索</a>
	                </li>
	            
	            
	        	    <li class="my_message">
	                    <a href="/microCourse/user/message" title="我的消息" target="_self">
	                        <i class="msg_icon" style="display: none;"></i>
	                        <span style="display: none;">我的消息</span>
	                    </a>
	                </li>
	                <li class="set_btn user-card-box">
	                    <a id="header-avator" class="user-card-item" action-type="my_menu"  href="/microCourse/user/mycourse" target="_self">
	                    <c:choose>
							<c:when test="${currentUser.avatar==null }">
								<img src="<%=request.getContextPath() %>/resources/images/default.jpg" width='40' height='40'>
							</c:when>
							<c:otherwise>
								<img src="${currentUser.avatar}" width='40' height='40'>
							</c:otherwise>
						</c:choose>
	                    
	                    <i class="myspace_remind" style="display: none;"></i>
	                    <span style="display: none;">动态提醒</span>
	                    </a>
	                    <div class="g-user-card">
	                        <div class="card-inner">
	                            <div class="card-top">
	                                <img src="${currentUser.avatar}" alt="monkey_92" class="l">
	                                <span class="name text-ellipsis">${currentUser.loginName}</span>
	                                <input id="user_id" type="hidden" value="${currentUser.userId }" />
	                                <p class="meta">
	                                    <span>经验<b id="js-user-mp">5166</b></span>
	                                    <span style="display: none">积分<b>12331</b></span>
	                                </p>
	                            </div>
	                            <div class="card-links">
	                                <a href="/microCourse/user/mycourse" class="my-mooc l">我的微课<i class="dot-update"></i></a>
	                                <span class="split l"></span>
	                                <a href="/microCourse/wenda/question/${currentUser.userId }" class="my-sns l">我的社区</a>
	                            </div>
	                            <div class="card-history">
	                                <span class="history-item">
	                                    <span class="tit text-ellipsis">DOM探索之基础详解篇</span>
	                                    <span class="media-name text-ellipsis">1-1 课程介绍</span>
	                                    <i class="icon-clock"></i>
	                                    <a href="/video/9491" class="continue">继续</a>
	                                </span>
	                            </div>
	                            <div class="card-sets clearfix">
	                                <a href="/microCourse/user/profile" class="l">个人设置</a>
	                                <a href="/microCourse/user/logout" class="r">退出</a>
	                            </div>
	                        </div>
	                        <i class="card-arr"></i>
	                    </div>
	                </li>
	            </ul>
	            </c:if>
	        </div>
	        <!-- <div class="app-down-area r">
	            <a href="/mobile/app">
	                <i class="header-app-icon"></i>微课程APP
	            </a>
	        </div> -->
	        <div class="search-area" data-search="top-banner">
	            <input class="search-input" data-suggest-trigger="suggest-trigger"
	            	placeholder="请输入想搜索的内容..." type="text" autocomplete="off">
	            <ul class="search-area-result" data-suggest-result="suggest-result">
	            </ul>
	            <input type="button" class="btn_search" data-search-btn="search-btn" />
	        </div>
		</div>
	
	 	<!-- 登录注册模态框 -->
		<div class="modal fade" id="my" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
	
		      <div class="modal-header">
		      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h1>
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
						<div class="input-group">
							<input type="text" class="form-control" name="loginName" id="loginName" onblur="validateLoginName()"   placeholder="请输入用户名">
							<p class="flr"><span id="validateLoginName"></span></p>
						</div>
						<!-- 密码 -->
						<div class="input-group">
							<input type="password" class="form-control" name="password" id="loginPassword" onblur="validateLoginPassword()" autocomplete="off"  placeholder="请输入密码">
							<p class="flr"><span id="validateLoginPassword"></span></p>
						</div>
						<!-- 忘记密码 -->
						<div class="rlf-group rlf-appendix clearfix">
							<label for="auto-signin" class="l" hidefocus="true"><input type="checkbox" checked="checked" id="auto-signin">自动登录</label>
							<a href="/user/newforgot" class="rlf-forget r" target="_blank" hidefocus="true">忘记密码 </a>
						</div>
						<!-- 登陆 -->
						<div class="rlf-group clearfix">
							<p class="flr "><span id="signin-globle-error" ></span></p>
							<input type="button" id="signin-btn" onclick="signin()" value="登录" hidefocus="true" class="btn-red btn-full">
						</div>
				    </form>
				  </div>
				  
				   <!-- 注册 -->
				  <div class="tab-pane" id="signup">
					<form id="signup-form" action="/microCourse/user/register" method="post">
						<!-- 用户名 -->
						<div class="input-group">
							<input type="text" class="form-control" id="inputName" name="loginName" onblur="validateName()" class="ipt ipt-emai" autocomplete="off" placeholder="请输入用户名">
							<p class="flr"><span id="username_validate"></span></p>
						</div>
						<!-- 密码-->
						<div class="input-group">
							<input type="password" class="form-control" id="password" name="password" onblur="validatePassword()" class="ipt ipt-pwd js-pass-pwd" placeholder="6-16位密码，区分大小写，不能用空格">
					        <p class="flr"><span id="password_validate"></span></p>
						</div>
						<!-- 昵称-->
						<div class="input-group">
							<input type="text" class="form-control" name="nickname" id="nick" onblur="validateNick()"  placeholder="昵称为2-18位，中英文、数字及下划线">
							<p class="flr"><span id="nick_validate" ></span></p>
						</div>
						<!-- 验证码-->
						<div class="input-group">
						    <input type="text" class="form-control" name="verify" id="verify" onblur="validateVerify()"  placeholder="请输入验证码">
						    <img class="verify-img" id="code" src="/microCourse/ImageCode" onclick="javascript:this.src='/microCourse/user/ImageCode?'+Math.random()">
							<p class="flr"><span id="verify_validate"></span></p>
						</div>
						<!-- 注册-->
						<div>
							<input type="button" onclick="signup()" id="signup-btn" value="注册" hidefocus="true" class="btn-red btn-full">
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
