define(function(require, exports, module) {
  //edit file name
  //delete file
  var box = require('./opus-dialog');
  require('./opusdetail');
  require('/microCourse/resources/lib/qtip/jquery.qtip.min.css');
  require('/microCourse/resources/lib/qtip/jquery.qtip.min.js');
  $('#js-del').click(function() {
    var file = OP_CONFIG.r.cwd.replace(/\/\s*$/,'').split('/');
    box.confirm('删除将无法恢复，你确认删除吗？', function(e) {
      $.ajax({
        url: '/opus/ajaxdelfile',
        type: 'post',
        dataType: 'json',
        data: {
          opus_id: OP_CONFIG.r.id,
          file: file.pop(),
          tree: file.join('/')
        },
        success: function(data) {
          //console.log(data);
          if(data.result === 0){
            var lc = window.location;
            lc.replace('/opus/resource?opus_id=' + OP_CONFIG.r.id + '&tree=' + encodeURIComponent(file.join('/')));
          }
        },
        error: function(){

        }
      })
    });
  });

  function showTip(msg, ipt) {
    $ipt = ipt || $('#js-create-dir-box input');
    $ipt.addClass('ipt-error')
    .qtip('option', 'content.text', msg)
    .qtip('toggle', true);
  }
  $('#js-edit-box').on('click', '.js-edit', function() {
    var $this = $(this),
      $file = $('.f-path span:last-child');
      $file.hide();
      $this.hide().before('<input type="text" class="ipt" />')
      .prev('input')
      .val($file.text())
      .qtip({
        position: {my: 'bottom center', at: 'top center'},
        content: '##',
        show: {
          event: ''
        },
        hide: {
          event: ''
        },
        style: {
          classes: 'qtip-red qtip-shadow'
        }
      });
  })
  .on('blur', 'input', editLast)
  .on('keypress', 'input', function(e) {
    if(e.keyCode == 13){
      editLast();
      //do ajax save;
    }
  });

  /*var $this = $(this);
    editLast()
    $this.next().show();
    //console.log(123123);
    $this.qtip('destory', true).remove();
    $('.f-path span:last-child').show();*/
  function restore() {
    var $this = $('#js-edit-box input');
    $this.next().show();
    $this.qtip('destory', true).remove();
    $('.f-path span:last-child').show();
  }
  function editLast() {
    var $this = $('#js-edit-box input'),
      val;
    val = $.trim($this.val());
    if ($('.f-path span:last-child').text() === val) {
      restore();
      return ;
    }
    if(!val) {
      showTip('文件名不能为空！', $this);
      return ;
    }
    if(val.length > 255) {
      showTip('文件名不能超过255个字符！', $this);
      return ;
    }

    $this.removeClass('ipt-error').qtip('api').hide();
    $this.attr('readonly', 'readonly');
    var t = OP_CONFIG.r.cwd.split('/');
    $.ajax({
      url: '/opus/ajaxrndirfile',
      type: 'post',
      dataType: 'json',
      data: {
        sdirfile: t.pop(),
        tree: t.join('/'),
        dirfile: val,
        opus_id: OP_CONFIG.r.id
      },
      success: function(data){
        if (data.result !== 0) {
          showTip(data.msg, $this);
          return ;
        }
        else{
          window.location.replace('/opus/resource?opus_id=' + OP_CONFIG.r.id + '&tree=' + encodeURIComponent(t.join('/') + '/' + val))
        }
      },
      error: function(){
        showTip('服务器错误，请稍后重试！', $this);
      },
      complete: function(){
        $this.attr('readonly', false);
      }
    })
  }
});