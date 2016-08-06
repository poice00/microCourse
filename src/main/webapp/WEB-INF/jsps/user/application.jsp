<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>应聘讲师-微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/apply.css" />
		
		<style>
			.label{
				font-size:100%;
				font-weight:normal;
			}
		</style>
		<script type="text/javascript">
		function applySuccess() {
			var description=$("#apply-introduction").val();
			var tureName=$("#apply-name").val();
			var videoUrl=$("#apply-media").val();
			var phoneNum=$("#apply-phone").val();
			$.ajax({
				type : "post",
				url : "/microCourse/course/teacherApply",
				data:{
					description:description,
					tureName:tureName,
					videoUrl:videoUrl,
					phoneNum:phoneNum
				},
				success : function(response) {
					alert(response);
				}
			}); 
		 }
		</script>
	</head>
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div id="main">
		<div class="seek-container clearfix">
		    <div class="l seek-l">
		        <div class="head">
		            <h2 class="deepen-col">欢迎加入微课讲师团，世界因你而精彩</h2>
		        </div>
		        <div class="content">
		            <!-- <form action="/microCourse/course/teacherApply" method="post"> -->
		            <form>
		                <table>
		                    <tbody><tr>
		                        <td class="label"><span class="star">*&nbsp;</span>我的简介</td>
		                        <td class="textarea">
		                            <textarea class="apply-introduction" id="apply-introduction" name="description" placeholder="输入我的简介"></textarea>
		                            <p class="tip font-num">
		                                <span class="left">简介尽可能体现您的主攻技术方向,从业经历,公开分享的经验等</span>
		                                <span class="right">不超过200字</span>
		                            </p>
		                            <div class="portrait">
		                                <a href="/space/u/uid/1226216"><img src="http://img.mukewang.com/user/5333a1a90001c8d802000200-100-100.jpg"></a>
		                                <a class="nickname deepen-col" href="/space/u/uid/1226216">monkey_92</a>
		                            </div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="label"><span class="star">*&nbsp;</span>我的姓名</td>
		                        <td>
		                            <input id="apply-name" class="true-name" name="tureName" type="text" value="" placeholder="输入你的姓名">
		                            <p class="tip">输入你的真实姓名</p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="label"><span class="star">*&nbsp;</span>联系方式</td>
		                        <td>
		                            <input id="apply-phone" name="phoneNum" class="phone-num" type="text" value="" placeholder="输入手机号码">
		                            <p class="tip">慕课网将通过此方式与你取得联系</p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="label">试讲视频</td>
		                        <td>
		                            <input id="apply-media" name="videoUrl" class="media-url" type="text" placeholder="粘贴视频页地址">
		                            <p class="tip">粘贴视频播放页地址即可自动提取（仅支持慕课网和优酷），可选填</p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="label"></td>
		                        <td>
		                            <button class="submit" type="button" id="" onclick="applySuccess()">提交</button>
		                            <p class="warning tip"></p>
		                        </td>
		                    </tr>
		                </tbody></table>
		            </form>
		        </div>
		    </div>
	    	<div class="r seek-r">
		        <!-- 应聘讲师 -->
				<div class="hire shadow">
					<img src="<%=request.getContextPath() %>/resources/images/hire_img.jpg" alt="" class="hire_img">
					<p class="hire-reason">如果你对本课程领域擅长、能按照自己或者本求课的描述分享你的知识给互联网用户，就来应聘吧</p>
					<p class="hire-reason">你的课程会在慕课网及我们的合作渠道中展示和推广，你就是未来的行业大牛</p>
					<p class="hire-reason">慕课网还会为你支付课程公益津贴，让你得到既实际又实惠的回报</p>
				</div>
				
				<!-- 讲师团成员 -->
				<div class="lecturer">
					<h2 class="lecturer-hd">他们也在微课讲师团</h2>
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
	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>