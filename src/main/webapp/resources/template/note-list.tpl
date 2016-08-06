<ul>    
    {{~it.list:notes:index}}
    <li >
      <div class="notelist_headpic">
        <a href="{{? notes.author_id == OP_CONFIG.userInfo.uid}}{{=tplDef.url_space_index}}{{??}}{{=tplDef.url_space_u}}/uid/{{=notes.author_id}}{{?}}" target="_blank">
          <img src="{{=notes.head}}" width="40" height="40">
        </a>
      </div>
      <div class="notelist_content">
        <div class="u_name"> <a href="{{? notes.author_id == OP_CONFIG.userInfo.uid}}{{=tplDef.url_space_index}}{{??}}{{=tplDef.url_space_u}}/uid/{{=notes.author_id}}{{?}}" target="_blank">{{=notes.nickname}}</a> </div>
        <div class="js-notelist-content notelist-content">
            <p>{{=notes.content}}</p>
            <div class="notelist-content-more">
              <a href="javascript:;" class="js-toggle-content">[ 查看全文 ]</a>
            </div>
          </div>
        {{? notes.picture_url}}
          <div class="answercon">
            <span class="answerImg ansmallPic" id="ansmallPic">
                <img src="{{=notes.picture_url}}" width="156" height="88">
                <i>{{=notes.pic_time_fmt||'00:00'}}</i>
                <span class="intertime playtime_AS clearfix">
                    <a href="javascript:void(0)" onClick="return false" target="_blank" class="seepic">看截图</a>
                    <a href="/video/{{#def.media_id}}/{{=notes.time_point}}" target="_blank" class="seevideo">看视频</a>
                </span>
            </span>
            <span class="answerImg anbigPic" id="anbigPic" style="display:none;">
                <img src="{{=notes.picture_url.replace(/\d+-\d+(\.\w+)$/,'500-284$1')}}" width="500" height="284">
            </span>
          </div>
        {{?}}
        {{? notes.lang>0}}
          <div class="disscus-code-icon-wrap">
            <i class="disscus-code-icon js-show-node-code" data-id="{{=notes.id}}"></i>
          </div>  
        {{?}}
        <div class="notelist-bottom clearfix"> 
            <span title="{{=notes.update_time}}" class="l timeago">{{=notes.update_time_fmt}}</span>
            <div class="notelist-actions">
              {{? notes.is_collected>0}}
                <a title="已采集" href="javascript:;" class="Jcollect list-praise on"  data-id="{{=notes.id}}|{{=notes.author_id}}"><span class="icon-star on"></span><i>已采集</i><em>{{=notes.collect_num}}</em></a>
              {{??}}
                <a title="采集" href="javascript:;" class="Jcollect list-praise " data-id="{{=notes.id}}|{{=notes.author_id}}"><span class="icon-star"></span><i>采集</i><em>{{=notes.collect_num}}</em></a>
              {{?}}

              
              {{?notes.is_praised>0}} 
               <a title="取消赞" href="javascript:;" class="Jpraise list-praise on" data-id="{{=notes.id}}"><span class="icon-thumb on"></span>
              {{??}}
               <a title="赞" href="javascript:;" class="Jpraise list-praise " data-id="{{=notes.id}}"><span class="icon-thumb"></span>
              {{?}}
                <em>{{=notes.praise_num}}</em></a>
            </div>  
        </div>
      </div>
    </li>
    {{~}}
</ul>