define(function(require, exports, module) {
  require('./resource-common');
  require('/microCourse/resources/lib/qtip/jquery.qtip.min.css');
  require('/microCourse/resources/lib/qtip/jquery.qtip.min.js');
  require('/microCourse/resources/component/base/util/modal.button.js');
  require('/microCourse/resources/lib/webupload/webuploader.withoutimage.min.js');
  require('/microCourse/resources/lib/webupload/webuploader.css');
  require("/microCourse/resources/lib/ueditor/ueditor.parse");

  uParse("body",{
    rootPath : '/static/component/base/ueditor/',
    chartContainerHeight:500
  });

  $('#js-create-dir').click(function(e) {
    var $this = $(this);
    $this.hide().before('<div class="f-ipt-dir"><input class="ipt" type="text" placeholder="新建文件夹"/><span class="btn btn-blue btn-mini">确定</span></div>')
    .prev()
    .find('input')
    .qtip({
      position: {my: 'bottom center', at: 'top center'},
      content: '文件名不能为空！',
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
  });
  $('#js-create-dir-box').on('click', '.btn', function(e) {
    var $ipt = $(this).prev('input'),
      val = $.trim($ipt.val());
      if(!val) {
        showTip('文件名不能为空！');
        return ;
      }
      if(val.length > 255) {
        showTip('文件名不能超过255个字符！');
        return ;
      }
      $ipt.removeClass('ipt-error').qtip('api').hide();
      submit(val, $(this));

  }).on('keyup', 'input', function(e) {
    var $this = $(this),
      val = $.trim($this.val());
      //console.log(val)
    if(val && val.length <= 255 && $this.hasClass('ipt-error')) {
      $this.removeClass('ipt-error').qtip('api').hide();
    }
  });

  function showTip(msg, ipt) {
    $ipt = ipt || $('#js-create-dir-box input');
    $ipt.addClass('ipt-error')
    .qtip('option', 'content.text', msg)
    .qtip('toggle', true);
  }
  function submit(val,el) {
    if(el.hasClass('loading')) return ;
    el.addClass('loading');
    $.ajax({
      url: '/opus/ajaxmkdir',
      type: 'post',
      dataType: 'json',
      data: {
        tree: OP_CONFIG.r.cwd,
        opus_id: OP_CONFIG.r.id,
        dir: val
      },
      success: function(data) {
        if(data.result !== 0) {
          showTip(data.msg);
        }
        else{
          window.location.href = '/opus/resource?opus_id=' + encodeURIComponent(OP_CONFIG.r.id) + '&tree=' + encodeURIComponent(OP_CONFIG.r.cwd + '/' + val);
        }
      },
      error: function(data) {
        showTip('后台错误，请稍后重试！');
      },
      complete: function(){
        el.removeClass('loading');
      }
    });
  }




  //file upload
  $('#js-upload').click(function() {
    var uploader
    $('<div class="modal-import"><i class="m-close" data-dismiss="modal"></i><h1>导入作品</h1><div class="modal-body"><div class="upload-box"><div id="upload-picker"> 选择文件 </div><p class="m-msg"></p></div><h2>说明：</h2><ol><li>作品支持用户导入自有作品，可上传单文件。包含程序文件，图片，样式。</li><li>作品可通过压缩包上传，文件类型包含zip,rar两种格式。作品压缩包文件大小不能超过10M。压缩包内文件过多，目录过深都将导致上传失败。</li><li>上传完成后将自动解压到当前目录下。如压缩包内包含乱码文件或程序无法识别文件将不与显示。</li></ol></div></div>').
    on('hide.modal', function(e){
      $(this).remove();
      uploader && uploader.destory && uploader.destory();
    })
    .on('shown.modal', function() {
      var $this = $(this);
      uploader = WebUploader.create({
          swf: '/static/lib/webupload/Uploader.swf',
          server: '/opus/opusupload',
          pick: {id: '#upload-picker',multiple: false},//'#upload-picker',
          resize: false,
          formData: {
            opus_id: OP_CONFIG.r.id,
            path: OP_CONFIG.r.cwd
          },
          fileVal:'file',
          fileNumLimit: 1,
          accept: {
            //extensions: 'zip,rar,txt,ppt,pptx,doc,docx,vsd,htaccess,htm,html,css,js,shtml,json,xml,less,php,jsp,java,asp,aspx,apk,ipa, jar, so, arsc, dex,png,jpg,jpeg,gif,eot,svg,tff,woff'
            extensions: 'scss,sass,zip,rar,txt,ppt,pptx,doc,docx,vsd,htaccess,htm,html,css,js,shtml,json,xml,less,php,jsp,java,asp,aspx,apk,ipa,jar,so,arsc,dex,png,jpg,jpeg,gif,eot,svg,ttf,woff'

          },
          auto: true
      });
      uploader.on('error', function(msg) {
        //console.log(msg)
        //err('只支持zip,rar两种类型文件！');
        err('文件格式不支持！');
      });
      uploader.on('uploadAccept', function(a,b){
        $('#upload-progress').remove();
        if (b.result !== 0) {
          $('#upload-picker').show();
          err(b.msg);
        }
        else {
          err('上传成功！');
          setTimeout(function() {window.location.reload();}, 1500);
        }
      });
      uploader.on('uploadStart', function() {
        err('');
        $('#upload-picker')
        //.hide() //flash mode error
        .after('<div id="upload-progress">正在上传<em>0%</em></div>');
      });
      /*uploader.on('all', function() {
        //err('');
      });*/
      uploader.on('uploadProgress', function(f, percentage){
        $('#upload-progress em').text(Math.min(100, Math.round(percentage * 100)) + '%');
      });
      uploader.on('uploadError', function() {
        $('#upload-picker').show();
        $('#upload-progress').remove();
        err('上传错误，请稍后重试');
        //uploader.stop();
        //uploader.reset();
      });
      uploader.on('uploadComplete', function() {
        //err('');

        uploader.stop();
        uploader.reset();
      });
      function err(msg) {
        $this.find('.m-msg').text(msg);
      }
    })
    .modal({show: 1, backdrop: 'static'});
  });
});
