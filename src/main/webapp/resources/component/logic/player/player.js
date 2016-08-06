
define(function(require, exports, module){
	require('jwplayer');
	
	
	// 识别是否为PC11111
	var  mode     = "flash"; 
	var  startMode="start";	
	function is_pc(){
			var arr = ['Android','iPhone','Windows Phone','iPad','BlackBerry','MeeGo','SymbianOS','Meizu','Huawei'];  // 其他类型的移动操作系统类型，自行添加
			var info = window.navigator.userAgent;
			var len = arr.length;
	
			for (var i = 0;i <len;i++) {
				if (info.indexOf(arr[i]) > 0){
					mode="html5";
					startMode="starttime";
					//alert(mode+"＝＝手机，系统："+arr[i]);
					return;
				}
			}
			//alert(mode+"===>> pc");
		   return;
		}
	

	function init(width, height, sourse,id){
      //is_pc();
		var thePlayer = jwplayer(id||'J_Video').setup({
			file:sourse,
			startparam:"start",
			width: width,
			height: height,
			primary:  "flash",
			autochange:true,
			events: {
				onReady: function(){
					thePlayer.play();
				}
			}
			
		})
		
	}
	module.exports = {
		init : init
	};


});


