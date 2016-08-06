<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %> 
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
				  		<td>角色名称</td>
				  		<td>角色描述</td>
				  		<td>操作
				  		</td>
			 </tr>
			<c:forEach items="${roleList}" var="item">
				<tr>
					  		<td>${item.name }</td>
					  		<td>${item.description }</td>
					  		<td><p:permission operateID="/role/edit"><a href="/microCourse/admin/role/editUI?id=${item.roleId }">
					  		<button type="button" class="btn btn-default">修改角色信息</button></a></p:permission>
					  		<p:permission operateID="/role/delete">
	  						<a href="/microCourse/admin/role/delete?id=${item.roleId }" onclick="return confirm('确定要删除角色吗')">
	  						<button type="button" class="btn btn-danger">删除角色</button></a></p:permission></td>
				 </tr>
			  </c:forEach>
			    
			<p:permission operateID="/admin/role/add"><a href="/microCourse/admin/role/addUI">
			 <button type="button" class="btn btn-info">新建角色</button></a>
			 </p:permission>    
		  
		</table>
	</div>
	 
	 
	 
</body>  
</html>