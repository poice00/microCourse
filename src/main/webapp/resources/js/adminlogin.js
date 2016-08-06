var isNameMeet = false;		//标记用户所填写的用户名是否否符合要求
var isPwdMeet = false;		//标记用户所填写的密码否符合要求
var isCaptchaMeet = false;		//标记验证码是否正确
var isNameAndPwdMeet = false;		//标记用户名密码匹配
var error = "";


function validateU(){
	var user_name = $("#username").val();
	if(user_name == ""){
		error = "用户名不能为空";
		 $("#uTip").text(error);
	}else{
		$("#uTip").text("");
		isNameMeet = true;
	}
}
function validateP(){
	var password = $("#pwd").val();
	if(password == ""){
		error = "密码不能为空";
		$("#pTip").text(error);
	}else{
		$("#pTip").text("");
		isPwdMeet = true;
	}
}
/** 验证用户名密码是否正确*/
function validateL(){
	//拿到用户名输入框节点
	var username = $("#username").val();
	var password = $("#pwd").val();
	//使用Ajax提交数据到后台校验
	    $.ajax({
	    	url:'/microCourse/admin/validateL',
			data:{
				username:username,
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
	                $("#signin-error").text(error);
	            }
	        }
	    });
	}

/** 登陆*/
function login(){
	validateU();
	validateP();
	validateL();
	if(isNameMeet&& isPwdMeet&& isNameAndPwdMeet){
		document.forms["adminLogin"].submit();
		
	}
}	
