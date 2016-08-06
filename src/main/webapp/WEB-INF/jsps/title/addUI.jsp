<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>职位信息</title>  
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
</head>
<body>  
  
  <form action="/microCourse/admin/title/add" method="post">
	职位描述:<input type="text" class="form-control" name="name" placeholder="输入职位名称" style="width: 300px"><br>
	职位說明:<textarea class="form-control" name="description" rows="3" placeholder="输入职位描述" style="width: 300px"></textarea><br>
	<br>
	<button type="submit" class="btn btn-success">保存</button>
	 <a href="javascript:history.go(-1);"><button type="button" class="btn btn-default">返回</button></a>
	</form>
</body>  
</html>