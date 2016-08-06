(function () {
    var URL = window.UEDITOR_HOME_URL || getUEBasePath();
    window.UEDITOR_CONFIG = {
        //为编辑器实例添加一个路径，这个不能被注释
        UEDITOR_HOME_URL : URL
        //图片上传配置区
        ,imageUrlNew:"/microCourse/resources/images/uploadimg"             //图片上传提交地址
        ,imageFieldName: "pic" /* 提交的图片表单名称 */
        ,imageMaxSize: 2048000 /* 上传大小限制，单位B */
        ,fileNumLimit: 5 /* 上传文件数量 */
        ,imageAllowFiles: [".png",".jpg", ".jpeg", ".gif", ".bmp"] /* 上传图片格式显示 */
        ,imageCompressEnable: true /* 是否压缩图片,默认是true */
        ,imageCompressBorder: 1600 /* 图片压缩最长边限制 */
        ,imageInsertAlign: "none" /* 插入的图片浮动方式 */
        ,toolbars: [["insertcode","bold","italic","underline","insertimage","link","unlink",'insertunorderedlist','insertorderedlist',"blockquote","redo","undo","preview"]] //"paragraph" 暂时没用
        ,initialFrameHeight:250  //初始化编辑器高度,默认320
        ,autoSyncData:false //自动同步编辑器要提交的数据
        ,pasteplain:true  //是否默认为纯文本粘贴。false为不使用纯文本粘贴，true为使用纯文本粘贴
        ,wordCount:true          //是否开启字数统计
        ,maximumWords:15000       //允许的最大字符数
        ,theme:'imooc'
        ,enableAutoSave: false
        ,saveInterval: 9e5
        ,elementPathEnabled : false
        ,'insertorderedlist':{}
       ,insertunorderedlist:{}
       ,iframeCssUrl: URL + 'themes/iframe.css'
       ,insertcode: {
            'bash':'Bash/Shell',
            'cpp':'C/C++',
            'css':'Css',
            'html':'Html',
            'java':'Java',
            'js':'Javascript',
            'php':'Php',
            'plain':'Plain Text',
            'python':'Python',
            'ruby':'Ruby',
            'sql':'Sql',
            'xml':'Xml'
        }
       ,'paragraph':{'p':'', 'h1':'', 'h2':'', 'h3':''}
    };

    function getUEBasePath ( docUrl, confUrl ) {
        return getBasePath( docUrl || self.document.URL || self.location.href, confUrl || getConfigFilePath() );
    }

    function getConfigFilePath () {
        var configPath = document.getElementsByTagName('script');
        return configPath[ configPath.length -1 ].src;
    }

    function getBasePath ( docUrl, confUrl ) {
        var basePath = confUrl;
        if(/^(\/|\\\\)/.test(confUrl)){
            basePath = /^.+?\w(\/|\\\\)/.exec(docUrl)[0] + confUrl.replace(/^(\/|\\\\)/,'');
        }else if ( !/^[a-z]+:/i.test( confUrl ) ) {
            docUrl = docUrl.split( "#" )[0].split( "?" )[0].replace( /[^\\\/]+$/, '' );
            basePath = docUrl + "" + confUrl;
        }
        return optimizationPath( basePath );
    }

    function optimizationPath ( path ) {
        var protocol = /^[a-z]+:\/\//.exec( path )[ 0 ],
            tmp = null,
            res = [];
        path = path.replace( protocol, "" ).split( "?" )[0].split( "#" )[0];
        path = path.replace( /\\/g, '/').split( /\// );
        path[ path.length - 1 ] = "";
        while ( path.length ) {
            if ( ( tmp = path.shift() ) === ".." ) {
                res.pop();
            } else if ( tmp !== "." ) {
                res.push( tmp );
            }

        }
        return protocol + res.join( "/" );

    }

    window.UE = {
        getUEBasePath: getUEBasePath
    };
})();
