define(function(require, exports, module){
	require('common');
	require('course_common');
	require('course_collection');

	var apis = {
		praise      : '/course/praisenote',
		cancelPraise: '/course/cancelpraise',
		collect     : '/course/collectnote'
    };

    var NoteAction={};

    NoteAction.praise = function(nid, $this, $praise){
		_this = this;

		$.ajax({
			url : apis.praise,
			data: {id:nid,mid:$this.attr("data-mid")},
			type : "GET",
			dataType : "json",
			success : function (json){
				if(json.result == 0){
					var num = parseInt($praise.text());
					$praise.text(num+1);
					//$this.removeClass('J_PraiseNum');
					$this.addClass('on');
					$this.find('span').addClass('on icon-thumb-revert praise-anim');
                    $this.attr('title', '取消赞');
				} 
			}
		});
	}
	
	NoteAction.cancel = function(nid, $this, $praise){
		$.ajax({
			url : apis.cancelPraise,
			data: {id:nid,mid:$this.attr("data-mid")},
			type : "POST",
			dataType : "json",
			success : function (json){
				if(json.result == 0){
					var num = parseInt($praise.text());
					$praise.text(num-1);
					//$this.addClass('J_PraiseNum');
					$this.removeClass('on');
					$this.find('span').attr('class', 'icon-thumb');
                    $this.attr('title', '支持');
				}
			}
		});
	}
	
  	NoteAction.collect = function(nid, $this, $collect){
  		var ids=$this.attr("data-mid").split("|");
  		if(OP_CONFIG.userInfo&&OP_CONFIG.userInfo.uid==ids[1]){
  			alert("亲亲\""+(OP_CONFIG.userInfo.nickname||"")+"\"，别采集自己的笔记哟~！");
  			return ;
  		}
		$.ajax({
			url : apis.collect,
			data: {id:nid,mid:ids[0]},
			type : "GET",
			dataType : "json",
			success : function (json){
				
				if(json.result == 0){
					var num = parseInt($collect.text());
					$collect.text(num+1);
					$this.addClass('on');
					$this.find('span').addClass('on icon-star-revert praise-anim');
					$this.attr('title', '已采集');
				}
			}
		});
		
		
	}
		 
		
	$('.Jpraise').on('click',function(){
		if (!OP_CONFIG.userInfo) {
			    require.async('login_sns',
		                    function(login) {
		                        login.init();
		                    })
				return 
		   }
		 
		 
		 var nid=$(this).closest('li').attr('id');
		 var $praise=$(this).find('em');
		 var _this=$(this);
		 
		 if(_this.hasClass('on')){
			  NoteAction.cancel(nid,_this, $praise)
			 }
		 else{
			 NoteAction.praise(nid,_this,$praise);
			 }
		 
	}) 

	$('.Jcollect').on('click',function(){
		if (!OP_CONFIG.userInfo) {
			    require.async('login_sns',
	                        function(login) {
	                            login.init();
	                        })
				return 
		   }
		
							
		 var _this=$(this);
		  if(_this.hasClass('on')){
			  return false;
			  }
		  
		  else{
			 var nid=$(this).closest('li').attr('id');
			 var $collect=$(this).find('em');
			 NoteAction.collect(nid, _this, $collect)
		  }
	 
	})

	$('.ansmallPic').click(function() {
        $(this).hide();
        $(this).parents('.answercon').find('.anbigPic').show();
        $(this).parents('.answercon').find('.intertime').removeClass('playtime_AS');
        $(this).parents('.answercon').find('.intertime').addClass('playtime_Ac');
    });
    
	$('.anbigPic').click(function() {
		$(this).hide();
		$(this).parents('.answercon').find('.ansmallPic').show();
		$(this).parents('.answercon').find('.intertime').removeClass('playtime_Ac');
		$(this).parents('.answercon').find('.intertime').addClass('playtime_AS');
	});

	$('#js-note-container').on('click', '.js-toggle-content', function(e) {
		var $this = $(this),
			state = $this.attr('data-state');
		if(state === 'expanded') {
			$this
			.text('[ 查看全文 ]')
			.attr('data-state','collapsed')
			.parent().css({
				position: 'absolute'
			})
			.closest('.js-notelist-content').css({
				maxHeight: '168px' //28*6
			});
		}
		else {
			$this
			.text('[ 收起全文 ]')
			.attr('data-state','expanded')
			.parent().css({
				position: 'static'
			})
			.closest('.js-notelist-content').css({
				maxHeight: 'none'
			});
		}
		e.preventDefault();
	}).on('click', '.ctrl-img', function(e){
		var wrap = $(this).parents('.answercon'),
			small = wrap.find('.js-answer-img-small'),
			expand = wrap.find('.js-answer-img-expand');

		small.hide();
		expand.show();

		expand.off('click').on('click', function(e){
			expand.hide();
			small.show();
		});
		
		return false;
	}).on('click', '.js-answer-img-expand', function(e){

	})
});