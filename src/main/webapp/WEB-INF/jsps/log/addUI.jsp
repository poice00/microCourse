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

  
  <form action="/ssy110/role/add" method="post">
	角色名称:<input type="text" name="name"><br>
	角色說明:<input type="text" name="description"><br>
	角色权限:<br>
	<input type="submit" value="保存">
	 <a href="javascript:history.go(-1);">返回</a>
	</form>
</body>  
</html>