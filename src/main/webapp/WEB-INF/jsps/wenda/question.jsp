<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>我的社区-微课程</title>  
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/community.css" />
		
		<script>
			var isLogin=1;
			
			/* $().ready(function(){
				var list = new Array();
				$("#side>li").each(function(i,item){
					list[i] = $(item);
					
					$(item).hover(function(){
						localStorage.order = i;
					});
				
				});
				
				list[parseInt(localStorage.getItem("order"))].addClass("test");
			});
				 */
		
		</script>
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<!-- 社区导航 -->
	<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>

	<div class="wenda clearfix">
		<div class="sider">
		    <div class="user-info">
		        <a href="javascript:void(0)" class="user-pic">
		            <c:choose>
						<c:when test="${currentUser.avatar==null }">
							<img src="<%=request.getContextPath() %>/resources/images/default.jpg" width="220" height="220">
						</c:when>
						<c:otherwise>
							<img  src="${currentUser.avatar}" width="220" height="220">
						</c:otherwise>
					</c:choose>
		        </a>
		        <span class="user-name mt25"><a class="user-name" href="javascript:void(0)">${user.nickname }</a></span>
		        <span class="user-role">${user.title.name }</span>
	        </div>
	    <div class="user-desc">
	        <div class="sign-wrap">
	            <p id="signed" class="signed"> <c:choose>
				<c:when test="${user.introduction==null }">
					这位童鞋很懒，什么也没有留下～～！
				</c:when>
					<c:otherwise>
						 ${user.introduction }
					</c:otherwise>
				</c:choose>     
                </p>
	                                    <em class="publish-sign" id="publishsign"></em>
            </div>
	        <textarea id="signing" class="signing">这位童鞋很懒，什么也没有留下～～！</textarea>
	        <p id="rlf-tip-wrap" class="rlf-tip-wrap"></p>
	    </div>
	    <div class="expr"><span data-uid="1226216">5166</span>经验</div>
	    	<ul id="side" class="nav">
	           <li><a href="/myclub/myquestion/t/ques">我的问答</a><!--<span>9</span>--></li>
	           <li class="my"><a href="/myclub/opus?uid=1226216">我的作品</a></li>
	           <li><a href="/myclub/article">我的文章</a></li>
	           <li><a href="/user/userinfo">我的设置</a></li>
	           <li><a href="/space/u/uid/1226216" class="other-link">我的课程</a></li>
	        </ul>
	    </div><!--sider end-->
	
	
		<div id="layer_sendmsg" class="font-colorg" style="display:none">
	        <div class="sendadd">
	        <h4>发送好友申请<span class="tipclose"></span></h4>
	        <div class="sendcon">
	            <textarea class="chatInput" id="textInput" type="text" name="说点什么吧" cols="1" rows="5"></textarea>
	        </div>
	        <div class="sendsq">
	            <a href="#" id="sendBtn" class="sendInvite btn btn-green">发送申请</a>
	        </div>
	    </div>
	    </div>    <div class="r js-layout-change">
	        <div class="l wenda-main">
	            <!--<div class="newpost">
	              <h1 class="newpost-title">我的提问</h1>
	            </div>-->
	            <div class="my-newpost">
	                <a href="/myclub/myquestion/t/ques" class="active">我的问答  0</a>
	                <a href="/myclub/myquestion/t/reply">我的回复  0</a>
	                <a href="/myclub/myquestion/t/follow">我的关注  0</a>
	                <a href="/wenda/save" class="newq">发新问题</a>
	            </div>
	            <!--左侧列表内容-->
	            <div class="wenda-list">
	            <div class="unquestion">
	<span></span>
	<p>您还没有进行过任何提问</p>
	</div>
	            </div>
	        </div>
	    </div>
	</div>

	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>