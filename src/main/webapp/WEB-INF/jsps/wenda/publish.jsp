<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>  
<html>  
	<head>  
		<title>发问题_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/wenda-save.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">
			<!-- 社区导航 -->
			<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>
			
			<div class="container clearfix" style="">
			    <div class="l bbs-main" style="">
			      <div class="sucesspage" style="">
			        <h2>发问题</h2>
			        <div id="js-inputques" class="inputques" style="">
		               <div class="js-ques-category category clearfix">
		                 <span class="ques-label">分类：</span>
                         <a href="javascript:void(0)" class="onactive" data-type="18">技术问答</a>
                         <a href="javascript:void(0)" data-type="17">技术分享</a>
		               </div>
		               <div class="quesdetail clearfix">
		                  <span class="ques-label">标题：</span>
		                  <div class="question-area">
		                    <input type="text" id="ques-title" class="ipt autocomplete" maxlength="255" name="title" placeholder="请输入问题标题">
		                    <p class="errortip"></p>
		                    <dl class="send-area-result">
		                    </dl>
		                  </div>
		               </div>
		                <div class="quesdetail mbottom" style="">
		                  <span class="ques-label">内容：</span>
		                  <div id="editor-wrap" class="editor clearfix" >
		                    <div class="" id="ques-editor">
		                    </div>
		                    <p class="errortip"></p>
		                  </div>
		                </div>
		                <div class="mbottom">
		                  <span class="ques-label">标签：</span>
		                  <div id="tag-title" class="ques-tag defaultbox">
		                    <div id="tagcontent" class="tags-content">
		                        <span id="label-default">您最多可以选择3个标签哟！</span>
		                    </div>
		                    <p class="errortip firse"></p>
		                    <!-- <p class="tag-tip">您最多可以从以下选择3个标签哟！</p> -->
		                    <div id="js-tags" class="taglist clearfix">
		                    	<c:forEach items="${tagList }" var = "tag">
	                             	<a href="javascript:;" class="list-tag" data-id="${tag.tagId }" name="${tag.name }">${tag.name }</a>
	                             </c:forEach>
                            </div>
		                  </div>
		               </div>
			        </div>
			        <div class="verify-code clearfix"></div>
			        <div class="saveques-bottom">
			          <a href="##" id="ques-submit-btn" class="btn btn-green link-btn publishbtn">发布</a>
			          <p class="global-errortip js-global-error"></p>
			        </div>
			      </div>
			     </div>
				  <div class="r bbs-slide">
				    <div class="panel bbs-sendques">
				      <div class="panel-body">
				        <h1>您想发问题 还是发问题还是想发问题？</h1>
				        <dl>
				          <dt>上面没有写错，是您看错啦。</dt>
				          <dd>1、您是想来吐槽的吧，没事，随便发吧。有人会跟你一起吐槽的。</dd>
				          <dd>2、您是来解决问题？请先搜索是否已经有同类问题吧。这样您就省心少打字。</dd>
				          <dd>3、没找到是么？就在发问题时精确描述你的问题，不要写与问题无关的内容哟；</dd>
				          <dd>4、慕课讨论更热衷于解达您想要的答案。能引起思考和讨论的知识性问题；</dd>
				          <dt>问答禁止这些提问</dt>
				          <dd>1、禁止发布求职、交易、推广、广告类与问答无关信息将一律清理。</dd>
				          <dd>2、尽可能详细描述您的问题，如标题与内容不符，或与问答无关的信息将被关闭。</dd>
				          <dd>3、问答刷屏用户一律冻结帐号</dd>
				        </dl>
				      </div>
				    </div>
				    <!-- tags -->
				    <div class="panel clearfix">
				      <div class="panel-heading">
				        <h3 class="panel-title">热门标签</h3>
				      </div>
		              <div class="panel-body hot-tags clearfix">
		              	  <c:forEach items="${top20Tag }" var = "tag">
                          	  <a href="tag/${tag.tagId }" class="hot-label" target="_blank">${tag.name }</a>
                          </c:forEach>
		               </div>
		            </div>
				  </div>
			</div>
		</div>
		
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		
		<script type="text/javascript" charset="utf-8" src="/microCourse/resources/lib/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="/microCourse/resources/lib/ueditor/ueditor.all.js"> </script>
		
	</body>  
</html>