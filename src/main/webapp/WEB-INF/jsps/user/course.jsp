<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我系增老师的课程</title>
		
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
			            <img src="http://img.mukewang.com/55ae2df90001d31307200720-100-100.jpg" title="">
			        </span>
			        <ul class="user-lay">
			            <li class="mynick-name">
			                <span class="user-name">我系曾老师</span>
			            </li>
			            <li>
			                <span class="user-site"> JAVA开发工程师 </span>
			            </li>
			                        
			                <li class="actions">
			                                    <a href="javascript:void(0)" class="btn-add-friend js-add-friend" id="js-add-frd" data-uid="2171957">加为好友</a>
			                </li>
			                                    </ul>
			    </div>
			    <div class="user-desc">
			        <div class="sign-wrap">
			                        <p id="signed" class="signed read-only">这位童鞋很懒，什么也没有留下～～！<a class="more-info" href="/space/profile/uid/2171957">详细信息</a></p>
			                    </div>
			    </div>
			    <ul class="mp clearfix">
			        <li class="l mp-item">
			          <span class="mp-atag">
			            <p class="mp-num">77小时 1分</p>
			            <p class="mp-title">学习</p>
			          </span>
			        </li>
			        <li class="mp-item">
			          <a class="mp-atag" href="javascript:;">
			                        <span class="mp-num">
			                10033            </span>
			                        <span class="mp-title ">经验</span>
			          </a>
			        </li>
			    </ul>
			    <ul class="nav">
			        <li>
			            <a class="js-count-course active" href="/space/u/uid/2171957"><i class="icon-nav icon-tick"></i>TA的课程<em class="got-num">77</em></a>
			                    </li>
			        <li>
			            <a class="js-count-plan " href="/space/program/uid/2171957"><i class="icon-nav icon-plan"></i>TA的计划<em class="got-num">11</em></a>
			        </li>
			        <li>
			            <a class="js-count-note " href="/space/note/uid/2171957"><i class="icon-nav icon-note"></i>TA的笔记<em class="got-num">0</em></a>
			        </li>
			                <li class="rd-dissu">
			            <a class="read-mine" href="/myclub/otherquestion?uid=2171957">TA的社区</a>
			            <p class="read-notice">看看里面有什么好玩的事情吧～～</p>
			        </li>
			            </ul>
			            
		        <!-- 最近访客 -->
		        <jsp:include page="/WEB-INF/jsps/common/recent_visitors.jsp"></jsp:include>
		        
			    </div><!--sider end-->
			  </div>
			  <div class="r space-main">
			    
			    <div class="family">
			        <h1 class="family-hd">TA的课程</h1>
			    </div>
			    <div class="course-tool-bar clearfix">
			        <div class="tool-left l">
			            <div class="tool-all">
			                <span id="js-columall" class="tool-item all-statu"><strong>全部</strong> <i class="tool-item icon icon-down"></i></span>
			                <ul id="js-columbd" class="all-cont" style="display: none;">
			                                                            <li><a data-id="0" href="/space/u/uid/2171957/sid/0">全部</a></li>
			                                          <li><a data-id="1" href="/space/u/uid/2171957/sid/1">PHP</a></li>
			                                          <li><a data-id="7" href="/space/u/uid/2171957/sid/7">HTML/CSS</a></li>
			                                          <li><a data-id="44" href="/space/u/uid/2171957/sid/44">JavaScript</a></li>
			                                          <li><a data-id="219" href="/space/u/uid/2171957/sid/219">jQuery</a></li>
			                                          <li><a data-id="220" href="/space/u/uid/2171957/sid/220">JAVA</a></li>
			                                          <li><a data-id="221" href="/space/u/uid/2171957/sid/221">Html5</a></li>
			                                          <li><a data-id="223" href="/space/u/uid/2171957/sid/223">Android</a></li>
			                                          <li><a data-id="468" href="/space/u/uid/2171957/sid/468">Linux</a></li>
			                                          <li><a data-id="952" href="/space/u/uid/2171957/sid/952">MySQL</a></li>
			                                          <li><a data-id="955" href="/space/u/uid/2171957/sid/955">iOS</a></li>
			                                          <li><a data-id="1261" href="/space/u/uid/2171957/sid/1261">前端工具</a></li>
			                                          <li><a data-id="1262" href="/space/u/uid/2171957/sid/1262">CSS3</a></li>
			                                          <li><a data-id="1263" href="/space/u/uid/2171957/sid/1263">Bootstrap</a></li>
			                                          <li><a data-id="1309" href="/space/u/uid/2171957/sid/1309">Oracle</a></li>
			                                          <li><a data-id="1331" href="/space/u/uid/2171957/sid/1331">C++</a></li>
			                                          <li><a data-id="1359" href="/space/u/uid/2171957/sid/1359">大数据</a></li>
			                                          <li><a data-id="1361" href="/space/u/uid/2171957/sid/1361">Cocos2d-x</a></li>
			                                                      </ul>
			
			            </div>
			        </div>
			        <div class="tool-right r">
			            
			            
			            <span class="tool-item total-num">
			                共<b></b>个课程
			            </span>
			            <span class="tool-item tool-pager">
			                <span class="pager-num">
			                    <b class="pager-cur">1</b>/<em class="pager-total">6</em>
			                </span>
			                                <a href="javascript:void(0)" class="pager-action pager-prev hide-text disabled">上一页</a>
			                
			                                <a href="/space/u/uid/2171957/page/2" class="pager-action pager-next hide-text">下一页</a>
			                            </span>
			        </div>
			    </div>
			    
			    
			<div class="main-bd  clearfix course-list" id="J_MyClass">
			      <ul class="">
			                <li class="course-one" data-id="199">
			              <a href="/learn/199" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="反射——Java高级开发必须懂的" src="http://img.mukewang.com/54179be90001026706000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>反射——Java高级开发必须懂的</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">掌握了反射的知识，才能更好的学习Java高级课程，因此必须要学习——你懂的！本门课程主要介绍Class类的使用，方法和成员变量的反射，以及通过反射了解集合泛型的本质等知识。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">24037人学习</span>
			              </div>
			              <span class="time-label">
			                                     1小时20分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="283">
			              <a href="/learn/283" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="Java实现验证码制作" src="http://img.mukewang.com/55b19e790001ae1706000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>Java实现验证码制作</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">验证码的应用十分普遍，我们经常会在网上看到数字字母组合的验证码、包含中文的验证码、以及算式形式的验证码等等。本门课程就会带大家使用Java Web中的servlet以及Jcaptcha、Kaptcha两种开源组件来实现各式各样的验证码。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">15984人学习</span>
			              </div>
			              <span class="time-label">
			                                     2小时 0分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="401">
			              <a href="/learn/401" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="Java微信公众号开发进阶" src="http://img.mukewang.com/555ed1de000157b106000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>Java微信公众号开发进阶</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">本门课程是《初识微信公众号开发》的进阶课程，在入门课程的基础上，对Java微信公众号的开发模式进行深入讲解。主要介绍了图文、音乐消息的回复，自定义菜单，最后介绍了百度翻译小案例。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">20655人学习</span>
			              </div>
			              <span class="time-label">
			                                     2小时27分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="368">
			              <a href="/learn/368" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="初识Java微信公众号开发" src="http://img.mukewang.com/552cbdeb0001bf9506000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>初识Java微信公众号开发</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">微信拥有庞大的用户基础，微信公众号的相关开发也比较热门，本套课程就带领大家进入Java微信公众号开发的精彩世界，学习微信公众号开发的相关概念，编辑模式和开发模式应用，以及百度BAE的使用。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">32594人学习</span>
			              </div>
			              <span class="time-label">
			                                     1小时36分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="271">
			              <a href="/learn/271" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="JAVA Web开发技术应用——监听器" src="http://img.mukewang.com/549bdff000015c9806000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>JAVA Web开发技术应用——监听器</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">本课程从Java Web中的监听器的概念和用途入手，紧接着讲解监听器的第一个实例，然后由浅到深地从启动顺序到分类、从Servelt2.5到 Servlet3.0，重点讲解了两种分类，包括按监听的对象划分和按监听的事件划分，最后以一个实际项目中统计在线人数的案例进行讲解。
			</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">19874人学习</span>
			              </div>
			              <span class="time-label">
			                                     1小时30分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="213">
			              <a href="/learn/213" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="Java Web开发技术应用——过滤器" src="http://img.mukewang.com/5449b90b00019ea906000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>Java Web开发技术应用——过滤器</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">本课程主要是从实际生活当中的过滤器入手,详细讲解了Java Web过滤器的概念、工作原理、生命周期以及过滤器的API。然后从一个过滤器引入多个过滤器链的相关知识，同时课程还详细介绍了过滤器的分类。最后以两个实际项目当中的案例诠释了过滤器的应用。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">15508人学习</span>
			              </div>
			              <span class="time-label">
			                                     1小时40分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="171">
			              <a href="/learn/171" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="Java眼中的XML---文件读取" src="http://img.mukewang.com/548902540001a3e506000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>Java眼中的XML---文件读取</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">文件的形态是千变万化的，在 Internet 中，我们通常使用一种叫做 XML 的文件来传输或者存储数据。本次课程中，@Jessica Jiang 将会带领小伙伴们把这种 XML 文件应用与 Java 程序结合起来，教你如何应用 Java“解析 XML ”。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">18608人学习</span>
			              </div>
			              <span class="time-label">
			                                     3小时 0分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="109">
			              <a href="/learn/109" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="版本管理工具介绍---SVN篇" src="http://img.mukewang.com/537585b80001ce4306000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>版本管理工具介绍---SVN篇</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">多人协作开发是程序猿不可避免的话题，版本控制工具不可或缺，学会 SVN ，让初入公司的你与他人的合作不再尴尬！本课程主要介绍版本控制工具之一 SVN 的安装、结合Java代码的简单操作及常见问题解决。版本控制的环境下才能共创程序猿梦想，大家代码都好才是真的好！</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">20867人学习</span>
			              </div>
			              <span class="time-label">
			                                    47分 | 初级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="269">
			              <a href="/learn/269" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="JAVA遇见HTML——Servlet篇" src="http://img.mukewang.com/549bbf110001019406000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>JAVA遇见HTML——Servlet篇</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">Servlet是JAVA Web开发的核心基础，在项目中的应用非常广泛。本门课程在JSP课程的基础上，深入介绍Servlet的基础知识。包括Servlet的执行流程和生命周期，Tomcat对Servlet的装载情况，如何获取表单数据以及Servlet路径跳转。最后会带大家使用流行的MVC架构进行项目开发。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">23019人学习</span>
			              </div>
			              <span class="time-label">
			                                     3小时10分 | 初级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="375">
			              <a href="/learn/375" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="使用JSP+Servlet技术生成报表" src="http://img.mukewang.com/554706690001974406000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>使用JSP+Servlet技术生成报表</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">报表就是用表格、图表等格式来动态显示数据。本课程是Java Web的案例课程，主要关注于用表格形式来显示数据。主要内容包括报表的基础知识，报表实现原理和核心技术，以及如何使用JSP+Servlet技术来生成报表。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">13552人学习</span>
			              </div>
			              <span class="time-label">
			                                     1小时26分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="166">
			              <a href="/learn/166" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="JAVA遇见HTML——JSP篇" src="http://img.mukewang.com/53e815520001911306000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>100%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 100%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>JAVA遇见HTML——JSP篇</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">亲，这里有资深讲师为初学者量身打造的Java Web入门级课程JSP，讲师将通过大量的案例向您展示JavaWeb开发环境搭建、工具使用和JSP的基本语法，深入理解Java Web开发思想，最终使您能独立开发简单的Java Web应用。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">35714人学习</span>
			              </div>
			              <span class="time-label">
			                                     7小时 0分 | 初级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="167">
			              <a href="/learn/167" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="JS动画效果" src="http://img.mukewang.com/53e1bdcb00011e7f06000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>JS动画效果</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">通过本课程JS动画的学习，从简单动画开始，逐步深入缓冲动画、多物体动画、链式动画、多动画同时运动到完美运动框架的过程，每一个效果封装成一个小运动框架，逐渐培养和锻炼封装运动框架和编程的思想，让您的逻辑思维不断增强。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">21156人学习</span>
			              </div>
			              <span class="time-label">
			                                     2小时 8分 | 高级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="147">
			              <a href="/learn/147" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="企业网站综合布局实战" src="http://img.mukewang.com/53bca1f00001d36906000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>6%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 6%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>企业网站综合布局实战</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">本课程重点介绍HTML/CSS实现常见企业网站布局的方法、布局中常用的基本盒子模型、三列布局、两列自适应高度及基于jQ的开源图片幻灯片切换效果插件的使用。让您快速掌握企业网站的基本布局方法，同时对HTML、CSS、JS、jQ等知识的综合运用和提升。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">34752人学习</span>
			              </div>
			              <span class="time-label">
			                                     2小时55分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="59">
			              <a href="/learn/59" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="倒计时效果" src="http://img.mukewang.com/532be49f00018cc006000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>倒计时效果</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">现今团购网、电商网、门户网等，常使用时间记录重要的时刻，如时间显示、倒计时差、限时抢购等，本课程分析不同倒计时效果的计算思路及方法，掌握日期对象Date，获取时间的方法,计算时差的方法，实现不同的倒时计效果。</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">9737人学习</span>
			              </div>
			              <span class="time-label">
			                                    32分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			                <li class="course-one" data-id="352">
			              <a href="/learn/352" target="_blank">
			              <div class="course-list-img">
			                  <img width="240" height="135" alt="细说Java多线程之内存可见性" src="http://img.mukewang.com/5518c3d7000175af06000338-300-170.jpg">
			                  <div class="media-progress">
			                      <div class="progress-val text-ellipsis"><span>0%</span></div>
			                      <div class="mask"></div>
			                      <div class="progress-bar">
			                          <div class="bar" style="width: 0%"></div>
			                      </div>
			                  </div>
			              </div>
			              <h5>
			                  <span>细说Java多线程之内存可见性</span>
			              </h5>
			              <div class="tips">
			                  <p class="text-ellipsis">本课程带领大家深层次学习Java中的内存可见性、Java内存模型、指令重排序、as-if-serial语义等多线程中偏向底层的一些知识，以及synchronized和volatile实现内存可见性的原理和方法。			</p>
			                  <span class="l ">
			                                    更新完毕
			                                    </span>
			                  <span class="l ml20">12418人学习</span>
			              </div>
			              <span class="time-label">
			                                    57分 | 中级
			                              </span>
			
			              </a>
			              <span class="del"></span>
			          </li>
			          </ul>
			          <div class="page"><span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a href="javascript:void(0)" class="active">1</a><a href="/space/u/uid/2171957/sid/0/page/2">2</a><a href="/space/u/uid/2171957/sid/0/page/3">3</a><a href="/space/u/uid/2171957/sid/0/page/4">4</a><a href="/space/u/uid/2171957/sid/0/page/5">5</a><a href="/space/u/uid/2171957/sid/0/page/6">6</a><a href="/space/u/uid/2171957/sid/0/page/2">下一页</a><a href="/space/u/uid/2171957/sid/0/page/6">尾页</a></div>
			        </div>
			
			  </div>
			</div>
			
			</div>	 
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
	</body>  
</html>