<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>  
<html>  
	<head>  
		<title>${topic.title }_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/lib/layer/1.6.0/skin/layer.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/wenda-detail.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">
			<!-- 社区导航 -->
			<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>
			
			<div class="container qa-container clearfix" style="">
			    <div class="qa-left l" style="">
			        <div class="qa-left-wrap" style="">
			            <div class="qa-breadcrumb">
			                <a href="..">全部问答</a> &gt; <a href="../${topic.source }">${status.location }</a>
			            </div>
			            <c:choose>
			            	<c:when test="${status.currentUserIsTizhu && status.replyCount != 0 && status.bestReplyId == 0 }">
		                        <div class="wenda-tip">已有同学回复你了，快去采纳为答案吧！帮助你的同学可得到+20经验。一起来努力吧！</div>
			            	</c:when>
			            </c:choose>
                        <div class="qa-header">
			                <div class="qa-header-right r">
			                    <div class="small-share l">
			                        <ul class="share-wrap">
			                        <li>
			                            <span class="share-txt">分享</span>
			                        </li>
			                        <li class="weichat-posi">
			                          <div class="bdsharebuttonbox weichat-style bdshare-button-style0-16" data-bd-bind="1442908233658">
			                            <a href="#" class="bds_weixin icon-nav icon-share-weichat" data-cmd="weixin" title="分享到微信"></a>
			                            <a href="#" class="bds_qzone icon-nav icon-share-qq" data-cmd="qzone" title="分享到QQ空间"></a>
			                            <a href="#" class="bds_tsina icon-nav icon-share-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
			                          </div>
			                        </li>
			                      </ul>
			                    </div>
                                <a href="javascript:void(0)" data-id="${topic.topicId }" title="${status.follow }" class="l wenda-add-collection js-collection-btn">
                                	<c:choose>
                                		<c:when test = "${status.follow eq '添加关注' }">
					                        <i class="icon-heart"></i>
                                		</c:when>
                                		<c:otherwise>
                                			<i class="icon-heart-revert"></i>
                                		</c:otherwise>
									</c:choose>
			                    </a>
					            <c:choose>
				                    <c:when test="${status.currentUserIsTizhu }">
	                               		<span id="js-edit" class="qa-edit l"><i class="icon-edit"></i></span>
	                               	</c:when>
						        </c:choose>
                            </div>
			                <a href="/microCourse/wenda/question/${topic.user.userId }" target="_blank" class="qa-author">
			                	<img src="${status.tizhuAvatar }" width="40" height="40">
			                	${status.tizhuNickName }
		                	</a>
			            </div>
			            <div class="qa-content" data-qid="${topic.topicId }">
			                <div class="qa-content-inner ">
			                    <div id="js-content-main">
			                        <h3 class="js-qa-wenda-title qa-wenda-title">${topic.title }</h3>
			                        <div id="js-qa-wenda" class="qa-wenda imgPreview rich-text"><p>${topic.content }<br></p></div>
			                    </div>
                                <div id="js-wenda-editor" class="js-msg-context" style="display:none;">
			                        <input type="text" id="js-wenda-editor-title" class="ipt wenda-editor-title" maxlength="255" placeholder="请输入标题...">
			                        <div id="js-wenda-editor-content" class="wenda-editor-content">
			                        </div>
			                        <script type="text/plain" id="js-editor-content-dup"><p>${topic.content }<br /></p></script>
			                        <div class="qa-deditor-foot clearfix">
			                            <div class="r">
			                                <span class="qa-tips"></span>
			                                <button id="js-wenda-editor-cancel" class="btn btn-mini btn-normal ">取消</button>
			                                <button id="js-wenda-editor-submit" class="btn btn-mini btn-green" data-id="${topic.topicId }">保存</button>
			                            </div>
			                        </div>
			                    </div>
                            </div>
			                <div class="qa-content-addon clearfix">
			                    <span class="qa-createtime l">${status.elapse }前</span>
                                    <div class="keyword-list">
                                    	<c:forEach items="${tags }" var="tag">
	                                        <a href="/microCourse/wenda/tag/${tag.tagId }" target="_blank" class="list-tag">${tag.name }</a>
                                    	</c:forEach>
                                    </div>
                                <span class="qa-view-num r">${topic.browseCount } 浏览</span>
			                    <span class="qa-total-comment r">${status.replyCount } 回答</span>
			                </div>
			            </div>
			            <div class="qa-comments">
			            	<c:forEach items = "${replyList }" var = "reply">
			            		<c:choose>
			            			<c:when test = "${status.bestReplyId != reply.snsId }">
					            		<!-- 未采纳答案 -->
						                <div class="qa-comment js-qa-comment" data-cid="${reply.snsId }">
						                	<c:choose>
							                	<c:when test = "${status.currentUserIsTizhu && !reply.isTizhu && status.bestReplyId eq 0 }">
											        <a href="javascript:void(0)" class="js-qa-comment-accept qa-comment-accept" data-ids="${topic.topicId }-${reply.snsId}">
											            <i></i>
											            <span>设置为最佳问答</span>
											        </a>
									        	</c:when>
							        		</c:choose>
									        <div class="qa-comment-wrap clearfix  js-comment-accept-hover">
										        <div class="qa-comment-author">
										            <a href="/microCourse/wenda/question/${reply.userId }" title="${reply.nickname }">
										                <img src="/microCourse/upload/${reply.avatar }/avatar.jpg" width="40" height="40">
										                <span class="qa-comment-nick">${reply.nickname }</span>
							                        </a>
										        </div>
										        
										        <c:choose>
										        	<c:when test = "${status.currentUserIsTizhu && !reply.isTizhu && status.bestReplyId eq 0 }">
									        			<div class="qa-comment-d hasSet">
										        	</c:when>
										        	<c:otherwise>
										        		<div class="qa-comment-d">
									        		</c:otherwise>
										        </c:choose>
											        	    <div class="qa-comment-inner">
												                <div class="qa-comment-c imgPreview">
												                    <div class="rich-text">
												                        <p>${reply.content }</p> 
												                    </div>
												                </div>
												                <div class="qa-comment-addon">
												                    <span class="qa-comment-time">${reply.elapse }前</span>
												                    <div class="qa-comment-addon-r">
												                        <span class="qa-total-reply js-reply-item-reply">
												                        	<i class="icon-msg"></i>
												                        	<span class="js-qa-tr-num">回复</span>
											                        	</span>
												                       <c:choose>
												                        	<c:when test = "${reply.hasThumbsUp eq 0 }">
														                        <span class="js-qa-comment-support qa-comment-support js-qacom-supported-user"
														                        	data-ids="${currentUser.userId }-${reply.snsId }">
												                        	</c:when>
												                        	<c:otherwise>
												                        		<span class="js-qa-comment-support qa-comment-support qa-comment-supported js-qacom-supported-user"
														                        	data-ids="${currentUser.userId }-${reply.snsId }">
												                        	</c:otherwise>
											                        	</c:choose>
												                        	<i class="icon-thumb"></i>
												                        	<span>${reply.thumbUps }</span>
											                        	</span>
												                    </div>
												                </div>
												            </div>
												        </div>
									        </div>
									        <div class="qa-reply">
									        	<div class="qa-reply-header"></div>
										        <div class="qa-replies">
										            <div class="qa-reply-c">
										               <c:forEach items = "${reply.replies }" var = "r">
											                <div class="qa-reply-item" data-rid="${reply.snsId }">
											                    <a class="qa-reply-item-author" href="/microCourse/wenda/question/${r.fromUserId }" title="${r.fromNickname }">
											                   		<img src="/microCourse/upload/${r.fromAvatar }/avatar.jpg" width="40" height="40">
											                    </a>
											                    <div class="qa-reply-item-inner">
											                        <p>
				                                                        <a href="/microCourse/wenda/question/${r.fromUserId }" class="qa-reply-nick">${r.fromNickname }</a>
				                                                        <c:choose>
				                                                        	<c:when test = "${r.toNickname != '' }">
											                                                                 回复 <a href="/microCourse/wenda/question/${r.toUserId }" class="qa-reply-nick">${r.toNickname }</a>：
				                                                        	</c:when>
				                                                        </c:choose>
				                                                    </p>
											                        <p class="q-reply-item-c">${r.content }</p>
											                        <div class="qa-reply-item-foot clearfix">
											                            <span class="reply-item-index r">#${r.floor }</span>
											                            <span>${r.elapse }前</span>
											                            <span class="qa-reply-item-reply js-reply-item-reply" data-uid="${r.fromUserId }|${r.fromNickname }" data-cid="${r.snsId }">
											                            	<i class="icon-resp"></i>回复
										                            	</span>
											                        </div>
											                    </div>
											                </div>
									                	</c:forEach>
									                	<c:choose>
										            	<c:when test="${reply.countOfReplies > 3 }">
										            		<div class="overplusnum js-overplus-num" data-rid="${reply.snsId }">
										            			点击展开后面
										            			<em class="js-reminds-num">${reply.countOfReplies - 3 }</em>条评论
									            			</div>
										            	</c:when>
									            	</c:choose>
							                        </div>
										
										            <!-- 回复框 -->
										            <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" data-tuid="${currentUser.userId }" style="display:none">
										                <div class="qa-reply-iavator l">
							                                <a href="/microCourse/wenda/question/${currentUser.userId }" title="${currentUser.nickname }">
										                        <img src="${currentUser.avatar }" width="40" height="40">
										                    </a>
							                            </div>
										                <div class="qa-reply-iwrap">
										                    <div class="qa-reply-iarea">
										                        <c:choose>
										                    		<c:when test = "${empty currentUser }">
												                        <textarea name="" id="" class="js-unlogin ipt" readonly placeholder="写下你的评论...">
												                        	写下你的评论...
											                        	</textarea>
										                    		</c:when>
										                    		<c:otherwise>
												                        <textarea name="" id="" class="js-reply-ipt-default ipt" placeholder="写下你的评论...">
											                        		写下你的评论...
										                        		</textarea>
										                    		</c:otherwise>
									                    		</c:choose>
										                    </div>
										                </div>
										                <div class="qa-reply-ifoot clearfix">
										                    <div class="qa-reply-footright r">
										                        <span class="qa-tips"></span>
										                        <button class="btn-normal btn-mini js-ipt-cancel">取消</button>
										                        <button class="btn-mini btn-green  js-ipt-submit">提交</button>
										                    </div>
										                </div>
										            </div>
										        </div>
									    	</div>
								    	</div>
									</c:when>
									<c:otherwise>
									<!-- 最佳答案 -->
									<div class="qa-comment js-qa-comment" data-cid="${reply.snsId }">
									    <div class="qa-comment-wrap clearfix thebest ">
									        <h3 class="the-best-answer">最佳回答</h3>
									        <span class="qa-comment-time">${reply.elapse }前</span>
									        <div class="qa-comment-d">
									            <div class="qa-comment-inner">
									                <div class="qa-comment-c imgPreview">
									                    <div class="rich-text">
									                        <p> ${reply.content }</p>
									                    </div>
									                </div>
									                <div class="qa-comment-addon">
									                    <div class="qa-comment-author">
									                        <a href="/microCourse/wenda/question/${reply.userId }" title="${reply.nickname }">
									                            <img src="/microCourse/upload/${reply.avatar }/avatar.jpg"width="24" height="24">
									                            <span class="qa-comment-nick">${reply.nickname }</span>
									                        </a>
									                    </div>
									                    <div class="qa-comment-addon-r">
									                        <span class="qa-total-reply js-reply-item-reply">
									                            <i class="icon-msg"></i>
									                            <span class="js-qa-tr-num">回复</span>
									                        </span>
									                        <c:choose>
									                        	<c:when test = "${reply.hasThumbsUp eq 0 }">
											                        <span class="js-qa-comment-support qa-comment-support js-qacom-supported-user"
											                        	data-ids="${currentUser.userId }-${reply.snsId }">
									                        	</c:when>
									                        	<c:otherwise>
									                        		<span class="js-qa-comment-support qa-comment-support qa-comment-supported js-qacom-supported-user"
											                        	data-ids="${currentUser.userId }-${reply.snsId }">
									                        	</c:otherwise>
								                        	</c:choose>
									                            <i class="icon-thumb"></i>
									                            <span>${reply.thumbUps }</span>
									                        </span>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div>
									    <div class="qa-reply">
									        <div class="qa-reply-header"></div>
									        <div class="qa-replies">
									        	<!-- 默认显示3条回复的回复 -->
									            <div class="qa-reply-c">
									        		<c:forEach items = "${reply.replies }" var = "r">
										                <div class="qa-reply-item" data-rid="${reply.snsId }">
										                    <a class="qa-reply-item-author" href="/microCourse/wenda/question/${r.fromUserId }" title="${r.fromNickname }">
										                   		<img src="/microCourse/upload/${r.fromAvatar }/avatar.jpg" width="40" height="40">
										                    </a>
										                    <div class="qa-reply-item-inner">
										                        <p>
			                                                        <a href="/microCourse/wenda/question/${r.fromUserId }" class="qa-reply-nick">${r.fromNickname }</a>
			                                                        <c:choose>
			                                                        	<c:when test = "${r.toNickname != '' }">
										                                                                 回复 <a href="/microCourse/wenda/question/${r.toUserId }" class="qa-reply-nick">${r.toNickname }</a>：
			                                                        	</c:when>
			                                                        </c:choose>
			                                                    </p>
										                        <p class="q-reply-item-c">${r.content }</p>
										                        <div class="qa-reply-item-foot clearfix">
										                            <span class="reply-item-index r">#${r.floor }</span>
										                            <span>${r.elapse }前</span>
										                            <span class="qa-reply-item-reply js-reply-item-reply" data-uid="${r.fromUserId }|${r.fromNickname }" data-cid="${r.snsId }">
										                            	<i class="icon-resp"></i>回复
									                            	</span>
										                        </div>
										                    </div>
										                </div>
								                	</c:forEach>
									            	<c:choose>
										            	<c:when test="${reply.countOfReplies > 3 }">
										            		<div class="overplusnum js-overplus-num" data-rid="${reply.snsId }">
										            			点击展开后面
										            			<em class="js-reminds-num">${reply.countOfReplies - 3 }</em>条评论
									            			</div>
										            	</c:when>
									            	</c:choose>
									            </div>
									            <!-- 回复框 -->
									            <div class="js-qa-reply-ibox qa-reply-ibox  clearfix" style="display: none;">
									                <div class="qa-reply-iavator l">
									                    <a href="/microCourse/wenda/question/${currentUser.userId }" title="${currentUser.nickname }">
									                        <img src="${currentUser.avatar }" width="40" height="40">
									                    </a>
									                </div>
									                <div class="qa-reply-iwrap">
									                    <div class="qa-reply-iarea">
									                    	<c:choose>
									                    		<c:when test = "${empty currentUser }">
											                        <textarea name="" id="" class="js-unlogin ipt" readonly placeholder="写下你的评论...">
											                        	写下你的评论...
										                        	</textarea>
									                    		</c:when>
									                    		<c:otherwise>
											                        <textarea name="" id="" class="js-reply-ipt-default ipt" placeholder="写下你的评论...">
										                        		写下你的评论...
									                        		</textarea>
									                    		</c:otherwise>
								                    		</c:choose>
									                    </div>
									                </div>
									                <div class="qa-reply-ifoot clearfix">
									                    <div class="qa-reply-footright r">
									                        <span class="qa-tips"></span>
									                        <button class="btn-normal btn-mini js-ipt-cancel">取消</button>
									                        <button class="btn-mini btn-green  js-ipt-submit">提交</button>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div>
									</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
		            </div>
		            <div id="js-qa-comment-input" class="qa-comment-input js-msg-context clearfix" style="">
		                <div class="qa-ci-avator l">
                           	<a href="/microCourse/wenda/question/${currentUser.userId }" title="${currentUser.nickname }">
                           		<img src="${currentUser.avatar }" width="40" height="40">
                      		</a>
		                </div>
		                <div class="qa-ci-wrap" style="">
		                    <div id="js-reply-editor-box" class="wd-comment-box js-ci-inner ">
		                    </div>
		                    <div id="js-qa-ci-footer" class="qa-ci-footer clearfix">
		                        <div class="qa-ci-footright r">
		                            <span class="qa-tips"></span>
		                            <button id="js-wenda-ci-submit" class="btn btn-green " data-qid="${topic.topicId }">回答</button>
		                        </div>
                   			</div>
		                </div>
		            </div>
                </div>
			    <div class="qa-right r">
			        <div class="wenda-slider">
			            <!-- pub new ques -->
						<div class="newques-container">
						  <a href="/microCourse/wenda/save" class="newques-btn" id="js-newques" target="_blank"><!--<i class="icon-addques"></i>-->发新问题</a>
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
						<!--ques relations -->
						<div class="panel about-ques">
						  <div class="panel-heading">
						    <h2 class="panel-title">相关的问题</h2>
						  </div>
						  <div class="panel-body clearfix">
					        <div class="mkhotlist padtop"><a href="/qadetail/57971" target="_blank">大神，哪能找到你啊？求交流，求带</a></div>
					        <div class="mkhotlist "><a href="/qadetail/58888" target="_blank">内联元素设置浮动之后不会覆盖下面的块级元素 浮动不是脱离文档流么</a></div>
					        <div class="mkhotlist "><a href="/qadetail/59269" target="_blank">没效果</a></div>
					        <div class="mkhotlist "><a href="/qadetail/59585" target="_blank">背景图位置和取值正负的问题</a></div>
					        <div class="mkhotlist bordbottom"><a href="/qadetail/59670" target="_blank">跟着老师的步骤，做到“已选择”这里的时候，错位了~改了很久都回不来，是哪里的问题呢？</a></div>
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
								        <a href="/myclub/otherquestion?uid=255777" class="l roll-head" target="_blank" title="偌颜宁"><img src="http://img.mukewang.com/user/5453449f0001c36e05520522-40-40.jpg" width="40" height="40"></a>
								        <a href="/myclub/otherquestion?uid=255777" target="_blank" title="偌颜宁" class="rankingnickname">偌颜宁</a>
								        <em class="archieve">我牛X啥都知道</em>
								        <i class="adopt rankingnum">4021<br>回答</i>
							       </li>
					          </ul>
						    </div>
						</div>
						<!-- course relations -->
        			</div>
    			</div>
		    </div>
			<div id="reply-box" style="display:none;">
			    <div class="js-qa-reply-ibox qa-reply-ibox clearfix">
			        <div class="qa-reply-iavator l">
                        <a href="/microCourse/wenda/question/${currentUser.userId }" title="${currentUser.nickname }">
			                <img src="${currentUser.avatar }" width="40" height="40">
			            </a>
                    </div>
			        <div class="qa-reply-iwrap">
			            <div class="qa-reply-iarea">
			                <textarea maxlength="2000" name="" id="" class="js-reply-ipt ipt" placeholder="写下你的评论..."></textarea>
			            </div>
			            <div class="qa-reply-ifoot clearfix">
			                <div class="qa-reply-footright r">
			                    <span class="qa-tips"></span>
			                    <button class="btn-normal btn-mini js-ipt-cancel">取消</button>
			                    <button class="btn-green btn-mini  js-ipt-submit">提交</button>
			                </div>
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