define(function(require, exports, module) {
    return;
    require('common');
    var global_data = {
        cat_id: 0,
        unlearn: 0,
        page: 1
    };
    //读数据时的背景效果
    var loading = $('.bg-loading');
    //处理查询路径
    function ctrlSearch() {
        this.url = window.location;
    };
    ctrlSearch.prototype.getSearch = function (arr) {
        var Identification="?";
        if(!window.history.pushState){
            Identification="#";
        }
        var pos = this.url.href.indexOf(Identification);
        if(pos==-1)
        {
            return "";
        }else{
            var query=this.url.href.substring(pos+1);
            return query;
            /*for(var i= 0 , len = arr.length ; i < len;i++){
                if(arr[i]===query) return query;
            }
            return "";*/
        }

    };
    ctrlSearch.prototype.setSearch = function (search) {
        //如果不支持h5的pushState，则用hash
        var Identification="?";

        if(window.history.pushState){
            var pos = this.url.href.indexOf(Identification);
            if (pos == -1) {
                if (search == '') {
                    return;
                } else {
                    var str = this.url + Identification + search;
                    window.history.pushState({}, '', str);
                }
            } else {
                var str = this.url.href.substring(0, pos);
                if (search === '') {
                    window.history.pushState({}, '', str);
                } else {
                    str += Identification + search;
                    window.history.pushState({}, '', str);
                }

            }
        }else{
            Identification="#";
            return window.location.hash=search;
        }

        //var pos = this.url.href.indexOf(Identification);
        //if (pos == -1) {
        //    //window.location.href=this.href+'?'+search;
        //    if (search == '') {
        //        return;
        //    } else {
        //        var str = this.url + Identification + search;
        //        setStr(str)
        //        //window.history.pushState({}, '', str);
        //    }
        //} else {
        //    var str = this.url.href.substring(0, pos);
        //    if (search === '') {
        //        setStr(search)
        //        //window.history.pushState({}, '', str);
        //    } else {
        //        //str += Identification + search;
        //        setStr(search);
        //        //window.history.pushState({}, '', str);
        //    }
        //
        //}
    };


    //读取数据
    var isLoading = true;
    function loadData() {
        if(isLoading==false){
            return;
        }
        if (global_data.page === 'none') {
            return;
        }
        //请求前展示动画效果
        if (!loading.hasClass('show')) {
            loading.addClass('show');
        }

        var req_url = "/course/ajaxprogram";
        //default
        var req_param = global_data;
        isLoading=false;
        $.post(req_url, req_param, function (res_data) {
            if (loading.hasClass('show')) {
                loading.removeClass('show');
            }
            if (res_data.list) {
                var html = createProgramList(res_data.list,req_param);
                if (global_data.page === 1) {
                    $('.program-list').html(html);
                } else {
                    $('.program-list').append(html);
                }
            } else {
                alert("返回数据异常");
            }
            if (res_data.nextPage == 1) {
                global_data.page++;
            } else {
                global_data.page = 'none';
            }
            isLoading=true;
        }, "json");
    }

    //生成计划列表的每一项
    function createProgramList(list,req_param) {
        var temparr = [];
        if (list.length === 0) {
            //处理无数据情况
            if(req_param.page==1){
                return '<div class="no-program"><div class="no-program-bg"></div><p>目前还没有相关计划</p></div>';
            }else{
                return;
            }

        }
        $.each(list, function (index, item) {
            var href = "/course/programdetail/pid/" + item.id;
            //var tags=item.keywrods.split(",");
            var tags = $.trim(item.keywrods);
            tags = tags == '' ? 0 : tags.split(',');
            //http://img.mukewang.com/53ad010c0001385806000180.jpg
            var imgurl = 'http://img.mukewang.com/' + item.path_pic + '.jpg';
            var temp = [];

            temp.push('<li>');
            temp.push('<img src="' + imgurl + '" alt="' + item.name + '"/>');
            temp.push('<a href="' + href + '"><div class="program-item-title"><h4>');
            temp.push(item.name);
            temp.push('</h4>');
            if (tags !== 0) {
                temp.push('<div class="program-tag">');
                for (var i = 0, len = tags.length; i < len; i++) {
                    temp.push('<span>' + tags[i] + '</span>');
                }
            }
            temp.push('</div>');
            temp.push('</div>');
            temp.push('<div class="program-info">');
            temp.push('<p class="program-count-user">' + item.study_persons + '参加</p>');
            temp.push('<p class="program-count-course">' + item.courses + '门课</p>');
            temp.push('</div>');
            if (item.is_learn === 1) {
                temp.push('<div class="hasLearn">您已经参加此计划</div>');
            }
            temp.push('</a></li>');
            temparr.push(temp.join(''));
        });
        return temparr.join('');
    }

    //设置列表红色的标识
    function setIdentification() {
        var elem=$('.program-sider .selected');
        var text=elem.find('a').text();
            text=$.trim(text);
        $('.program-category h2').text(text);
        var pos =elem.position().top;
        $('.program-sider em').animate({'top': pos + 'px'});
    }

    //初始化页面，根据浏览器路径，定位当前数据
    /*
    * for(var i= 0 , len = arr.length ; i < len;i++){
     if(arr[i]===query) return query;
     }*/
    function init(arr) {

        //判断query是不是当前可选类别里的
        function isSelectable(arr,query){
            for(var i= 0 , len = arr.length ; i < len;i++){
                if(arr[i]===query) return true;
            }
            return false;
        }

        var tempobj = new ctrlSearch();
        var searchStr = tempobj.getSearch(arr);
        var elems = $(".program-sider a");
        if (searchStr == "") {
            $(".program-sider a").eq(0).click();
        }else if(!isSelectable(arr,searchStr)){
            $(".program-sider a").eq(0).trigger('click',{isNotSetUrl:true});
        } else {
            $.each(elems, function (i, o) {
                var obj = $(o).parent('li');
                var marking = obj.attr('data-marking');
                if (marking == searchStr) {
                    //$(o).click();
                    $(".program-sider a").eq(i).click();
                    return false;
                }
            });
        }
    }


    $(function () {

        $(".program-sider a").on('click', function (e,op) {
            console.log(op);
            //e.preventDefault();
            var obj = $(this).parent('li');
            if (obj.hasClass('selected')) {
                return;
            }
            obj.parent().find('.selected').removeClass('selected');
            obj.addClass('selected');
            setIdentification();

            if(!op||!op.isNotSetUrl){
                //设置浏览路径
                var marking = obj.attr('data-marking');
                var tempobj = new ctrlSearch();
                //var searchStr=tempobj.getSearch();
                tempobj.setSearch(marking);
            }

            //设置请求参数
            var cid = obj.attr('data-cid');
            cid = $.trim(cid);
            cid = cid == '' ? 0 : cid;
            global_data.cat_id = cid;
            global_data.page = 1;
            if ($('.program-filter .no-display-learned').length === 0) {
                //显示已学
                global_data.unlearn = 0;
            } else if ($('.program-filter .no-display-learned').hasClass('checked')) {
                //不显示已学
                global_data.unlearn = 1;
            }
            loadData();
        });
        $('.program-filter .no-display-learned').on('click', function () {
            if ($(this).hasClass('checked')) {
                $(this).removeClass('checked');
                global_data.unlearn = 0;
            } else {
                $(this).addClass('checked');
                global_data.unlearn = 1;
            }
            global_data.page = 1;
            var cid = $('.program-sider .selected').attr('data-cid');
            cid = $.trim(cid);
            cid = cid == '' ? 0 : cid;
            global_data.cat_id = cid;
            loadData();
        });
        $(window).scroll(function () {
            //当 .program-main 位于当前视口顶部的时候，设置为fixed;
            var ws = $(window).scrollTop();
            var point1 = $('.program-wrap').offset().top;
            if (ws >= point1) {
                $('.program-category').css('position', 'fixed');
                $('.program-sider').css('position', 'fixed').css('top', 0);
            } else {
                $('.program-category').css('position', 'absolute');
                $('.program-sider').css('position', 'absolute').css('top', 'auto');
            }
            ;
            var pointer2 = $(document).outerHeight(true);
            var cur = $(window).scrollTop() + $(window).outerHeight(true);
            if (cur >= pointer2&&global_data.page!==1) {
                loadData();
            }
        });
        (function(){
            //获取当前所有可以访问的分类字符串
            var temparr=[];
            $('.program-sider li').each(function(i,n){
               var text = $(n).attr('data-marking');
                text= $.trim(text);
                temparr.push(text);
            });
            init(temparr);
        })();

    });
});
