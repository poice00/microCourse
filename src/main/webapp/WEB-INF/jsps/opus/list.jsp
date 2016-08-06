<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<title>作品_社区_微课程</title>
		
		<jsp:include page="/WEB-INF/jsps/common/style.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/opus-index.css"/>
		
	</head>  
	<body>  
		
		<!-- 导航栏 -->
		<jsp:include page="/WEB-INF/jsps/common/header.jsp"></jsp:include>
		
		<!-- 社区导航 -->
		<jsp:include page="/WEB-INF/jsps/common/social_header.jsp"></jsp:include>
		
		<div class="opus-wrap clearfix">

    <ul class="opus-nav">
            <li class="first-cat selected"><a href="/opus/index">全部作品</a></li>
                    <li class="first-cat"><a href="/opus/index?cid=10">前端开发</a></li>
                                                                                                                                <li><a href="/opus/index?cid=19">Html/Css</a></li>
                                                            <li><a href="/opus/index?cid=18">JavaScript</a></li>
                                                            <li><a href="/opus/index?cid=16">Html5</a></li>
                                                            <li><a href="/opus/index?cid=15">jQuery</a></li>
                                                            <li><a href="/opus/index?cid=14">AugularJS</a></li>
                                                            <li><a href="/opus/index?cid=13">Node.js</a></li>
                                                            <li><a href="/opus/index?cid=12">Bootstrap</a></li>
                                                            <li><a href="/opus/index?cid=7">前端框架</a></li>
                                                            <li><a href="/opus/index?cid=17">CSS3</a></li>
                                                <li class="first-cat"><a href="/opus/index?cid=4">后端开发</a></li>
                                                                                                                                <li><a href="/opus/index?cid=9">PHP</a></li>
                                                            <li><a href="/opus/index?cid=8">JAVA</a></li>
                                                            <li><a href="/opus/index?cid=5">C/C++</a></li>
                                                <li class="first-cat"><a href="/opus/index?cid=1">移动开发</a></li>
                                                                                                                                <li><a href="/opus/index?cid=3">iOS</a></li>
                                                            <li><a href="/opus/index?cid=2">Android</a></li>
                                        
        <!--<li><a href="?">javascript</a></li>
        <li><a href="?">java</a></li>-->

    </ul>
    <div class="opus-works">
        <div class="category-header">
                        <h3>全部</h3>
                                    <a href="/myclub/opus" class="my-opus">我的作品</a>
            <a href="/opus/create" class="sns-create-opus sns-add-works">创建作品</a>
                    </div><!--category-header end-->
        <div class="category-list clearfix">
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=255259">
                                <img src="http://img.mukewang.com/53ddfd140001b01301800180-100-100.jpg" alt="">
                            </a>
                                                        <p>啷_哩个啷</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=893">Banner Slide</a></h3>
                        <p>banner幻灯片，该项目用于企业网站建设项目。</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 1</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1168023">
                                <img src="http://img.mukewang.com/545846230001832502200220-100-100.jpg" alt="">
                            </a>
                                                        <p>feibenren</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=892">百度首页简单模仿</a></h3>
                        <p>做了一个百度首页，仅仅使用了火狐和谷歌浏览器进行测试，很不完善，请大家帮我指正一下还有哪些地方可以改进，感激不尽！！！</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 4</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=2036295">
                                <img src="http://img.mukewang.com/55ec0a5600011faf01000100-100-100.jpg" alt="">
                            </a>
                                                        <p>leosstudio</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=890">PHP MVC三层框架</a></h3>
                        <p>模板解析引擎，数据模型操作封装，MVC三层架构</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=9">PHP</a>
                                                        <span>点赞 1</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=175839">
                                <img src="http://img.mukewang.com/55eef29f00013dac09600375-100-100.jpg" alt="">
                            </a>
                                                        <p>Jeffery_Cai</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=885">简约的学生管理系统</a></h3>
                        <p>本作品由Jeffery自由编写
使用技术点：PHP+MYSQL
</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=9">PHP</a>
                                                        <span>点赞 1</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=298101">
                                <img src="http://img.mukewang.com/54584c9c0001489602200220-100-100.jpg" alt="">
                            </a>
                                                        <p>wslover</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=884">基于H5和Css3的Canvas游戏-疯狂的字母</a></h3>
                        <p>主要运用html5的canvas的画图Api，结合键盘输入功能，以及运用一些简单的算法，比如小球碰撞，判断输入的与当前画布的是否相同等，随着时间和分数的增加速度也会加快。游戏完成后可上传分数到服务器。

不提供源码下载，要学习可留言。
演示地址：http://wshome.sinaapp.com/h5-web/game/drop-words/index.html</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=16">Html5</a>
                                                        <a href="/opus/index?cid=17">CSS3</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 5</span>
                            <span>收藏 2</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1877738">
                                <img src="http://img.mukewang.com/545862510001f70c02200220-100-100.jpg" alt="">
                            </a>
                                                        <p>安卓大师修炼记</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=883">影院票务系统</a></h3>
                        <p>基于JAVA ，Sqlite的项目,GUI编程</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=8">JAVA</a>
                                                        <span>点赞 0</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1127536">
                                <img src="http://img.mukewang.com/533e4d7c0001828702000200-100-100.jpg" alt="">
                            </a>
                                                        <p>未来开拓者</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=882">简易计算器</a></h3>
                        <p>新手入门，使用javascript和css外加一点html做的简易计算器，求轻喷。。</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=17">CSS3</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 1</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1024024">
                                <img src="http://img.mukewang.com/54649f750001da8701000100-100-100.jpg" alt="">
                            </a>
                                                        <p>Vern</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=881">基于原生JS移动端响应式解决方案——AUTOSTRAP</a></h3>
                        <p>就目前移动端而言，已有比较成熟都响应式框架，类似于Bootstrap、AmazeUI、Skeljs。但是对于普通开发者来说，为了满足快速开发的需求去学习和使用这些框架的时间成本是比较高的。所以，本着轻量、快速开发的原则，为大家提供了基于原生JS的移动动端解决方案，希望能在交流、使用中继续优化AutoStrap。</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 2</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=454545">
                                <img src="http://img.mukewang.com/5441e3700001d43801800180-100-100.jpg" alt="">
                            </a>
                                                        <p>叶子纷飞2803962550</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=880">自己写得php+ajax留言板</a></h3>
                        <p>php的，不会搭建起来就问我</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=9">PHP</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 3</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1913441">
                                <img src="http://img.mukewang.com/545867630001795d02200220-100-100.jpg" alt="">
                            </a>
                                                        <p>管理員</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=875">基于js的前台dataTables分页插件</a></h3>
                        <p>json分页，ajax分页</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=15">jQuery</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 0</span>
                            <span>收藏 1</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=107613">
                                <img src="http://img.mukewang.com/534190cb00014c7d01000099-100-100.jpg" alt="">
                            </a>
                                                        <p>五更寒</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=873">跟着liuyubobobo老师出来的 Canvas图像生成</a></h3>
                        <p>跟着老师改出来的js代码</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=17">CSS3</a>
                                                        <span>点赞 0</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1094242">
                                <img src="http://img.mukewang.com/5333a2a10001064f02000200-100-100.jpg" alt="">
                            </a>
                                                        <p>关于淡淡的淡淡的</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=870">onethink的在线安装数据库demo</a></h3>
                        <p>将onethink的在线安装数据库给扒下来</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=9">PHP</a>
                                                        <span>点赞 2</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1366677">
                                <img src="http://img.mukewang.com/556ac1e50001cbef02200220-100-100.jpg" alt="">
                            </a>
                                                        <p>子木李</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=857">Canvas实现简易图片放大镜</a></h3>
                        <p>学习liuyubobobo老师的canvas教程，实现的简单的放大镜功能，可移动滑杆调节放大镜放大系数，默认为2倍，最小为1，最大为6</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=16">Html5</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <span>点赞 3</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=137573">
                                <img src="http://img.mukewang.com/5380b8850001337201000100-100-100.jpg" alt="">
                            </a>
                                                        <p>黄总</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=855">FastD PHP Framework</a></h3>
                        <p>基于composer依赖管理，简单&amp;灵活的PHP开发框架。
源码地址：https://coding.net/u/janhuang/p/fastd/git
Github: https://github.com/JanHuang/fastD
官网：http://www.fast-d.cn/</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=9">PHP</a>
                                                        <span>点赞 1</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=2021080">
                                <img src="http://img.mukewang.com/545850a00001fdd002200220-100-100.jpg" alt="">
                            </a>
                                                        <p>MYXDYY</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=841">硬件计价软件</a></h3>
                        <p>基于JFrame图形化界面的硬件计价软件，采用文件序列化操作保存信息，由于第一次做，对很多细节有不完善的地方。</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=8">JAVA</a>
                                                        <span>点赞 3</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=2176700">
                                <img src="http://img.mukewang.com/55afaccc0001bf1801800180-100-100.jpg" alt="">
                            </a>
                                                        <p>PerGeorge</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=836">七夕活动《如何拿下慕女神》</a></h3>
                        <p>和源码相比，增加了logoshake的时间长度，附加了一些logo和动画的小变化。</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=15">jQuery</a>
                                                        <a href="/opus/index?cid=16">Html5</a>
                                                        <a href="/opus/index?cid=17">CSS3</a>
                                                        <span>点赞 4</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1366677">
                                <img src="http://img.mukewang.com/556ac1e50001cbef02200220-100-100.jpg" alt="">
                            </a>
                                                        <p>子木李</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=835">七夕活动《七夕祝福》</a></h3>
                        <p>根据慕课网七夕专题的讲解，参考大神的代码，制作的七夕的祝福，未实现声音播放功能</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=15">jQuery</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 7</span>
                            <span>收藏 1</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1999748">
                                <img src="http://img.mukewang.com/55673e3e00012ba701800180-100-100.jpg" alt="">
                            </a>
                                                        <p>指尖上的coding</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=833">js原生代码实现瀑布流图片浏览</a></h3>
                        <p>js原生代码实现瀑布流图片浏览。学习慕课网瀑布流的作业作品。源代码在waterfall中。</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=16">Html5</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 3</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box left">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1972269">
                                <img src="http://img.mukewang.com/555a15a20001387101000100-100-100.jpg" alt="">
                            </a>
                                                        <p>J丶_0</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=832">简单的日历控件满足一般的需求</a></h3>
                        <p>简单日历控件；
使用方法 new chooseDate(options).createLayout();
options为json对象传入id和slogan
{"id":"date","slogan":"我的日历","callback":fn}
slogan为自定义页脚,callback为回掉函数</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=15">jQuery</a>
                                                        <a href="/opus/index?cid=18">JavaScript</a>
                                                        <a href="/opus/index?cid=19">Html/Css</a>
                                                        <span>点赞 2</span>
                            <span>收藏 0</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="category-item">
                <div class="item-box ">
                    <div class="opus-info">
                        <div class="author">
                            <a href="/myclub/opus?uid=1061884">
                                <img src="http://img.mukewang.com/54584cec0001f21302200220-100-100.jpg" alt="">
                            </a>
                                                        <p>Viser</p>
                                                    </div>
                        <h3><a href="/opus/resource?opus_id=831">Flappy bird</a></h3>
                        <p>用cocos2d-x编写的flappy bird，用兴趣的可以看一下https://github.com/zhanghuanzj/MyFlappyBird</p>
                        <div class="tagbox">
                                                        <a href="/opus/index?cid=5">C/C++</a>
                                                        <span>点赞 3</span>
                            <span>收藏 1</span>
                        </div>
                    </div>
                </div>
            </div>
                    </div><!--category-list end-->
                <div class="page"><span class="disabled_page">首页</span><span class="disabled_page">上一页</span><a href="javascript:void(0)" class="active">1</a><a href="/opus/index/cid/0/page/2">2</a><a href="/opus/index/cid/0/page/3">3</a><a href="/opus/index/cid/0/page/4">4</a><a href="/opus/index/cid/0/page/5">5</a><a href="/opus/index/cid/0/page/2">下一页</a><a href="/opus/index/cid/0/page/5">尾页</a></div>
        
    </div>

</div>
		
		<div id="main">
			
			
			
		</div>
		
		<!-- 页脚 -->
		<jsp:include page="/WEB-INF/jsps/common/footer.jsp"></jsp:include>
		 
	</body>  
</html>