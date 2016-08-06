define(function(require, exports, module) {
    //var dia=require('./opus-dialog');
//源代码，评论，设置通用部分
//收藏作品
var collectOpus=(function(){
    var rObj = {};
    var param = {};
    //此变量声明在opusdetail.phtml模板中
    if(aboutInfo.opusid){
        param.opus_id=aboutInfo.opusid;
    }else{
        $('a.js-signin-btn').click();
        return;
    }

    //收藏
    rObj.collect=function( callback ){
        $.ajax({
            type:'post',
            url: '/opus/ajaxcollect',
            data:param,
            dataType:'json',
            success:function(data){
                callback(data);
            },
            error:function(){
                alert('请检查网络');
            }
        });
    };
    //取消收藏
    rObj.cancelCollect=function( callback ){
        $.ajax({
            type:'post',
            url: '/opus/ajaxdelcollect',
            data:param,
            dataType:'json',
            success:function(data){
                callback(data);
            },
            error:function(){
                alert('请检查网络');
            }
        });
    }
    return rObj;

})( jQuery );


//点赞作品
var upVote=(function(){
    var rObj = {};
    var param = {};
    //此变量声明在opusdetail.phtml模板中
    param.opus_id=aboutInfo.opusid;
    //点赞作品
    rObj.upvote=function( callback ){
        $.ajax({
            type:'post',
            url: '/opus/ajaxupvote',
            data:param,
            dataType:'json',
            success:function(data){
                callback(data);
            },
            error:function(){
                alert('请检查网络');
            }
        });
    };
    //取消点赞作品
    rObj.cancelUpvote=function( callback ){
        $.ajax({
            type:'post',
            url: '/opus/ajaxdelupvote',
            data:param,
            dataType:'json',
            success:function(data){
                callback(data);
            },
            error:function(){
                alert('请检查网络');
            }
        });
    }
    return rObj;

})( jQuery );


    $(function(){
        //下载源码
        /*$('.download').on( 'click' , function(){
            alert('开始下载');
        });*/

        //收藏
        $('.sns-store-up').on( 'click' , function(){
            if(isLogin==0){
                $('a#js-signin-btn').click();
                return;
            }
            var that = $(this);
            //如果该作品是登录用户自己的作品，则收藏按钮不可以点击
            if(that.hasClass('disabled')){
                return ;
            }
            if(that.hasClass('sns-favorite')){
                //已经收藏，点击后是取消收藏
                collectOpus.cancelCollect(function(data){
                    if(data.result==0) {
                        //alert('取消成功');
                        that.removeClass('sns-favorite').addClass('sns-favorite-outline');
                        that.find('i').text('收藏');
                        var num = that.find('em').text();
                        num = parseInt(num);
                        if (num > 0) {
                            num--;
                        }
                        that.find('em').text(num);
                    }else{
                        alert(data.msg);
                    }
                });
            }else{
                //还没有收藏，点击后是收藏
                collectOpus.collect(function( data ){
                    if(data.result==0){
                        //alert('收藏成功');
                        that.removeClass('sns-favorite-outline').addClass('sns-favorite');
                        that.find('i').text('已收藏');
                        var num = that.find('em').text();
                        num = parseInt(num);
                        num++;
                        that.find('em').text(num);
                    }else{
                        alert(data.msg);
                    }
                });
            }

        });
        //点赞
        $('.opus-info .sns-point-praise').on( 'click' , function(){
            if(isLogin==0){
                $('a#js-signin-btn').click();
                return;
            }
            var that = $(this);
            if(that.hasClass('sns-thumb-up')){
                //已经点赞作品，点击后是取消点赞作品
                upVote.cancelUpvote(function(data){
                    if(data.result==0) {
                        //alert('取消点赞成功');
                        that.removeClass('sns-thumb-up').addClass('sns-thumb-up-outline');
                        that.find('i').text('点赞');
                        var num = that.find('em').text();
                        num = parseInt(num);
                        if (num > 0) {
                            num--;
                        }
                        that.find('em').text(num);
                    }else{
                        alert(data.msg);
                    }
                });
            }else{
                //还没有点赞，点击后是点赞
                upVote.upvote(function( data ){
                    if(data.result==0){
                        //alert('点赞成功');
                        that.removeClass('sns-thumb-up-outline').addClass('sns-thumb-up');
                        that.find('i').text('已赞');
                        var num = that.find('em').text();
                        num = parseInt(num);
                        num++;
                        that.find('em').text(num);
                    }else{
                        alert(data.msg);
                    }
                });
            }
        });

        //下载源代码
        $('.sns-download').on( 'click',function(){
            if(isLogin==0){
                $('a#js-signin-btn').click();
                return;
            }
            var param = {};
            //此变量声明在模板中,opusdetail.phtml
            param.download_key=aboutInfo.downloadkey;
            ///opus/sharedownload/?code=xxxxx
            $.ajax({
                type:'post',
                url: '/opus/sharedownload',
                data:param,
                dataType:'json',
                success:function(data){
                    //console.log(data);
                    if(data.result==0){
                        //window.open(data.data);
                        $('body').append('<a href="'+data.data+'" id="down"></a>');
                        //$('body').append('<a href="http://www.sina.com" id="down">haha</a>');
                        document.getElementById("down").click();
                        $('#down').remove();
                    }else{
                        //dia.open('fail',data.msg,function(){});
                        alert(data.msg);
                    }

                },
                error:function(){
                    alert('请检查网络');
                    //dia.open('fail',data.msg,function(){});
                }
            });
        });

    ////分享
    var opusname=$(".opus-sub-header a").text();   //作品名称
        //console.log(opusname);
    var html = opusname+"@慕课网_作品";    //分享文案
    var url = 'http://www.mukewang.com' + window.location.pathname + window.location.search;

        window._bd_share_config={
            "common":{
                "bdUrl": url,
                "bdSnsKey": {
                    'tsina':'2788596354'
                },
                "bdText":html,
                "bdMini":"2",
                "bdMiniList":false,
                "bdPic":"",
                "bdStyle":"0",
                "bdSize":"16"
            },
            "share":{}
        };with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
    });
});