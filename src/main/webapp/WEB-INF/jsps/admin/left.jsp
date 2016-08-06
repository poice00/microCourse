<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员界面</title>
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
 <script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/admin/jquery.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/admin/bootstrap.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/admin/menu.js"></script>
</head>
<body>
<div class="container">
	<div class="jumbotron">
        <h1>管理员界面</h1>
    </div>
    
    	
    
    
	    <div class="row">
    
     	<!-- 权限列表 -->
        <div class="col-xs-3" id="myScrollspy">
				<div class="panel panel-default">
					<!-- 顶级权限 -->
					
					
					
					<div id="Menu">
					    <ul id="MenuUl">
					    <!-- 顶级权限 -->
							<c:forEach items="${topPrivilege}" var="item">
						        <li class="level1">
						            <div onClick="menuClick(this)" class="level1Style"><span class="glyphicon glyphicon-cog" style="cursor: pointer;">${item.name }</span></div>
						          
						          <!-- 折叠内容 -->
					            	 <c:forEach items="${item.children}"  var="children">
							            <ul style="display: none;" class="MenuLevel2">
												<li><a href="/microCourse/admin${children.url }" target="right">${children.name }</a></li>
							            </ul>
									</c:forEach>
						        </li>
						     </c:forEach>
						</ul>
					</div>
					
					
				</div>
        </div>
        
        
        	
    </div>
</div>



</body>
</html>

