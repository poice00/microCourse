<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员界面</title>
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/meun.css">
 <script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/admin/menu.js"></script>
</head>
<body>
<div >
	<!-- <div class="jumbotron">
        <h1 align="center">管理员界面</h1>
    </div> -->
	    <div class="jumbotron">
	    	欢迎你，<span style="color: red">${currentAdmin.loginName}</span>
	    	<a href="logout" style="float: right">点我注销</a>
	    </div>
	    <div class="row">
	    
     	<!-- 权限列表 -->
        <div class="col-xs-2">
				<div class="panel panel-default">
					<!-- 顶级权限 -->
					<div id="Menu">
					    <ul id="MenuUl">
					    <!-- 顶级权限 -->
							<c:forEach items="${topPrivilege}" var="item">
						        <li class="level1">
						            <div onClick="menuClick(this)" class="level1Style"><h4><span class="glyphicon glyphicon-cog" style="cursor: pointer;">${item.name }</span></h4></div>
						            <ul style="display: none;" class="MenuLevel2">
						            	<c:forEach items="${item.children}"  var="children">
											<li><h4><p:permission operateID="${children.url }"><a target="ifrm"  href="/microCourse/admin${children.url }">${children.name }</a></p:permission><h4></li>
										</c:forEach>
						            </ul>
						        </li>
						     </c:forEach>
						</ul>
					</div>
					
				</div>
        </div>
        
        
        <!-- 跳转页面 -->
	    <div class="col-xs-10">
        	<div class="panel panel-default">
				  <iframe name="ifrm" frameborder=0 width=100% height=700></iframe>
	        </div>
        </div>
        	
    </div>
</div>

</body>
</html>

