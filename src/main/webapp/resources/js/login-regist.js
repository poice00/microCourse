$(document).ready(function(){
	/** 注册*/
  $("#logupa").click(function(){
    $("#logup").addClass("active-title");
    $("#login").removeClass("active-title");
  });
  /** 登陆*/
  $("#logina").click(function(){
	  $("#login").addClass("active-title");
	  $("#logup").removeClass("active-title");
  });
  
  /** 注册按钮*/
  $("#js-signup-btn").click(function(){
	  $("#logup").addClass("active-title");
	  $("#signup").addClass("tab-pane active");
	  $("#login").removeClass("active-title");
	  $("#signin").removeClass("tab-pane active");
	  $("#signin").addClass("tab-pane");
  });
  /** 登陆按钮*/
  $("#js-signin-btn").click(function(){
	  $("#login").addClass("active-title");
	  $("#signin").addClass("tab-pane active");
	  $("#logup").removeClass("active-title");
	  $("#signup").removeClass("tab-pane active");
	  $("#signup").addClass("tab-pane");
  });
  
});
/**================注册=======================*/
var isNameMeet = false;		//标记用户所填写的用户名是否否符合要求
var isPwdMeet = false;		//标记用户所填写的密码否符合要求
var isNickMeet = false;		//标记用户所填写的昵称否符合要求
var isCaptchaMeet = false;		//标记验证码是否正确
var isNameAndPwdMeet = false;		//标记用户名密码匹配
var error = "";
/** 验证密码*/
function validatePassword(){
	var password = $("#password").val();
	if(password == ""){
		error = "密码不能为空";
		$("#password_validate").text(error);
	}else if(!(/^[^\s]{6,16}$/).test(password)){  
		error = "6-16位密码，区分大小写，不能用空格";
		$("#password_validate").text(error);
	}else{
		$("#password_validate").text("");
		$("#password_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
		isPwdMeet = true;
	}
}
/** 验证昵称*/
function validateNick(){
	var nick = $("#nick").val();
	if(nick == ""){
		error = "昵称不能为空";
		$("#nick_validate").text(error);
	}else if(!(/^[\d\w\u4e00-\u9fa5,\.;\:"'?!\-]{2,18}$/).test(nick)){
		error = "2-18位的中文,英文,数字,下划线";
		$("#nick_validate").text(error);
	}else{
		$("#nick_validate").text("");
		$("#nick_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
		isNickMeet = true;
	}
}
/** 验证码*/
function validateVerify(){
	var verify = $("#verify").val();
	if(verify == ""){
			error = "验证码不能为空";
			$("#verify_validate").text(error);
	}else{
		$("#verify_validate").text("");
		//使用Ajax提交数据到比验证码
		$.ajax({
			url:'/microCourse/user/checkCode',
			data:{
				input_code:verify
			},
			type:'post',
			async:false,	//默认为true，这里需要改为false
			success:function(response) {
				//拿到返回值
				//判断是否有重复
				if(response == "fail") {
					//重复...
					error="验证码错误";
					$("#verify_validate").text(error);
					$("#verify_validate").append("<img src='/microCourse/resources/images/false.png' style='width: 25px;height: 25px' />");
					isCaptchaMeet = false;
				}else {
					//不重复...
					$("#verify_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
					isCaptchaMeet = true;
				}
			}
		});
	}
}

/** 验证用户名是非被注册*/
function validateName(){
	//拿到用户名输入框节点
	var user_name = $("#inputName").val();
	if(user_name == ""){
		error = "用户名不能为空";
		 $("#username_validate").text(error);
	}
	else if(!(/^[a-zA-z][a-zA-Z0-9_]{3,8}$/).test(user_name)){
		error = "以字母开头，4-9位，只能包含字母、数字和下划线！";
		 $("#username_validate").text(error);
	}
	/*判断用户名是否被注册*/
	else{
		$("#username_validate").text("");
	//使用Ajax提交数据到后台校验
	    $.ajax({
	    	url:'/microCourse/user/validate',
			data:{
				name:user_name
			},
			type:'post',
			async:false,	//默认为true，这里需要改为false
			success:function(response) {
	            //拿到返回值
	            //判断是否有重复
	            if(response == "exist") {
	                //重复...
	                error="该用户名已被注册";
	                $("#username_validate").text(error);
	                $("#username_validate").append("<img src='/microCourse/resources/images/false.png' style='width: 25px;height: 25px' />");
	            }else {
	                //不重复...
	                $("#username_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' style='width: 25px;height: 25px'  />");
	            	isNameMeet = true;
	            }
	        }
	    });
	}
}
/** 注册*/
function signup(){
	validateName();
	validatePassword();
	validateNick();
	validateVerify();
	if(isNameMeet&& isPwdMeet && isCaptchaMeet){
		document.forms["signup-form"].submit();
	}
}	

/**================登陆=======================*/

function validateLoginName(){
	var user_name = $("#loginName").val();
	if(user_name == ""){
		error = "用户名不能为空";
		 $("#validateLoginName").text(error);
	}else{
		$("#validateLoginName").text("");
		isNameMeet = true;
	}
}
function validateLoginPassword(){
	var password = $("#loginPassword").val();
	if(password == ""){
		error = "密码不能为空";
		$("#validateLoginPassword").text(error);
	}else{
		$("#validateLoginPassword").text("");
		isPwdMeet = true;
	}
}
/** 验证用户名密码是否正确*/
function validateLogin(){
	//拿到用户名输入框节点
	var user_name = $("#loginName").val();
	var password = $("#loginPassword").val();
	//使用Ajax提交数据到后台校验
	    $.ajax({
	    	url:'/microCourse/user/validateLogin',
			data:{
				loginName:user_name,
				password:password
			},
			type:'post',
			async:false,	//默认为true，这里需要改为false
			success:function(response) {
	            //拿到返回值
	            //判断是否有重复
	            if(response == "ok") {
	                //正确
	                isNameAndPwdMeet = true;
	            }else {
	                //错误...
	            	error="用户名或密码错误";
	                $("#signin-globle-error").text(error);
	            }
	        }
	    });
	}

/** 登陆*/
function signin(){
	validateLoginName();
	validateLoginPassword();
	validateLogin();
	if(isNameMeet&& isPwdMeet&& isNameAndPwdMeet){
		document.forms["signin-form"].submit();
		
	}
}	
