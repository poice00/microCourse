<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Java中的关键字-微课程</title>
<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/code.css">

<style>
dt {
	font-weight: normal;
}
</style>
<script>
	function codeCompile() {
		var code = $("#sourceCode").val();
		code = code.replace(/"\""/g, "'");
		$.ajax({
			type : "post",
			url : "/microCourse/course/codeResult",
			data : {
				code : code
			},
			success : function(response) {
				document.getElementById("J_Console").src="/microCourse/resources/video/result.html"; 
			}
		});
	};
	function codeReset() {
		var practiceId=${practice.practiceId };
		$.ajax({
			type : "post",
			url : "/microCourse/course/codeReset",
			data : {
				practiceId:practiceId
			},
			success : function(response) {
				document.getElementById("sourceCode").value=response; 
			}
		});
	};
	function codeCommit() {
		var code = $("#sourceCode").val();
		code = code.replace(/"\""/g, "'");
		var sectionId=${section.sectionId };
		var userId=${currentUser.userId };
		$.ajax({
			type : "post",
			url : "/microCourse/course/codeCommit",
			data : {
				code : code,
				sectionId:sectionId,
				userId:userId
			},
			success : function(response) {
				alert(response); 
			}
		});
	};
</script>


</head>
<body>

	<!--导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/study_header.jsp"></jsp:include>

	<div id="studyMain">

		<!--修正多个头部的bug-->
		<div class="wrap">
			<!--此处结构为练习题，视频，编程公用的侧栏-->
			<div class="section-list">
				<div class="operator">
					<div class="op chapter">
						<em class="icon-menu"></em>章节
					</div>
					<div class="op notes">
						<em class="icon-note"></em>笔记
					</div>
					<div class="op question">
						<em class="icon-addques"></em>提问
					</div>
				</div>
				<div class="nano has-scrollbar">
					<div class="nano-content" tabindex="0" style="right: -21px;">
						<h3>Java入门第一季</h3>
						<ul>
							<li class="sec-title"><span>第1章 Java初体验</span></li>
							<li data-id="1430"><a href="/video/1430"><em
									class="icon-video"></em>1-1 Java简介(05:49)</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1459"><a href="/video/1459"><em
									class="icon-video"></em>1-2 Java开发环境搭建...(07:30)</a> <i class="">
									<em class="icon-nolearn"></em>
							</i></li>
							<li data-id="1501"><a href="/video/1501"><em
									class="icon-video"></em>1-3 使用记事本编写Java...(07:00)</a> <i class="">
									<em class="icon-nolearn"></em>
							</i></li>
							<li data-id="1474"><a href="/ceping/1474"><em
									class="icon-test"></em>1-4 练习题</a> <i class=""> <em
									class="icon-half"></em>
							</i></li>
							<li data-id="1412"><a href="/video/1412"><em
									class="icon-video"></em>1-5 使用Eclipse开发Jav...(08:59)</a> <i
								class=""> <em class="icon-nolearn"></em>
							</i></li>
							<li data-id="1414"><a href="/video/1414"><em
									class="icon-video"></em>1-6 MyEclipse的使用简...(03:53)</a> <i class="">
									<em class="icon-nolearn"></em>
							</i></li>
							<li data-id="1475"><a href="/ceping/1475"><em
									class="icon-test"></em>1-7 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1416"><a href="/video/1416"><em
									class="icon-video"></em>1-8 程序的移植(03:08)</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1422"><a href="/video/1422"><em
									class="icon-video"></em>1-9 经验技巧分享(01:52)</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1423"><a href="/ceping/1423"><em
									class="icon-test"></em>1-10 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第2章 变量和常量</span></li>
							<li data-id="1176"><a href="/code/1176"><em
									class="icon-code"></em>2-1 Java中的关键字</a> <i class="">正在学 <em
									class="icon-clock"></em>
							</i></li>
							<li data-id="1177"><a href="/code/1177"><em
									class="icon-code"></em>2-2 认识Java标识符</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1180"><a href="/ceping/1180"><em
									class="icon-test"></em>2-3 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1183"><a href="/code/1183"><em
									class="icon-code"></em>2-4 变量是什么</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1221"><a href="/code/1221"><em
									class="icon-code"></em>2-5 如何命名Java变量...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1230"><a href="/code/1230"><em
									class="icon-code"></em>2-6 Java中的数据类型...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1242"><a href="/code/1242"><em
									class="icon-code"></em>2-7 Java中变量的使用规则...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1254"><a href="/ceping/1254"><em
									class="icon-test"></em>2-8 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1236"><a href="/code/1236"><em
									class="icon-code"></em>2-9 Java中的自动类型转换...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1241"><a href="/code/1241"><em
									class="icon-code"></em>2-10 Java中的强制类型转换...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1256"><a href="/code/1256"><em
									class="icon-code"></em>2-11 Java常量的应用</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1274"><a href="/code/1274"><em
									class="icon-code"></em>2-12 如何在Java中使用注释...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1275"><a href="/ceping/1275"><em
									class="icon-test"></em>2-13 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第3章 常用的运算符</span></li>
							<li data-id="1278"><a href="/code/1278"><em
									class="icon-code"></em>3-1 什么是运算符</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1279"><a href="/code/1279"><em
									class="icon-code"></em>3-2 Java中的算术运算符...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1298"><a href="/code/1298"><em
									class="icon-code"></em>3-3 Java中的赋值运算符...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1299"><a href="/code/1299"><em
									class="icon-code"></em>3-4 Java中的比较运算符...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1301"><a href="/code/1301"><em
									class="icon-code"></em>3-5 Java中的逻辑运算符...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1302"><a href="/ceping/1302"><em
									class="icon-test"></em>3-6 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1306"><a href="/code/1306"><em
									class="icon-code"></em>3-7 Java中的条件运算符...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1315"><a href="/code/1315"><em
									class="icon-code"></em>3-8 Java中运算符的优先级...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1314"><a href="/ceping/1314"><em
									class="icon-test"></em>3-9 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1352"><a href="/ceping/1352"><em
									class="icon-test"></em>3-10 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第4章 流程控制语句</span></li>
							<li data-id="1353"><a href="/code/1353"><em
									class="icon-code"></em>4-1 Java条件语句之 if ...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1354"><a href="/code/1354"><em
									class="icon-code"></em>4-2 Java条件语句之 if.....</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1355"><a href="/code/1355"><em
									class="icon-code"></em>4-3 Java条件语句之多重 ...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1356"><a href="/code/1356"><em
									class="icon-code"></em>4-5 Java条件语句之嵌套 ...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1421"><a href="/ceping/1421"><em
									class="icon-test"></em>4-6 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1358"><a href="/code/1358"><em
									class="icon-code"></em>4-7 Java条件语句之 swit...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1420"><a href="/code/1420"><em
									class="icon-code"></em>4-8 Java循环语句之 whil...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1424"><a href="/code/1424"><em
									class="icon-code"></em>4-9 Java循环语句之 do.....</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1425"><a href="/code/1425"><em
									class="icon-code"></em>4-10 Java循环语句之 for...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1427"><a href="/ceping/1427"><em
									class="icon-test"></em>4-11 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1431"><a href="/code/1431"><em
									class="icon-code"></em>4-12 Java循环跳转语句之 ...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1432"><a href="/code/1432"><em
									class="icon-code"></em>4-13 Java循环跳转语句之 ...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1433"><a href="/ceping/1433"><em
									class="icon-test"></em>4-14 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1497"><a href="/code/1497"><em
									class="icon-code"></em>4-15 Java 循环语句之多重...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="7249"><a href="/code/7249"><em
									class="icon-code"></em>4-16 编程练习</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第5章 阶段练习</span></li>
							<li data-id="1554"><a href="/code/1554"><em
									class="icon-code"></em>5-1 编程练习</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1625"><a href="/video/1625"><em
									class="icon-video"></em>5-2 编程练习解析(04:40)</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1626"><a href="/video/1626"><em
									class="icon-video"></em>5-3 编程练习优化(06:10)</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1627"><a href="/video/1627"><em
									class="icon-video"></em>5-4 使用Eclipse调试程...(05:39)</a> <i class="">
									<em class="icon-nolearn"></em>
							</i></li>
							<li data-id="1628"><a href="/video/1628"><em
									class="icon-video"></em>5-5 进阶练习(11:40)</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第6章 数组</span></li>
							<li data-id="1514"><a href="/code/1514"><em
									class="icon-code"></em>6-1 什么是数组</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1594"><a href="/ceping/1594"><em
									class="icon-test"></em>6-2 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1525"><a href="/code/1525"><em
									class="icon-code"></em>6-3 如何使用 Java 中的...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1595"><a href="/ceping/1595"><em
									class="icon-test"></em>6-4 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1531"><a href="/code/1531"><em
									class="icon-code"></em>6-5 使用循环操作 Java ...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1677"><a href="/code/1677"><em
									class="icon-code"></em>6-6 编程练习</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1556"><a href="/code/1556"><em
									class="icon-code"></em>6-7 使用 Arrays 类操作...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1864"><a href="/code/1864"><em
									class="icon-code"></em>6-8 使用 foreach 操作...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1571"><a href="/code/1571"><em
									class="icon-code"></em>6-9 Java 中的二维数组...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1596"><a href="/ceping/1596"><em
									class="icon-test"></em>6-10 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第7章 方法</span></li>
							<li data-id="1577"><a href="/code/1577"><em
									class="icon-code"></em>7-1 如何定义 Java 中的...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1578"><a href="/code/1578"><em
									class="icon-code"></em>7-2 Java 中无参无返回值...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1579"><a href="/code/1579"><em
									class="icon-code"></em>7-3 Java 中无参带返回值...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1634"><a href="/code/1634"><em
									class="icon-code"></em>7-4 编程练习</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1580"><a href="/code/1580"><em
									class="icon-code"></em>7-5 Java 中带参无返回值...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1581"><a href="/code/1581"><em
									class="icon-code"></em>7-6 Java 中带参带返回值...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1637"><a href="/ceping/1637"><em
									class="icon-test"></em>7-7 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1582"><a href="/code/1582"><em
									class="icon-code"></em>7-8 Java 中方法的重载...</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="1680"><a href="/code/1680"><em
									class="icon-code"></em>7-9 编程练习</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
							<li data-id="6977"><a href="/ceping/6977"><em
									class="icon-test"></em>7-10 练习题</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>
						<ul>
							<li class="sec-title"><span>第8章 编程挑战</span></li>
							<li data-id="1598"><a href="/code/1598"><em
									class="icon-code"></em>8-1 编程练习</a> <i class=""> <em
									class="icon-nolearn"></em>
							</i></li>
						</ul>

					</div>
					<div class="nano-pane">
						<div class="nano-slider"
							style="height: 176px; -webkit-transform: translate(0, 0px);"></div>
					</div>
				</div>
			</div>
			<div id="js-code-container" class="cmain-container"
				style="height: 764px; width: 1500px; display: block;">
				<div id="js-aticle-container"
					class="cwrap-autoheight aticle-container" style="width: 400px;">
					<div class="code-panel" id="J_PanelCode">
						<h2 class="code-head" id="J_CodeLang" data-lang="JAVA">Java中的关键字</h2>
						<div class="code-description" id="J_CodeDescr">
							<div class="code-desc co">
								<p align="left">Java 语言中有一些具有特殊用途的词被称为关键字。关键字对 Java
									的编译器有着特殊的意义，在程序中应用时一定要慎重哦！！</p>

								<p align="left">Java 中常用关键字：</p>

								<p align="left">
									<a href="http://img.mukewang.com/53588ce900019bee05190178.jpg"><img
										alt=""
										src="http://img.mukewang.com/53588ce900019bee05190178.jpg"
										style="width: 330px; height: 113px;"></a>
								</p>

								<p>问：这么多,记不住啊。。。。。。-_-||</p>

								<p>答：现在不需要你记住所有，混个眼熟即可，在学习的过程中，你会逐步找到感觉并记住他们</p>

								<p>
									对了，差点忘了大事，Java 关键字是<strong>区分大小写</strong>的哦！所以 void 是关键字，但 Void
									就不是了~~
								</p>

							</div>
							<div class="code-tips">
								<h3 class="code-tips-title">任务</h3>
								<div class="co">
									<p align="left">
										<strong>是否理解 Java 中的关键字了呢？一起验证一下吧！</strong>
									</p>

									<p align="left">
										仔细查看编辑器中的代码后，你能找到第 <strong>2</strong> 行存在的错误并修改它么？
									</p>
									<!-- 	<textarea id="codeText" placeholder="请编写代码"></textarea>
									<a onclick="codeCompile()">查看结果</a> 
									<textarea id="codeResult" ></textarea> -->
								</div>
								<div class="code-qa" id="J_CodeQa">
									<dl>
										<dt>
											<b>?</b>不会了怎么办
										</dt>
										<dd class="hide">
											<div class="co">
												<p>还记得关键字是区分大小写的么！看看 voiD 是有效的关键字么？？</p>

												<p>参考答案：</p>

												<p>
													<strong style="line-height: 1.6em;"><a
														href="http://img.mukewang.com/5358b37e000119a503560084.jpg"><img
															alt=""
															src="http://img.mukewang.com/5358b37e000119a503560084.jpg"
															style="width: 330px; height: 78px; opacity: 0.9;"></a></strong>
												</p>

												<p>
													运行结果：<a
														href="http://img.mukewang.com/5358b395000136b001320026.jpg"><img
														alt=""
														src="http://img.mukewang.com/5358b395000136b001320026.jpg"></a>
												</p>

												<p>&nbsp;</p>

											</div>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="js-editor-container"
					class="cwrap-autoheight editor-container"
					style="left: 400px; width: 1099px;">
					<div id="js-editor-drag-wrap" class="editor-drag-wrap">
						<div id="js-editor-drager" class="editor-drager" unselectable="on"
							style="-webkit-user-select: none; display: none;">
							<span>||</span>
						</div>
					</div>


					<div class="editor-box" id="J_EditorTabs">
						<div class="editor-tab js-editor-tab">
							<div class="editor-left icon-left editor-op"></div>
							<div class="editor-view">
								<ul class="clearfix" id="J_TabType"
									style="width: 148px; margin-left: 0px;">
									<li class="ui-tabs-active"><a href="#editor-tabs-java">HelloWorld.java</a></li>
								</ul>
							</div>
							<div class="editor-right icon-right editor-op"></div>
						</div>
						<div
							class="tab-con editor-item ace_editor ace-tomorrow-night ace_dark"
							id="editor-tabs-java" data-filename="HelloWorld.java"
							data-lang="java" style="font-size: 14px;">
                <textarea class="" wrap="" autocapitalize="" spellcheck="false" 
                      style="bottom: 639px; height: 658px; width: 1100px; right: 403.594px;" id="sourceCode">${practice.initCode }</textarea>
						</div>

					</div>
					<div class="editor-btn">
						<div class="editor-btn-inner">
							<a href="javascript:;" class="code-btn-submit r" id="J_Commit" title="提交" onclick="codeCommit()">提交</a> 
							<a href="javascript:;" class="code-btn-submit r" id="J_Commit" title="查看" style="margin-right: 20px;" onclick="codeCompile()">查看结果</a>
							<a href="javascript:;" class="code-btn-reset" id="J_EditorReset" title="重置" onclick="codeReset()">重置代码</a>
						</div>
					</div>



					<div id="js-result-container"
						class="cwrap-autoheight result-container"
						style="left: 1100px; width: 550px;">
						<div id="js-result-drag-wrap" class="result-drag-wrap">
							<div id="js-result-drager" class="result-drager"
								unselectable="on"
								style="-webkit-user-select: none; display: none;">
								<span>||</span>
							</div>
						</div>
						<div class="result-wrap">
							<div id="viewPort-content" style="margin-top: 20px;width:300px;">
								<h2>运行结果：</h2>
								<iframe name="Consoleframe" id="J_Console" frameborder="0"
									width="100%" height="100%"
									src=""> </iframe>
							</div>
						</div>
					</div>

					<div id="viewPort-header" class="result-triggers">

						<!-- <a href="" id="js-toggle-width"	class="result-toggle result-toggle-width"
						style="visibility: visible;" onclick="codeCompile()"><i></i><span>全屏</span></a>  -->
						<a href="javascript:;" id="js-toggle-vsb"
							class="result-toggle result-toggle-vsb" style="display: none;"><i></i><span>运行结果</span></a>
					</div>
				</div>
			</div>
			<div id="reset_mid" rel="1176" hidden=""></div>
			<div id="reset_step" rel="1" hidden=""></div>


			<div class="maybe-wenda" id="maybe-wenda" style="display: none;">
				<i class="icon-chat"></i>
				<p class="text">
					你发的评论可能会是问题？<br>是否将他发到问答中
				</p>
				<input class="btn ok" type="button" value="好的" id="wenda-ok">
				<input class="btn no" type="button" value="不用" id="wenda-no">
			</div>
		</div>

		<div class="course-subcontainer clearfix">
			<div class="course-left">
				<ul class="course-menu course-code-menu clearfix js-course-menu"
					style="position: absolute; left: 0px;">
					<li class="course-menu-item"><a class=""
						href="javascript:void(0)" id="plMenu">评论</a></li>
					<li class="course-menu-item"><a href="javascript:void(0)"
						id="qaMenu" class="active">问答</a></li>
					<li class="course-menu-item"><a href="javascript:void(0)"
						id="noteMenu">笔记</a></li>
					<li class="course-menu-item"><a href="javascript:void(0)"
						id="wikiMenu">WIKI</a></li>
					<li class="course-menu-item"><a href="javascript:void(0)"
						id="mateMenu">同学代码</a></li>
				</ul>
				<div id="disArea" class="lists-container list-wrap">
					<div id="pl-content" class="list-tab-con" style="display: none;">
						<div class="publish clearfix" id="discus-publish">
							<div class="publish-wrap publish-wrap-pl">
								<div class="pl-input-wrap">
									<div id="js-pl-input-fake" class="pl-input-inner">
										<textarea id="js-pl-textarea" class="js-placeholder"
											placeholder="扯淡、吐槽、表扬、鼓励……想说啥就说啥！"></textarea>
										<span class="num-limit"><span id="js-pl-limit">0</span>/300</span>
									</div>
									<div class="pl-input-btm input-btm clearfix">
										<div class="verify-code l"></div>
										<input type="button" id="js-pl-submit" class="r course-btn"
											value="发表评论">
									</div>
								</div>

							</div>
						</div>
						<div id="plLoadListData">
							<div class="pl-container"></div>
							<div class="page pl-list-page"></div>
						</div>
					</div>
					<div id="qa-content" class="list-tab-con" style="">
						<div id="qaLoadListData">
							<div class="sortlist">
								<div class="ordertab">
									<a href="javascript:void(0)" hidefocus="true" data-order="1"
										class="quealltab onactive">全部</a> <a href="javascript:void(0)"
										hidefocus="true" data-order="2" class="quealltab ">精华</a>
								</div>
							</div>
							<div class="answertabcon">
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/2327091" class="wenda-head"
											target="_blank" title="hequanren"> <img
											src="http://img.mukewang.com/5458639d0001bed702200220-80-80.jpg"
											alt="hequanren" width="40">
										</a> <a href="/space/u/uid/2327091" target="_blank"
											title="hequanren" class="wenda-nickname">hequanren</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/96491" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">1</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">13</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/96491" target="_blank" class="wendatitle">
													不是视频？ </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/1928834" target="_blank" title="忘性最大的人"
													class="replyuserhead"><img
													src="http://img.mukewang.com/554592370001cbba06400640-80-80.jpg"
													alt="忘性最大的人" width="20"> </a> <a
													href="/space/u/uid/1928834" target="_blank" title="忘性最大的人"
													class="nickname">忘性最大的人: </a> <span class="replydet">前面的自己看就好了，不用视频的，而且基础的还是多敲点代码，不然看了老师的以为懂了而不去写，就吃大亏了，乖乖地自己看文字吧，印象还深点。</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：5天前</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/2229982" class="wenda-head"
											target="_blank" title="秋水01"> <img
											src="http://img.mukewang.com/55c35a8c0001fee301000100-80-80.jpg"
											alt="秋水01" width="40">
										</a> <a href="/space/u/uid/2229982" target="_blank" title="秋水01"
											class="wenda-nickname">秋水01</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/92662" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">4</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">41</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/92662" target="_blank" class="wendatitle">
													为什么第二章以后就不能放了呀、 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/2327091" target="_blank"
													title="hequanren" class="replyuserhead"><img
													src="http://img.mukewang.com/5458639d0001bed702200220-80-80.jpg"
													alt="hequanren" width="20"> </a> <a
													href="/space/u/uid/2327091" target="_blank"
													title="hequanren" class="nickname">hequanren: </a> <span
													class="replydet">顶，求解答</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-08-15</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/2160595" class="wenda-head"
											target="_blank" title="圣经的旋律"> <img
											src="http://img.mukewang.com/545847c10001f40702200220-80-80.jpg"
											alt="圣经的旋律" width="40">
										</a> <a href="/space/u/uid/2160595" target="_blank" title="圣经的旋律"
											class="wenda-nickname">圣经的旋律</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/92282" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">2</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">32</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/92282" target="_blank" class="wendatitle">
													null到底是啥意思，怎么用 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/1913441" target="_blank" title="管理員"
													class="replyuserhead"><img
													src="http://img.mukewang.com/545867630001795d02200220-80-80.jpg"
													alt="管理員" width="20"> </a> <a href="/space/u/uid/1913441"
													target="_blank" title="管理員" class="nickname">管理員: </a> <span
													class="replydet">这个是相对于有地址而言对象有两种情况，一种是在内存中有地址，也就是分配了内存空间，另一种情况就是null了。Object
													obj = null; &nbsp;//声明 ,未分配空间obj = new String(); //分配空间。</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-08-13</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1010827" class="wenda-head"
											target="_blank" title="onewei"> <img
											src="http://img.mukewang.com/545f39640001a6d101800180-80-80.jpg"
											alt="onewei" width="40">
										</a> <a href="/space/u/uid/1010827" target="_blank" title="onewei"
											class="wenda-nickname">onewei</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/87995" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">5</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">63</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/87995" target="_blank" class="wendatitle">
													下面一些人什么问题都问。。。真无语~~ </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最赞回答]</span> <a
													href="/space/u/uid/2079019" target="_blank" title="夏雷冬霜"
													class="replyuserhead"><img
													src="http://img.mukewang.com/54584fb60001feb502200220-80-80.jpg"
													alt="夏雷冬霜" width="20"> </a> <a
													href="/space/u/uid/2079019" target="_blank" title="夏雷冬霜"
													class="nickname">夏雷冬霜: </a> <span class="replydet">任何问题都不值得嘲笑，很多你觉得”弱智“的问题，不是因为你懂，而是你问不出来，所有”弱智“问题Java语言的设计者当初设计语言的时候必然都考虑到了，后来语言成了标准，再也没有人问为什么了，以为java从天上掉下来的。所以你为什么觉得别人的问题简单呢？真的简单吗？...</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-07-22</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/292684" class="wenda-head"
											target="_blank" title="江心乱影_XL"> <img
											src="http://img.mukewang.com/54007fc80001a12f01800180-80-80.jpg"
											alt="江心乱影_XL" width="40">
										</a> <a href="/space/u/uid/292684" target="_blank" title="江心乱影_XL"
											class="wenda-nickname">江心乱影_XL</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/87802" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">1</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">38</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-tick-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/87802" target="_blank" class="wendatitle">
													课程形式疑问 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign adopt">[已采纳的回答]</span> <a
													href="/space/u/uid/128142" target="_blank" title="Perona"
													class="replyuserhead"><img
													src="http://img.mukewang.com/557e54c10001c62c02750275-80-80.jpg"
													alt="Perona" width="20"> </a> <a
													href="/space/u/uid/128142" target="_blank" title="Perona"
													class="nickname">Perona: </a> <span class="replydet">不是哦</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-07-21</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/2103147" class="wenda-head"
											target="_blank" title="Martin_zhou"> <img
											src="http://img.mukewang.com/545862e700016daa02200220-80-80.jpg"
											alt="Martin_zhou" width="40">
										</a> <a href="/space/u/uid/2103147" target="_blank"
											title="Martin_zhou" class="wenda-nickname">Martin_zhou</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/87631" target="_blank"
											class="replynumber noanswernum ">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">0</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">38</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/87631" target="_blank" class="wendatitle">
													慕课网牛逼 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-07-21</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/2124359" class="wenda-head"
											target="_blank" title="junyuZ"> <img
											src="http://img.mukewang.com/54584ca90001a85802200220-80-80.jpg"
											alt="junyuZ" width="40">
										</a> <a href="/space/u/uid/2124359" target="_blank" title="junyuZ"
											class="wenda-nickname">junyuZ</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/85973" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">2</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">42</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/85973" target="_blank" class="wendatitle">
													关于java关键字的小问题 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/302326" target="_blank" title="血舞残殇"
													class="replyuserhead"><img
													src="http://img.mukewang.com/548f8e8b0001e5e407000733-80-80.jpg"
													alt="血舞残殇" width="20"> </a> <a href="/space/u/uid/302326"
													target="_blank" title="血舞残殇" class="nickname">血舞残殇: </a> <span
													class="replydet">你看看C语言就好了，C语言中是有goto这个关键字的，java的底层又是C++所以这个关键字是保留的</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-07-10</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1964161" class="wenda-head"
											target="_blank" title="colinjian22"> <img
											src="http://img.mukewang.com/533e564d0001308602000200-80-80.jpg"
											alt="colinjian22" width="40">
										</a> <a href="/space/u/uid/1964161" target="_blank"
											title="colinjian22" class="wenda-nickname">colinjian22</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/78494" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">3</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">74</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/78494" target="_blank" class="wendatitle">
													java关键字 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/2068481" target="_blank" title="叶隐"
													class="replyuserhead"><img
													src="http://img.mukewang.com/55ab23f00001f5bc09500712-80-80.jpg"
													alt="叶隐" width="20"> </a> <a href="/space/u/uid/2068481"
													target="_blank" title="叶隐" class="nickname">叶隐: </a> <span
													class="replydet">这两个不是关键字，他们是数据类型，是引用类型。</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-05-18</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1924017" class="wenda-head"
											target="_blank" title="風平浪濪_0"> <img
											src="http://img.mukewang.com/554258870001a6d101000100-80-80.jpg"
											alt="風平浪濪_0" width="40">
										</a> <a href="/space/u/uid/1924017" target="_blank" title="風平浪濪_0"
											class="wenda-nickname">風平浪濪_0</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/76041" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">2</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">72</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-tick-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/76041" target="_blank" class="wendatitle">
													看了一小段有个问题 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign adopt">[已采纳的回答]</span> <a
													href="/space/u/uid/1896523" target="_blank"
													title="Absolute_Duo" class="replyuserhead"><img
													src="http://img.mukewang.com/553bcafa0001548601000100-80-80.jpg"
													alt="Absolute_Duo" width="20"> </a> <a
													href="/space/u/uid/1896523" target="_blank"
													title="Absolute_Duo" class="nickname">Absolute_Duo: </a> <span
													class="replydet">用Eclipse的话环境变量就不用配置了</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2015-05-01</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1033983" class="wenda-head"
											target="_blank" title="lionf"> <img
											src="http://img.mukewang.com/5333a0c40001088802000200-80-80.jpg"
											alt="lionf" width="40">
										</a> <a href="/space/u/uid/1033983" target="_blank" title="lionf"
											class="wenda-nickname">lionf</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/57289" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">2</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">119</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/57289" target="_blank" class="wendatitle">
													请检查代码中是否匹配：void，再试试！直接进入下一节 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/106515" target="_blank"
													title="Angel_mimi" class="replyuserhead"><img
													src="http://img.mukewang.com/533a8bf600019d3710240768-80-80.jpg"
													alt="Angel_mimi" width="20"> </a> <a
													href="/space/u/uid/106515" target="_blank"
													title="Angel_mimi" class="nickname">Angel_mimi: </a> <span
													class="replydet">现在还有这个问题么？</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2014-11-20</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1036658" class="wenda-head"
											target="_blank" title="花嫁zn"> <img
											src="http://img.mukewang.com/557ebf1f000119e401860186-80-80.jpg"
											alt="花嫁zn" width="40">
										</a> <a href="/space/u/uid/1036658" target="_blank" title="花嫁zn"
											class="wenda-nickname">花嫁zn</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/57083" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">4</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">117</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/57083" target="_blank" class="wendatitle">
													为什么改正了后。总会出现《请检查代码中是否匹配：void，再试试！直接进入下一节》 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign praise">[最新回答]</span> <a
													href="/space/u/uid/106515" target="_blank"
													title="Angel_mimi" class="replyuserhead"><img
													src="http://img.mukewang.com/533a8bf600019d3710240768-80-80.jpg"
													alt="Angel_mimi" width="20"> </a> <a
													href="/space/u/uid/106515" target="_blank"
													title="Angel_mimi" class="nickname">Angel_mimi: </a> <span
													class="replydet">现在还有这个问题么？</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2014-11-19</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1036658" class="wenda-head"
											target="_blank" title="花嫁zn"> <img
											src="http://img.mukewang.com/557ebf1f000119e401860186-80-80.jpg"
											alt="花嫁zn" width="40">
										</a> <a href="/space/u/uid/1036658" target="_blank" title="花嫁zn"
											class="wenda-nickname">花嫁zn</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/57082" target="_blank"
											class="replynumber noanswernum ">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">0</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">68</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/57082" target="_blank" class="wendatitle">
													改正错误 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2014-11-19</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/1008718" class="wenda-head"
											target="_blank" title="清风慕竹1008718"> <img
											src="http://img.mukewang.com/545dfa4d0001b13601000100-80-80.jpg"
											alt="清风慕竹1008718" width="40">
										</a> <a href="/space/u/uid/1008718" target="_blank"
											title="清风慕竹1008718" class="wenda-nickname">清风慕竹1008718</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/53734" target="_blank"
											class="replynumber hasanswernum">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">1</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">74</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-tick-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/53734" target="_blank" class="wendatitle">
													老师那个void的的d不是小写吗？？ </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replysign adopt">[已采纳的回答]</span> <a
													href="/space/u/uid/255777" target="_blank" title="偌颜宁"
													class="replyuserhead"><img
													src="http://img.mukewang.com/5453449f0001c36e05520522-80-80.jpg"
													alt="偌颜宁" width="20"> </a> <a href="/space/u/uid/255777"
													target="_blank" title="偌颜宁" class="nickname">偌颜宁: </a> <span
													class="replydet">你先看看左侧的任务要求</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2014-11-08</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/201193" class="wenda-head"
											target="_blank" title="点滴希望"> <img
											src="http://img.mukewang.com/53a6884300014c8c01000100-80-80.jpg"
											alt="点滴希望" width="40">
										</a> <a href="/space/u/uid/201193" target="_blank" title="点滴希望"
											class="wenda-nickname">点滴希望</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/53350" target="_blank"
											class="replynumber noanswernum ">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">0</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">51</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/53350" target="_blank" class="wendatitle">
													223213 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2014-11-07</em>
											</div>
										</div>
									</div>
								</div>
								<div class="wenda-listcon clearfix">
									<div class="headslider">
										<a href="/space/u/uid/497070" class="wenda-head"
											target="_blank" title="《平淡的歌》"> <img
											src="http://img.mukewang.com/545889f0000113fc01000100-80-80.jpg"
											alt="《平淡的歌》" width="40">
										</a> <a href="/space/u/uid/497070" target="_blank" title="《平淡的歌》"
											class="wenda-nickname">《平淡的歌》</a>
									</div>
									<div class="wendaslider">
										<a href="/qadetail/51549" target="_blank"
											class="replynumber noanswernum ">
											<div class="ys">
												<div class="number padAjust">
													<b class="numShow">0</b>
												</div>
												<div class="number">回答</div>
											</div>
											<div class="browsenum">
												<div class="number padAjust">
													<b class="numShow">13</b>
												</div>
												<div class="number">浏览</div>
											</div>
										</a>
										<h2 class="wendaquetitle">
											<i class="icon-ques-revert"></i>
											<div class="wendatitlecon">
												<a href="/qadetail/51549" target="_blank" class="wendatitle">
													挺好的 </a>
											</div>
										</h2>
										<div class="replycont clearfix">
											<i class="icon-msg-revert"></i>
											<div class="fl replydes">
												<span class="replydet">嗯～～，这个提问大家都在考虑......</span>
											</div>
										</div>
										<div class="replymegfooter">
											<div class="wenda-time">
												<em>时间：2014-11-04</em>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="page discuss-list-page">
								<span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a
									href="javascript:void(0)" data-page="1" class="active">1</a><a
									href="javascript:void(0)" data-page="2">2</a><a
									href="javascript:void(0)" data-page="3">3</a><a
									href="javascript:void(0)" data-page="2">下一页</a><a
									href="javascript:void(0)" data-page="3">尾页</a>
							</div>
						</div>
					</div>
					<div id="note-content" class="list-tab-con" style="display: none;">
						<div id="noteLoadListData">
							<div id="course_note" class="course_note"></div>
							<div class="page note-list-page"></div>
						</div>
					</div>
					<div id="wiki-content" class="list-tab-con" style="display: none;">
						<div id="wikiLoadListData">
							<div id="course_wiki" class="course_wiki"></div>
							<div class="page wiki-list-page"></div>
						</div>
					</div>
					<div id="mate-content" class="list-tab-con" style="display: none;">
						<div id="mateLoadListData">
							<div class="othterscode-container"></div>
							<div class="page othterscode-list-page"></div>
						</div>
					</div>

				</div>
			</div>
			<div class="course-right clearfix">
				<div class="classmate fl">
					<h3>
						你的同学<span>153696人</span><a href="javascript:void(0);"
							class="js-ch-mate ch-classmate">换一批</a>
					</h3>
					<div class="users_wrap">
						<div id="js-class-mate" class="users clearfix">
							<a class="mate-avator" href="/space/u/uid/101286" target="_blank"><img
								src="http://img.mukewang.com/user/5333a0350001692e02200220-80-80.jpg"
								title="Lemuel"></a><a class="mate-avator"
								href="/space/u/uid/103210" target="_blank"><img
								src="http://img.mukewang.com/user/530785b60001d0ab01000100-80-80.jpg"
								title="Twilight"></a><a class="mate-avator"
								href="/space/u/uid/105625" target="_blank"><img
								src="http://img.mukewang.com/user/5333a2590001069f02000200-80-80.jpg"
								title="花花"></a><a class="mate-avator"
								href="/space/u/uid/107153" target="_blank"><img
								src="http://img.mukewang.com/user/533e2efa0001fe4b01000100-80-80.jpg"
								title="VincentLiong"></a><a class="mate-avator"
								href="/space/u/uid/108510" target="_blank"><img
								src="http://img.mukewang.com/user/5333a17a0001592502000200-80-80.jpg"
								title="应学"></a><a class="mate-avator"
								href="/space/u/uid/108515" target="_blank"><img
								src="http://img.mukewang.com/user/533e4cf4000151f602000200-80-80.jpg"
								title="belief1992"></a><a class="mate-avator"
								href="/space/u/uid/108848" target="_blank"><img
								src="http://img.mukewang.com/user/534688dd0001680301000100-80-80.jpg"
								title="思想停摆"></a><a class="mate-avator"
								href="/space/u/uid/109229" target="_blank"><img
								src="http://img.mukewang.com/user/533e4d5b0001d57502200203-80-80.jpg"
								title="htz"></a><a class="mate-avator"
								href="/space/u/uid/111685" target="_blank"><img
								src="http://img.mukewang.com/user/5358e58500010cc601000100-80-80.jpg"
								title="走走道又疯了"></a><a class="mate-avator"
								href="/space/u/uid/112695" target="_blank"><img
								src="http://img.mukewang.com/user/535fca660001c62001000100-80-80.jpg"
								title="游鱼"></a><a class="mate-avator"
								href="/space/u/uid/115585" target="_blank"><img
								src="http://img.mukewang.com/user/536da25300011a4401000100-80-80.jpg"
								title="忽而今夏"></a><a class="mate-avator"
								href="/space/u/uid/115728" target="_blank"><img
								src="http://img.mukewang.com/user/536de03b0001ef4501000100-80-80.jpg"
								title="土豆彡"></a><a class="mate-avator"
								href="/space/u/uid/116245" target="_blank"><img
								src="http://img.mukewang.com/user/537020d50001c3db01000100-80-80.jpg"
								title="Marker_0001"></a><a class="mate-avator"
								href="/space/u/uid/116736" target="_blank"><img
								src="http://img.mukewang.com/user/5370d4b2000150d101160116-80-80.jpg"
								title="Lovely_Guy"></a><a class="mate-avator"
								href="/space/u/uid/116955" target="_blank"><img
								src="http://img.mukewang.com/user/5371e1c1000134e001000100-80-80.jpg"
								title="BINGO_0001"></a><a class="mate-avator"
								href="/space/u/uid/117074" target="_blank"><img
								src="http://img.mukewang.com/user/5372c46e000131d301000100-80-80.jpg"
								title="夏目子安"></a><a class="mate-avator"
								href="/space/u/uid/117387" target="_blank"><img
								src="http://img.mukewang.com/user/54584f7b0001559202200220-80-80.jpg"
								title="光影GG"></a><a class="mate-avator"
								href="/space/u/uid/117517" target="_blank"><img
								src="http://img.mukewang.com/user/537440800001abad01000100-80-80.jpg"
								title="Mr wolf"></a><a class="mate-avator"
								href="/space/u/uid/117864" target="_blank"><img
								src="http://img.mukewang.com/user/537570b70001b3c701000100-80-80.jpg"
								title="LuckyDevil"></a><a class="mate-avator"
								href="/space/u/uid/118106" target="_blank"><img
								src="http://img.mukewang.com/user/5375904400012c8801000100-80-80.jpg"
								title="春之思靓"></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="course-about">
			<div class="course-about-tit clearfix">
				<h3>学过该课的人还学过</h3>
				<span class="on">课程</span> <span>计划</span>
			</div>
			<ul class="con-wrap clearfix" style="display: block;">
				<li><a href="/view/124" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/53b65f70000148d306000338.jpg"
						alt="Java入门第二季">
						<p>Java入门第二季</p>
				</a></li>
				<li><a href="/view/110" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/537587c60001def606000338.jpg"
						alt="Java入门第三季">
						<p>Java入门第三季</p>
				</a></li>
				<li><a href="/view/9" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/529dc3380001379906000338.jpg"
						alt="HTML+CSS基础课程">
						<p>HTML+CSS基础课程</p>
				</a></li>
				<li><a href="/view/36" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/53e1d0470001ad1e06000338.jpg"
						alt="JavaScript入门篇">
						<p>JavaScript入门篇</p>
				</a></li>
				<li><a href="/view/122" class="img-box" target="_blank"> <img
						src="http://img.mukewang.com/53b3d133000158e206000338.jpg"
						alt="与MySQL的零距离接触">
						<p>与MySQL的零距离接触</p>
				</a></li>
			</ul>
			<ul class="con-wrap clearfix" style="display: none;">
				<li><a href="/course/programdetail/pid/10" class="img-box"
					target="_blank"> <img
						src="http://img.mukewang.com/55aef9210001b0a402400180.jpg"
						alt="Android攻城狮初养成">
						<p>Android攻城狮初养成</p>
				</a></li>
				<li><a href="/course/programdetail/pid/25" class="img-box"
					target="_blank"> <img
						src="http://img.mukewang.com/55aefbc70001bb4802400180.jpg"
						alt="Java攻城狮养成计划（入门篇）">
						<p>Java攻城狮养成计划（入门篇）</p>
				</a></li>
				<li><a href="/course/programdetail/pid/29" class="img-box"
					target="_blank"> <img
						src="http://img.mukewang.com/55aef90d0001f2a502400180.jpg"
						alt="高德开发者必由之路——Android SDK篇">
						<p>高德开发者必由之路——Android SDK篇</p>
				</a></li>
				<li><a href="/course/programdetail/pid/31" class="img-box"
					target="_blank"> <img
						src="http://img.mukewang.com/5567c0bb00013ef702400180.jpg"
						alt="Java工程师">
						<p>Java工程师</p>
				</a></li>
				<li><a href="/course/programdetail/pid/33" class="img-box"
					target="_blank"> <img
						src="http://img.mukewang.com/5567c0a50001538002400180.jpg"
						alt="Android工程师">
						<p>Android工程师</p>
				</a></li>
			</ul>
		</div>

		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
</body>
</html>
