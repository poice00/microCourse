<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
</head>  
<body>  
  
  <form action="/microCourse/admin/user/edit" method="post" >
  	<input type="hidden" name="id" class="form-control" value="${user.userId}">
  	 <div class="container">
	用户名:<input type="text" name="password" class="form-control" value="${user.loginName}" style="width: 300px" disabled="disabled"><br>
	密码:<input type="text" name="password" class="form-control" value="${user.password}" style="width: 300px"><br>
	昵称:<input type="text" name="nickname" class="form-control" value="${user.nickname}" style="width: 300px"><br>
	修改角色：	<select name="roleId" class="form-control" style="width: 300px">
			<c:forEach items="${roleList}" var="item">
				  <option value ="${item.roleId }" <c:if test="${user.role.name==item.name }">selected</c:if>
				  >${item.name }</option>
			</c:forEach>
		</select>
	<br>
	<button type="submit" class="btn btn-success">保存</button>
	 <a href="javascript:history.go(-1);"><button type="button" class="btn btn-default">返回</button></a>
	 </div>
	</form>
</body>  
</html>