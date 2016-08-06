define(function(require, exports, module) {

    require('common');
    var cutil = require('course_common');
    require('course_collection');

    var store = require('store');

    var apis = {
        praise: '/course/praisenote',
        cancelPraise: '/course/cancelpraise',
        collect: '/course/collectnote'
    };

    // 是否需要验证码(快速第二评论时出现验证码)
    var needVerifyCode = false;

    var lastCmtTime = 0;

    if (!OP_CONFIG.userInfo) {
        $(".js-textarea-unlogin").click(function() {
            require.async('login_sns', function(login) {
                login.init();
            });
        });
    }

    //评论框
    $('#js-pl-input-fake').on({
            focusin: function() {
                $(this).addClass('ipt-fake-focus');
                $(".pub-editor-wrap").next(".errortip").hide();
            },
            focusout: function() {
                $(this).removeClass('ipt-fake-focus');
            },
            keyup: function() {
                var len = $.trim($('#js-pl-textarea').val()).length;
                if (len > 300) {
                    $(this).addClass("ipt-fake-error").find('#js-pl-limit').addClass('limit-overflow');
                } else {
                    $(this).removeClass("ipt-fake-error").find("#js-pl-limit").removeClass('limit-overflow')
                }
                $('#js-pl-limit').text(len);
            }
        })
        //发布评论
    function ajaxComment(obj) {
        $.ajax({
            url: "/course/docomment",
            type: "post",
            dataType: "json",
            data: obj,
            success: function(data) {
                if (data.result == -103008) { // 是否发布到问答
                    var $maybe = $("#maybe-wenda");
                    $maybe.show().addClass("show");
                } else if (data.result === 0) { // 发布评论
                    $("#js-pl-textarea").val('').blur();
                    var item = data.data;
                    var plcon = obj.content;
                    var reg,
                        escapeMap = {
                            '&': '&amp;',
                            '<': '&lt;',
                            '>': '&gt;',
                            '"': '&quot;',
                            "'": '&#x27;',
                            '`': '&#x60;'
                        }
                    reg = '(?:';
                    for (var key in escapeMap) {
                        reg += key + '|';
                    }
                    reg = reg.slice(0, -1);
                    reg += ')';
                    reg = RegExp(reg, 'g');
                    plcon = plcon.replace(reg, function(m) { //escape html
                        return escapeMap[m] || m;
                    }).replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, "$1<br>$2");

                    var html = '<li>';
                    html += '<div class="notelist_headpic">' + '<a href="/space/index" target="_blank"><img src="' + item.portrait + '" width="40" height="40"/></a>' + '</div>' + '<div class="notelist_content">' + '<div class="u_name">' + '<a href="/space/index" target="_blank">' + item.nickname + '</a>' + '</div>' + '<p>' + plcon + '</p>' + '<div class="notelist-bottom clearfix"> ' + '<span  class="l timeago">时间：' + item.create_time + '</span>' + '<div class="notelist-actions"> ' + '<a title="赞" href="javascript:;" class="js-pl-praise list-praise"  data-id="' + item.id + '">' + '<span class="icon icon_good "></span>' + '<em>0</em>' + '</a>' + '</div>' + '</div>' + '</div>' + '</li>';

                    var post = {
                        id: item.id,
                        txt: plcon,
                        time: item.create_time,
                        nickname: item.nickname,
                        upic: item.portrait
                    },
                    postTpl = $('#tpl_pl').html(), // 评论模板，存在页面中
                    postHtml = '';

                    postHtml = cutil.tpl(postTpl, post);


                    if (!$('#course_note .mod-post').length) {
                        $('#course_note').append('<ul class="mod-post"></ul>');
                        $('#course_note .empty-holder').remove();
                    }
                    $('#course_note .mod-post').prepend(postHtml);
                    $("#js-pl-limit").text('0');

                    $('.js-verify-box').hide();
                    needVerifyCode = false;
                } else if(data.result == -1) { // 出现验证码（两次发布在一分钟之内）
                    var form = $('.js-form:visible');

                    form.find('.js-verify-box').show().trigger('reset');
                    form.find('.errortip').text('请输入验证码！').show();
                    needVerifyCode = true;
                }else{
                    // 验证失败,刷新验证码
                    var form = $('.js-form:visible');
                    form.find('.js-verify-box:visible').trigger('reset');
                    form.find('.errortip').text(data.msg).show();
                }
            },
            complete: function() {
                $('#js-pl-submit').removeClass("loading").val('发表评论');
            }
        })
    }

    function commentSubmit(checked, param) {
        var $this = $('#js-pl-submit'),
            $uExpValEl = $('#js-user-mp'),
            $tipEl = $(".pub-editor-wrap").parent().find(".errortip"),
            verifyBox = $('.js-verify-box'),
            verifyNum = null,
            opts = {},
            val;


        if ($this.hasClass("loading")) return;
        val = $.trim($('#js-pl-textarea').val());
        if (val.length < 5) {
            $tipEl.text("内容不能少于5个字符！").show();
            return;
        } else if (val.length > 300) {
            $tipEl.text("内容不能大于300个字符！").show();
            return;
        } else {
            $tipEl.hide();
        }

        // 对用户经验值判断，经验值不满50不能发评论
        if($uExpValEl.length && +$uExpValEl.text() < 50){
            $tipEl.text("您的经验值未满50，不能发表评论！").show();
            return false;
        }

        verifyBox.is(':visible') && verifyBox.trigger('validate');
        if (verifyBox.hasClass('vf-error')) {
            verifyBox.trigger('reset');
            return;
        }
        verifyNum = verifyBox.find('.ipt').val().trim();
        needVerifyCode && (opts.verify = verifyNum);

        $this.addClass("loading").val('发布中...');

        var data = {
                content: val,
                cid: GC.course.id
            };

        $.extend(data, opts);

        if (checked) {
            data.checked = 1
        }
        ajaxComment(data);
    }
    $('#js-pl-submit').click(function() {
        commentSubmit(false);
    });

    //引导问答弹出框中得点击事件
    $("#wenda-ok").on("click", function() {
        store.set("maybewenda_content", $.trim($('#js-pl-textarea').val()));
        location = "/qa/" + GC.course.id;
    });
    $("#wenda-no").on("click", function() {
        commentSubmit(true);
        $("#maybe-wenda").removeClass("show").slideUp("fast");
    });
    //支持评论js-pl-praise
    $(document).on("click", ".js-pl-praise", function(e) {
        e.preventDefault();
        var $this = $(this),
            id;
        if (!OP_CONFIG.userInfo) {
            require.async('login_sns', function(login) {
                login.init();
            });
            return
        }
        id = $this.attr("data-id");
        $.ajax({
            url: "/course/commentsupport",
            data: {
                id: id
            },
            type: "post",
            dataType: "json",
            success: function(data) {
                if (data.result == 0) {
                    var num = +$this.text();
                    $this.find("em").text(num + 1);
                    //$this.removeClass('J_PraiseNum');
                    $this.addClass('on').removeClass("js-pl-praise");
                    $this.find('span').addClass('on icon-thumb-revert praise-anim');
                }
            },
            error: function() {

            }
        });
    });
})
