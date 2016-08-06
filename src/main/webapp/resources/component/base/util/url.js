/**
 * url常用操作类
 * @author Mr_zhang
 * @date 2015-06-02
 */
define(function(require, exports, module){
	var urlUtil = {
		getUrl: function(){
			return location.href;
		},
	    getHash: function(){
	    	return location.hash.replace(/^[^#]*#?(.*)$/, '$1');
	    },
	    getSearch: function(){
	    	var searchStr = location.search; // 如果无search返回""
	    	return searchStr.length > 0 ? searchStr.substring(1) : "";
	    },
	    /**
	 	 * 获取url的所有查询字符串：字符串分割分析法
	     * @return {Object} 查询参数对象
	     */
	    getUrlQuery: function(keyName) {
	    	if(!keyName){ // 如果未传入目标查询key，则返回query对象
				var searchStr = this.getSearch(),
					items = searchStr ? searchStr.split("&") : [], // 每一项参数【键值对】
					query = {}, // 保存数据的对象
					item = null,
					keyName = null,
					keyVal = null;
				for (var i = 0, len = items.length; i < len; i++) {
					item = items[i].split("=");
					keyName = decodeURIComponent(item[0]); // 对字符串项解码，防止参数值是中文时出现乱码
					keyVal = decodeURIComponent(item[1]);
					if (keyName.length) {
						query[keyName] = keyVal;
					}
				}
				return query;
	    	}else{
	    		var searchStr = this.getSearch(),
				reg = new RegExp("(^|&)" + keyName + "=([^&]*)(&|$)","i");

				var results = searchStr.match(reg);
				if (!results) {
					return null;
			    }
				return results[2];
	    	}
		},
		/**
		* 删除url字符串中指定的query
		* @param  {string}  urlStr  url字符串
		* @param  {string}  keyName 要删除的query名
		* @return {string}          删除指定query后的url字符串
		*/
		delUrlQuery: function(urlStr, keyName) {
			var escapeKeyName = function(){
				var escapeReg = new RegExp("([.*+?^=!:\x24{}()|[\\]\/\\\\])", "g");
				return keyName.replace(escapeReg, "\\\x241");
			};
			keyName = escapeKeyName(keyName);
			var reg = new RegExp("((\\?)("+ keyName +"=[^&]*&)+(?!"+ keyName +"=))|(((\\?|&)"+ keyName +"=[^&]*)+$)|(&"+ keyName +"=[^&]*)", "g");
			return urlStr.replace(reg, "\x241");
		}
	};

	//exports.url = urlUtil;
	return urlUtil;
});