<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${currentUser.nickname }的课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user-course.css" />
		
	</head>  
	<body>  
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">

<div class="main-body container clearfix">
  <div class="l">
                  <div class="sider">
    <div class="user-info">
        <span class="user-pic">
           <c:choose>
				<c:when test="${currentUser.avatar==null }">
					<img src="<%=request.getContextPath() %>/resources/images/default.jpg" width="220" height="220">
				</c:when>
				<c:otherwise>
					<img  src="${currentUser.avatar}" width="220" height="220">
				</c:otherwise>
			</c:choose>
        </span>
        <ul class="user-lay">
            <li class="mynick-name">
                <span class="user-name">${user.nickname }</span>
            </li>
            <li>
                <span class="user-site"> ${user.title.name } </span>
            </li>
                        <li><a href="<%=request.getContextPath()%>/user/profile" class="user-setup">设置</a></li>
                                </ul>
    </div>
    <div class="user-desc">
        <div class="sign-wrap">
            <p id="signed" class="signed">
           			<c:choose>
				<c:when test="${user.introduction==null }">
					这位童鞋很懒，什么也没有留下～～！
				</c:when>
					<c:otherwise>
						 ${user.introduction }
					</c:otherwise>
				</c:choose>     
                
            </p>
            <p id="rlf-tip-wrap" class="rlf-tip-wrap"></p>
                    </div>
    </div>
    <ul class="mp clearfix">
        <li class="l mp-item">
          <span class="mp-atag">
            <p class="mp-num">43小时33分</p>
            <p class="mp-title">学习</p>
          </span>
        </li>
        <li class="mp-item">
          <a class="mp-atag" href="<%=request.getContextPath() %>/user/experience">
                        <span class="mp-num mp-hover">
                2014            </span>
                        <span class="mp-title mp-hover">经验</span>
          </a>
        </li>
    </ul>
    <ul class="nav">
        <li>
            <a class="js-count-course active" href="/space/index"><i class="icon-nav icon-tick"></i>我的课程<em class="got-num">22</em></a>
                    </li>
        <li>
            <a class="js-count-plan " href="/space/program"><i class="icon-nav icon-plan"></i>我的计划<em class="got-num">0</em></a>
        </li>
        <li>
            <a class="js-count-note " href="/space/note"><i class="icon-nav icon-note"></i>我的笔记<em class="got-num">0</em></a>
        </li>
                <li>
            <a class="" href="/space/code"><i class="icon-nav icon-code"></i>我的代码<em class="got-num">112</em></a>
        </li>
        <li class="rd-dissu">
            <a class="read-mine" href="/myclub/myquestion/t/ques">查看我的社区</a>
            <p class="read-notice">看看里面有什么好玩的事情吧～～</p>
        </li>
            </ul>
    </div><!--sider end-->
  </div>
  <div class="r space-main">
    
    <div class="family">
        <h1 class="family-hd">我的课程</h1>
    </div>
    <div class="course-tool-bar clearfix">
        <div class="tool-left l">
            <a href="/space/index" class="sort-item active">已关注
                        </a>
            <a href="/space/course/t/0" class="sort-item ">已学</a>
            <a href="/space/course/t/2" class="sort-item ">已学完</a>
        </div>
        <div class="tool-right r">
            <div class="tool-all">
                <span id="js-columall" class="tool-item"><strong>全部</strong> <i class="tool-item icon icon-down"></i></span>
                <ul id="js-columbd" class="all-cont">
                                                            <li><a data-id="0" href="/space/index/sid/0">全部</a></li>
                                                      </ul>

            </div>

            
            
            <span class="tool-item total-num">
                共<b></b>个课程
            </span>
            <span class="tool-item tool-pager">
                <span class="pager-num">
                    <b class="pager-cur">1</b>/<em class="pager-total">1</em>
                </span>
                                <a href="javascript:void(0)" class="pager-action pager-prev hide-text disabled">上一页</a>
                
                                <a href="javascript:void(0)" class="pager-action pager-next hide-text disabled">下一页</a>
                            </span>
            <span class="tool-item tool-remove js-program-edit" data-edit='0'>
                <i class="icon icon-del"></i><b>删除</b>
            </span>
        </div>
    </div>
    
    
    <ul class="follow-list">
          <div class="uncourse">
        <p>暂无任何关注</p>
      </div>
        </ul>

        
  </div>
</div>

</div>

		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	</body>  
</html>