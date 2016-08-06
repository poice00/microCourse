<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<script language="javascript"
src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
<style type="text/css">
	.img{
		width: 25px;
		height: 25px;
	}
	.span_8{
		width: 25px;
		height: 25px;
		color: red;
	}
</style>
<script type="text/javascript">
	var isNameMeet = false;		//标记用户所填写的用户名是否否符合要求
	var isPwdMeet = false;		//标记用户所填写的密码否符合要求
	var isCaptchaMeet = false;		//标记验证码是否正确
	function validate(){
		//拿到用户名输入框节点
		var user_name = $("#inputName").val();
		var error = "";
		if(user_name == ""){
			error = "用户名不能为空";
			 $("#username_validate").text(error);
			isNameMeet = false;
		}
		/*判断用户名是否被注册*/
		else{
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
		                $("#username_validate").append("<img src='/microCourse/resources/images/false.png' class='img' />");
		                isNameMeet = false;
		            }else {
		                //不重复...
		                $("#username_validate").text("").append("<img src='/microCourse/resources/images/true.jpg' class='img' />");
		            	isNameMeet = true;
		            }
		        }
		    });
		}
	}
	function sign(){
		validate();
		if(isNameMeet){
			document.forms[0].submit();
		}
	}	
</script>
</head>  
<body>  
  
  <form action="/microCourse/admin/user/add" method="post">
  <div class="container">
	用户名:<input id="inputName" type="text" class="form-control" placeholder="输入用户名" name="loginName" onblur="validate()" style="width: 300px"><span id="username_validate" class="span_8"></span><br>
	密码:<input type="password" class="form-control" name="password"  placeholder="输入密码" style="width: 300px"><br>
	昵称:<input type="text" class="form-control" name="nickname" placeholder="输入昵称" style="width: 300px"><br>
	选择角色:
		<select name="roleId" class="form-control" style="width: 300px" >
			<c:forEach items="${roleList}" var="item">
				  <option value ="${item.roleId }">${item.name }</option>
			</c:forEach>
		</select>
		<br>
	<button type="submit" class="btn btn-success">保存</button>
	 <a href="javascript:history.go(-1);"><button type="button" class="btn btn-default">返回</button></a>
	</div>
	</form>
</body>  
</html>