 <ul>    
    {{~ it.list:wiki:index}}
    <li>
    <div class="wikilist_content">
       <a target="_blank" href="/wiki/view?pid={{=wiki.p_id}}" class="con-wrap">
          <h3> {{=wiki.title}}</h3>
          <div class="con">{{=wiki.content}}</div>
       </a>
    </div>
    </li>
    {{~}}
</ul>