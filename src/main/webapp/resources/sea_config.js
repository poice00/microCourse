seajs.config({
	// 别名配置
	alias: {
		'seajs-text' : '/microCourse/resources/sea-modules/seajs/seajs-text/1.0.3/seajs-text',
		'seajs-combo': '/microCourse/resources/sea-modules/seajs/seajs-combo/1.0.0/seajs-combo',
		//'jquery'     : '/static/sea-modules/jquery/jquery/1.9.1/jquery',
		'store'      : '/microCourse/resources/sea-modules/gallery/store/1.3.14/store',
		'underscore' : '/microCourse/resources/sea-modules/gallery/underscore/1.3.14/underscore',
		'moment'     : '/microCourse/resources/sea-modules/gallery/moment/2.3.1/moment',

		'jquery'     : '/microCourse/resources/lib/jquery/1.9.1/jquery',
		'util'       : '/microCourse/resources/lib/util/0.1.0/util',
		'jwplayer'   : '/microCourse/resources/lib/jwplayer/1.0.0/jwplayer',
		'doT'        : '/microCourse/resources/lib/dot/1.0.0/doT',
		'socket.io'  : '/microCourse/resources/lib/socket.io/1.3.5/socket.io.min',
		'ace'        : '/microCourse/resources/lib/ace/1.0.0/ace',

		'drag'       : '/microCourse/resources/component/base/drag/drag',
		'tab'        : '/microCourse/resources/component/base/tab/tab',
		'scroll_load': '/microCourse/resources/component/base/scroll_load/scroll_load',

		'common'     : '/microCourse/resources/component/logic/common/common',
		'login'      : '/microCourse/resources/component/logic/login/login',
		'login_sns'  : '/microCourse/resources/component/logic/login/login-regist',
		'chat'       : '/microCourse/resources/component/logic/chat/im',
		'player'     : '/microCourse/resources/component/logic/player/player',
		'ceditor'    : '/microCourse/resources/component/logic/ceditor/ceditor', //主提交编辑器
		'publish'    : '/microCourse/resources/component/logic/publish/publish',

		'show_data'  : '/microCourse/resources/page/course/common/show_data',
		'codeEditor' : '/microCourse/resources/page/course/common/code_editor',  //基本查看代码
	    'Module-layer' : '/microCourse/resources/lib/layer/1.6.0/layer.min',
        'placeholder': '/microCourse/resources/component/base/placeholder/placeholder',
        	
        'verify-code': '/microCourse/resources/page/common/verify-code',
        'placeholder': '/microCourse/resources/component/base/placeholder/placeholder',
        'course_common': '/microCourse/resources/page/course/common/course_common',
        'course_collection': '/microCourse/resources/page/course/common/course_collection',
        'autocomplete': '/microCourse/resources/page/course/common/autocomplete'
	},
	map: [

		[ /^(.*\.(?:css|js|tpl))(.*)$/i, '$1?'+seajsTimestamp ]
	],

	// 路径配置
	paths: {
		'lib': '/microCourse/resources/lib',
		'util': '/microCourse/resources/component/base/util'
	},

	// 变量配置
	//vars: {
	//	'locale': 'zh-cn'
	//},

	// 映射配置
	//map: [
	//	['http://example.com/js/app/', 'http://localhost/js/app/']
	//],

	// 预加载项

	preload: ['jquery', 'seajs-text','common'],
	//preload: ['jquery', 'seajs-text', 'seajs-combo'],

	// 调试模式
	debug: true,

	// Sea.js 的基础路径
	//base: 'http://example.com/path/to/base/',

	// 文件编码
	charset: 'utf-8'
});