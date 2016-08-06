<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>头像-微课程</title> 
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common-less.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/login.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/settings.css" />
		
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div id="main">
		<div class="wcontainer set-space-cont clearfix">
		  <div class="setting-left l">
		    <ul class="wrap-boxes">
		        <li>
		        <a href="/microCourse/user/profile" class="onactive">个人资料</a>
		      </li>
		      <li class="nav-active">
		         <a href="/microCourse/user/avatar">头像设置</a>
		       </li>
		      <li>
		        <a href="/microCourse/user/password">修改密码</a>
		      </li>
		    </ul>
		  </div>
		  
		  <div class="setting-right ">
		    <div class="setting-right-wrap wrap-boxes settings">
				<div id="setting-avator" class="setting-wrap setting-avator clearfix">
					<div class="avator-img l">
						<div>
							<c:choose>
								<c:when test="${user.avatar==null }">
									<img id="uploadPreview" src="<%=request.getContextPath() %>/resources/images/default.jpg" width="220" height="220">
								</c:when>
								<c:otherwise>
									<img id="uploadPreview" src="${user.avatar}" width="220" height="220">
								</c:otherwise>
							</c:choose>
						
						</div>
					</div>
					<form action="postpic" method="post" enctype="multipart/form-data">
						<div class="avator-btn-group">
							<div id="avator-btns" class="avator-btn-inner">
						        <div class="avator-btn-wrap">
							            <a href="javascript:void(0)" hidefocus="true" class="avator-btn-fake">上传头像</a>
							         	  <input id="uploadImage" type="file" title="上传头像" name="myPhoto" onchange='viewPic();'/>
						            
						        </div>
							</div>
							<div class="avator-upload-wrap" >
								<input class="rlf-btn-green btn-block" type="submit" value="保存">
							</div>
						</div>
					</form>
				</div>
		    </div>
		  </div>
		</div>

	</div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		 function viewPic() {
			var oFReader = new FileReader();
			oFReader.onload = function(e) {
				document.getElementById("uploadPreview").src = e.target.result;
			}
			if (document.getElementById("uploadImage").files.length === 0) {
				return;
				}
			var oFile = document.getElementById("uploadImage").files[0];
			oFReader.readAsDataURL(oFile);
			}
	 
	 </script>
</body>  
</html>