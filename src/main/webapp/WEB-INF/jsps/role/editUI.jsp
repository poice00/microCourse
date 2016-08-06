<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Hello</title>  
<script language="javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
	<script language="javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.treeview.js"></script>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery.treeview.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/file.css" />
<link rel="stylesheet" type="text/css" href="/microCourse/resources/css/admin/bootstrap.min.css">
</head>  
<script type="text/javascript">
	// 选择所有
	function selectAll(checkedValue){
		$("input[type=checkbox][name=privilegeIds]").prop("checked", checkedValue);
	}
	function doChecked( liID, checkedValue ){
		// 当前点击的checkbox元素所在的li元素
		var jLi = $("#" + liID);
		// 选中所有的直属下级。（children()方法是筛选下一级，find()是筛选所有后代）
		jLi.children("ul").find("input[type=checkbox]").prop("checked", checkedValue);
		
		// 选中或取消选中直属上级
		if( checkedValue ){ // checkedValue是boolean型，表示是否选中了当前复选框
			// 如果当前是选中，则选中所有的直属上级
			jLi.parents("li").children("input[type=checkbox]").prop("checked", checkedValue);
		}else{
			// 如果当前是取消选中，并且同级中没有被选中的项，则也取消上级的选中状态
			var jCheckedSibingCB = jLi.siblings("li").children("input[type=checkbox]:checked");
			if(jCheckedSibingCB.size() == 0){
				var jCheckboxInput = jLi.parent("ul").siblings("input[type=checkbox]");
				jCheckboxInput.prop("checked", checkedValue);
				
			 	// 递归操作每一层直属上级
				var jParentLi = jCheckboxInput.parent("li");
				if(jParentLi.size() > 0){
					doChecked(jParentLi.attr("id"), checkedValue);
				} 
			}
	}
} 
	
	
</script>
</head>  
<body>  
  
  <form action="/microCourse/admin/role/edit" method="post" >
  	<input type="hidden" name="id" value="${role.roleId}">
  	
  	<div style="float: left;">
	角色名称:<input type="text" class="form-control" name="name" value="${role.name}" placeholder="输入角色名称" style="width: 300px"><br>
	角色說明:<textarea class="form-control" name="description"  rows="3" placeholder="输入角色描述" style="width: 300px">${role.description}</textarea><br>
	</div>
	
<!-- 表单内容显示 -->
	<div>
			<div>
				角色权限:
			</div>
			<div class="ItemBlockBorder">
				<div class="ItemBlock">
					<table cellpadding="0" cellspacing="0" class="mainForm">
						<!--表头-->
						<thead>
							<tr align="LEFT" valign="MIDDLE" id="TableTitle">
								<td width="300px" style="padding-left: 7px;">
									<input type="CHECKBOX" id="cbSelectAll"
									onClick="selectAll(this.checked)" />
									<label for="cbSelectAll">全选</label>
								</td>
							</tr>
						</thead>

						<!--显示数据列表-->
						<tbody id="TableData">
							<tr class="TableDetail1" >
							<!-- 显示权限树 -->
							<td>
							<ul id="tree">
								<c:forEach items="${topPrivilegeList}" var="item">
									<li id="li_${ item.id}">
										<input type="checkbox" value="${ item.id}"
												name="privilegeIds" id="cb_${ item.id}"  onclick='doChecked("li_${ item.id}", this.checked)' 
													<c:forEach items="${privilegeIds}" var="a">
													 <c:if test="${a==item.id }">checked</c:if> 
													</c:forEach>	 
												 />
										<label for="cb_${ item.id}">
											<span class="folder">${ item.name}</span>
										</label> <br>
										<ul>
											<c:forEach items="${item.children}"  var="children">
												<li id="li_${ children.id}"><input type="checkbox" value="${ children.id}" 
												name="privilegeIds" id="cb_${ children.id}" onclick='doChecked("li_${ children.id}", this.checked)'
												<c:forEach items="${privilegeIds}" var="a"> 
												 <c:if test="${a==children.id }">checked</c:if> 
												 </c:forEach>
												/>
												<label for="cb_${ children.id}">
												<span class="folder">
												${ children.name}</span>
												</label> <br>
													<ul>
													<c:forEach items="${children.children}"  var="childrens">
													<li id="li_${ childrens.id}"><input type="checkbox" value="${ childrens.id}" 
													name="privilegeIds" id="cb_${ childrens.id}" onclick='doChecked("li_${ childrens.id}", this.checked)'
													<c:forEach items="${privilegeIds}" var="a"> 
													 <c:if test="${a==childrens.id }">checked</c:if> 
													 </c:forEach>
													/>
													<label for="cb_${ childrens.id}">
													<span class="folder">
													${ childrens.name}</span>
													</label> <br></li>
											</c:forEach>
												</ul></li>
												
												
											</c:forEach>
										</ul></li>
								</c:forEach>
								
								
							</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	
			</div>					
				<script type="text/javascript">
				$("#tree").treeview();
			</script>
	<br>
		<button type="submit" class="btn btn-success">保存</button>
		 <a href="javascript:history.go(-1);"><button type="button" class="btn btn-default">返回</button></a>
	</form>
</body>  
</html>