define(function(require, exports, module) {
	require('/microCourse/resources/lib/jquery/plugin/jquery.easing.min');
	require('/microCourse/resources/lib/jquery/plugin/jquery.lavaTab');

	//
	var suggest = require('/microCourse/resources/component/base/suggest/suggest'),
		urlUtil = require('/microCourse/resources/component/base/util/url'),
		isRequest = false, // 是否正在请求数据
		$resultWrap = null;

	// 异步切换数据
	function getSearchData(page, currentItem) {
		var resUrl = "",
			_data = {},
			typeName = $(currentItem).data('type');

		isRequest = true;

		switch (typeName) {
			case '课程':
				resUrl = "searchcourse";
				break;
			case '问答':
				resUrl = "searchbbs";
				break;
			case '文章':
				resUrl = "searcharticle";
				break;
			case '作品':
				resUrl = "searchopus";
				break;
			default:
				resUrl = "searchwiki";
		}

		// 关键词
		_data.words = $('.J-suggest-input').val() || urlUtil.getUrlQuery('words');

		// 改版后，tag参数默认为0，即不区分标签类型
		_data.tag = 0;

		// 页码
		if(page){
			_data.page = page;
		}

		$.ajax({
			url: resUrl,
			type: "get",
			data: _data,
			beforeSend: function(){
				$resultWrap.html('').addClass('loading');
			},
			success: function(res) {
				isRequest = false;
				$resultWrap.removeClass('loading').html(res);
			},
			error: function() {
				isRequest = false;
			}
		})
	}

	$(function() {
		var $searchContainer = $('[data-search="search-page"]'),
			$typeWrap = $('.J-type-list');

		$resultWrap = $('.J-result-list');

		// suggest功能实例化
		new suggest($searchContainer);

		// 类型列表项高亮缓动
		$typeWrap.lavaTab({
			fx: "backout", //缓动类型
			speed: 700, //缓动时间
			click: function(evt, currentItem, callback) {
				var $currentItem = $(currentItem);
				if (isRequest || $currentItem.hasClass('selected')) {
					return;
				}
				callback && callback(currentItem);
				getSearchData(null, currentItem);
			}
		});

		// 翻页处理
		$resultWrap.on("click", ".js-page a", function(evt){
			if (isRequest) {
				return;
			}
			var currentItem = $typeWrap.find('li.selected')[0];
			$(this).addClass('active').siblings().removeClass('active');
			getSearchData($(this).data('page'), currentItem);
			evt.stopPropagation();
		});
	});
});