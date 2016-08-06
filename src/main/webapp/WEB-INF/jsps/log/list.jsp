<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>日志管理</title> 
<script language="javascript"
src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
<script language="javascript"
src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
</head>  
<body>  

	<div align="center" style="height: 600px">
	<form id="page" action="" >
		<!-- <label><input type="radio" value="0" checked="checked" name="roleType">用户</label>
        <label><input type="radio" value="1"  name="roleType">管理员</label>
		 -->
		<div class="input-group" style="width: 300px">
		  <input type="text" class="form-control" placeholder="输入用户名查询" name="loginName" value="${ loginName}">
		  <span class="input-group-addon" style="cursor: pointer;" onclick="search()">GO</span>
		</div>
		
		<table class="table table-hover">
		
			<tr>
		    	<td>用户名</td>
		    	<td>执行操作</td>
		    	<td  width="100px">访问时间</td>
		    	<td width="100px">访问方法</td>
		    	<td width="200px">参数和值</td>
		    	<td>用户IP</td>
		    	<td></td>
		    	
		    </tr>
		    <c:forEach items="${pageBean.recordList}" var="item">
		    	<c:if test="${item.description!=null}">
		    	<tr>
		    	<td><span style="color: red;">${item.createBy.loginName }</span></td>
		    	<td><span style="color: red;">${item.description }</span></td>
		    	<td width="100px">${item.createDate }</td>
		    	<td width="100px">${item.method }</td>
		    	<td width="200px">${item.params }</td>
		    	<td>${item.requestIp }</td>
		    	<td><p:permission operateID="/log/delete">
			  		<a href="/microCourse/admin/log/delete?id=${item.id }" onclick="return confirm('确定要删除日志吗')">
			  		 <button type="button" class="btn btn-danger">删除日志</button></a>
			  		</p:permission></td>
		    	
		    	</tr>
		  		</c:if>
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