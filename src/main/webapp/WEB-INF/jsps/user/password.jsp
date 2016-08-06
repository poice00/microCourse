<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>修改密码-微课程</title>  
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common-less.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/login.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/settings.css" />
		<style type="text/css">
		span{
			color: red
		}
		</style>
		
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
		      <!-- <li>
		        <a href="/microCourse/user/email">邮箱验证</a>
		      </li> -->
		      <li class="nav-active">
		        <a href="/microCourse/user/password">修改密码</a>
		      </li>
		      <!-- <li>
		        <a no-pjajx="" href="/microCourse/user/bindsns">绑定帐号</a>
		      </li> -->
		    </ul>
		  </div>
		  <div class="setting-right ">
		    <div class="setting-right-wrap wrap-boxes settings">
					<div class="pwd-reset-wrap setting-resetpwd">
					    <form action="changePassowrd" method="post" id="changePassowrd">
							<input type="hidden" name="id" value="${currentUser.userId}">
					        <div class="wlfg-wrap">
					            <label class="label-name" for="">当前密码</label>
					            <div class="input-group">
								  <input  type="password" class="form-control" name="oldpass" id="oldpass"  style="width: 300px; " placeholder="请输入当前密码" onblur="validateOldPassword()">
									<span id="old_validate"></span>
								</div>
					        </div>
					        <p class="rlf-tip-wrap"></p>
					        <div class="wlfg-wrap">
					            <label class="label-name" for="newpass">新密码</label>
					             <div class="input-group">
								  <input type="password" class="form-control" name="newpass" id="newpass" style="width: 300px" placeholder="请输入密码" onblur="validateNewPassword()">
								  <span id="newpass_validate"></span>
								</div>
					            
					        </div>
					        <p class="rlf-tip-wrap"></p>
					        <div class="wlfg-wrap">
					            <label class="label-name" for="confirm">确认密码</label>
					            <div class="input-group">
								  <input type="password" class="form-control" name="newpass2" id="newpass2" style="width: 300px" placeholder="请输入密码" onblur="validateNewPassword2()" >
								  <span id="newpass2_validate"></span>
								</div>
					        </div>
					        <p class="rlf-tip-wrap"></p>
					        <div class="wlfg-wrap">
					            <label class="label-name" for=""></label>
					            <div class="rlf-group">
					                <input type="button" class="rlf-btn-green btn-block"  value="保存" onclick="change()">
					            </div>
					        </div>
					    </form>
					</div>
		
		
		
		    </div>
		  </div>		
		</div>
	
	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
	 /** 验证密码*/
	 var isNameMeet = false;		//标记用户所填写的用户名是否否符合要求
	 var isPwdMeet = false;		//标记用户所填写的密码否符合要求
	 var isPwdMeet2 = false;		//标记用户所填写的密码否符合要求
	 var error = "";
	 function validateOldPassword(){
	 	var oldpass = $("#oldpass").val();
	 	if(oldpass == ""){
	 		error = "密码不能为空";
	 		$("#old_validate").text(error);
	 	}else{
	 		$("#old_validate").text("");
	 		//使用Ajax提交数据到后台校验
	 		    $.ajax({
	 		    	url:'/microCourse/user/validateOldPass',
	 				data:{
	 					password:oldpass
	 				},
	 				type:'post',
	 				async:false,	//默认为true，这里需要改为false
	 				success:function(response) {
	 		            //拿到返回值
	 		            //判断是否有重复
	 		            if(response == "not") {
	 		                //重复...
	 		                error="密码错误";
	 		                $("#old_validate").text(error);
	 		                $("#old_validate").append("<img src='/microCourse/resources/images/false.png' style='width: 25px;height: 25px' />");
	 		            }else {
	 		                //不重复...
	 		                $("#old_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
	 		            	isNameMeet = true;
	 		            }
	 		        }
	 		    });
	 	}
	 }
	 function validateNewPassword(){
		 	var newpass = $("#newpass").val();
		 	var oldpass = $("#oldpass").val();
		 	if(newpass == ""){
		 		error = "密码不能为空";
		 		$("#newpass_validate").text(error);
		 	}else if(newpass==oldpass){  
		 		error = "新密码与旧密码不能相同！";
		 		$("#newpass_validate").text(error);
		 	}else if(!(/^[^\s]{6,16}$/).test(newpass)){  
		 		error = "6-16位密码，区分大小写，不能用空格";
		 		$("#newpass_validate").text(error);
		 	}else{
		 		$("#newpass_validate").text("");
		 		$("#newpass_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
		 		isPwdMeet = true;
		 	}
		 }
	 function validateNewPassword2(){
	 	var newpass = $("#newpass").val();
	 	var newpass2 = $("#newpass2").val();
	 	if(newpass2 == ""){
	 		error = "密码不能为空";
	 		$("#newpass2_validate").text(error);
	 	}else if(!(/^[^\s]{6,16}$/).test(newpass2)){  
	 		error = "6-16位密码，区分大小写，不能用空格";
	 		$("#newpass2_validate").text(error);
	 		
	 	}else if(newpass != newpass2){  
	 		error = "两次输入不一致！";
	 		$("#newpass2_validate").text(error);
	 		
	 	}else{
	 		$("#newpass2_validate").text("");
	 		$("#newpass2_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
	 		isPwdMeet2 = true;
	 	}
	 }
	 
	 /** 修改*/
	 function change(){
		 validateOldPassword();
		 validateNewPassword();
		 validateNewPassword2();
	 	if(isNameMeet&& isPwdMeet && isPwdMeet2){
	 		document.forms["changePassowrd"].submit();
	 	}
	 }	
	 
	 </script>
</body>  
</html>