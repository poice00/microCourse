<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<title>活动_社区_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/activity-index.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<!-- 社区导航 -->
		<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>
		
		<div class="activity-wrap clearfix">
    <div class="activity-main">
        <div class="activity-header">
            <ul class="activity-type clearfix">
                <li class="acting selected"><a href="/social/index/">正在进行中</a></li>
                <li class="over"><a href="/social/index?overst=-1">已结束</a></li>
            </ul>
        </div>
        <div class="activity-list">
            <ul class="clearfix">
                                <li data-activity-id="120" class="btn-ui">
                    <div class="activity-item">
                        <a href="http://www.imooc.com/wenda/detail/278020" target="_blank"><img src="http://img.mukewang.com/55b7200d000121d703800160.jpg" height="161" width="381"></a>
                        <h2 class="txtflow"><a href="http://www.imooc.com/wenda/detail/278020" target="_blank">慕课网高薪捉拿程序大牛</a></h2>
                        <p><span>活动时间：</span>07月28日 <span>至</span> 12月31日<span class="hot">热度 <em class="hot-count">822</em></span></p>
                    </div>
                </li>
                                <li data-activity-id="113" class="btn-ui">
                    <div class="activity-item">
                        <a href="http://www.imooc.com/wenda/detail/269175" target="_blank"><img src="http://img.mukewang.com/5575323f000126f303800160.jpg" height="161" width="381"></a>
                        <h2 class="txtflow"><a href="http://www.imooc.com/wenda/detail/269175" target="_blank">2015中国在线教育高峰论坛</a></h2>
                        <p><span>活动时间：</span>06月08日 <span>至</span> 09月17日<span class="hot">热度 <em class="hot-count">872</em></span></p>
                    </div>
                </li>
                            </ul>
            
        </div>
    </div>
    <div class="activity-aside">
                <div class="current-user">
            <dl>
               <dd class="clearfix">
                   <div class="cell photo"><a href="/myclub/opus/" target="_blank" title="我的社区"><img src="http://img.mukewang.com/user/5333a1a90001c8d802000200-80-80.jpg" width="39" height="39"></a></div>
                   <div class="cell">
                       <a href="/myclub/opus/" title="我的社区"><strong class="nickname txtflow">monkey_92</strong></a>
                       <span class="job-info txtflow" title="学生">学生</span>
                   </div>
               </dd>
               <dt class="slogan breakword">这位童鞋很懒，什么也没有留下～～！</dt>
            </dl>
        </div>
                <div class="active-users">
            <div class="active-users-title">活跃用户</div>
            <dl class="active-users-list">
                                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2324613" target="_blank" title="访问墨竹121的社区"><img src="http://img.mukewang.com/user/545865b90001b1d102200220-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2324613" target="_blank" title="访问墨竹121的社区"><strong class="nickname txtflow">墨竹121</strong></a>
                       <span class="job-info txtflow" title="JAVA开发工程师">JAVA开发工程师</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2148760" target="_blank" title="访问stupidliar的社区"><img src="http://img.mukewang.com/user/533e4d470001a00a02000200-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2148760" target="_blank" title="访问stupidliar的社区"><strong class="nickname txtflow">stupidliar</strong></a>
                       <span class="job-info txtflow" title="学生">学生</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=1079066" target="_blank" title="访问还是那颗星的社区"><img src="http://img.mukewang.com/user/5481288c0001ab2500400040-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=1079066" target="_blank" title="访问还是那颗星的社区"><strong class="nickname txtflow">还是那颗星</strong></a>
                       <span class="job-info txtflow" title="学生">学生</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2344338" target="_blank" title="访问Sdesu的社区"><img src="http://img.mukewang.com/user/545868c20001b8c402200220-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2344338" target="_blank" title="访问Sdesu的社区"><strong class="nickname txtflow">Sdesu</strong></a>
                       <span class="job-info txtflow" title="其它">其它</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2340870" target="_blank" title="访问VicdVud的社区"><img src="http://img.mukewang.com/user/54584c910001b8d902200220-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2340870" target="_blank" title="访问VicdVud的社区"><strong class="nickname txtflow">VicdVud</strong></a>
                       <span class="job-info txtflow" title="学生">学生</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=1993954" target="_blank" title="访问qq_薛定谔的猫的社区"><img src="http://img.mukewang.com/user/556520330001630501000100-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=1993954" target="_blank" title="访问qq_薛定谔的猫的社区"><strong class="nickname txtflow">qq_薛定谔的猫</strong></a>
                       <span class="job-info txtflow" title="其它">其它</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2226199" target="_blank" title="访问Nameless13的社区"><img src="http://img.mukewang.com/user/55c1fd820001d27201600160-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2226199" target="_blank" title="访问Nameless13的社区"><strong class="nickname txtflow">Nameless13</strong></a>
                       <span class="job-info txtflow" title="Web前端工程师">Web前端工程师</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2077941" target="_blank" title="访问cjb9的社区"><img src="http://img.mukewang.com/user/5333a1e500018d2502000200-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2077941" target="_blank" title="访问cjb9的社区"><strong class="nickname txtflow">cjb9</strong></a>
                       <span class="job-info txtflow" title="JAVA开发工程师">JAVA开发工程师</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2190347" target="_blank" title="访问阿山哥的社区"><img src="http://img.mukewang.com/user/5333a1a90001c8d802000200-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2190347" target="_blank" title="访问阿山哥的社区"><strong class="nickname txtflow">阿山哥</strong></a>
                       <span class="job-info txtflow" title="学生">学生</span>
                    </div>
                </dt>
                                <dt class="clearfix">
                    <div class="cell photo"><a href="/myclub/opus?uid=2174819" target="_blank" title="访问android_MrLw的社区"><img src="http://img.mukewang.com/user/55af406b000115a801000100-40-40.jpg" height="39" width="39"></a></div>
                    <div class="cell">
                       <a href="/myclub/opus?uid=2174819" target="_blank" title="访问android_MrLw的社区"><strong class="nickname txtflow">android_MrLw</strong></a>
                       <span class="job-info txtflow" title="移动开发工程师">移动开发工程师</span>
                    </div>
                </dt>
                                            </dl>
        </div>
    </div>
</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		 
	</body>  
</html>