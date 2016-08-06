(function($){
	//函数扩展
	$.extend({
/*
=======================================
图片放大预览：
大小图片文件名，命名规则必须如下 XXX-宽-高.jpg
层级结构必须为
<div class='className'>
	<img src=''>
=======================================
*/
		chatImgView: function(_target) {
		
			var maskLayer,bigImgSrc;
				
			function close(){
				$('.maskLayer').remove();
				$('.upLayer').remove();	
			};
			function cssInt(target){
				
				$('.upLayer img').css({
					'width':target.width,
					'height':target.height
					})
				$('.upLayer').css({
					'width':target.width,
					'height':target.height,
					'margin-left': -(target.width/2),
					'margin-top': -(target.height/2),
					'top':'50%',
					'left':'50%'	
				});
			};
			function bsChange(t1,t2,t3){
				t1.hide();t2.show();t3?t2.html(t3):t1.remove();
			};
			$(document).unbind().bind('click',function(e){
				
				switch(e.target.className){
					
					/*case _target:
						
						var _this = $(e.target);
						
						_this.after('<div class="bigImgDiv"></div>');
					
						bigImgSrc = _this.attr('src').split('-')[0] + '-500-284.jpg';
				
						var bHtml = '<span class="chatPhotoView">查看大图</span> \
									 <img src="' + bigImgSrc + '" class="chatPhotoBig" />';
									  
						bsChange(_this,_this.parent().find('.bigImgDiv'),bHtml);
						
					break;*/
					
					case 'chatPhotoBig':	
						bsChange($(e.target).parent(),$(e.target).parent().parent().find('img'));
					break;
					
					/*case 'chatPhotoView':*/
					case _target:
					//var bigImg = null;
						function getImgOriginalSize(){                  
						/*图片等比例缩放*/
						var mostW = 900;      //设置最大宽度
						var mostH = 700;      //设置最大高度
						if(this.width > mostW ){//当前图片大于最大宽度
							var scaling = 1-(this.width-mostW)/this.width;    
							//计算缩小比例
							this.width = mostW;
							this.height = this.height*scaling;//高度根据宽度来进行缩放
							}
						if(this.height > mostH ){//当前图片大于最大高度
							var scaling = 1-(this.height-mostH)/this.height;    
							//计算缩小比例
							this.height = mostH;
							this.width = this.width*scaling;//宽度根据高度来进行缩放小
						}	
                       
						maskLayer = '<div class="maskLayer"></div> \
							<div class="upLayer"> \
				 				<i class="close_upLyr" title="关闭"></i> \
								<img src="' + this.src + '" /> \
							</div>';

						$(maskLayer).appendTo('body');
						cssInt(this);
					}
						var	bigImg = new Image();
						bigImg.src = e.target.src.replace('-150-150','');		
						if(bigImg.complete){//如果图片已经存在于浏览器缓存，直接调用回调函数     
							getImgOriginalSize.call(bigImg);
							return;// 直接返回，不用再处理onload事件     
						}else{//图片下载完毕时异步调用getImgOriginalSize.call         
							bigImg.onload=function(){
								getImgOriginalSize.call(bigImg);
							}
						}	
						
						cssInt(this);
						
					break;
					
					case 'maskLayer':
						close();
					break;
					
					case 'close_upLyr':
						close();
					break;
				}
			});

		}
	})
})(jQuery);