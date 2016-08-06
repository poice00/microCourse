<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>微课程</title>  
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/base.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common-less.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/settings.css" />
		
		<style type="text/css">
			.wcontainer{min-height: 650px;}
			.logout-wrap{padding: 48px 0;}
			.logout-left{text-align: center;padding-top: 40px;}
			.logout-left i{display: inline-block;width: 120px;height: 120px;background: url(<%=request.getContextPath() %>/resources/images/rl-sprite.png) no-repeat 0 -130px;}
			.logout-left p{font-size: 24px;color:#656e73;padding: 35px 0 30px;}
			.logout-left a:link,.logout-left a:visited{color:#39b94e;}
			.logout-left a:hover{text-decoration: underline;}
			.logout-left{float: left;width: 320px;}
			
			
			.logout-right{position:relative;margin-left: 320px;border-left: 1px solid #edf0f2;padding-left: 60px;}
			.field-wrap{width:520px;position: relative;}
			#info,#contact{border:1px solid #d0d6d9;width: 260px;font-size:14px;transition:border-color 0.2s;-webkit-transition:border-color 0.2s;-moz-transition:border-color 0.2s;-o-transition:border-color 0.2s;padding: 7px;}
			#info:focus,#contact:focus{border-color: #7bd089; }
			#info{width:500px;height: 200px; resize: none; overflow: hidden; }
			#contact{ vertical-align: middle;width: 500px;height: 24px;line-height: 24px;font-size:14px;padding: 7px;}
			.logout-right button{display: inline-block;margin-right: 5px;vertical-align: middle;color: #fff;font-size: 14px;background-color:#39b94e;height: 40px;line-height: 40px;width: 190px;cursor: pointer;text-align: center;transition:background-color 0.2s;-webkit-transition:background-color 0.2s;-moz-transition:background-color 0.2s;-o-transition:background-color 0.2s;}
			.logout-right button:hover{ background-color: #33a646;}
			.logout-right h2{margin-bottom: 12px;}
			.logout-right .rlf-tip-wrap{ font-size: 12px;height: 30px;line-height: 26px;}
			.logout-right .rlf-tip-error{background: url(/static/images/rl-sprite.png) no-repeat -108px -934px; padding-left: 15px; color: #be3948;}
			.logout-right .error-field{border-color:#be3948 !important; }
			.placeholder{color: #d0d6d9;font-size: 14px;}
			.phd:-moz-placeholder{color: #d0d6d9;font-size: 14px;}
			.phd::-moz-placeholder{ color: #d0d6d9; font-size: 14px;}
			.phd::-webkit-input-placeholder{color: #d0d6d9;font-size: 14px;z}
			.phd:-ms-input-placeholder{color: #d0d6d9; font-size: 14px;}
			.us-join-qq{display: inline-block;width: 160px; height: 40px;line-height: 40px;vertical-align: middle;background: #2ea7e0;text-align: center;}
			.us-join-qq:link,.us-join-qq:visited{color: #fff;}
			.us-join-qq:hover{background: #2996c9;}
			.us-join-qq i{ display: inline-block;width: 24px; height: 20px;margin-right: 4px;vertical-align: middle;background: url(/static/images/us-sprite.png) no-repeat -76px -110px;}
			.result-wrap{display: none; text-align: center;padding: 100px 60px 100px 0;}
			.result-wrap h2{font-size: 24px;color: #656e73; line-height: 1.5em;}
			.result-wrap a{display: inline-block;margin-top: 15px;}
			.result-wrap a:link,.result-wrap a:visited{color:#39b94e;}
			.qqGroup { position:absolute;right:-220px;top:20px;padding-top: 10px; line-height: 2.5em;}
			.qqGroup a{padding-left:10px;color: #008000;}
			.qqGroup span{padding-left:10px;}
		</style>
		
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div class="wcontainer">
	    <div class="wwrap wrap-boxes">
	        <div class="wheader-wrap">
	            <h1>退出登录</h1>
	        </div>
	        <div class="logout-wrap clearfix">
	            <div class="logout-left">
	                <i></i>
	                <p class="pwd-rstsuc-txt">您已成功退出登录</p>
	                <a href="/microCourse">返回首页</a>
	            </div>
	            <div class="logout-right">
	                <div class="result-wrap">
	                    <h2>提交成功</h2>
	                    <p>感谢你的建议，我会努力让自己变得高大上！</p>
	                    <a href="javascript:void(0)" hidefocus="true">继续添加建议</a>
	                </div>
	                <div class="field-wrap">
	                    <h2>意见反馈</h2>
	                    <div>
	                        <textarea name="info" id="info" class="phd" cols="30" rows="10" placeholder="骚年，哪有不爽，来喷吧！"></textarea>
	                        <p class="rlf-tip-wrap"></p>
	                    </div>
	                    <div>
	                        <input type="text" name="contact" id="contact" class="phd" placeholder="请留下真实联系方式（邮箱、QQ），方便我们答疑解惑！">
	                        <p class="rlf-tip-wrap"></p>
	                    </div>
	                     <div class="btn-wrap clearfix">
	                        <button hidefocus="true" id="submit" class="r">提交</button>
	                        <p id="feedback-error" class="rlf-tip-wrap rlf-tip-error" style="display:none"></p>
	                    </div>
	                    <div class="qqGroup">
	                        <h3>加入粉丝QQ群，直接喷！</h3>
	                        <ul>
	                            <li>群7: 416465236</li>
	                            <li>Java群: 6200344</li>
	                            <li>Php群: 42125527</li>
	                            <li>web前端群2: 27810317</li>
	                            <li>安卓群: 232465453</li>
	                            <li>在校生群: 187845234</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>