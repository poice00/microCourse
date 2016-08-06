<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
		<title>搜索-微课程</title> 
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/search.css" />
		<script language="javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/resources/js/search.js"></script>
		<style>
			.thumbnail{
				padding:0px;
				border:0px;
			}
		</style>
	</head>  
	<body>
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<div id="main">
			<div class="search-container">
	
			    <!--banner start-->
			    <div class="search-banner">
			        <div class="search-box clearfix" data-search="search-page">
			            <div class="suggest-input-box l">
			                <input id="content" class="suggest-input J-suggest-input" 
			                placeholder="请输入想搜索的内容..." type="text" autocomplete="off"
			                  onFocus="show()" oninput="showFuzzySearch()">
			                <span id="clear" class="btn-text-clear" onclick="clear()" title="清空" style="display: none">清空</span>
			            </div>
			            <input type="button" class="btn-search" data-search-btn="search-btn" value="搜索" onclick="search()" >
			            <ul id="result" class="suggest-list"  style="display: none">
			            </ul>
			        </div>
			    </div>
	    		<!--banner end-->
	
			    <div class="search-main clearfix">
			        <!--search result start-->
			        <div class="search-result l">
			            <ul class="type-list J-type-list clearfix">
			                <li class="type-item selected" data-type="课程">课程</li>
			              <!--   <li class="type-item" data-type="问答">问答</li>
			                <li class="type-item" data-type="文章">文章</li>
			                <li class="type-item" data-type="作品">作品</li>
			                <li class="type-item" data-type="Wiki">Wiki</li> -->
			            </ul>
			            <div class="result-list J-result-list">
	                    	<div class="result-header clearfix">
		                   		 为您找到相关课程<span id="count">0</span>个
			                    <!--<span class="popular-sort J-popular-sort">最热排序</span>
			                    <span class="latest-sort J-latest-sort">最新排序</span>-->
			                </div>
			                <ul class="search-course" id="result">
			                
	                           <!-- 	<li class="course-item border-btm">
			                        <div class="course-item-content clearfix">
			                            <div class="thumbnail">
			                                <div class="thumbnail-inner">
			                                    <a href="/learn/21" target="_blank"><img src="http://img.mukewang.com/52d11ce00001e81a06000338-280-160.jpg"></a>
			                                </div>
			                            </div>
			                            <div class="introduction">
			                                <h2 class="title autowrap"><span id="name">jQuery基础<font color='red'>课程</font></span></h2>
			                                <div class="description autowrap">课程简介：<span id="description">本<font color='red'>课程</font>分为11个章节，前四个章节重点介绍jQuery中选择器的使用方法，第五、六章节介绍jQuery如何操作DOM元素，在第七、八章中，详细介绍jQuery中的动画特效和Ajax的调用过程，从第九章</span></div>
			                                <div class="chapter autowrap">课程大纲：</div>
			                            </div>
			                        </div>
		                    	</li> -->
	                         </ul>
	                    </div>
	                    
	                    <div class="num">
							
						</div>
			        </div>
			        <!--search result end-->
			        <!--hot-search start-->
			       <!--  <dl class="hot-search r">
			            <dt>热门搜索</dt>
			            <dd>
							<a title="java" href="/index/search?words=java"> java </a> 
							<a title="mysql" href="/index/search?words=mysql"> mysql </a> 
						</dd>
			        </dl> -->
			        <!--hot-search end-->
			    </div>
					
			</div>
		<%--  <%@ include file="/WEB-INF/jsps/public/pageView.jsp"%> --%>
		</div>
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		 
	</body>  
</html>