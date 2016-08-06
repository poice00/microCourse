<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="ssy110" prefix="p" %>
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>课程审核</title>  
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
	<div>
	
		<form action="/microCourse/admin/course/inspect" method="post" >
	  	<input type="hidden" name="id" value="${course.courseId}">
		课程名称:<a href="/microCourse/course/view/${course.courseId}">${course.name}</a><br>
		课程描述:
			${course.description}<br>
		讲师:${course.user.nickname}<br>
		难度:${course.level}<br>
		时长:${course.duration}<br>
		状态:${course.status}<br>
		 
		 <button type="button" onclick="inspect(1)" class="btn btn-success">通过</button>
		 <button type="button" id="refuse" class="btn btn-danger">拒绝</button>
		 <a href="javascript:history.go(-1);"><button type="button" class="btn btn-default">返回</button></a>
		 
		 <div id="content" style="display: none">
		 
		 	输入拒绝原因:
			 <textarea rows="3" cols="" name="inspectResult">
			 </textarea>
			 <button type="button" onclick="inspect(2)" class="btn btn-danger">提交</button>
		 </div>
		</form>
	
	</div>
	
	
	
	
<script type="text/javascript">
		function inspect(inspectState) {
			$(document.forms[0]).append("<input type='hidden' name='inspectState' value='"+ inspectState + "'>");
			document.forms[0].submit();
		}
		$("#refuse").click(function(){
			$("#content").toggle();	
		});
</script>
</body>  
</html>