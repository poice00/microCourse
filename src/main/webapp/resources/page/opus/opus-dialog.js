define(function(require, exports, module) {
    //绘制确认对话框
    /*
    结构：
    <div class="confirm-dialog">
        <div class="tip-img sns-favorite"></div>
        <p class="tip-text">文件夹删除将无法恢复，您确定要删除文件夹及文件吗？</p>
        <div class="tip-btn-box">
            <span class="sure">确定</span>
            <span class="cancel">取消</span>
        </div>
    </div>
    */
    function renderCfmDia( type , msg ,callback){
        var temparr = [];
        temparr.push('<div class="confirm-dialog">');
        if(type==='favorite'){
            temparr.push('<div class="tip-img sns-favorite"></div>');
        }
        if(type==='delfile'){
            temparr.push('<div class="tip-img sns-delete"></div>');
        }
        temparr.push('<p class="tip-text">'+msg+'</p>');
        temparr.push('<div class="tip-btn-box">');
        temparr.push('<span class="sure">确定</span>');
        temparr.push('<span class="cancel">取消</span>');
        temparr.push('</div>');
        temparr.push('</div>');
        $('body').append(temparr.join(''))

        $('.confirm-dialog .sure').on('click',function( e ){
            callback( e );
            $('.confirm-dialog .cancel').trigger('click');
        });
        $('.confirm-dialog .cancel').on('click',function( e ){
            $('.confirm-dialog').remove();
        });
    }
    //绘制信息提示框
    /*
      结构：
     <div class="info-dialog">
         <div class="tip-img sns-done-outline"></div>
         <p class="tip-text">文件夹删除失败</p>
     </div>
    */
    function renderInfoDia(type,msg,closeCallback){
        var temparr=[];
        temparr.push('<div class="info-dialog">');
        if(type=="succ"){
            temparr.push('<div class="tip-img sns-done-outline"></div>');
        }
        if(type=="fail"){
            temparr.push('<div class="tip-img sns-info-outline"></div>');
        }
        temparr.push('<p class="tip-text">'+msg+'</p>');
        temparr.push('</div>');
        $('body').append(temparr.join(''));
        $('body').one('click',function( e ){
            if(closeCallback){
                closeCallback( e );
            }
            $('.info-dialog').remove();
        });
        window.setTimeout(function(){
            $('body').trigger('click');
        },3000);
    }



    //对外方法
    //type:favorite是确认收藏对话框
    //type:delfile是确认删除对话框
    //type:succ是成功信息提示框
    //type:fail是失败信息提示框
    //msg:是要确认的信息
    //callback:在确认对话框中是用户点击对话框确定按钮要执行的操作；
    //         在提示对话框中是提示对话框消失时执行的事件
    exports.open=function( type , msg ,callback ){
        //一个页面中同一时刻只能有一个对话框
        $('.confirm-dialog').remove();
        $('.info-dialog').remove();
        switch( type ){
            case 'favorite':renderCfmDia( type , msg ,callback);break;
            case 'delfile':renderCfmDia( type , msg ,callback);break;
            case 'succ':renderInfoDia( type , msg ,callback);break;
            case 'fail':renderInfoDia( type , msg ,callback);break;
        }
    };
    exports.error = function(msg, callback) {
        renderInfoDia('fail' , msg ,callback);
    };
    exports.info = function(msg, callback) {
        renderInfoDia('succ' , msg ,callback);
    };
    exports.confirm = function(msg, callback) {
        renderCfmDia('delfile', msg ,callback);
    };
});
/*
eg:
 var dia=require('./opus-dialog.js');
 dia.open('delfile','文了个波',function(){
     alert('成功');
 });
*/