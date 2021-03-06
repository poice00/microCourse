define(function(require){
    require("/microCourse/resources/lib/autosize/jquery.autosize.min.js");
    require("/microCourse/resources/component/base/util/modal.button.js");
    var util={
        clearInput:function(){

        },
        clearInputDefault:function(){
            var $this=$(this);
            $this.closest(".qa-reply-ibox-default").find("textarea").val("").blur();
            $(this).closest(".qa-reply-ifoot").hide();
        },
        msg:function(msg,isRight){
            var $ctx=$(this).closest(".qa-reply-ifoot"),
                m=msg?"addClass":"removeClass",
                c=isRight?"qa-tips-ok":"qa-tips-error";
            $ctx.find(".qa-tips").removeClass("qa-tips-ok qa-tips-error")[m](c).html(msg||"");
        },
        /*msgComment:function(msg,isRight){
            var $ctx=$("#js-qa-comment-input"),
                m=msg?"addClass":"removeClass",
                c=isRight?"qa-tips-ok":"qa-tips-error";
            $ctx.find(".qa-tips").removeClass("qa-tips-ok qa-tips-error")[m](c).html(msg||"");
        },*/
        msgComment:function(msg,isRight){
            var $ctx=$(this).closest(".js-msg-context"),
                m=msg?"addClass":"removeClass",
                c=isRight?"qa-tips-ok":"qa-tips-error";
            $ctx.find(".qa-tips").removeClass("qa-tips-ok qa-tips-error")[m](c).html(msg||"");
        },
        extendPostData:function(data){
            if(OP_CONFIG.page=="qadetail"){
                data.is_old=1;
            }
            else{
                data.is_old=0;
            }
        },
        isWenda:function(){
            return OP_CONFIG.module=="wenda"&&OP_CONFIG.page=="detail";
        },
        getReplyBlock:function(){
            //this.replyStr=this.replyStr||$("#reply-box").
            if(!this.replyStr){
                this.replyStr=$("#reply-box").html().replace(/(<textarea[^>]*>).*?(<\/textarea>)/,"$1$2");//ie10-11,render placeholder as text;
                $("#reply-box").remove();
            }
            return this.replyStr;
        },
        getVerifyCodeBlock:function(){
            return [
                '<div class="verify-code l">',
                    '<input type="text" maxlength="4" class="verify-code-ipt">',
                    '<img src="/wenda/getverifycode?',Math.random(),'" >',
                    '<span class="verify-code-around">看不清换一换</span>',
                '</div>'
            ].join("");
        },
        getReplyTextBlock:function(){
            return this.replyTextStr||(this.replyTextStr=[
                '<div class="qa-reply-item" data-rid="{reply_id}">',
                    '<a class="qa-reply-item-author" href="/microCourse/wenda/question/{from_uid}" title="{from_username}">',
                       '<img src="/microCourse/upload/{from_pic}/avatar.jpg">',
                    '</a>',
                    '<div class="qa-reply-item-inner">',
                        '<p>{usertype}',//<span class="qa-icon"></span>
                        '<a href="/microCourse/wenda/question/{from_uid}" class="qa-reply-nick">{from_username}</a> ',
                        '{toUsername}</p>',//回复 <a href="{#url_space_u#}/uid/{$ct.to_uid}">{$ct.to_username}</a>
                        '<p class="q-reply-item-c">{description}</p>',
                        '<div class="qa-reply-item-foot">',
                        	'<span class="reply-item-index r"></span>',
                            '<span>{create_time}</span>',
                            '<span class="qa-reply-item-reply js-reply-item-reply" data-uid="{from_uid}|{from_username}"><i class="icon-resp"></i>回复</span>',
                        '</div>',
                    '</div>',
                '</div>'
            ].join(""));
        },
        getReplyHtml:function(data){
            var txt=this.getReplyTextBlock(),
                modifer=this.modifer;
            txt=txt.replace(/\{(\w+?)\}/g,function(s,s1){
                return modifer[s1]?modifer[s1](data):data[s1]||'';
            });
            return txt;
        },
        modifer:{
            usertype:function(data){
                return data.from_usertype==2?'<span class="qa-icon"></span>':'';
            },
            toUsername:function(data){
                if(!!data.to_username){
                    return '回复 <a href="/microCourse/wenda/question/'+data.to_uid+'" class="qa-reply-nick">'+data.to_username+'：</a>';
                }
                return '';
            },
            description:function(data){ //nl2br
                return data.description.replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g,"$1<br>$2");
            }
        },
        getEditBlock:function(){

        },
        escape:function(str){
            return str.replace(/[<>]/g,function(){})
        },
        
/*========================================================加载最近点赞过的人========================================================*/
        
        showSupported:function(){
            var $this=$(this),
                offset=$this.offset(),
                dx=15,
                dy=-17,
                $con;
            //relative to right top corner
            $con=util.getSupportedContainer();
            $con.css({
                left:offset.left+dx+$this.width(),
                top:offset.top+dy
            }).fadeIn('fast');
            $con.find("supported-inner").html("正在加载...");
            util.loadSupported($this.attr("data-ids").split("-")[1]);
        },
        
/*========================================================加载点赞人的图标========================================================*/

        loadSupported:function(id){
            var _this=this;
            this.supportedXhr&&this.supportedXhr.abort();
            this.supportedXhr=$.ajax({
                url:"/microCourse/wenda/get_supply_nickname",
                data:{
                    id:id,
                    r:Math.random() //cache bust
                },
                dataType:"json",
                success:function(data){
                    var html="";
                    _this.supportedXhr=null;
                    if(data.result==0){
                        $.each(data.data,function(k,v){
                            html+='<a href="/microCourse/wenda/question/' + v.uid + '" target="_blank" title="'
                            	+ v.nickname + '"><img src="/microCourse/upload/' + v.img + '/avatar.jpg" /></a>';
                        });
                        html=html||"还没有人赞过哦~~";
                    }
                    else{
                        html=data.msg;
                    }
                    util.getSupportedContainer().find(".supported-inner").html(html);
                }
            });
        },
        getSupportedContainer:function(){
            var $con=$("#supported-nick-container");
            if(!$con.length){
                $con=$("<div id='supported-nick-container' class='supported-container js-supported-container'><h2>最近赞过的人</h2><div class='supported-inner'></div><div class='supported-arrow'><i></i></div></div>");
                $(document.body).append($con);
            }
            return $con;
        },
        hideSupported:function(){
            util.getSupportedContainer().fadeOut('fast');
        }
    }
    
/*========================================================对提供最佳答案的人表示感谢========================================================*/
    
    var setCorrectMsg=function(id){
        var m=$(".correct-layer");
        if(!m.length){
            $("body").append('<div class="correct-layer">\
                <h3>采纳答案成功！</h3>\
                <p>向帮助你的同学说点啥吧！感谢那些助人为乐的人</p>\
                <input type="text" value="非常感谢！" /><a href="javascript:void(0)" class="btn-submit">提交</a>\
                <button aria-hidden="true" hidefocus="true" data-dismiss="modal" class="btn-close" type="button"></button>\
            </div>');
            m=$(".correct-layer");
            m.on("shown",function(){
                $(".correct-layer .btn-submit").on("click",function(event) {
                    if($(this).hasClass('isloading')) return;
                    var c=$(".correct-layer input").val();
                    if(c.length==0){
                        window.location.reload();
                        return ;
                    }
                    if(c.strLen()>40){
                        $(".correct-layer input").focus().addClass('error');
                        return ;
                    }
//                    var data={
//                        description:c,
//                        reply_id:id
//                    }
                    var data = {};
                    
                    data.reply_id = id;
                    data.description = c;			//交换数据格式不一致，很蛋疼
                    data.level = 1;
                    
                    util.extendPostData(data);
                    $(this).addClass('isloading');
                    $.post('/microCourse/wenda/save_reply_comment', "data=" + JSON.stringify(data), function(data) {		//这种方法也可以，学习了
                        window.location.reload();
                    });
                })
                $(".correct-layer input").on("keyup",function(){
                    var c=$(".correct-layer input").val();
                    if(c.strLen()>40){
                        $(".correct-layer input").addClass('error');
                    }else{
                        $(".correct-layer input").removeClass('error');
                    }
                })
            }).on("hidden",function(){
                $(this).remove();
            });
        }
        m.modal("show");
    }

    //placholder fallback
    var ipt=document.createElement("input");
    if(!("placeholder" in ipt)){

        $(document).on("focusout","#main [placeholder]",function(){
            var $this=$(this);
            if(!$this.val().length){
                $this.val($this.attr("placeholder")).addClass("placeholder");
            }
        }).on("focusin","#main [placeholder]",function(){
            var $this=$(this);
            if($this.val()==$this.attr("placeholder")&&$this.hasClass("placeholder")){
                $this.val("").removeClass("placeholder")
            }
        });
    }


    var popSupportedTimer,
        hideSupportedTimer;
    //reply
    $(document).on("click",".js-unlogin",function(){
        seajs.use("login_sns",function(login){
            login.init();
        });
        
/*========================================================大拇指被点击========================================================*/
        
    }).on("click",".js-qa-comment-support",function(){
    	if (!OP_CONFIG.userInfo) {
            function popLogin() {
                require.async('login_sns',
                function(login) {
                    login.init();
                });
            };
            popLogin();
            return;
        }
    	
        var $this=$(this),ids,data;
        if($this.hasClass("qa-comment-supported")){
        	layer.msg("不能重复点赞",2,3);
        	return ;
        }
        $this.addClass("qa-comment-supported");
        data={};
        ids=$this.attr("data-ids").split("-");
        if(util.isWenda()){
            data.user_id=ids[0];
            data.reply_id=ids[1];
        }
        else{
            data.id=ids[1];
        }
        $.ajax({
            url:util.isWenda()?'/microCourse/wenda/support_reply':'/course/ajaxaddreplynum',
            data:{
            	data:JSON.stringify(data)
            },
            type:"POST",
            dataType:"json",
            success:function(data) {
                var $span;
                if (data.result=='0') {
                    $span=$this.find('span');
                    $span.text(+$span.text()+1);
                }
            }
        });
        
/*========================================================设置为最佳答案========================================================*/        
        
    }).on("click.accept",".js-qa-comment-accept",function(){
        var $this=$(this),ids,data;
        if($this.hasClass("loading")){
            return ;
        }
        ids=$this.attr("data-ids").split("-");
        data={};
        data[util.isWenda()?"ques_id":"qid"]=ids[0];
        data[util.isWenda()?"reply_id":"aid"]=ids[1];
        $.ajax({
            url:util.isWenda()?"/microCourse/wenda/adopt_reply":"/course/ajaxadoptanswer",
            data:"data=" + JSON.stringify(data),
            dataType:"json",
            type:"post",
            success:function(data){
                if(data.result==0){
                    $this.addClass("qa-comment-correct").removeClass("qa-comment-accept");
                    $(document).off("click.accept");
                    setCorrectMsg(ids[1])				//见160行
                }
            }
        })
        
/*========================================================鼠标and大拇指========================================================*/
        
    }).on("mouseenter",".js-qacom-supported-user",function(){
        //pop supported people;
        var $this=$(this),
            $con;
        clearTimeout(popSupportedTimer);
        popSupportedTimer=setTimeout($.proxy(util.showSupported,this),1000);
    }).on("mouseleave",".js-qacom-supported-user",function(){
        clearTimeout(hideSupportedTimer);
        clearTimeout(popSupportedTimer);
        hideSupportedTimer=setTimeout(util.hideSupported,300);
    }).on("mouseenter",".js-supported-container",function(){
        clearTimeout(hideSupportedTimer);
    }).on("mouseleave",".js-supported-container",function(){
        hideSupportedTimer=setTimeout(util.hideSupported,200);
        
/*========================================================问题的回复的回复行里回复按钮被点击========================================================*/
        
    }).on("click",".js-reply-item-reply",function(){
        var $this=$(this),
            $p=$this.closest(".js-qa-comment"),
            cid=$p.attr("data-cid"),
            data,offset;
        $p.find('.js-qa-reply-ibox').show().find("textarea");
        if($this.attr("data-uid")){
            us=$this.attr("data-uid").split("|");
            $p.find('.js-qa-reply-ibox').find("textarea").focus().val("回复 "+us[1]+"：");
            $p.find('.js-qa-reply-ibox').attr("data-tuid",us[0]);
            $p.find('.js-qa-reply-ibox').attr("data-cid",$this.attr("data-cid"));
        }else{
            $p.find('.js-qa-reply-ibox').find("textarea").focus().val("");
        }
        offset=$p.find('.js-qa-reply-ibox').offset();
        $("html,body").animate({scrollTop:offset.top-$(window).height()/3});
        
/*========================================================展开剩余回复========================================================*/
    }).on("click",".js-overplus-num",function(){
        var $this=$(this),data;
        data={
            reply_id:$this.attr("data-rid"),
            page:(+$this.attr("data-page")||1)+1
        }
        util.extendPostData(data);
        $.ajax({
            url:"/microCourse/wenda/get_comment",
            data:data,
            success:function(data){
                var $p=$this.parent();
                //$p.nextAll().remove();
                $p.append(data);
                $this.remove();
            }
        });
    }).on("click",".js-ipt-cancel",function(){
        var $p=$(this).closest(".js-qa-reply-ibox"),
            $pre;
        //$pre=$p.prev(".js-qa-reply-ibox").show();
        $p.hide();
        
/*========================================================提交对回答的回复and对回答的回复的回复========================================================*/
        
    }).on("click",".js-ipt-submit",function(){
         //提交回复
        var $this=$(this),
            reg,
            $pc=$this.closest(".js-qa-comment"),
            $ibox=$this.closest(".js-qa-reply-ibox"),
            $vbox,
            $ipt,
            data,
            c,
            v,
            tuid,
            maxContentLength;
        
        data={};
        if($this.hasClass("disabled")) return ;
        c=($ipt=$ibox.find(".js-reply-ipt-default")).val();
        c=$.trim(c);
        tuid=$ibox.attr("data-tuid");
        c_id = $ibox.attr("data-cid");
       // console.log($ibox.data("tuid"))
        
        data.reply_id=$pc.attr("data-cid");		//问题的回答的ID
        data.level = 1;							//1级
        reg=/^回复\s*\S+：/;
        if(tuid&&reg.test(c)){
        	data.to_user_id = tuid;
        	data.to_username = c.substring(2, c.indexOf("："));		//回复谁
            c=c.replace(reg,"");
            data.reply_id = c_id;	//问题的回答的回复的ID
            data.level = 2;			//2级
        }
        if(c.length==0||c==$ipt.attr("placeholder")){
            util.msg.call(this,"请输入回复内容");
            return ;
        }
        if(c.length<3){
            util.msg.call(this,"回复字数不小于3个");
            return ;
        }

        maxContentLength=util.isWenda()?2000:300;
        if(c.length>maxContentLength){
            util.msg.call(this,"回复字数不大于"+maxContentLength+"个");
            return ;
        }
        if(($vbox=$ibox.find(".verify-code")).length){
            v=$vbox.find("input").val();
            if(v.length==0){
                util.msg.call(this,"请输入验证码");
                return ;
            }
            if(v.length!=4){
                util.msg.call(this,"请输入正确的验证码");
                return ;
            }
            data.verify_code=v;
        }
        util.msg.call(this);//clearMsg
        $pc.find(".verify-code").find('input').val("");
        data.description=c;					//内容
        util.extendPostData(data);

        $this.addClass("disabled").text("提交...");
        $.ajax({
            url:"/microCourse/wenda/save_reply_comment",
            type:"post",
            data:{
            	data : JSON.stringify(data),
            },
            dataType:"json",
            success:function(data){
                if(data.result==0){
                    if($pc.find('.js-reminds-num').length > 0){
                        $pc.find('.js-reminds-num').text($pc.find('.js-reminds-num').text()*1+1);
                    }else{
                        if($pc.find(".qa-reply-item").length==3){
                            $pc.find(".qa-reply-c").append('<div class="overplusnum js-overplus-num" data-rid="'+$pc.attr("data-cid")+'">点击展开后面<em class="js-reminds-num">1</em>条评论</div>')
                        }else{
                            var html=util.getReplyHtml(data.data);
                            var order = $pc.find(".qa-reply-c").find(".qa-reply-item:last").find(".reply-item-index").text();
                            if(order)
                            	order = order.substring(order.indexOf("#") + 1);
                            else
                            	order = 0;
                            
                            var offset=$pc.find(".qa-reply-c").append(html).find(".qa-reply-item:last").offset();
                            
                            $pc.find(".qa-reply-c").find(".qa-reply-item:last").find(".reply-item-index").text("#" + (parseInt(order) + 1));		//显示楼层
                            
                            $("html,body").animate({scrollTop:offset.top-$(window).height()/3});
                        }
                    }
                    util.msg.call($this);
                    $ibox.hide();
                    $('.verify-code img').each(function(el) {
                        var $this = $(this);
                        $this.attr("src", $this.attr("src").replace(/\?[\d\.]*$/,'?'+Math.random()));
                    });
                }
                else if(data.result == -1 && data.data === 1) {
                    var $f=$ibox.find(".qa-reply-ifoot");
                    if($f.find(".verify-code").length) return ;
                    $f.prepend(util.getVerifyCodeBlock());
                    util.msg.call($this,'请输入验证码');
                    return ;
                }
                else{
                    util.msg.call($this,data.msg);
                }
            },
            error:function(data){
                util.msg.call($this,data);
            },
            complete:function(){
                $this.removeClass("disabled").text("提交");
            }
        });
    });


    //verify code
    $(document).on("click",".verify-code-around",function(){
        var $img=$(this).prev("img");
        $img.attr("src",$img.attr("src").replace(/\?\S*/,"?"+Math.random()));
    });

    //$(".js-qa-reply-ibox textarea").autosize({minHeight:"22"});

    $('.imgPreview img').click(function(){
        $("body").append('<div class="mask" style="display:none;"></div>\
            <div class="bigimg">\
            <i title="关闭" class="close_upLyr"></i>\
            </div>')
        var _url=$(this).attr("src");
        var _bigurl=_url;
        if(_url.indexOf("img.mukewang.com")!=-1){//判断图片是否来自本地服务器
            var arr=$(this).attr("src").split("http://img.mukewang.com/")[1].split(".");
            _bigurl=arr[0];
            _bigurl=_bigurl.substring(0,_bigurl.length-8)+"00000000."+arr[1];
            var originimg = "http://img.mukewang.com/"+_bigurl;//原始图片
        }
        else{
            var arr = $(this).attr('src');
            var originimg = arr;
        }
        var imgnew = new Image();
        imgnew.onload=function(){
            var w1=$(window).width();
            var h1=$(window).height();

            var w2=this.width;
            var h2=this.height;

            var oldw = this.width;
            var oldh = this.height;

            var t1=w1/h1;//屏幕比
            var t2=w2/h2;//图片比

            if(t1>t2){
                if(h2>h1){
                    h2 = parseInt(h1-100);
                    w2 = parseInt(h2*t2);
                }

            }else{
                if(w2>w1){
                    w2 = parseInt(w1-100);
                    h2 = parseInt(w2/t2);
                }

            }
            $('.bigimg').css({'height':h2,'width':w2,'marginLeft':-w2/2,'marginTop':-h2/2});
            setTimeout(function(){
                $('.bigimg').append('<img src="'+originimg+'" class="ylpic" data-size="'+oldw+'|'+oldh+'" style="width:'+w2+'px;height:'+h2+'px"/>')
            },300)
       }

        imgnew.src=originimg;
        /*var html ='<i title="关闭" class="close_upLyr"></i>';*/
        $('.mask').show();
        $('.bigimg').show();
    })

    $('body').on('click','.close_upLyr,.mask',function(){
        $('.mask').remove()
        $('.bigimg').remove();
    })




    $(window).resize(function(){
            if($('.ylpic').length==0) return;
            var w1=$(window).width();
            var h1=$(window).height();

            var size=$('.ylpic').attr("data-size").split("|")
            var w2= size[0];
            var h2= size[1];
            var t1=w1/h1;//屏幕比
            var t2=w2/h2;//图片比

            if(t1>t2){
                if(h2>h1){
                    h2 = parseInt(h1-100);
                    w2 = parseInt(h2*t2);
                }

            }else{
                if(w2>w1){
                    w2 = parseInt(w1-100);
                    h2 = parseInt(w2/t2);
                }

            }

           $('.bigimg').css({'height':h2,'width':w2,'marginLeft':-w2/2,'marginTop':-h2/2});
            $('.ylpic').css({'height':h2,'width':w2});

    })

    return util;

//回复模块
    //$(".js-qa-comment").on("click","js-overplus-num"function(){
        //展开标签
    //}).on("click","js-r-submit",function(){
    //    //
   // })


//
// $(".js-qa-comment").on("click","js-qa-comment-support"function(){
        //展开标签
   // })



});
