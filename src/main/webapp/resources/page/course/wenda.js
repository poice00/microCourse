define(function(require, exports, module) {
    require('common');
    require('Module-layer');
    require('/microCourse/resources/lib/layer/1.6.0/skin/layer.css');
    require('placeholder');
    var cutil = require('course_common');
    require('course_collection');
    require('autocomplete');
    var store = require('store');
    if (!OP_CONFIG.userInfo) {
        $(".js-unlogin").click(function() {
            require.async('login_sns', function(login) {
                login.init();
            });
        });
        return;
    } else {
        var maybecontent = store.get("maybewenda_content");
        UE.getEditor("pub-editor", {
            initialFrameHeight: 80,
            initialFrameWidth: '100%',
            autoFloatEnabled: false,
            autoClearinitialContent: true,
            initialStyle: 'p{line-height:1.5em;font-size:13px;color:#444}'
        });
        UE.getEditor("pub-editor").addListener("ready", function() {
            if (maybecontent) {
                UE.getEditor("pub-editor").setContent(maybecontent);
                $("#ques-title").focus();
            }
            store.remove('maybewenda_content');
        });
    }

    UE.getEditor("pub-editor").addListener("focus", function() {
        $("#editor-wrap").next(".errortip").hide();
        gerror.hide();

    });
    //verify code
    $(document).on("click", ".verify-code-around", function() {
        var $img = $(this).prev("img");
        $img.attr("src", $img.attr("src").replace(/\?\.*/, "?" + Math.random()));
    });

    //验证标题是否为空
    var $title = $("#ques-title");
    $('#issuequestitle').on({
        focusin: function() {
            $('#ques-title').removeClass('defaultbox');
            $('#ques-title').addClass('ipt-fake-focus');
        },
        focusout: function() {
            $('#ques-title').removeClass('ipt-fake-focus');
            $('#ques-title').addClass('defaultbox');
        },
        keyup: function() {
            var val = $.trim($('#ques-title').val());
            $('#ques-title').addClass('ipt-fake-focus');

        }
    })

    if ($title[0].placeholder === undefined) {
        $title.focus(function() {
                $(this).removeClass('defaultbox');
                $(this).addClass('ipt-fake-focus');
                var $this = $(this);
                if ($this.val() === $this.attr("placeholder")) {
                    $this.val("").removeClass("placeholder");
                }
            })
            .blur(function() {
                $(this).addClass('defaultbox');
                $(this).removeClass('ipt-fake-focus');
                var $this = $(this);
                if (!$this.val().length) {
                    $this.val($this.attr("placeholder")).addClass("placeholder");
                }
            })
    }
    var gerror = (function() {
        var $p = $(".js-global-error");
        return {
            hide: function() {
                $p.hide();
            },
            show: function(t) {
                $p.text(t).show();
            }
        }
    })();
    $title.blur(checkTitle).focus(function() {
        $(this).removeClass("error").next("p").hide();
        gerror.hide();
    });

    function checkTitle() {
            var $this = $(this),
                val;
            if ((val = $.trim($this.val())).length < 5) {
                $this.addClass("error").next("p").text("标题不能少于5个字符！").show();
                return false;
            } else if (val.length > 255) {
                $this.addClass("error").next("p").text("标题不能大于255个字符！").show();
                return false;
            } else {
                $this.removeClass("error").next("p").hide();
            }
        }
        //验证结束
    $("#js-pub-btn").click(function() {
        var $v, c, content, data = {},
            $this = $(this),
            pureTxt;
        if ($this.hasClass("submit-loading")) return;
        content = UE.getEditor("pub-editor").getContent();
        content = $.trim(content);
        pureTxt = UE.getEditor("pub-editor").getContentTxt();
        pureTxt = $.trim(pureTxt);
        if (checkTitle.call($title) === false) {
            return;
        }
        if (pureTxt == "请输入问答内容...") {
            $("#editor-wrap").next(".errortip").text("请输入问答内容").show();
            return;
        }
        if (pureTxt.length < 5) {
            $("#editor-wrap").next(".errortip").text("内容不能少于5个字！").show();
            return;
        }
        if (content.length > 20000) {
            $("#editor-wrap").next(".errortip").text("内容长度不能超过20000个字符！建议您分多次发布！").show();
            return;
        }

        $v = $("#pub-btm .js-verify-box");

        if($v.is(':visible')){
        	c = $v.find(".ipt").val();

        	if (c.length == 0) {
        	    alert("请输入验证码");
        	    return;
        	}
        	if (c.length != 4) {
        	    alert("请输入正确的验证码");
        	    return;
        	}
        	data.verify = c;
        }else{
        	return $v.show().trigger('reset');
        }
        

        data.content = content;
        data.cid = $this.attr("data-cid");
        data.title = $title.val();
        $this.addClass("submit-loading").val("正在发布...");
        $.ajax({
            url: "/course/ajaxsaveques",
            type: "post",
            dataType: "json",
            data: data,
            success: function(data) {
            	var verifyBox = $("#pub-btm").find('.js-verify-box');

                if (data.result == 0) {
                    UE.getEditor("pub-editor").setContent("");
                    var nickname = ""; // decodeURI(store.get('nickname'));
                    var uid = 123; //store.get('uid');
                    var item = data.data.list[0];
                    var $quescon;
                    var html = '<div class="wenda-listcon clearfix" data-qid="' + item.id + '">';
                    html += '<div class="headslider fl">' + '<a href="/space/index" class="wenda-head" target="_blank" title="' + item.nickname + '"><img src="' + item.head + '" width="40" height="40"/></a>' + '</div>' + '<div class="wendaslider fl">' + '<a href="/qadetail/' + item.id + '" target="_blank" class="replynumber noanswernum">' + '<div class="ys">' + '<div class="number padAjust">' + '<b class="numShow">0</b>' + '</div>' + '<div class="number">回答</div>' + '</div>' + '<div class="browsenum">' + '<div class="number padAjust">'

                    + '<b class="numShow">0</b>' + '</div>' + '<div class="number">浏览</div>' + '</div>' + '</a>' + '<h2 class="wendaquetitle">' + '<i class="nofinish"></i><div class="wendatitlecon">' + '<a href="/qadetail/' + item.id + '" target="_blank" class="wendatitle">' + item.title + '</a>' + '</div>' + '</h2>' + '<div class="replycont clearfix">' + '<i class="replyicon fl"></i>' + '<div class="fl replydes">' + '<span class="replydet">嗯～～，这个提问大家都在考虑......</span>' + '</div>' + '</div>' + '<div class="replymegfooter">' + '<div class="wenda-time">' + '<em>时间：' + item.create_time + '</em>' + '</div>' + '</div>' + '</div>' + '</div>';

                    var post = {
                            id: item.id,
                            title: item.title,
                            nickname: item.nickname,
                            upic: item.head,
                            time: item.create_time
                        },
                        postTpl = $('#tpl_qa').html(),
                        postHtml = '';

                    postHtml = cutil.tpl(postTpl, post);

                    layer.msg('发布成功!', 2, -1);
                    $("#ques-title").focus();
                    $("#ques-title").val("");

                    $quescon = $('.answertabcon .course_quescon');
                    if (!$quescon.length) {
                        $('.answertabcon').html('<div class="course_quescon" ></div>');
                        $quescon = $('.answertabcon .course_quescon');
                    }
                    $quescon.prepend(postHtml);

                    verifyBox.hide();
                } else if (data.result == -4) {
                    //verify code;
                    if (verifyBox.is(':visible')) return;

                    verifyBox.show().trigger('reset');

                } else {
                    alert(data.msg);
                    verifyBox.trigger('reset');
                }
            },
            complete: function() {
                $this.removeClass("submit-loading").val("提问");
                $("#pub-btm").find('.js-verify-box').trigger('reset', 0);
            }
        })
    });

    //
    $('.ansmallPic').click(function() {
        var $p;
        $(this).hide();
        ($p = $(this).parents('.answercon')).find('.anbigPic').show();
        $p.find('.intertime').removeClass('playtime_AS').addClass('playtime_Ac');
    });
    $('.anbigPic').click(function() {
        var $p;
        $(this).hide();
        $p = $(this).parents('.answercon');
        $p.find('.ansmallPic').show();
        $p.find('.intertime').removeClass('playtime_Ac').addClass('playtime_AS');
    });

})
