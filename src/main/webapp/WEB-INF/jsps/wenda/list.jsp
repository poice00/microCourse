<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>  
<html>  
	<head>  
		<title>问答_社区_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/wenda-less.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">
			<!-- 社区导航 -->
			<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>
			
			<div class="wenda clearfix">
	  			<div class="js-layout-change">
	    			<div class="l wenda-main">
				    	<!-- <ul class="wenda-tab clearfix">
					        <li class="tabactive"><a href="/microCourse/wenda">全部问答</a></li>
					        <li><a href="/microCourse/wenda/19">课程问答</a></li>
					        <li><a href="/microCourse/wenda/18">技术问答</a></li>
					        <li><a href="/microCourse/wenda/17">技术分享</a></li>
					        <li><a href="/microCourse/wenda/20">活动建议</a></li>
				    	</ul> -->
					    <div class="newpost">
					        <a href="/microCourse/wenda/19/0" class="quealltab  onactive">最新</a>
					        <!--  <a href="/wenda/0/2" class="quealltab " >最新回答</a> -->
					        <a href="/microCourse/wenda/19/1" class="quealltab ">热门</a>
					        <a href="/microCourse/wenda/19/2" class="quealltab ">等待回复</a>
					        <!-- <a href="javascript:void(0)" class="btn-custom-wenda js-btn-custom-show">
						        <span>
						          <i class="icon-set"></i>
						          <em>问答定制</em>
						        </span>
					        </a> -->
					    </div>
					    
					    <!--左侧列表内容-->
					    <div class="wenda-list">
					    	<c:forEach items = "${wendaList }" var = "wenda">
	        					<div class="wenda-listcon clearfix">
								    <div class="headslider">
								        <a href="/microCourse/wenda/question/${wenda.question.user.userId }" class="wenda-head" target="_blank"
								        	title="${wenda.question.user.nickname }">
								            <img src="${wenda.question.user.avatar }" width="40" height="40">
								        </a>
								        <a href="/microCourse/wenda/question/${wenda.question.user.userId }" target="_blank" title="${wenda.question.user.nickname }"
								        	class="wenda-nickname">
								            ${wenda.question.user.nickname }
								        </a>
								    </div>
								    <div class="wendaslider">
								    	<c:choose>
								    		<c:when test="${wenda.answerCount eq 0 }">
									        	<a href="/microCourse/wenda/detail/${wenda.question.topicId }" target="_blank" class="replynumber noanswernum">
								    		</c:when>
								    		<c:otherwise>
									        	<a href="/microCourse/wenda/detail/${wenda.question.topicId }" target="_blank" class="replynumber hasanswernum">
								    		</c:otherwise>
							    		</c:choose>
								            <div class="ys">
								                <div class="number"><span>${wenda.answerCount }</span></div>
								                <div>回答</div>
								            </div>
								            <div class="browsenum">
								                <div class="number"><span>${wenda.question.browseCount }</span></div>
								                <div>浏览</div>
								            </div>
								        </a>
								        <h2 class="wendaquetitle">
								        	<c:choose>
								        		<c:when test="${wenda.question.top }">
										            <i class="icon-ad"></i>
								        		</c:when>
								        		<c:when test="${wenda.question.bestAnswer != null }">
								        			<i class="icon-tick-revert"></i>
								        		</c:when>
								        		<c:otherwise>
								        			<i class="icon-ques-revert"></i>
								        		</c:otherwise>
								        	</c:choose>
								            <div class="wendatitlecon">
								            	<c:choose>
								            		<c:when test = "${wenda.question.top }">
								                		<span class="icon-ding"></span>&nbsp;
								            		</c:when>
								            	</c:choose>
								                <a href="/microCourse/wenda/detail/${wenda.question.topicId }" target="_blank" class="wendatitle">
								                    ${wenda.question.title }
								                </a>
								            </div>
								        </h2>
								        <div class="replycont clearfix">
								            <i class="icon-msg-revert"></i>
								            <div class="l replydes">
								            	<c:choose>
								            		<c:when test="${wenda.status eq 0 }">
								            			<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
								            		</c:when>
								            		<c:otherwise>
							            				<c:choose>
										            		<c:when test="${wenda.status eq 1 }">
										            			<span class="replysign adopt">[已采纳的回答]</span>
										            		</c:when>
									            		
										            		<c:when test="${wenda.status eq 2 }">
										            			<span class="replysign praise">[最赞回答]</span>
										            		</c:when>
										            		
									            			<c:otherwise>
										            			<span class="replysign praise">[最新回答]</span>
										            		</c:otherwise>
							            				</c:choose>
							            				<a href="/microCourse/wenda/question/${wenda.statusUser.userId }" target="_blank" title="${wenda.statusUser.nickname }" class="replyuserhead">
								            				<img src="${wenda.statusUser.avatar }" width="20" height="20">
							            				</a>
							            				<a href="/microCourse/wenda/question/${wenda.statusUser.userId }" target="_blank" title="${wenda.statusUser.nickname }" class="nickname">
							            					${wenda.statusUser.nickname }: 
						            					</a>
							            				<span class="replydet">${wenda.statusSns.content }</span>
								            		</c:otherwise>
								            	</c:choose>
								        	</div>
								    	</div>
								        <div class="replymegfooter clearfix">
								            <div class="wenda-time l">
								                <em>提问时间：${wenda.elapse }前</em>
								            </div>
								            <div class="keyword-list l">
								            	<c:forEach items = "${wenda.tags }" var = "tag">
									                <a href="/microCourse/wenda/tag/${tag.tagId }" target="_blank" class="list-tag">
									                	${tag.name }
									                </a>
								            	</c:forEach>
								            </div>
								        </div>
									</div>
								</div>
				  			</c:forEach>
	  
							<div class="page">
								<span class="disabled_page">首页</span>
								<span class="disabled_page">上一页</span>
								<c:forEach begin="1" end="${page }" varStatus="status">
									<a href="/microCourse/wenda/${status.index - 1}">${status.index }</a>
								</c:forEach>
								<a href="/wenda/0/1/2">下一页</a>
								<a href="/microCourse/wenda/${page - 1}">尾页</a>
							</div>
	    				</div>
	    			</div>
	    			<div class="r wenda-slider">
	      				<!-- pub new ques -->
						<div class="newques-container">
							<a href="/microCourse/wenda/save" class="newques-btn" id="js-newques" target="_blank">发新问题</a>
						</div>
						
						<!--user info-->
						<c:choose>
							<c:when test = "${currentUser != null }">
								<div class="wenda-my">
									<div class="user-info">
									  <a class="user-img" href="/microCourse/wenda/question/${currentUser.userId }">
									    <img src="${currentUser.avatar }" alt="${currentUser.nickname }">
									  </a>
									  <p class="username">${currentUser.nickname }</p>
									</div>
									<ul class="user-about">
									  <li><a href="/microCourse/wenda/question/${currentUser.userId }">提问 </a></li>
									  <li class="repl"><a href="/microCourse/wenda/reply/${currentUser.userId }">回复 </a></li>
									  <li><a href="/microCourse/wenda/follow/${currentUser.userId }">关注 </a></li>
									</ul>
								</div>
							</c:when>
						</c:choose>
						
						<!-- tags -->
						<div class="panel wenda-form clearfix">
						  <div class="panel-body clearfix">
						      <c:forEach items = "${top20Tag }" var = "tag">
						          <a href="/microCourse/wenda/tag/${tag.tagId }" class="hot-label" target="_self">${tag.name }</a>
						      </c:forEach>
					      </div>
						</div>
						
						<!-- hot questiones -->
						<div class="panel hot">
						  <div class="panel-heading">
						    <h2 class="panel-title">一周热门问题</h2>
						  </div>
						  <div class="panel-body clearfix" style="padding:0px;">
						      <ul class="weekly-hot">
						          <li class="padtop"><em class="hoticon hot1">热</em><a href="/wenda/detail/288042" target="_blank" class="hottalk">【官方活动】写书评赢Android群英传 你敢写 我敢送</a><i class="rankingnum">5<br>回答</i></li>
						          <li class=""><em class="hoticon hot2">热</em><a href="/qadetail/97236" target="_blank" class="hottalk">自己演示的正确性</a><i class="rankingnum">8<br>回答</i></li>
						          <li class=""><em class="hoticon hot3">热</em><a href="/qadetail/97387" target="_blank" class="hottalk">老师，这个是什么情况呀？</a><i class="rankingnum">7<br>回答</i></li>
						          <li class=""><em class="hoticon hot4">热</em><a href="/qadetail/97046" target="_blank" class="hottalk">求解错在哪里，输出不带小数点</a><i class="rankingnum">5<br>回答</i></li>
						          <li class="bordbottom"><em class="hoticon hot5">热</em><a href="/qadetail/97730" target="_blank" class="hottalk">使用预处理语句的占位符输入中文会出错？？？？</a><i class="rankingnum">4<br>回答</i></li>
					          </ul>
					      </div>
						</div>
						
						<!-- reply rank -->
						<div class="panel weekly-rank">
						    <div class="panel-heading">
						    	<h2 class="panel-title">一周回答雷锋榜 </h2>
						    	<a href="/wenda/top" target="_blank" class="honormore">更多</a>
						    </div>
						    <div class="wenda-mkclasscon clearfix">
						        <ul>
					          	    <li class="padtop">
							            <a href="/myclub/otherquestion?uid=255777" class="l roll-head" target="_blank" title="偌颜宁">
							          	    <img src="http://img.mukewang.com/user/5453449f0001c36e05520522-40-40.jpg" width="40" height="40">
						          	    </a>
							            <a href="/myclub/otherquestion?uid=255777" target="_blank" title="偌颜宁" class="rankingnickname">偌颜宁</a>
							            <em class="archieve">我牛X啥都知道</em>
							            <i class="adopt rankingnum">4019<br>回答</i>
						            </li>
					            </ul>
					        </div>
						</div>
						<!-- course relations -->
	   				</div>
	  			</div>
			</div>
		</div>
		
		<div class="custom-layout js-custom-layout">
		    <div class="custom-content">
		      	<p>选择我喜欢的问答类型，专注我最懂的类别。帮助他人解决问题，为世界贡献一点爱，明天就会更好。</p>
		        <div class="custom-tags clearfix js-keyword-list">
		            <a href="javascript:void(0)" data-id="0" class="hot-label js-all-keyword curr">全部问答</a>
		            <a href="javascript:void(0)" data-id="2" class="hot-label js-keyword">PHP</a>
		            <a href="javascript:void(0)" data-id="3" class="hot-label js-keyword">JAVA</a>
		            <a href="javascript:void(0)" data-id="5" class="hot-label js-keyword">Html/CSS</a>
		            <a href="javascript:void(0)" data-id="7" class="hot-label js-keyword">Maya</a>
		            <a href="javascript:void(0)" data-id="8" class="hot-label js-keyword">MongoDB</a>
		        </div>
			    <div class="btnbox">
			        <a href="javascript:void(0)" class="btn btn-green js-custom-save">保存</a>
			        <a href="javascript:void(0)" class="btn btn-white js-custom-cancel">取消</a>
			    </div>
			    
		        <script>
			        //页面载入时，选中的定制标签
			        var initHotLabel='';
		      	</script>
		    </div>
	  	</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		<script type="text/javascript">seajs.use("/microCourse/resources/page/wenda/index");</script>
		 
	</body>  
</html>