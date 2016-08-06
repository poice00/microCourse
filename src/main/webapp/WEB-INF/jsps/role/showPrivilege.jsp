<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
</head>  
<body>  
	<div>
		用户名是：${currentUser.name}
	</div>
  
  <form action="/ssy110/role/edit" method="post" >
	角色名称:${role.name}<br>
	角色說明:${role.description}<br>
	角色权限:<br>
	 <a href="javascript:history.go(-1);">返回</a>
	</form>
</body>  
</html>