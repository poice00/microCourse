/**
 * tab火焰灯效果切换插件
 * @author zhangshaoliu
 * @date 2015-8-14
 */
define(function(require, exports, module){
	/**
	 * 私有方法，检测参数是否合法
	 * @param  {Object}  options 配置参数对象
	 * @return {Boolean}
	 */
	function isObject(options) {
		return !options || (options && Object.prototype.toString.call(options) === "[object Object]") ? true : false;
	}

	var defaults = {
		fx: "linear",
		speed: 500,
		click: function() {}
	};

	$.fn.lavaTab = function(opts) {
		if (!isObject(opts)) {
			return this;
		}
		var settings = $.extend({}, defaults, opts);

		return this.each(function() {
			var $wrapEl = $(this),
				noop = function() {},
				$moveEl = $('<li class="move-light"></li>').appendTo($wrapEl),
				$tabItem = $("li", this),
				selectedItem = $("li", this)[0];

			function setCurrent(tabItem) {
				$moveEl.css({
					"left": tabItem.offsetLeft + "px",
					"width": tabItem.offsetWidth + "px"
				});
				$(tabItem).addClass('selected').siblings().removeClass('selected');
				selectedItem = tabItem;
			};

			function moveLight(tabItem) {
				$moveEl.each(function() {
					$(this).dequeue();
				}).animate({
					width: tabItem.offsetWidth,
					left: tabItem.offsetLeft
				}, settings.speed, settings.fx);
			}

			$(this).hover(noop, function() {
				moveLight(selectedItem);
			});

			$tabItem.not(".move-light").hover(function() {
				moveLight(this);
			}, noop);

			$tabItem.on('click', function(e) {
				return settings.click.apply(this, [e, this, setCurrent]);
			});

			setCurrent(selectedItem);
		});
	};
});