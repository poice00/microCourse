<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<title>发布成功_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/publish-success.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">
			<div class="bbs clearfix">
			  <div class="sucesspage">
			    <h2>问题发布成功</h2>
			    <div class="sendques">
			        <span></span>
			       <h3>您的问题已经提交成功!</h3>
			       <p>请耐心等待，肯定会有很多热心的同学回答你的问题</p>
			       <p>为鼓励好答案，请为他们投票并设置最佳答案（仅限提问）</p>
			       <p><a href="/microCourse/wenda/0" class="btn btn-green">返回问答</a></p><p>
			       </p><p>
			              <a href="/microCourse/wenda/detail/${topicId }" class="myques">查看我提的问题</a>
			              </p><p>
			    </p></div>
			  </div>
			</div>
		</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		 
	</body>  
</html>