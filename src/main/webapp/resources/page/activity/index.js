/**
 * @author Mr_zhang
 * @date 2015-05-20
 */
define(function(require, exports, module) {
    var urlUtil = require('/microCourse/resources/component/base/util/url');

    $(function(){
        // -1表示当前页是已结束的活动页
        var overst = urlUtil.getUrlQuery('overst');
        if(overst == -1){
            var $overItem = $('.over');
            $overItem.siblings().removeClass('selected').end().addClass('selected');
        }

        // 活动点击--热度统计
        $('.activity-list').off('click').on('click', 'li', function(e){
            var $hotCountEl = $(this).find('.hot-count'),
                activityId = $(this).data('activity-id'),
                hotCount = +$hotCountEl.text();

            hotCount++;
            $hotCountEl.text(hotCount);
            //console.log(activityId);
            $.ajax({
                url : '/social/useractive',
                type : "POST",
                dataType: "json",
                data: {social_id: activityId},
                success: function(data){

                },
                error: function() {}
            });
        });
    });
});