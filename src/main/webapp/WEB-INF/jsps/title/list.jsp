<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
</head>  
<body>  

	<div class="center">
		<table class="table table-hover">
			<tr>
				  		<td>职位名称</td>
				  		<td>职位描述</td>
				  		<td>操作
				  		</td>
			 </tr>
		
			<c:forEach items="${titleList}" var="item">
				<tr>
					  		<td>${item.name }</td>
					  		<td>${item.description }</td>
					  		<td><p:permission operateID="/title/edit">
					  			<a href="/microCourse/admin/title/editUI?id=${item.titleId }">
					  			 <button type="button" class="btn btn-default">修改职位信息</button></a>
					  		</p:permission>
					  		<p:permission operateID="/title/delete">
					  			<a href="/microCourse/admin/title/delete?id=${item.titleId }" onclick="return confirm('确定要删除职位吗')">
					  			 <button type="button" class="btn btn-danger">删除职位</button></a>
					  		</p:permission></td>
				 </tr>
			  </c:forEach>
			    
			    
		  <p:permission operateID="/admin/title/add"><a href="/microCourse/admin/title/addUI">
			  <button type="button" class="btn btn-info">新建职位</button></a>
		  </p:permission>
		  
		</table>
	</div>
	 
	 
	 
	 
</body>  
</html>