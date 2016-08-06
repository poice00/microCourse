define(function(require, exports, module){
    require('common');
	require('/microCourse/resources/page/course/common/course_common.js');
	require('/microCourse/resources/page/course/common/course_collection.js');
    var store = require('store')
/*学习页列表*/
$('.learnchapter h3').click(function(){
			if ($(this).parent().hasClass('learnchapter-active')) {
			$(this).next('.video').slideUp('fast', function(){ $(this).parent().removeClass('learnchapter-active'); });
			$(this).find('span')
				.removeClass('icon-sub')
				.addClass('icon-plus');
			$(this).find('i').removeClass('hasOpenOn');
	        $(this).find('i').addClass('hasOpen');
		} else {
			$(this).next('.video').slideDown('fast', function(){ $(this).parent().addClass('learnchapter-active'); });
			$(this).find('span')
				.removeClass('icon-plus')
				.addClass('icon-sub');
			$(this).find('i').removeClass('hasOpen');
			$(this).find('i').addClass('hasOpenOn');
		}
});

$(".back-btn").on("click",function(event) {
	if(document.referrer&&document.referrer.indexOf("course/list")!=-1){

		window.location=document.referrer
	}else{
		window.location="/course/list"
	}
	return false;
});

/*记录播放记录到本地存储*/
$('.video li').bind('click',function(){
	var mid_href = $(this).find('a').attr('href');
	store.set('mid_href', mid_href);
})
//
$(function(){
	var mid_href = store.get('mid_href');
    if(mid_href !='' && mid_href != undefined && store.get('uid') == undefined ) {
		$('.learnchapter .video  a').each(function() {
			if($(this).attr('href') == mid_href) {
				$(this).parents('.learnchapter').addClass('learnchapter-active');
				$(this).parents('.video').show();
				$(this).parents('.learnchapter')
					.find('span')
					.removeClass('icon-plus')
					.addClass('icon-sub');
			}
		})
		store.remove('mid_href');
	} else if(store.get('uid') == undefined) {
		//$('.learnchapter h3').eq(0).addClass('learnchapter-active').click();
	}

});

$('.mod-chapters').on('click', 'h3', function(e){
	var flag = $(this).find('span'),
		chapter = $(this).parents('.chapter');

	chapter.toggleClass('chapter-active');

	if(chapter.hasClass('chapter-active')){
		flag.removeClass('icon-plus').addClass('icon-sub');
	}else{
		flag.removeClass('icon-sub').addClass('icon-plus');
	}
})


})
