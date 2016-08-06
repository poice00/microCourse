
$(document).ready(function(){
  $("#clear").click(function(){
    $("#content").val('');
    document.getElementById('clear').style.display = "none";
  });
  
  /*var ul = document.getElementById('result');
  var lis = ul.getElementsByTagName('li');
  for(var i=0;i<lis.length;i++){
      lis[i].onclick = function(){
          alert(this.innerHTML);
      }
  }*/

});
function show(){
	 document.getElementById('result').style.display = "block";
	 var content = $("#content").val();
	 if(content == ""){
			$.ajax({
				url:'/microCourse/user/findHistory',
				data:{
					content:content
				},
				type:'post',
				async:false,	//默认为true，这里需要改为false
				success:function(result) {
					//拿到返回值
//					alert(result);
					$(".suggest-list").html("");
					var jsonObj = JSON.parse(result);
					for(var key in jsonObj){
						$(".suggest-list")
							.append(" <li>" +  jsonObj[key].name +"</li>")
						;
					}
					var ul = document.getElementById('result');
					var lis = ul.getElementsByTagName('li');
					for(var i=0;i<lis.length;i++){
						lis[i].onclick = function(){
							$("#content").val(this.innerHTML);
							document.getElementById('result').style.display = "none";
						}
					}
				}
			});
			
	 }
	 
	
}
function hide(){
	 document.getElementById('result').style.display = "none";
}
/**
 * 非IE：oninput
 * IE：onpropertychange
 */
function showFuzzySearch(){
	var info = "";
	var input_content = $("#content").val();
	$.ajax({
		url:'/microCourse/user/showFuzzySearch',
		data:{
			content:input_content
		},
		type:'post',
		async:false,	//默认为true，这里需要改为false
		success:function(result) {
			//拿到返回值
//			alert(result);
			 $(".suggest-list").html("");
			var jsonObj = JSON.parse(result);
			
			for(var key in jsonObj){
				$(".suggest-list")
					.append(" <li>" +  jsonObj[key].name +"</li>")
				;
			}
			var ul = document.getElementById('result');
			var lis = ul.getElementsByTagName('li');
			for(var i=0;i<lis.length;i++){
				lis[i].onclick = function(){
					$("#content").val(this.innerHTML);
					document.getElementById('result').style.display = "none";
				}
			}
			
			  
		}
	});
}
function gotoPageNum(currentPage) {//翻页
	document.getElementById('result').style.display = "none";
	var info = "";
	var input_content = $("#content").val();
	$.ajax({
		url:'/microCourse/user/searchIn',
		data:{
			content:input_content,
			currentPage:currentPage
		},
		type:'post',
		async:false,	//默认为true，这里需要改为false
		success:function(result) {
			//拿到返回值
			//判断是否有重复
//			alert(result);
			 $(".search-course").html("");
			 $(".num").html("");
			var jsonObj = JSON.parse(result);
			$("#count").text(jsonObj.recordCount);
			 var numlist = eval(jsonObj.recordList);
//			 alert(jsonObj);
			for(var key in numlist){
				$(".search-course")
					.append(" <li class='course-item border-btm'>"
					+ " <div class='course-item-content clearfix'>"
					+ "  <div class='thumbnail'>"
					+ " 	 <div class='thumbnail-inner'>"
					+ "  	 	<a href='/microCourse/course/view/" + numlist[key].courseId + "' target='_blank'><img src='/microCourse/"+ numlist[key].logo + "'></a>"
					+ " 	 </div>"
					+ "  </div>"
					+ "  <div class='introduction'>"
					+ "   <h2 class='title autowrap'>" + numlist[key].name  + "</h2>"
					+ " 	 <div class='description autowrap'>课程简介：" + numlist[key].description + "</div>"
					+ "  </div>"
					+ " </div>"
					+ "</li>")
				;
			}
			 $(".num")
				.append(" 页次：" +jsonObj.currentPage+"/" + jsonObj.pageCount + "页&nbsp;"
					+ " 每页显示：" +jsonObj.pageSize+"条 &nbsp;"
					+ " <ul class='pagination'>"
					+ " <li><a href='javascript:gotoPageNum(1)' style='cursor: hand;'>首页</a></li>"
					+ " </ul>");
			for(var i=jsonObj.beginPageIndex; i<=jsonObj.endPageIndex; i++) {  
				if(i==jsonObj.currentPage){
					$(".pagination")
					.append(" <li class='active'><a style='cursor: hand;'>" + i + "<span class='sr-only' >(current)</span></a></li>")
					;

				}else{
					$(".pagination")
					.append(" <li><a onclick='gotoPageNum(" + i +");' style='cursor: hand;'>" + i + "<span class='sr-only' >(current)</span></a></li>")
					;
				}
			}
			$(".pagination")
			.append(" <li><a href='javascript:gotoPageNum("+ jsonObj.pageCount+")' style='cursor: hand;'>尾页</a></li>");
		}
	});
}



function search(){
	document.getElementById('result').style.display = "none";
	var info = "";
	var input_content = $("#content").val();
	$.ajax({
		url:'/microCourse/user/searchIn',
		data:{
			content:input_content,
			currentPage:1
		},
		type:'post',
		async:false,	//默认为true，这里需要改为false
		success:function(result) {
			//拿到返回值
			//判断是否有重复
//			alert(result);
			 $(".search-course").html("");
			 $(".num").html("");
			var jsonObj = JSON.parse(result);
			$("#count").text(jsonObj.recordCount);
			 var numlist = eval(jsonObj.recordList);
//			 alert(jsonObj);
			for(var key in numlist){
				$(".search-course")
					.append(" <li class='course-item border-btm'>"
					+ " <div class='course-item-content clearfix'>"
					+ "  <div class='thumbnail'>"
					+ " 	 <div class='thumbnail-inner'>"
					+ "  	 	<a href='/microCourse/course/view/" + numlist[key].courseId + "' target='_blank'><img src='/microCourse/"+ numlist[key].logo + "'></a>"
					+ " 	 </div>"
					+ "  </div>"
					+ "  <div class='introduction'>"
					+ "   <h2 class='title autowrap'>" + numlist[key].name  + "</h2>"
					+ " 	 <div class='description autowrap'>课程简介：" + numlist[key].description + "</div>"
					+ "  </div>"
					+ " </div>"
					+ "</li>")
				;
			}
			 $(".num")
				.append(" 页次：" +jsonObj.currentPage+"/" + jsonObj.pageCount + "页&nbsp;"
					+ " 每页显示：" +jsonObj.pageSize+"条 &nbsp;"
					+ " <ul class='pagination'>"
					+ " <li><a href='javascript:gotoPageNum(1)' style='cursor: hand;'>首页</a></li>"
					+ " </ul>");
			for(var i=jsonObj.beginPageIndex; i<=jsonObj.endPageIndex; i++) {  
				if(i==jsonObj.currentPage){
					$(".pagination")
					.append(" <li class='active'><a style='cursor: hand;'>" + i + "<span class='sr-only' >(current)</span></a></li>")
					;

				}else{
					$(".pagination")
					.append(" <li><a onclick='gotoPageNum(" + i +");' style='cursor: hand;'>" + i + "<span class='sr-only' >(current)</span></a></li>")
					;
				}
			}
			$(".pagination")
			.append(" <li><a href='javascript:gotoPageNum('"+ jsonObj.pageCount+")' style='cursor: hand;'>尾页</a></li>");
		}
	});
}