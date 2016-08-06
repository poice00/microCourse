<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<title>文章_社区_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/article-index.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<!-- 社区导航 -->
		<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>
		
		<div class="container clearfix">
	<div class="article-left l">
					<h2 class="page-title">文章</h2>
				<div class="article-tool-bar clearfix">
	        <div class="tool-left l">

	            <a href="/article/index/cid/0/order/0" class="sort-item active">最新</a>
	            <a href="/article/index/cid/0/order/1" class="sort-item ">热门</a>
	        </div>
	        <div class="tool-right r">
	            <div class="tool-all">
	                <span id="js-columall" class="tool-item">


	                	<strong class="all-status">全部</strong> <i class="tool-item icon icon-down"></i></span>
	                <ul id="js-columbd" class="all-cont" style="display: none;">
                    			                									<li><a data-id="0" href="/article/index/cid/0/order/0/page">全部</a></li>
		                									<li><a data-id="105" href="/article/index/cid/105/order/0/page">前端开发</a></li>
		                									<li><a data-id="106" href="/article/index/cid/106/order/0/page">后端开发</a></li>
		                									<li><a data-id="107" href="/article/index/cid/107/order/0/page">程序人生</a></li>
		                									<li><a data-id="108" href="/article/index/cid/108/order/0/page">IT职场</a></li>
		                									<li><a data-id="109" href="/article/index/cid/109/order/0/page">设计</a></li>
		                									<li><a data-id="110" href="/article/index/cid/110/order/0/page">移动开发</a></li>
		                									<li><a data-id="113" href="/article/index/cid/113/order/0/page">数据库</a></li>
		                									<li><a data-id="114" href="/article/index/cid/114/order/0/page">其他</a></li>
		                									<li><a data-id="115" href="/article/index/cid/115/order/0/page">程序员幽默</a></li>
		                		                	                  	</ul>
	            </div>
	        </div>
	    </div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1468">
					<img src="http://img.mukewang.com/55f273750001c74904500281-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1468" class="title-detail">Java集合框架综述</a>
				</h3>
				<p class="item-bd">最近被陆陆续续问了几遍HashMap的实现，回答的不好，打算复习复习JDK中的集合框架，并尝试分析其源码，这么做一方面是这些类非常实用，掌握其实现能更好的优化我们的程序；另一方面是学习借鉴JDK是如何实现了这么一套优雅高效的类库，提升编程能力。 在介绍具体适合类之前，本篇文章对Java中的集合框架做一个大致描述，从...<a class="read-more" href="/article/1468">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/106/page" target="_blank">后端开发</a>
						</li>
						<li class="pass-time"><span>1天前</span></li>
						<li class="pass-time"><span>191浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 6</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1467">
					<img src="http://img.mukewang.com/55f24fde0001c41604500450-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1467" class="title-detail">自学 iOS 开发的一些经验</a>
				</h3>
				<p class="item-bd">不知不觉作为 iOS 开发也有两年多的时间了，记得当初看到 OC 的语法时，愣是被吓了回去，隔了好久才重新耐下心去啃一啃。啃了一阵，觉得大概有了点概念，看到 Cocoa 那么多的 Class，又懵了，怎么才能调用系统的相机？怎么保存信息？怎么做一个像 Twitter 个人页那样的页面？总之就是不知道该从哪切入。 现在回想...<a class="read-more" href="/article/1467">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/110/page" target="_blank">移动开发</a>
						</li>
						<li class="pass-time"><span>1天前</span></li>
						<li class="pass-time"><span>200浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 6</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1466">
					<img src="http://img.mukewang.com/55efd7a90001e6ef03580284-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1466" class="title-detail">Sublime Text3使用总结</a>
				</h3>
				<p class="item-bd">写在前面的话：平时做项目中在用eclipse和vs，但是对于一些小项目，感觉没有必要搞那么大的一个工具使用，比如写个小微商城，搞个小脚本了什么，所以就一直在用Sublime Text，界面清新简洁，没有多余的令强迫症用户抓狂的点，所以今天也简单总结一下我使用过程中用的最多的一些小技巧，分享给大家。 一、Sublime Text2 ...<a class="read-more" href="/article/1466">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
						</li>
						<li class="pass-time"><span>3天前</span></li>
						<li class="pass-time"><span>1658浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 18</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 0</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1465">
					<img src="http://img.mukewang.com/55efd4cc0001038704500338-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1465" class="title-detail">Sass用法指南</a>
				</h3>
				<p class="item-bd">写在前面的话：随着CSS文件越来越大，内容越来越复杂，对其进行很好的维护将变的很困难。这时CSS预处理器就能够帮上大忙了，它们往往拥有变量、嵌套、继承等许多CSS不具备的特性。有很多CSS预处理器，这里总结Sass的使用方法。 我们可以通过一种类似css的编程语言编写代码，保存为.scss后缀名的文件，然后使用Sass进行处理...<a class="read-more" href="/article/1465">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
						</li>
						<li class="pass-time"><span>3天前</span></li>
						<li class="pass-time"><span>412浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 2</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 0</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1464">
					<img src="http://img.mukewang.com/55efa8f400010cde10521052-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1464" class="title-detail">7个去伪存真的JavaScript面试题</a>
				</h3>
				<p class="item-bd">上周，我发表了《C#程序员的7个面试问题》。这次我要说的是如何淘汰那些滥竽充数的JavaScript程序员。 你会惊讶于居然有这么多人来面试工作，并且他们的简历描述得都貌似很牛逼的样子。但是如果你问他们相关问题的话，你就会发现他们对此一无所知。我不知道他们这些简历是真的还是只是一个噱头。所以和其他面试官一样，我...<a class="read-more" href="/article/1464">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/114/page" target="_blank">其他</a>
						</li>
						<li class="pass-time"><span>3天前</span></li>
						<li class="pass-time"><span>1321浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 7</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 3</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1463">
					<img src="http://img.mukewang.com/55efa6e1000135c115550929-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1463" class="title-detail">TIOBE 9月编程语言排行榜：新TIOBE指数算法</a>
				</h3>
				<p class="item-bd">截至本月，TIOBE 指数采用了一种改进的算法来计算编程语言的普及。这种新的算法主要是为了处理异常值（统计噪声）从结果中删除。以前的算法集中在每个搜索引擎的异常值的数目。如果有太多的异常值的一个搜索引擎，搜索引擎将没有资格因其“不可靠的”结果。现在个别异常值（统计噪声每搜索引擎的语言）被删除。在这种方式...<a class="read-more" href="/article/1463">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/107/page" target="_blank">程序人生</a>
						</li>
						<li class="pass-time"><span>3天前</span></li>
						<li class="pass-time"><span>335浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 5</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 2</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1462">
					<img src="http://img.mukewang.com/55ee8d2a0001077506400370-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1462" class="title-detail">数学不好也能成为优秀的程序员！</a>
				</h3>
				<p class="item-bd">想学编程？数学不好？没关系，最新研究发现，学习编程所需的数学水平最多只要小学四年级，数学不好也能成为优秀的程序员。 众所周知，学习编程涉及很多知识，包括搜索、逻辑学、审错学，但是你知道这一切的最低数学基础要求吗？答案是不超过小学四年级算术水平。 一般我是不赞同任何人学习编程的，除非是真的想学。我认为...<a class="read-more" href="/article/1462">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/107/page" target="_blank">程序人生</a>
						</li>
						<li class="pass-time"><span>4天前</span></li>
						<li class="pass-time"><span>758浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 25</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 3</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1461">
					<img src="http://img.mukewang.com/55ee86080001d68904810284-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1461" class="title-detail">20 个有用的 Angular.js 工具</a>
				</h3>
				<p class="item-bd">喜欢 Angular.js？我们为开发者编写了一份最佳 angular.js 工具和资源清单，这可让使用 angular 开发应用程序变得高效。 对于大多数想要设计动态 web 应用的开发者而言，Angular.js 成为了一个可以选择的框架。angularjs 开发者如果想开始一个 AngularJS 工程，为了采取成熟的方式开发网页，他们或许需要很多工...<a class="read-more" href="/article/1461">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
						</li>
						<li class="pass-time"><span>4天前</span></li>
						<li class="pass-time"><span>779浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 8</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1460">
					<img src="http://img.mukewang.com/55ee81d90001bce112400698-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1460" class="title-detail">新人一开始要怎么学编程？</a>
				</h3>
				<p class="item-bd">此文主要针对没有受过计算机专业教育又想进入计算机行业的人。 当今世界不仅实体书资料多多，网络资源更是丰富。并且犹如“摩尔定律”一般，隔个一两年某些资料就翻了一番。所以我认为只要有兴趣，时间和毅力（兴趣在最前面）完全可以通过网络自学进入程序员队伍。 吐槽 虽然资料很多，不过我要吐槽一下大部分的教科书、...<a class="read-more" href="/article/1460">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/107/page" target="_blank">程序人生</a>
						</li>
						<li class="pass-time"><span>4天前</span></li>
						<li class="pass-time"><span>1703浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 23</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 8</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1459">
					<img src="http://img.mukewang.com/55ee5a1b0001ebcd08091024-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1459" class="title-detail">产品设计，搞清楚6W3H就够了!</a>
				</h3>
				<p class="item-bd">题目是标题党，大家自动忽略。主要是站在产品经理的层面，来讲讲如何使用6H3W来做产品设计。 why：为什么？用户为什么要用这款或这种产品？能够满足用户的什么需求呢？或者说，隐隐约约中有什么需求出现了而市场上没有满足或没有很好地被满足吗？这里涉及到核心需求的挖掘和洞察，是产品设计中最难的部分。 who：谁？产品...<a class="read-more" href="/article/1459">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/1879927" target="_blank">
								<img src="http://img.mukewang.com/5590ff2a00010c0002000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/1879927" target="_blank">i爱慕客...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
						</li>
						<li class="pass-time"><span>4天前</span></li>
						<li class="pass-time"><span>221浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 4</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1458">
					<img src="http://img.mukewang.com/55ee550a0001685505500413-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1458" class="title-detail">Linux 小技巧：Chrome 小游戏，让文字说话，计划作业，重复执行命令</a>
				</h3>
				<p class="item-bd">重要的事情说两遍，我完成了一个Linux提示与彩蛋系列，让你的Linux获得更多创造和娱乐。 本文，我将会讲解Google-chrome内建小游戏，在终端中如何让文字说话，使用‘at’命令设置作业和使用watch命令重复执行命令。 1.Google Chrome 浏览器小游戏彩蛋 网线脱掉或者其他什么原因连不上网时，Google Chrome就会出现一个...<a class="read-more" href="/article/1458">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/210365" target="_blank">
								<img src="http://img.mukewang.com/5333a1bc00014e8302000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/210365" target="_blank">乌拉拉学...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/106/page" target="_blank">后端开发</a>
						</li>
						<li class="pass-time"><span>4天前</span></li>
						<li class="pass-time"><span>207浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 5</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1457">
					<img src="http://img.mukewang.com/55ed3a630001451205000313-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1457" class="title-detail">Linux中10个有用的命令行补齐命令</a>
				</h3>
				<p class="item-bd">在Linux系统中，输入一个命令，再按两次TAB键，就会列出所有以输入字符开头的可用命令。这并不新鲜，很可能你已经知道了这个。这个功能被称作命令补全。默认情况下，bash命令行可以自动补全文件或目录名称。不过，我们可以使bash命令行补全执行更多的操作，通过补全命令可以让它成就下一个辉煌。 这个教程说明了我们是怎样...<a class="read-more" href="/article/1457">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/210365" target="_blank">
								<img src="http://img.mukewang.com/5333a1bc00014e8302000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/210365" target="_blank">乌拉拉学...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/106/page" target="_blank">后端开发</a>
						</li>
						<li class="pass-time"><span>5天前</span></li>
						<li class="pass-time"><span>558浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 2</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1456">
					<img src="http://img.mukewang.com/55ed2f100001e90704000222-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1456" class="title-detail">听故事学iOS：一个故事搞懂多线程！</a>
				</h3>
				<p class="item-bd">屎壳郎老板和它的收费公厕 刚接触开发的童鞋在学多线程的时候,往往比较吃力，因为这家伙比较抽象,较难通过运行代码直接看到多线程操作的实际效果，和UI相比，多线程部分更注重理解。所以，希望能通过这个故事，帮助大家更好地理解iOS中的多线程。故事是以GCD为主要实现手段进行展开的。 OK,那废话不多说,一起走进财富故事...<a class="read-more" href="/article/1456">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/110/page" target="_blank">移动开发</a>
						</li>
						<li class="pass-time"><span>5天前</span></li>
						<li class="pass-time"><span>1005浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 8</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 0</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1455">
					<img src="http://img.mukewang.com/55ed2bb00001be5104000222-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1455" class="title-detail">听故事学Swift系列 - 小明与红包(optionals - 可选类型)</a>
				</h3>
				<p class="item-bd">虽然都是基于Cocoa和CocoaTouch框架，虽然都属于动态运行模式的静态类型语言，但是Swift和OC两门语言之间的区别还是蛮大的。 所以，希望通过这么一个故事，将Swift中的和OC区别较大的语法、概念和生活中的点点滴滴相互映射，让知识融入生活，用生活融化知识。 哎呀我去，这B装的，我自己都脸红了╮(╯﹏╰）╭ 熊孩子小...<a class="read-more" href="/article/1455">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/110/page" target="_blank">移动开发</a>
						</li>
						<li class="pass-time"><span>5天前</span></li>
						<li class="pass-time"><span>359浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 3</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1454">
					<img src="http://img.mukewang.com/55ed29e70001399c03000300-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1454" class="title-detail">学习Swift不能错过的10大开源项目</a>
				</h3>
				<p class="item-bd">如果你是位iOS开发者，或者你正想进入该行业，那么Swift为你提供了一个绝佳的机会。Swift的设计非常优雅，较Obj-C更易于学习，当然也非常强大。 为了指导开发者使用Swift进行开发，苹果发布了一系类的技术文档，比如The Swift Programming Language 和 Using Swift with Cocoa and Objective-C，同时苹果也开通...<a class="read-more" href="/article/1454">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/110/page" target="_blank">移动开发</a>
						</li>
						<li class="pass-time"><span>5天前</span></li>
						<li class="pass-time"><span>725浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 2</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 0</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1453">
					<img src="http://img.mukewang.com/55ecf6d50001fb7f06000375-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1453" class="title-detail">Linux 新手应该知道的 26 个命令</a>
				</h3>
				<p class="item-bd">当你进入了 Linux 的世界，在下载、安装 了某个 Linux 发行版，体验了 Linux 桌面并安装了一些你喜爱和需要的软件之后，应该去了解下 Linux 真正的魅力所在：命令行。每一个 Linux 命令其实就是一个程序，借助这些命令，我们可以办到非常多的事情。下面将会为大家介绍一下几个常用的命令。 如何寻求帮助？ 在...<a class="read-more" href="/article/1453">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/106/page" target="_blank">后端开发</a>
						</li>
						<li class="pass-time"><span>5天前</span></li>
						<li class="pass-time"><span>1505浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 11</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 2</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1452">
					<img src="http://img.mukewang.com/55ebe9ce0001af6306000450-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1452" class="title-detail">12个 Web 设计师必备的 Bootstrap 工具</a>
				</h3>
				<p class="item-bd">Bootstrap是一个非常棒的前端网站开发平台，它提供了大量的开发高体验的、高效的网站所需要的组件。这给网站开发人员与网站设计师提供了很好的便捷性，他们能很快很便捷在这一平台上找到开发所需的所有组件。Bootstrap打破了原有的世界记录，并且在Github的所有项目中排名第一。 Bootstrap兼容所有新的浏览器，同时向下兼...<a class="read-more" href="/article/1452">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
						</li>
						<li class="pass-time"><span>6天前</span></li>
						<li class="pass-time"><span>1147浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 8</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 2</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1451">
					<img src="http://img.mukewang.com/55ebd45c0001ff2106280472-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1451" class="title-detail">Python学习资料与博客推荐</a>
				</h3>
				<p class="item-bd">知乎上看到一题主询问： ”已经学习了python的入门书籍，也练习了书上的一些习题，练习写了一个20行左右的爬图片的小程序。现在想要提高提高，就想问问能有哪些好的网站或者博客有这方面的资料。“ Python程序员彭泉鑫翻译了Full Stack Python上的一段内容，并进行了调整，希望对初学Python、进阶Python的朋友们有所帮...<a class="read-more" href="/article/1451">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/264930" target="_blank">
								<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/264930" target="_blank">奋斗在路...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/106/page" target="_blank">后端开发</a>
						</li>
						<li class="pass-time"><span>6天前</span></li>
						<li class="pass-time"><span>346浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 6</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 2</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1450">
					<img src="http://img.mukewang.com/55ebaf33000155d006600377-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1450" class="title-detail">程序员的激情其实是一种痛苦</a>
				</h3>
				<p class="item-bd">我不是一个“充满激情的程序员”。我觉得，固定8小时工作之后，就应该去做点别的事情，比如说看看科幻小说，和我亲爱的妻子聊聊天等等。当别人问起，我会正儿八经地这么回答，“这才是所谓的生活。你也应该试一试”。 其实我内心非常看不上那些充满激情的程序员，他们所谓的激情就是一天花上12甚至16个小时坐在电脑前写代...<a class="read-more" href="/article/1450">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/107/page" target="_blank">程序人生</a>
						</li>
						<li class="pass-time"><span>6天前</span></li>
						<li class="pass-time"><span>810浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 19</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 5</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<div class="article-lwrap clearfix">
						<!-- img -->
			<div class="item-img r">
				<a href="/article/1449">
					<img src="http://img.mukewang.com/55ebadf70001854503500535-160-160.jpg" width="160" height="160">
				</a>
			</div>
						<!-- text -->
			<div class="item-txt l">
				<h3 class="item-title">
					<a href="/article/1449" class="title-detail">8个强大的基于Bootstrap的CSS框架</a>
				</h3>
				<p class="item-bd">做过前端开发的小伙伴们应该对Bootstrap不会陌生，它是由Twitter推出的开源CSS框架，其中包含了很多Web前端开发的工具包和应用组件。当然，和jQuery一样，Bootstrap同时也是一个开放式的CSS框架，基于Bootstrap，我们也可以做许多不错的CSS UI组件。本文就介绍了8个强大的基于Bootstrap的CSS框架，一起来看看。 1、Bootst...<a class="read-more" href="/article/1449">[查看全文]</a></p>
				<div class="item-btm clearfix">
					<ul class="l left-info">
						<li class="hd-pic">
							<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
								<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
							</a>
							<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵...</a>
						</li>
						<li class="now-tag">
							<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
						</li>
						<li class="pass-time"><span>6天前</span></li>
						<li class="pass-time"><span>717浏览</span></li>
					</ul>
					<div class="r right-info">
						<div class="favorite l">
							<i class="icon sns-thumb-up-outline"></i><em>点赞 7</em>
						</div>
						<div class="item-judge l">
							<i class="icon sns-comment"></i><em>评论 1</em>
						</div>
					</div>
				</div>
			</div>
		</div>
				<!-- 分页 -->
    	<div id="pagenation" class="pagenation"><div class="page"><span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a href="javascript:void(0)" class="active">1</a><a href="/article/index/cid/0/order/0/page/2">2</a><a href="/article/index/cid/0/order/0/page/3">3</a><a href="/article/index/cid/0/order/0/page/4">4</a><a href="/article/index/cid/0/order/0/page/5">5</a><a href="/article/index/cid/0/order/0/page/6">6</a><a href="/article/index/cid/0/order/0/page/7">7</a><a href="/article/index/cid/0/order/0/page/2">下一页</a><a href="/article/index/cid/0/order/0/page/22">尾页</a></div></div>

	</div>
	<div class="article-right r">
		<!-- 写文章 -->
		<div class="new-ques">
									<div class="ques-bd">
				<a href="/myclub/article/uid/1226216" class="l sharer-head" target="_blank" title="">
					<img src="http://img.mukewang.com/5333a1a90001c8d802000200-100-100.jpg" alt="" width="40" height="40">
				</a>
		        <a href="/myclub/article/uid/1226216" target="_blank" title="" class="sharer-name">monkey_92</a>
		        <em class="shared-page">收藏了0文章</em>
			</div>
					</div>
		<!-- 推荐文章 -->
		<div class="remon-page">
		    <h2 class="panel-hd">推荐文章</h2>
						<div class="remon-main">
				<ul>
										<li>
						<h3 class="remon-title">
							<a href="/article/1300" class="title-detail">11本Java程序员必读的书</a>
						</h3>
						<p class="remon-bd">本文列出的11本书在Java程序员界都是被认为很棒的书。当一个程序员开始初学Java时，他的第一个问题应该是如...</p>
						<div class="arti-info clearfix">
							<ul>
								<li class="hd-pic">
									<a class="publisher-hd" href="/myclub/article/uid/2001275" target="_blank">
										<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="20" height="20">
									</a>
									<a class="publisher-name" href="/myclub/article/uid/2001275" target="_blank">朵朵朵</a>
								</li>
								<li class="now-tag">
									<a class="item-tag" href="/article/index/cid/106/page" target="_blank">后端开发</a>
								</li>
								<li class="now-tag">
									<span class="viewed-num">4340浏览</span>
								</li>
							</ul>
						</div>
					</li>
										<li>
						<h3 class="remon-title">
							<a href="/article/1312" class="title-detail">为新项目添彩的 10+ 超有用 JavaScript 库</a>
						</h3>
						<p class="remon-bd">JavaScript 库是一种基础地预写入脚本语言，可以减轻基于应用的 JavaScript 开发，比如 AJAX 和其他以...</p>
						<div class="arti-info clearfix">
							<ul>
								<li class="hd-pic">
									<a class="publisher-hd" href="/myclub/article/uid/1879927" target="_blank">
										<img src="http://img.mukewang.com/5590ff2a00010c0002000200-100-100.jpg" alt="" width="20" height="20">
									</a>
									<a class="publisher-name" href="/myclub/article/uid/1879927" target="_blank">i爱慕客</a>
								</li>
								<li class="now-tag">
									<a class="item-tag" href="/article/index/cid/105/page" target="_blank">前端开发</a>
								</li>
								<li class="now-tag">
									<span class="viewed-num">1297浏览</span>
								</li>
							</ul>
						</div>
					</li>
									</ul>
			</div>
					</div>
		<!-- 一周达人 -->
		<div class="weekly-rank">
		    <h2 class="panel-hd">一周达人</h2>
					    <div class="article-weekly clearfix">
      			<ol class="weekly-top">
      				      				<li>
      					<a href="/myclub/article/uid/264930" class="l hot-head" target="_blank" title="">
							<img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="" width="40" height="40">
      					</a>
						<a href="/myclub/article/uid/264930" target="_blank" class="hot-name">
							奋斗在路上</a>
						
						<i class="rank-num weektop-first">1</i>
      				</li>
      				      				<li>
      					<a href="/myclub/article/uid/2001275" class="l hot-head" target="_blank" title="">
							<img src="http://img.mukewang.com/545847490001582602200220-100-100.jpg" alt="" width="40" height="40">
      					</a>
						<a href="/myclub/article/uid/2001275" target="_blank" class="hot-name">
							朵朵朵</a>
						
						<i class="rank-num weektop-two">2</i>
      				</li>
      				      				<li>
      					<a href="/myclub/article/uid/210365" class="l hot-head" target="_blank" title="">
							<img src="http://img.mukewang.com/5333a1bc00014e8302000200-100-100.jpg" alt="" width="40" height="40">
      					</a>
						<a href="/myclub/article/uid/210365" target="_blank" class="hot-name">
							乌拉拉学编程</a>
						
						<i class="rank-num ">3</i>
      				</li>
      				      				<li>
      					<a href="/myclub/article/uid/1879927" class="l hot-head" target="_blank" title="">
							<img src="http://img.mukewang.com/5590ff2a00010c0002000200-100-100.jpg" alt="" width="40" height="40">
      					</a>
						<a href="/myclub/article/uid/1879927" target="_blank" class="hot-name">
							i爱慕客</a>
						
						<i class="rank-num ">4</i>
      				</li>
      				      			</ol>
			</div>
					</div>
	</div>
</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		 
	</body>  
</html>