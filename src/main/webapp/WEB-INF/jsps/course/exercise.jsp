<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>练习题-微课程</title>
<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/exercise.css">

<style>
dt {
	font-weight: normal;
}
</style>
<script>
	function activityA() {
		$("#895").addClass("clickStyle");
		$("#896").removeClass("clickStyle");
		$("#897").removeClass("clickStyle");
		$("#898").removeClass("clickStyle");
		$("#postAnswer").removeClass("disable");
		$("#postAnswer").addClass("enable");
	}
	function activityB() {
		$("#896").addClass("clickStyle");
		$("#895").removeClass("clickStyle");
		$("#897").removeClass("clickStyle");
		$("#898").removeClass("clickStyle");
		$("#postAnswer").removeClass("disable");
		$("#postAnswer").addClass("enable");
	}
	function activityC() {
		$("#897").addClass("clickStyle");
		$("#896").removeClass("clickStyle");
		$("#895").removeClass("clickStyle");
		$("#898").removeClass("clickStyle");
		$("#postAnswer").removeClass("disable");
		$("#postAnswer").addClass("enable");
	}
	function activityD() {
		$("#898").addClass("clickStyle");
		$("#896").removeClass("clickStyle");
		$("#897").removeClass("clickStyle");
		$("#895").removeClass("clickStyle");
		$("#postAnswer").removeClass("disable");
		$("#postAnswer").addClass("enable");
	}
	function answerCommit() {
		var answer;
		var classA = document.getElementById("895").className;
		var classB = document.getElementById("896").className;
		var classC = document.getElementById("897").className;
		var classD = document.getElementById("898").className;
		if (classA.indexOf("clickStyle") > 0) {
			answer = "A";
		}
		if (classB.indexOf("clickStyle") > 0) {
			answer = "B";
		}
		if (classC.indexOf("clickStyle") > 0) {
			answer = "C";
		}
		if (classD.indexOf("clickStyle") > 0) {
			answer = "D";
		}
		var sectionId = ${exercise.section.sectionId};
		var userId = ${currentUser.userId};
		var exerciseId = ${exercise.exerciseId};
		document.getElementById("895").style.display = "none";
		document.getElementById("896").style.display = "none";
		document.getElementById("897").style.display = "none";
		document.getElementById("898").style.display = "none";
		document.getElementById("answerAndjiexi").style.display = "block";
		$.ajax({
			type : "post",
			url : "/microCourse/course/exerciseCommit",
			dataType : "json",
			data : {
				answer : answer,
				sectionId : sectionId,
				userId : userId,
				exerciseId : exerciseId
			},
			success : function(data) {
				$("#answerJudge").html(data.answ); 
				$("#answerJiexie").html(data.jiexi);
				var mm=data.jiexi;
				var nn="此为正确答案！";
				document.getElementById("redo_span").style.display = "inline";
				document.getElementById("js-redo").style.display = "block";
				document.getElementById("postAnswer").style.display = "none";
				document.getElementById("next_item").style.display = "block";
				if(mm==nn){
				document.getElementById("result_Part").style.display = "none";
				document.getElementById("resultPartShow").style.display = "none";
				}else
					{
					document.getElementById("result_Part").style.display = "block";
					document.getElementById("resultPartShow").style.display = "none";
					}
			}
		});
	}
	function viewRightAnswer() {
	  document.getElementById("resultPartShow").style.display = "block";
	}
	function redoExercise() {
	$("#898").removeClass("clickStyle");
	$("#896").removeClass("clickStyle");
	$("#897").removeClass("clickStyle");
	$("#895").removeClass("clickStyle");
	document.getElementById("895").style.display = "block";
	document.getElementById("896").style.display = "block";
	document.getElementById("897").style.display = "block";
	document.getElementById("898").style.display = "block";
	document.getElementById("answerAndjiexi").style.display = "none";
	document.getElementById("next_item").style.display = "none";
	document.getElementById("postAnswer").style.display = "block";
	document.getElementById("redo_span").style.display = "none";
}
</script>
</head>
<body>

	<!--导航栏 -->
	<jsp:include page="/WEB-INF/jsps/common/study_header.jsp"></jsp:include>

	<div id="studyMain">


		<div class="practiseCon" id="cepingTop" style="height: 764px;">
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
									class="icon-test"></em>1-4 练习题</a> <i class="">正在学 <em
									class="icon-clock"></em>
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
									class="icon-code"></em>2-1 Java中的关键字</a> <i class=""> <em
									class="icon-half"></em>
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
			<div class="practiseBox clearfix">
				<div class="xitiList" id="video-box">
					<div id="feature-slide-block">
						<dl class="feature-slide-preview" style="">
							<dt data-qid="228" class="nano has-scrollbar">
								<div class="con-box nano-content" tabindex="0"
									style="right: -21px;">
									<h2 class="ceping-head oneSel">单选练习题</h2>
									<!-- <div class="unit passed">
                                      <i class="line "></i>
                                      <var class="number "></var>
                                                                          </div> -->
									<div class="ceping-description J_CodeLang">
										<h3 class="desc-hd"></h3>
										<div class="ceping-desc co clearfix">
											<p>在控制台运行一个 Java 程序 Test . class ，使用的命令正确的是（ ）</p>

											<!--  -->
										</div>
										<div class="ceping-tips">
											<div class="ceping-qa"></div>
										</div>
									</div>
								</div>
								<!--con-box end-->
								<div class="nano-pane" style="display: none;">
									<div class="nano-slider"
										style="height: 510px; -webkit-transform: translate(0, 0px);"></div>
								</div>
							</dt>
							<dd class="dd-wrap nano js-dd has-scrollbar">
								<div class="nano-content" id="select_position" data-ty="" tabindex="0" style="right: -21px;">
									<div class="select-wrap" exam-ind="0" id="895" opt-ind="A"
										onclick="activityA()">
										<div class="arrowSel"></div>
										<i class="round"></i> <span><em>A</em>java Test . class</span>
									</div>
									<div class="select-wrap" exam-ind="0" id="896" opt-ind="B"
										onclick="activityB()">
										<div class="arrowSel"></div>
										<i class="round"></i> <span><em>B</em>javac Test.class</span>
									</div>
									<div class="select-wrap" exam-ind="0" id="897" opt-ind="C"
										onclick="activityC()">
										<div class="arrowSel"></div>
										<i class="round"></i> <span><em>C</em>java Test</span>
									</div>
									<div class="select-wrap" exam-ind="0" id="898" opt-ind="D"
										onclick="activityD()">
										<div class="arrowSel"></div>
										<i class="round"></i> <span><em>D</em>javac Test</span>
									</div>
								</div>
								<!-- 答案与解析放置地方 -->
								<div class="assess" id="answerAndjiexi" style="display: none;">
									<div class="content">
										<div class="curOptAnswer nano has-scrollbar">
											<div class="nano-content" tabindex="0" style="right: -17px;">
												<p class="wrongAnswer clearfix">
													<span class="icon-point img-statu"></span><em id="answerJudge"></em>
												</p>
												<div class="optAnseTip">
													<h3>解析</h3>
													<span id="answerJiexie"></span>
												</div>
												<p class="cue" id="result_Part">
													<a href="javascript:;" onclick="viewRightAnswer()">看正确答案</a>
												</p>
												<div class="resultPart" id="resultPartShow" style="display: none;">
													<div class="correct">
														<span><em>C</em>java Test</span>
													</div>
												</div>
											</div>
											<div class="nano-pane" style="display: none;">
												<div class="nano-slider"
													style="height: 469px; transform: translate(0px, 0px);"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="nano-pane" style="display: none;">
									<div class="nano-slider"
										style="height: 460px; -webkit-transform: translate(0, 0px);"></div>
								</div>
							</dd>
						</dl>

					</div>
				</div>
				<div id="showCurAnswer" data-next-mid="1412">
					<div id="nextMediaCont" class="nextMediaCont"
						style="display: none;">
						<span class="reDo js-toRedo">重做</span> <input class="sendAnsw"
							type="button" id="CPsubmit" value="下一题">
					</div>
					<div id="js-redo" class="btn_ceping" style="display: block;">
						<span id="redo_span" class="reDo js-toRedo" onclick="redoExercise()">重做</span> 
						<input id="postAnswer" type="button" class="sendAnsw disable" onclick="answerCommit()"
							value="提交"> 
							<a style="display: none;" class="sendAnsw next-item" id="next_item" href="/video/1412">下一节</a>
					</div>
				</div>
			</div>
		</div>

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
			<ul class="course-menu  clearfix js-course-menu"
				style="position: absolute; left: 0px;">
				<li class="course-menu-item"><a class=""
					href="javascript:void(0)" id="plMenu">评论</a></li>
				<li class="course-menu-item"><a href="javascript:void(0)"
					id="qaMenu" class="active">问答</a></li>
				<li class="course-menu-item"><a href="javascript:void(0)"
					id="noteMenu">笔记</a></li>
				<li class="course-menu-item"><a href="javascript:void(0)"
					id="wikiMenu">WIKI</a></li>
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
									<a href="/space/u/uid/105648" class="wenda-head"
										target="_blank" title="昵称无"> <img
										src="http://img.mukewang.com/55a3387b0001126306000327-80-80.jpg"
										alt="昵称无" width="40">
									</a> <a href="/space/u/uid/105648" target="_blank" title="昵称无"
										class="wenda-nickname">昵称无</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/95168" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">21</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/95168" target="_blank" class="wendatitle">
												为什么会是这个呢？ </a>
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
											<em>时间：2015-09-01</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/1881029" class="wenda-head"
										target="_blank" title="日光倾城雪"> <img
										src="http://img.mukewang.com/545863e80001889e02200220-80-80.jpg"
										alt="日光倾城雪" width="40">
									</a> <a href="/space/u/uid/1881029" target="_blank" title="日光倾城雪"
										class="wenda-nickname">日光倾城雪</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/75158" target="_blank"
										class="replynumber hasanswernum">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">1</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">50</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/75158" target="_blank" class="wendatitle">
												这个怎么点下一题 </a>
										</div>
									</h2>
									<div class="replycont clearfix">
										<i class="icon-msg-revert"></i>
										<div class="fl replydes">
											<span class="replysign praise">[最新回答]</span> <a
												href="/space/u/uid/1234857" target="_blank" title="Jy_z"
												class="replyuserhead"><img
												src="http://img.mukewang.com/54584ee0000179f302200220-80-80.jpg"
												alt="Jy_z" width="20"> </a> <a href="/space/u/uid/1234857"
												target="_blank" title="Jy_z" class="nickname">Jy_z: </a> <span
												class="replydet">直接下一节。 慕课的练习基本只有一题。</span>
										</div>
									</div>
									<div class="replymegfooter">
										<div class="wenda-time">
											<em>时间：2015-04-24</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/280200" class="wenda-head"
										target="_blank" title="Bury"> <img
										src="http://img.mukewang.com/53f615450001a6cf01000100-80-80.jpg"
										alt="Bury" width="40">
									</a> <a href="/space/u/uid/280200" target="_blank" title="Bury"
										class="wenda-nickname">Bury</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/62677" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">45</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/62677" target="_blank" class="wendatitle">
												很好 </a>
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
											<em>时间：2015-01-11</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/1106236" class="wenda-head"
										target="_blank" title="小菜鸟10009"> <img
										src="http://img.mukewang.com/5333a21e0001eb4102000200-80-80.jpg"
										alt="小菜鸟10009" width="40">
									</a> <a href="/space/u/uid/1106236" target="_blank"
										title="小菜鸟10009" class="wenda-nickname">小菜鸟10009</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/60126" target="_blank"
										class="replynumber hasanswernum">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">1</b>
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
											<a href="/qadetail/60126" target="_blank" class="wendatitle">
												my name is Hao Nan Feng </a>
										</div>
									</h2>
									<div class="replycont clearfix">
										<i class="icon-msg-revert"></i>
										<div class="fl replydes">
											<span class="replysign praise">[最新回答]</span> <a
												href="/space/u/uid/446611" target="_blank" title="尼采"
												class="replyuserhead"><img
												src="http://img.mukewang.com/548dadf600019a3103000300-80-80.jpg"
												alt="尼采" width="20"> </a> <a href="/space/u/uid/446611"
												target="_blank" title="尼采" class="nickname">尼采: </a> <span
												class="replydet">Hao Nan Feng？</span>
										</div>
									</div>
									<div class="replymegfooter">
										<div class="wenda-time">
											<em>时间：2014-12-14</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/1096019" class="wenda-head"
										target="_blank" title="菜鸟中的菜鸟"> <img
										src="http://img.mukewang.com/5333a2a10001064f02000200-80-80.jpg"
										alt="菜鸟中的菜鸟" width="40">
									</a> <a href="/space/u/uid/1096019" target="_blank" title="菜鸟中的菜鸟"
										class="wenda-nickname">菜鸟中的菜鸟</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/59772" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">33</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/59772" target="_blank" class="wendatitle">
												想学点什么 </a>
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
											<em>时间：2014-12-11</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/1022092" class="wenda-head"
										target="_blank" title="猫辰儿"> <img
										src="http://img.mukewang.com/546401a2000181fe00850092-80-80.jpg"
										alt="猫辰儿" width="40">
									</a> <a href="/space/u/uid/1022092" target="_blank" title="猫辰儿"
										class="wenda-nickname">猫辰儿</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/56266" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">31</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/56266" target="_blank" class="wendatitle">
												Lynn </a>
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
											<em>时间：2014-11-13</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/492682" class="wenda-head"
										target="_blank" title="hehe_0015"> <img
										src="http://img.mukewang.com/5333a0aa000121d702000200-80-80.jpg"
										alt="hehe_0015" width="40">
									</a> <a href="/space/u/uid/492682" target="_blank"
										title="hehe_0015" class="wenda-nickname">hehe_0015</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/50376" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">11</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/50376" target="_blank" class="wendatitle">
												ggx </a>
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
											<em>时间：2014-11-02</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/437472" class="wenda-head"
										target="_blank" title="断桥_0003"> <img
										src="http://img.mukewang.com/543879120001a69601000100-80-80.jpg"
										alt="断桥_0003" width="40">
									</a> <a href="/space/u/uid/437472" target="_blank" title="断桥_0003"
										class="wenda-nickname">断桥_0003</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/40392" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">60</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/40392" target="_blank" class="wendatitle">
												javac用于将源代码编译成字节码文件，Java用于执行字节码文件，在执行时不能指定字节码文件后缀 </a>
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
											<em>时间：2014-10-13</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/437782" class="wenda-head"
										target="_blank" title="feier"> <img
										src="http://img.mukewang.com/543896b30001062601000100-80-80.jpg"
										alt="feier" width="40">
									</a> <a href="/space/u/uid/437782" target="_blank" title="feier"
										class="wenda-nickname">feier</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/39044" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">33</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/39044" target="_blank" class="wendatitle">
												javac 用于将源代码程序编译成字节码文件，java 用于执行字节码文件，在执行时不能指定文件后缀 </a>
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
											<em>时间：2014-10-11</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/434293" class="wenda-head"
										target="_blank" title="Kueeis"> <img
										src="http://img.mukewang.com/5436a90e000133c101000100-80-80.jpg"
										alt="Kueeis" width="40">
									</a> <a href="/space/u/uid/434293" target="_blank" title="Kueeis"
										class="wenda-nickname">Kueeis</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/38458" target="_blank"
										class="replynumber hasanswernum">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">2</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">53</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/38458" target="_blank" class="wendatitle">
												这个貌似怎么选都错 </a>
										</div>
									</h2>
									<div class="replycont clearfix">
										<i class="icon-msg-revert"></i>
										<div class="fl replydes">
											<span class="replysign praise">[最新回答]</span> <a
												href="/space/u/uid/434293" target="_blank" title="Kueeis"
												class="replyuserhead"><img
												src="http://img.mukewang.com/5436a90e000133c101000100-80-80.jpg"
												alt="Kueeis" width="20"> </a> <a
												href="/space/u/uid/434293" target="_blank" title="Kueeis"
												class="nickname">Kueeis: </a> <span class="replydet">我是说程序的问题</span>
										</div>
									</div>
									<div class="replymegfooter">
										<div class="wenda-time">
											<em>时间：2014-10-10</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/336696" class="wenda-head"
										target="_blank" title="0风逍逍0"> <img
										src="http://img.mukewang.com/533e4c2300012ab002200220-80-80.jpg"
										alt="0风逍逍0" width="40">
									</a> <a href="/space/u/uid/336696" target="_blank" title="0风逍逍0"
										class="wenda-nickname">0风逍逍0</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/33109" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">47</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/33109" target="_blank" class="wendatitle">
												javac 用于将源代码程序编译成字节码文件，java 用于执行字节码文件，在执行时不能指定文件后缀 </a>
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
											<em>时间：2014-09-25</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/320203" class="wenda-head"
										target="_blank" title="草原上空的一朵白云"> <img
										src="http://img.mukewang.com/5416428c0001f0ab01800180-80-80.jpg"
										alt="草原上空的一朵白云" width="40">
									</a> <a href="/space/u/uid/320203" target="_blank"
										title="草原上空的一朵白云" class="wenda-nickname">草原上空的一朵白云</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/30421" target="_blank"
										class="replynumber hasanswernum">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">1</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">58</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/30421" target="_blank" class="wendatitle">
												太好了，这样边学边操作，可操作性很强，超赞的慕课网 </a>
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
											<em>时间：2014-09-17</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/312088" class="wenda-head"
										target="_blank" title="mobile"> <img
										src="http://img.mukewang.com/533e4c640001354402000200-80-80.jpg"
										alt="mobile" width="40">
									</a> <a href="/space/u/uid/312088" target="_blank" title="mobile"
										class="wenda-nickname">mobile</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/27922" target="_blank"
										class="replynumber hasanswernum">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">1</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">35</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/27922" target="_blank" class="wendatitle">
												分成这样一小节一小节的，看着清晰明白，而且随时抽出来一点儿时间就可以学习了，很方便 </a>
										</div>
									</h2>
									<div class="replycont clearfix">
										<i class="icon-msg-revert"></i>
										<div class="fl replydes">
											<span class="replysign praise">[最新回答]</span> <a
												href="/space/u/uid/255777" target="_blank" title="偌颜宁"
												class="replyuserhead"><img
												src="http://img.mukewang.com/5453449f0001c36e05520522-80-80.jpg"
												alt="偌颜宁" width="20"> </a> <a href="/space/u/uid/255777"
												target="_blank" title="偌颜宁" class="nickname">偌颜宁: </a> <span
												class="replydet">是的哦~很方便，便于学习时间上的安排</span>
										</div>
									</div>
									<div class="replymegfooter">
										<div class="wenda-time">
											<em>时间：2014-09-10</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/301269" class="wenda-head"
										target="_blank" title="被淡忘的人"> <img
										src="http://img.mukewang.com/54070fb70001696201000100-80-80.jpg"
										alt="被淡忘的人" width="40">
									</a> <a href="/space/u/uid/301269" target="_blank" title="被淡忘的人"
										class="wenda-nickname">被淡忘的人</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/25801" target="_blank"
										class="replynumber hasanswernum">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">1</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">60</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/25801" target="_blank" class="wendatitle">
												不错，刚刚入门，看得还不错 </a>
										</div>
									</h2>
									<div class="replycont clearfix">
										<i class="icon-msg-revert"></i>
										<div class="fl replydes">
											<span class="replysign praise">[最新回答]</span> <a
												href="/space/u/uid/255777" target="_blank" title="偌颜宁"
												class="replyuserhead"><img
												src="http://img.mukewang.com/5453449f0001c36e05520522-80-80.jpg"
												alt="偌颜宁" width="20"> </a> <a href="/space/u/uid/255777"
												target="_blank" title="偌颜宁" class="nickname">偌颜宁: </a> <span
												class="replydet">加油！加油！</span>
										</div>
									</div>
									<div class="replymegfooter">
										<div class="wenda-time">
											<em>时间：2014-09-03</em>
										</div>
									</div>
								</div>
							</div>
							<div class="wenda-listcon clearfix">
								<div class="headslider">
									<a href="/space/u/uid/121060" class="wenda-head"
										target="_blank" title="gudao"> <img
										src="http://img.mukewang.com/533e4d510001c2ad02000200-80-80.jpg"
										alt="gudao" width="40">
									</a> <a href="/space/u/uid/121060" target="_blank" title="gudao"
										class="wenda-nickname">gudao</a>
								</div>
								<div class="wendaslider">
									<a href="/qadetail/25236" target="_blank"
										class="replynumber noanswernum ">
										<div class="ys">
											<div class="number padAjust">
												<b class="numShow">0</b>
											</div>
											<div class="number">回答</div>
										</div>
										<div class="browsenum">
											<div class="number padAjust">
												<b class="numShow">52</b>
											</div>
											<div class="number">浏览</div>
										</div>
									</a>
									<h2 class="wendaquetitle">
										<i class="icon-ques-revert"></i>
										<div class="wendatitlecon">
											<a href="/qadetail/25236" target="_blank" class="wendatitle">
												javac 用于将源代码程序编译成字节码文件，java 用于执行字节码文件，在执行时不能指定文件后缀 </a>
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
											<em>时间：2014-09-02</em>
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
			<div class="coursedownload fl">
				<h3>资料下载</h3>
				<ul class="downlist">
					<li><span><i class="icon icon-folder"></i>环境变量配置资料</span> <a
						href="http://img.mukewang.com/down/546d53630001d4e400000000.rar"
						class="downcode" target="_blank" download="" data-id="358"
						title="环境变量配置资料">下载</a></li>
				</ul>
			</div>
			<div class="classmate fl">
				<h3>
					你的同学<span>153557人</span><a href="javascript:void(0);"
						class="js-ch-mate ch-classmate">换一批</a>
				</h3>
				<div class="users_wrap">
					<div id="js-class-mate" class="users clearfix">
						<a class="mate-avator" href="/space/u/uid/101310" target="_blank"><img
							src="http://img.mukewang.com/user/5333a207000118af02200220-80-80.jpg"
							title="浅调雨_99"></a><a class="mate-avator"
							href="/space/u/uid/101454" target="_blank"><img
							src="http://img.mukewang.com/user/545864490001b5bd02200220-80-80.jpg"
							title="慕奶姨"></a><a class="mate-avator"
							href="/space/u/uid/101827" target="_blank"><img
							src="http://img.mukewang.com/user/52de190d000190ca10240681-80-80.jpg"
							title="李伟星"></a><a class="mate-avator"
							href="/space/u/uid/103133" target="_blank"><img
							src="http://img.mukewang.com/user/54a664d60001999401000100-80-80.jpg"
							title="HaveTwoBrush"></a><a class="mate-avator"
							href="/space/u/uid/103208" target="_blank"><img
							src="http://img.mukewang.com/user/54d73cbe0001e64501000100-80-80.jpg"
							title="szhj"></a><a class="mate-avator"
							href="/space/u/uid/107501" target="_blank"><img
							src="http://img.mukewang.com/user/5341578b0001049e01000100-80-80.jpg"
							title="Baiang"></a><a class="mate-avator"
							href="/space/u/uid/108318" target="_blank"><img
							src="http://img.mukewang.com/user/53c937030001b31e13660768-80-80.jpg"
							title="天瑜CJT"></a><a class="mate-avator"
							href="/space/u/uid/108601" target="_blank"><img
							src="http://img.mukewang.com/user/5333a2d100019c1d02000200-80-80.jpg"
							title="李钦"></a><a class="mate-avator"
							href="/space/u/uid/108814" target="_blank"><img
							src="http://img.mukewang.com/user/533e4ce900010ae802000200-80-80.jpg"
							title="can"></a><a class="mate-avator"
							href="/space/u/uid/109339" target="_blank"><img
							src="http://img.mukewang.com/user/5347faec0001411001800180-80-80.jpg"
							title="pc_xiong"></a><a class="mate-avator"
							href="/space/u/uid/110827" target="_blank"><img
							src="http://img.mukewang.com/user/535144200001ddf901800180-80-80.jpg"
							title="MurphyLuo"></a><a class="mate-avator"
							href="/space/u/uid/110951" target="_blank"><img
							src="http://img.mukewang.com/user/535297220001276501000100-80-80.jpg"
							title="牧之"></a><a class="mate-avator"
							href="/space/u/uid/111734" target="_blank"><img
							src="http://img.mukewang.com/user/53592fb70001416801000099-80-80.jpg"
							title="素漪芊贳"></a><a class="mate-avator"
							href="/space/u/uid/114756" target="_blank"><img
							src="http://img.mukewang.com/user/536b0cea00017ba001800180-80-80.jpg"
							title="Albertzhang"></a><a class="mate-avator"
							href="/space/u/uid/115055" target="_blank"><img
							src="http://img.mukewang.com/user/536c67bd0001b64a01000100-80-80.jpg"
							title="phper007"></a><a class="mate-avator"
							href="/space/u/uid/115214" target="_blank"><img
							src="http://img.mukewang.com/user/5333a1e500018d2502000200-80-80.jpg"
							title="iGeek"></a><a class="mate-avator"
							href="/space/u/uid/115665" target="_blank"><img
							src="http://img.mukewang.com/user/536dbbcc0001f59601000100-80-80.jpg"
							title="半颓废λφ半成熟"></a><a class="mate-avator"
							href="/space/u/uid/116413" target="_blank"><img
							src="http://img.mukewang.com/user/53703d5000017e5301800180-80-80.jpg"
							title="dreambibi"></a><a class="mate-avator"
							href="/space/u/uid/116705" target="_blank"><img
							src="http://img.mukewang.com/user/5370bb27000197ce01000100-80-80.jpg"
							title="ζัޓއއއ ゜淡忘゛"></a><a class="mate-avator"
							href="/space/u/uid/116819" target="_blank"><img
							src="http://img.mukewang.com/user/537180fe00013caa01000100-80-80.jpg"
							title="图拉丁"></a>
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
