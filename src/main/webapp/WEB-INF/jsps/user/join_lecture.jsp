<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>加入讲师团-微课程</title>  
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/lecture.css" />
		
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div id="main">
		<div class="seek-container">
		    <div class="masters-nav">
		        <!-- 分享 -->
		        <div class="share r">
		            <em class="tip">分享</em>
		            <div class="bdsharebuttonbox bdshare-button-style0-16" id="bdsharebuttonbox" data-bd-bind="1442477218498">
		                <a href="#" class="bds_more" data-cmd="more"></a>
		            </div>
		        </div>
		        <!-- 立即加入 -->
		                <a href="/microCourse/user/apply" class="join-masters" id="join-masters"></a>
            </div>
		    <div class="masters-main clearfix">
		        <!-- 应聘讲师 -->
		        <div class="hire shadow">
		            <img src="<%=request.getContextPath() %>/resources/images/master_font2.png" alt="" class="hire_img">
		            <p class="hire-reason">加入讲师团，用你的知识服务更多学习者，你就是互联网精神的代言人</p>
		            <p class="hire-reason">你的课程会在慕课网及我们的合作渠道中展示和推广，你就是未来的行业大牛</p>
		            <p class="hire-reason hire-last">慕课网还会为你支付课程公益津贴，让你得到既实际又实惠的回报</p>
		        </div>
		        <!-- 讲师团成员 -->
				<div class="lecturer">
					<h2 class="lecturer-hd">他们也在慕课讲师团</h2>
					<ul class="lecturer-bd">
						<li>
							<a class="lecturer-col" href="http://www.imooc.com/space/teacher/id/101768" target="_blank">
								<img class="lecturer-img" src="http://img.mukewang.com/user/52e0ebbc000130fb16041604-220-220.jpg" alt="">
								<i class="lecturer-name">大城小胖</i>
							</a>
							<p class="lecturer-intro">国内知名前端和Java工程师、著名HTML5专家、独立游戏开发者</p>
						</li>
						<li>
							<a class="lecturer-col" href="http://www.imooc.com/space/teacher/id/101686" target="_blank">
								<img class="lecturer-img" src="http://img.mukewang.com/user/536b4d120001005f02720306-220-220.jpg" alt="">
								<i class="lecturer-name">远人</i>
							</a>
							<p class="lecturer-intro">先后就职于腾讯、人人网，资深的云前端工程师，首席前端架构师</p>
						</li>
						<li>
							<a class="lecturer-col" href="http://www.imooc.com/space/teacher/id/103747" target="_blank">
								<img class="lecturer-img" src="http://img.mukewang.com/user/531438a60001ee3110240681-220-220.jpg" alt="">
								<i class="lecturer-name">大漠穷秋</i>
							</a>
							<p class="lecturer-intro">《Ext江湖》、《ActionScript3.0游戏基础（第二版）》、《使用AngularJS开发下一代WEB应用》作者</p>
						</li>
					</ul>
				</div>
		    </div>
		</div>
		<div class="guidman-left"></div>
		<div class="guidman-right"></div>

	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>