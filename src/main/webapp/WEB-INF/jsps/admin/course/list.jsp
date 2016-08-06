<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>课程管理</title>  
<script language="javascript"
src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
<script language="javascript"
src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
<style type="text/css">
	#state{
		color: red
	}
</style>
</head>  
<body>  
	<div align="center" style="height: 600px">
	<form id="page" action="" >
	
		<%-- <div class="input-group" style="width: 300px">
		  <input type="text" class="form-control" placeholder="输入讲师查询" name="teacherName" value="${ teacherName}">
		  <span class="input-group-addon" style="cursor: pointer;" onclick="search()">GO</span>
		</div>
		 --%>
		<div class="input-group" style="width: 300px">
		  <input type="text" class="form-control" placeholder="输入课程ID查询" name="courseId" value="${ courseId}">
		  <span class="input-group-addon" style="cursor: pointer;" onclick="search()">GO</span>
		</div>
	
		<table class="table table-hover">
			<tr>
				  		<td>课程名称</td>
				  		<td>课程id</td>
				  		<td>课程描述</td>
				  		<td>讲师</td>
				  		<td>难度</td>
				  		<td>时长</td>
				  		<td>状态</td>
				  		<td>审核</td>
				  		<td>原因</td>
				  		<td></td>
			 </tr>
			 <c:forEach items="${pageBean.recordList}" var="item">
				    <tr>
				  		<td width="200px">${item.name }</td>
				  		<td width="200px">${item.courseId}</td>
				  		<td width="300px">${item.description }</td>
				  		<td>${item.user.nickname }</td>
				  		<td>${item.level }</td>
				  		<td>${item.duration }</td>
				  		<td>${item.status }</td>
				  		<c:if test="${item.inspectState==0 }">
				  			<td id="state">未审核
				  			<p:permission operateID="/course/inspect">
				  			<a href="/microCourse/admin/course/inspectUI?id=${item.courseId }">
				  				<button type="button" class="btn btn-info">审核</button></a></p:permission> 
				  			</td>
				  		</c:if>
				  		<c:if test="${item.inspectState==1 }">
				  			<td>审核通过</td>
				  		</c:if>
				  		<c:if test="${item.inspectState==2 }">
				  			<td id="state">审核不通过
				  			<!-- <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">详情</button> -->
				  			</td>
				  		</c:if>
				  		<td>${item.inspectResult}</td>
				  		<td>
				  		
				  		<p:permission operateID="/course/delete">
				  		<a href="/microCourse/admin/course/delete?id=${item.courseId }" onclick="return confirm('确定要删除此课程吗')">
				  		<button type="button" class="btn btn-danger">删除</button></a>
				  		</p:permission></td>
				  	</tr>
			 </c:forEach>
			    
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