<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
<style type="text/css">
	#state{
		color: red
	}
</style>
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
</head>  
<body>  
	<div class="center">
	<form id="page" action="" >
		<table class="table table-hover">
			<tr>
				  		<td width="300px">登录名</td>
				  		<td width="300px">角色</td>
				  		<td width="300px">操作</td>
				  		<td width="300px">申请导师</td>
				  		<td>原因</td>
			 </tr>
			<c:forEach items="${pageBean.recordList}" var="item">
				 <c:choose>
				    <c:when test="${item.loginName=='admin' }">
				 		<tr>
				   		 <td width="300px"><span style="color: red">${item.loginName }</span></td>
				   		 <td width="300px"><span style="color: red">超级管理员</span></td>
				   		 <td width="300px"><span style="color: red">无</span></td>
				   		 </tr>
				    </c:when>
				    <c:otherwise>
				    <tr>
				  		<td width="300px">${item.loginName }</td>
				  		<td width="300px">${item.role.name }</td>
				  		<td width="300px"><p:permission operateID="/user/edit"><a href="/microCourse/admin/user/editUI?id=${item.userId }">
				  		<button type="button" class="btn btn-default">修改</button></a></p:permission> 
				  		<p:permission operateID="/user/delete">
				  		<a href="/microCourse/admin/user/delete?id=${item.userId }" onclick="return confirm('确定要删除此用户吗')">
				  		<button type="button" class="btn btn-danger">删除</button></a>
				  		</p:permission></td>
				  		<c:if test="${item.applyTutor==0 }">
				  			<td id="state">无 
				  			</td>
				  		</c:if>
				  		<c:if test="${item.applyTutor==1 }">
				  			<<td id="state">未审核
				  			<p:permission operateID="/course/inspect">
				  			<a href="/microCourse/admin/user/inspectUI?id=${item.userId }">
				  				<button type="button" class="btn btn-info">审核</button></a></p:permission> 
				  			</td>
				  		</c:if>
				  		<c:if test="${item.applyTutor==2 }">
				  			<td id="state">导师审核通过
				  			</td>
				  		</c:if>
				  		<c:if test="${item.applyTutor==3 }">
				  			<td id="state">导师审核失败
				  			</td>
				  		</c:if>
				  		<td>${item.inspectResult}</td>
				  	</tr>
				  	</c:otherwise>
			  	</c:choose>
			 </c:forEach>
			    
			    <p:permission operateID="/user/addUI"><a href="/microCourse/admin/user/addUI">
			    	<button type="button" class="btn btn-info">新增用户</button></a></p:permission>
		</table>
		</form>
			 <%@ include file="/WEB-INF/jsps/public/pageView.jsp"%>
	</div>
	<script type="text/javascript">
		function search() {
			document.forms["page"].submit();
		}
</script>
</body>  
</html>