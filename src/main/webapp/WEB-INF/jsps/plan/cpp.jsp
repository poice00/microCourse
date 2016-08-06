<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>${plan.name}_学习计划_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/plan-detail-less.css" />
		
		<script type="text/javascript">
		    var OP_CONFIG = OP_CONFIG || {};
		
		    OP_CONFIG.isLogin = 1;
		
		    var chartData = [];

            chartData = [{"week":"\u5468\u4e94","medias":0},{"week":"\u5468\u516d","medias":0},{"week":"\u5468\u65e5","medias":0},{"week":"\u5468\u4e00","medias":0},{"week":"\u5468\u4e8c","medias":0},{"week":"\u5468\u4e09","medias":0},{"week":"\u5468\u56db","medias":2}];
    	</script>
		
	</head>
	<body  id="List_courseId">
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		<div id="main">


    <div class="g-layer g-layer-left clearfix plan-joined">
    <div class="g-crumb">
                     
            <a href="/course/program">学习计划</a>
        
     <!--
        <a href="/space/program/uid/">的学习计划</a>
         -->
        <span class="split">\</span>
        <span class="cur">C++远征攻略</span>
    </div>
    <div class="layer-aside">
        <div class="plan-logo">
            <img src="http://img.mukewang.com/55cc72150001f41002400180-240-180.jpg" alt="C++远征攻略">
        </div>
        <div class="plan-actions mb14">
        
            <a href="javascript:void()" class="join-plan-btn joined js-plan-action" style="display:block" data-pid="42" data-cmd="cancel">
                <span class="t">已参加该计划</span>
                <span class="b">
                    退出该计划
                </span>
            </a>
            <a href="javascript:void()" class="join-plan-btn js-plan-action" style="display:none" data-pid="42" data-cmd="join">
                <span class="t">参加该计划</span>
                <span class="b">
                    <i class="icon-tick-revert"></i>成功加入该计划
                </span>
            </a>
        </div>
        <div class="mb30">
            <h3 class="g-tit mb14">计划介绍</h3>
            <p class="txt autowrap" id="js-plan-desc" data-max-height="192">
                <span class="desc-long">
                    C++是在C语言的基础上开发的一种通用编程语言，应用广泛。C++支持多种编程范式 －－面向对象编程、泛型编程和过程化编程。C++语言灵活，运算符的数据结构丰富、具有结构化控制语句、程序执行效率高，而且同时具有高级语言与汇编语言的优点，与其它语言相比 ，可以直接访问物理地址，与汇编语言相比又具有良好的可读性和可移植性。
                </span>
                <a href="javascript:void();" class="txt-more">更多</a>
            </p>
        </div>
                <h3 class="g-tit">7日学霸榜</h3>
        <div class="week-rank">
            <div class="hd">
                <span>
                                        你排名<b>200</b>位，比第一位少<b>145</b>节                </span>
            </div>
            <ul class="week-rank-list">
                                                <li class="rank1">
                    <a href="/space/u/uid/2327829" target="_blank">
                        <img src="http://img.mukewang.com/55ed8de60001824d04230395-100-100.jpg" alt="H00HK">
                        <span class="name">H00HK</span>
                        <span class="total">学完<b>146</b>节课程</span>
                        <em class="rank-num">1</em>
                    </a>
                </li>
                                <li class="rank2">
                    <a href="/space/u/uid/2363645" target="_blank">
                        <img src="http://img.mukewang.com/55fa7fd90001b04101000100-100-100.jpg" alt="你是我唯一想要的了解">
                        <span class="name">你是我唯一想要的了解</span>
                        <span class="total">学完<b>119</b>节课程</span>
                        <em class="rank-num">2</em>
                    </a>
                </li>
                                <li class="rank3">
                    <a href="/space/u/uid/2388789" target="_blank">
                        <img src="http://img.mukewang.com/545863080001255902200220-100-100.jpg" alt="Mr_ZJ">
                        <span class="name">Mr_ZJ</span>
                        <span class="total">学完<b>118</b>节课程</span>
                        <em class="rank-num">3</em>
                    </a>
                </li>
                                <li class="rank4">
                    <a href="/space/u/uid/2368662" target="_blank">
                        <img src="http://img.mukewang.com/533e4d3d0001ed7802000200-100-100.jpg" alt="伟哥6不6">
                        <span class="name">伟哥6不6</span>
                        <span class="total">学完<b>109</b>节课程</span>
                        <em class="rank-num">4</em>
                    </a>
                </li>
                                <li class="rank5">
                    <a href="/space/u/uid/1362308" target="_blank">
                        <img src="http://img.mukewang.com/55142d0900018f8001000100-100-100.jpg" alt="AlmostLover">
                        <span class="name">AlmostLover</span>
                        <span class="total">学完<b>90</b>节课程</span>
                        <em class="rank-num">5</em>
                    </a>
                </li>
                                <li class="rank6">
                    <a href="/space/u/uid/2371074" target="_blank">
                        <img src="http://img.mukewang.com/55fd4b1a000166ed01000100-100-100.jpg" alt="_在路上_">
                        <span class="name">_在路上_</span>
                        <span class="total">学完<b>85</b>节课程</span>
                        <em class="rank-num">6</em>
                    </a>
                </li>
                                <li class="rank7">
                    <a href="/space/u/uid/2386483" target="_blank">
                        <img src="http://img.mukewang.com/560299d70001b02101800180-100-100.jpg" alt="weibo_我未老_你依然__0">
                        <span class="name">weibo_我未老_你依然__0</span>
                        <span class="total">学完<b>80</b>节课程</span>
                        <em class="rank-num">7</em>
                    </a>
                </li>
                                <li class="rank8">
                    <a href="/space/u/uid/2257370" target="_blank">
                        <img src="http://img.mukewang.com/545845e900013e3e02200220-100-100.jpg" alt="friendnj">
                        <span class="name">friendnj</span>
                        <span class="total">学完<b>78</b>节课程</span>
                        <em class="rank-num">8</em>
                    </a>
                </li>
                                <li class="rank9">
                    <a href="/space/u/uid/280038" target="_blank">
                        <img src="http://img.mukewang.com/560161c90001502e01800180-100-100.jpg" alt="弘玄网络">
                        <span class="name">弘玄网络</span>
                        <span class="total">学完<b>75</b>节课程</span>
                        <em class="rank-num">9</em>
                    </a>
                </li>
                                <li class="rank10">
                    <a href="/space/u/uid/1339484" target="_blank">
                        <img src="http://img.mukewang.com/54584d1300016b9b02200220-100-100.jpg" alt="IT_背兜">
                        <span class="name">IT_背兜</span>
                        <span class="total">学完<b>67</b>节课程</span>
                        <em class="rank-num">10</em>
                    </a>
                </li>
                                                <!-- <li class="second">
                    <a href="#">
                        <img src="" alt="">
                        <span class="name">王德巴</span>
                        <span class="total">学完<b>19</b>节课程</span>
                        <em class="rank-num">2</em>
                    </a>
                </li> -->
            </ul>
        </div>
            </div>
    <div class="layer-container">
        <div class="plan-main">
            <div class="plan-top">
                <h2>C++远征攻略</h2>
                <div class="plan-meta">
                    <div class="r">
                        <a href="javascript:void(0)" class="program-tools-note  plan-clock js-note l open" title="设置提醒" data-pid="42">
                            <i class="clock-icon l"></i>更新通知：
                            <strong class="clock-state">已开启</strong>
                            <span class="note-tip"></span>
                        </a>
                        <i class="split l">|</i>
                                        <div class="small-share r">
                        <ul class="share-wrap">
                            <li>
                                <span class="share-txt">分享</span>
                            </li>
                        <li class="weichat-posi">
                          <div class="bdsharebuttonbox weichat-style bdshare-button-style2-16" data-bd-bind="1443512327103">
                            <a href="#" class="bds_weixin icon-nav icon-share-weichat" data-cmd="weixin" title="分享到微信"></a>
                            <a href="#" class="bds_qzone icon-nav icon-share-qq" data-cmd="qzone" title="分享到QQ空间"></a>
                            <a href="#" class="bds_tsina icon-nav icon-share-weibo" data-cmd="tsina" title="分享到新浪微博"></a>
                          </div>
                        </li>
                      </ul>
                    </div>
                    </div>
                    <span class="meta meta-tags">
                        <span class="g-tag">C++基础</span>
                        <span class="g-tag">面向对象</span>
                                            </span>
                    <span class="meta meta-course">11门课程</span>
                    <span class="meta meta-member">584人在学</span>
                </div>
            </div>
                            
                <!-- <div class="plan-step-wrap">
    <ul class="plan-step salary-raise-step clearfix">
        <li class="step-item clearfix step-over step-first">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4>夯石基础之HTML、CSS（鼠标点击和展开后）</h4>
                <p>我们从最基本的概念开始了解，步步深入，带领你来学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，在后半部分你会接触到CSS样式代码添加，为后面的案例课程打下基础。</p>
            </div>
            <div class="step-medias-wrap">
                <div class="step-medias course-list">
                    <ul class="clearfix">
                        <li class="course-media">
                            <a href="/view/159">
                            <div class="course-list-img">
                                <img width="280" height="160" alt="PS大神通关教程" src="http://img.mukewang.com/53d8684b00011cf907000210-300-170.jpg">
                            </div>
                            <h5>
                                <span><i class="learned">已学</i>PS大神通关教程</span>
                            </h5>
                            <div class="tips">
                                <p class="text-ellipsis">一路的升级打怪，让你实现ps菜鸟到大神的炫酷逆袭。</p>
                                <span class="l update-latest">更新至5-17</span>
                                <span class="l ml20">71190人学习</span>
                            </div>
                            <span class="time-label">2小时30分</span>
                            <b class="follow-label">跟我学</b>
                            </a>
                        </li>
                        <li class="course-media">
                            <a href="/view/159">
                            <div class="course-list-img">
                                <img width="280" height="160" alt="PS大神通关教程" src="http://img.mukewang.com/53d8684b00011cf907000210-300-170.jpg">
                            </div>
                            <h5>
                                <span><i class="learned">已学</i>PS大神通关教程</span>
                            </h5>
                            <div class="tips">
                                <p class="text-ellipsis">一路的升级打怪，让你实现ps菜鸟到大神的炫酷逆袭。</p>
                                <span class="l update-latest">更新至5-17</span>
                                <span class="l ml20">71190人学习</span>
                            </div>
                            <span class="time-label">2小时30分</span>
                            <b class="follow-label">跟我学</b>
                            </a>
                        </li>
                        <li class="course-media">
                            <a href="/view/159">
                            <div class="course-list-img">
                                <img width="280" height="160" alt="PS大神通关教程" src="http://img.mukewang.com/53d8684b00011cf907000210-300-170.jpg">
                            </div>
                            <h5>
                                <span><i class="learned">已学</i>PS大神通关教程</span>
                            </h5>
                            <div class="tips">
                                <p class="text-ellipsis">一路的升级打怪，让你实现ps菜鸟到大神的炫酷逆袭。</p>
                                <span class="l update-latest">更新至5-17</span>
                                <span class="l ml20">71190人学习</span>
                            </div>
                            <span class="time-label">2小时30分</span>
                            <b class="follow-label">跟我学</b>
                            </a>
                        </li>
                        <li class="course-media">
                            <a href="/view/159">
                            <div class="course-list-img">
                                <img width="280" height="160" alt="PS大神通关教程" src="http://img.mukewang.com/53d8684b00011cf907000210-300-170.jpg">
                            </div>
                            <h5>
                                <span><i class="learned">已学</i>PS大神通关教程</span>
                            </h5>
                            <div class="tips">
                                <p class="text-ellipsis">一路的升级打怪，让你实现ps菜鸟到大神的炫酷逆袭。</p>
                                <span class="l update-latest">更新至5-17</span>
                                <span class="l ml20">71190人学习</span>
                            </div>
                            <span class="time-label">2小时30分</span>
                            <b class="follow-label">跟我学</b>
                            </a>
                        </li>
                        <li class="course-media">
                            <a href="/view/159">
                            <div class="course-list-img">
                                <img width="280" height="160" alt="PS大神通关教程" src="http://img.mukewang.com/53d8684b00011cf907000210-300-170.jpg">
                            </div>
                            <h5>
                                <span><i class="learned">已学</i>PS大神通关教程</span>
                            </h5>
                            <div class="tips">
                                <p class="text-ellipsis">一路的升级打怪，让你实现ps菜鸟到大神的炫酷逆袭。</p>
                                <span class="l update-latest">更新至5-17</span>
                                <span class="l ml20">71190人学习</span>
                            </div>
                            <span class="time-label">2小时30分</span>
                            <b class="follow-label">跟我学</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            
        </li>
        <li class="step-item clearfix step-cur">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4>夯石基础之HTML、CSS（鼠标点击和展开后）</h4>
                <p>我们从最基本的概念开始了解，步步深入，带领你来学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，在后半部分你会接触到CSS样式代码添加，为后面的案例课程打下基础。</p>
            </div>
        </li>
        <li class="step-item clearfix step-last">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4>夯石基础之HTML、CSS（鼠标点击和展开后）</h4>
                <p>我们从最基本的概念开始了解，步步深入，带领你来学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，在后半部分你会接触到CSS样式代码添加，为后面的案例课程打下基础。</p>
            </div>
        </li>
    </ul>
</div> -->
<div class="plan-step-wrap js-raise-panel" id="js-raise-panel">
        <ul class="plan-step salary-raise-step clearfix">
            <li class="step-item clearfix
                                         step-first
                        ">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4>远征前准备</h4>
                <p class="autowrap">学习C++需要有C语言的基础（有基础的童鞋可以跳过此步）</p>
            </div>
            <div class="step-medias-wrap" style="display: none;">
                <div class="step-medias course-list">
                    <ul class="clearfix">
                                            
                            
                    
                                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1136" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C语言入门" src="http://img.mukewang.com/54a38eb4000120ad06000338-240-135.jpg">
                        </div>
            <h5>
                <span>C语言入门</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">进入编程世界的必修课-C语言</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                110764
                                人学习</span>
            </div>
            <span class="time-label">
                                    4小时50分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1135" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="Linux C语言编程基本原理与实践" src="http://img.mukewang.com/54db0bfc0001946006000338-240-135.jpg">
                        </div>
            <h5>
                <span>Linux C语言编程基本原理与实践</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">C—最强编程语言的编程本质。</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                39272
                                人学习</span>
            </div>
            <span class="time-label">
                                    2小时 | 中级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1134" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="Linux C语言指针与内存" src="http://img.mukewang.com/55544c1a000151b906000338-240-135.jpg">
                        </div>
            <h5>
                <span>Linux C语言指针与内存</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">指针-C语言的核心</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                14856
                                人学习</span>
            </div>
            <span class="time-label">
                                    2小时5分钟 | 中级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1133" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="Linux C语言结构体" src="http://img.mukewang.com/5567d48300010ba306000338-240-135.jpg">
                        </div>
            <h5>
                <span>Linux C语言结构体</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">C语言的深入，结构体的学习看过来</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                15507
                                人学习</span>
            </div>
            <span class="time-label">
                                    1小时30分钟 | 中级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                            </ul>
                </div>
            </div>
        </li>
            <li class="step-item clearfix
                                                ">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4>远征起航</h4>
                <p class="autowrap">初始C++，了解C++与C的不同以及C++的基本语法</p>
            </div>
            <div class="step-medias-wrap" style="display: none;">
                <div class="step-medias course-list">
                    <ul class="clearfix">
                                            
                            
                    
                                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1145" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之起航篇" src="http://img.mukewang.com/550b86560001009406000338-240-135.jpg">
                        </div>
            <h5>
                <span>C++远征之起航篇</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">C++亮点尽在其中</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                41140
                                人学习</span>
            </div>
            <span class="time-label">
                                    1小时5分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1144" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之离港篇" src="http://img.mukewang.com/553ee6a7000166a806000338-240-135.jpg">
                        </div>
            <h5>
                <span>C++远征之离港篇</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">C++扫清通往面向对象的最后一道障碍</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                19369
                                人学习</span>
            </div>
            <span class="time-label">
                                    1小时27分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                            </ul>
                </div>
            </div>
        </li>
            <li class="step-item clearfix
                                                ">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4>远征面向对象</h4>
                <p class="autowrap">这里讲述了C++中的面向对象，封装、继承、多态</p>
            </div>
            <div class="step-medias-wrap" style="display: none;">
                <div class="step-medias course-list">
                    <ul class="clearfix">
                                            
                            
                    
                                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1143" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之封装篇（上）" src="http://img.mukewang.com/553ef667000115b406000338-240-135.jpg">
                        </div>
            <h5>
                <span>C++远征之封装篇（上）</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">封装--面向对象的基石。</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                17566
                                人学习</span>
            </div>
            <span class="time-label">
                                    2小时19分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1141" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之封装篇（下）" src="http://img.mukewang.com/55658e8f00013bef06000338-240-135.jpg">
                        </div>
            <h5>
                <span>C++远征之封装篇（下）</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">封装--面向对象三大特征之一</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                9443
                                人学习</span>
            </div>
            <span class="time-label">
                                    3小时12分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1140" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之继承篇" src="http://img.mukewang.com/557fb3ac0001e42206000338-240-135.jpg">
                        </div>
            <h5>
                <span>C++远征之继承篇</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">继承，面向对象三大特征之一</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                10136
                                人学习</span>
            </div>
            <span class="time-label">
                                    2小时36分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1138" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之多态篇" src="http://img.mukewang.com/55c80a5c0001ef6006000338-240-135.jpg">
                        </div>
            <h5>
                <span>C++远征之多态篇</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">多态，C++的精华所在。</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                7146
                                人学习</span>
            </div>
            <span class="time-label">
                                    2小时55分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                            </ul>
                </div>
            </div>
        </li>
            <li class="step-item clearfix
                         step-cur 
                                 step-last
                         step-last-learned
                ">
            <i class="line"></i>
            <i class="dot"></i>
            <div class="step-content">
                <h4 class="open">远征模板</h4>
                <p class="autowrap">C++中的友元、模板尽在其中</p>
            </div>
            <div class="step-medias-wrap" style="display: block;">
                <div class="step-medias course-list">
                    <ul class="clearfix">
                                            
                            
                    
                                                        <li class="course-one">
                                            <a href="/microCourse/course/view/1137" target="_blank">
                  
                        <div class="course-list-img">
                <img width="240" height="135" alt="C++远征之模板篇" src="http://img.mukewang.com/55cc716c0001756806000338-240-135.jpg">
                            <div class="media-progress">
                    <div class="progress-val text-ellipsis"><span>0%</span></div>
                    <div class="mask"></div>
                    <div class="progress-bar">
                        <div class="bar" style="width: 0%"></div>
                    </div>
                </div>
                        </div>
            <h5>
                <span><i class="learned">已学</i>C++远征之模板篇</span>
            </h5>
            <div class="tips">
                <p class="text-ellipsis">模板，站在巨人的肩膀上。</p>
                                    <span class="l ">更新完毕</span>
                                                
                <span class="l ml20">
                                4545
                                人学习</span>
            </div>
            <span class="time-label">
                                    3小时20分钟 | 初级
                            </span>
            <b class="follow-label">跟我学</b>
            </a>
        </li>
                                            </ul>
                </div>
            </div>
        </li>
        </ul>
    </div>
            
            <!-- 学习报告 -->
            
                        <div class="study-reports">
                <h2 class="g-tit mb14">我的学习报告</h2>
                <div class="reports-static clearfix">
                    <div class="reports-user l">
                        <a href="/space/index">
                            <img src="http://img.mukewang.com/user/5333a1a90001c8d802000200-80-80.jpg" alt="monkey_92" onload="">
                            <span class="name">monkey_92</span>
                            <span class="join-time" data-time="1442028002" id="js-join-time"><b>17天前</b>加入该计划</span>
                        </a>
                    </div>
                    <div class="reports-metas">
                        <span class="meta-progress">
                            <b class="num">0<i>%</i></b>
                            <em class="name">计划完成进度</em>
                        </span>
                        <span class="meta-progress">
                            <b class="num">2<i>分钟</i></b>
                            <em class="name">学习耗时</em>
                        </span>
                        <span class="meta-progress">
                            <b class="num">1<i>/287节</i></b>
                            <em class="name">完成课节</em>
                        </span>
                        <span class="meta-progress">
                            <b class="num">200<i>位</i></b>
                            <em class="name">7日学霸排行榜</em>
                        </span>
                    </div>
                </div>
                <div class="reports-chart-container">
                    <div class="hd">
                        <span><b>七日学习情况</b></span>
                        <em>单位：节</em>
                    </div>
                    <div class="bd">
                        <div id="report-chart" style="height: 300px; margin: -20px 0px 0px -50px; -webkit-tap-highlight-color: transparent; -webkit-user-select: none; background-color: rgba(0, 0, 0, 0);" _echarts_instance_="1443512327218"><div style="position: relative; overflow: hidden; width: 930px; height: 300px;"><div data-zr-dom-id="bg" style="position: absolute; left: 0px; top: 0px; width: 930px; height: 300px; -webkit-user-select: none;"></div><canvas width="930" height="300" data-zr-dom-id="0" style="position: absolute; left: 0px; top: 0px; width: 930px; height: 300px; -webkit-user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><canvas width="930" height="300" data-zr-dom-id="1" style="position: absolute; left: 0px; top: 0px; width: 930px; height: 300px; -webkit-user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas><canvas width="930" height="300" data-zr-dom-id="_zrender_hover_" style="position: absolute; left: 0px; top: 0px; width: 930px; height: 300px; -webkit-user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></canvas></div></div>
                    </div>
                </div>
            </div>
                        <!-- 学习报告 E-->
        </div>
    </div>
</div>
<div class="anchor-pop">
    <div class="t"></div>
    <div class="m">
        <div class="anchor-pop-main"></div>
    </div>
    <div class="b"></div>
</div>
<script type="text/javascript">

var surl=url = 'http://www.mukewang.com' + window.location.pathname;
window._bd_share_config={
    "common":{
        "bdUrl": surl,
        "bdSnsKey": {
          'tsina':'2788596354'
        },
        "bdText":"我正在参加@慕课网 的一个学习计划【C++远征攻略】，很不错哦！快来一起学习吧！",
        "bdMini":"2",
        "bdMiniList":false,
        "bdPic":"",
        "bdStyle":"2",
        "bdSize":"16"
    },
    "share":{}
};
with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];

</script>


</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		
	</body>
</html>
    