<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta name="renderer" content="webkit">
	
	
	<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/registandlogin.css" />
	
	<!-- 后引用的样式会覆盖先引用样式,覆盖bootstrap的样式 -->
	<style type="text/css">
		a:hover{
			text-decoration:none;
		}
		
		*,*:before,*:after{
			box-sizing:content-box;
		}
	</style>
	
	<script type="text/javascript">
	
  		var OP_CONFIG={"module":"${config.module}","page":"${config.page}",
  				"${userInfo}":{"uid":"${currentUser.userId}","nickname":"${currentUser.nickname}"}};
  		
  		var isLogin = 1;
  		var seajsTimestamp="v=" + new Date().getTime();
  	 	var ownName="yanbaobin@yeah.net";
  	 	
	</script>