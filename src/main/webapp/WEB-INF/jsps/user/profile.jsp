<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>个人资料-微课程</title>  
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common-less.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/login.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/settings.css" />
		
	</head>  
<body>  
	
	<!-- 导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
	
	<div class="wcontainer set-space-cont clearfix">
  <div class="setting-left l">
    <ul class="wrap-boxes">
      <li class="nav-active">
        <a href="/microCourse/user/profile" class="onactive">个人资料</a>
      </li>
      <li>
         <a href="/microCourse/user/avatar">头像设置</a>
       </li>
      <!-- <li>
        <a href="/microCourse/user/email">邮箱验证</a>
      </li> -->
      <li>
        <a href="/microCourse/user/password">修改密码</a>
      </li>
      <!-- <li>
        <a no-pjajx="" href="/microCourse/user/bindsns">绑定帐号</a>
      </li> -->
    </ul>
  </div>
  <div class="setting-right ">
    <div class="setting-right-wrap wrap-boxes settings">
        

<div id="setting-profile" class="setting-wrap setting-profile">
    <form id="profile" action="/microCourse/user/changeProfile" method="post">
    <input type="hidden" name="id" value="${currentUser.userId}">
        <div class="wlfg-wrap">
            <label class="label-name" for="nick">昵称</label>
            <div class="input-group">
			  &nbsp<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>	
			  <input type="text" class="form-control" name="nickname" id="username" value="${user.nickname }" style="width: 300px" >
			</div>
			  <p class="rlf-tip-wrap"></p>
            
            
        </div>
        <div class="wlfg-wrap">
            <label class="label-name" for="job">职位</label>
            <div class="rlf-group">
            
                 
                <select name="titleId" class="rlf-select" hidefocus="true" id="job">
                				<c:if test="${user.title==null}">
                					<option value=""  selected="selected">请选择职位</option>
                				</c:if>
                				
	                				<c:forEach items="${titleList}" var="item">
									  <option value ="${item.titleId }" <c:if test="${user.title.name==item.name }">selected</c:if>
							  >${item.name }</option>
                				</c:forEach>
                			
	                    	
	
							
				</select>                   
                  
                <p class="rlf-tip-wrap"></p>
            </div>
        </div>
        <div class="wlfg-wrap">
            <label class="label-name">性别</label>
            <div class="rlf-group rlf-radio-group">
                <label><input type="radio" hidefocus="true" value="0" <c:if test="${user.gender==0 }">checked</c:if> name="gender">保密</label>
                <label><input type="radio" hidefocus="true" value="1" <c:if test="${user.gender==1 }">checked</c:if> name="gender">男</label>
                <label><input type="radio" hidefocus="true" value="2" <c:if test="${user.gender==2 }">checked</c:if> name="gender">女</label>
            </div>
            <p class="rlf-tip-wrap"></p>
        </div>
        <div class="wlfg-wrap">
            <label class="label-name" for="aboutme">个性签名</label>
            <div class="rlf-group">
                <textarea name="introduction"  id="aboutme" cols="30" rows="5" class="textarea"
                >${user.introduction}</textarea>
                <p class="rlf-tip-wrap"></p>
            </div>
        </div>
        <div class="wlfg-wrap">
            <div class="rlf-group">
                <input id="profile-submit" type="submit" hidefocus="true" aria-role="button" class="rlf-btn-green btn-block profile-btn" />
            </div>
        </div>
    </form>
</div>
</div>


    </div>
  </div>
		
	<!-- 页脚 -->
	<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	 
</body>  
</html>