<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragrma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>库存管理系统</title>
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/home.css">
<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${basePath}/js/goods.js"></script>
<script src="https://cdn.staticfile.org/vue/2.4.2/vue.min.js"></script>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="https://cdn.bootcss.com/Base64/1.0.2/base64.min.js"></script>
<body>
	<div style="position: relative;">
		<div id="main">
			<div id="header">
				<div class="logo">
					<img src="images/logo.png">
				</div>
				<div class="search">
					<form class="navbar-form" role="search">
						<div class="form-group">
							<select class="choose">
								<option>货物名称</option>
								<option>货物类型</option>
								<option>产品产地</option>
							</select> <input type="text" class="form-control" placeholder="请先选择搜索类型">

							<button type="submit" class="btn btn-default">搜索</button>
						</div>
					</form>
				</div>
				<div class="show">

					<div class="userLogo">
						<a href="#"><img src="images/userLogo.png"></a>
					</div>
					<span id="userSpan">欢迎您，${user.name}&nbsp;&nbsp;<a
						href="${basePath}/logout">【退出】</a></span>

				</div>
			</div>
			<div id="main_content">
				<div id="main_content_left">
					<div style="height: 60px; width: 100%; background-color: #E8E8E8"></div>
					<div class="list-group center">
						<button type="button" class="list-group-item center">功能区</button>
						<button type="button" class="list-group-item center"
							id="goodManage">库存管理</button>

						<button type="button" class="list-group-item center manageButton"
							id="addGood" onclick="showAddGood()">货物入库</button>

						<button type="button" class="list-group-item center"
							id="UserManage">用户管理</button>
						<button type="button" class="list-group-item center manageButton"
							id="listU" onclick="showUserList()">用户列表</button>
						<button type="button" class="list-group-item center manageButton"
							id="addU" onclick="showAddUserModal()">新增用户</button>

					</div>
				</div>
				<div id="main_content_body">
					<div id="new">

						<a class="btn btn-default btn-primary" data-toggle="modal"
							data-target="#addGoods" data-dismiss="modal" role="button">新增库存</a>
						<a class="btn btn-default btn-primary" href="${basePath}/home">查询库存</a>
					</div>
					<div class="goodList">
						<table id="goodsTable">
							<tr class="goodTittle">
								<th><input type="checkbox" name="">全选</th>
								<th>序号</th>
								<th class="A">名称</th>
								<th>型号</th>
								<th class="A">产地</th>
								<th>单价</th>
								<th>库存</th>
								<th>总价</th>
								<th colspan="3" style="width: 150px;">操作</th>
							</tr>
							<c:forEach items="${goodList}" var="goods" varStatus="status">
								<c:if test="${status.index%2==0}">
									<tr bgcolor="#BEBEBE">
										<td width="5%"><input type="checkbox" name="" /></td>
										<td width="5%">${status.index+1}</td>
										<td width="15%">${goods.goodName}</td>
										<td width="10%">${goods.goodType}</td>
										<td width="20%">${goods.goodProduct}</td>
										<td width="10%">${goods.goodPrice}</td>
										<td width="10%">${goods.goodNum}</td>
										<td width="10%">${goods.goodNumPrice}</td>
										<td width="5%"><a class="btn btn-default btn-primary"
											id="editButton" role="button" onclick="edit(${goods.gId})">编辑</a></td>
										<td width="5%"><a class="btn btn-default btn-success"
											data-toggle="modal" data-dismiss="modal" role="button"
											id="editButton" onclick="query(${goods.gId})">查看</a></td>
										<td width="5%"><a class="btn btn-default btn-danger"
											href="${basePath}/deleteGood/${goods.gId}" role="button">删除</a></td>
									</tr>
								</c:if>
								<c:if test="${status.index%2!=0}">
									<tr>
										<td width="5%"><input type="checkbox" name="" /></td>
										<td width="5%">${status.index+1}</td>
										<td width="15%">${goods.goodName}</td>
										<td width="10%">${goods.goodType}</td>
										<td width="20%">${goods.goodProduct}</td>
										<td width="10%">${goods.goodPrice}</td>
										<td width="10%">${goods.goodNum}</td>
										<td width="10%">${goods.goodNumPrice}</td>
										<td width="5%"><a class="btn btn-default btn-primary"
											role="button" onclick="edit(${goods.gId})">编辑</a></td>
										<td width="5%"><a class="btn btn-default btn-success"
											data-toggle="modal" data-dismiss="modal" role="button"
											id="editButton" onclick="query(${goods.gId})">查看</a></td>
										<td width="5%"><a class="btn btn-default btn-danger"
											href="${basePath}/deleteGood/${goods.gId}" role="button">删除</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>

				</div>

			</div>
			<div id="footer">
				<span>@copyright:liuquanhui</span>
			</div>
		</div>
	</div>
	<!-- 新增货物模态框（Modal） -->
	<div class="modal fade" id="addGoods" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">录入库存</h4>
				</div>
				<div class="modal-body">
					<form action="${basePath}/goodlist" method="post" id="addForm">
						<input type="text" name="goodName" placeholder="请输入货物名称："><br />
						<input type="text" name="goodType" placeholder="请输入货物类型："><br />
						<input type="text" name="goodProduct" placeholder="请输入生产地："><br />
						<input type="text" name="goodPrice" placeholder="请输入货物单价："
							v-model="price" id="goodPrice"><br /> <input type="text"
							name="goodNum" placeholder="请输入货物数量：" v-model="goodNum"
							id="goodNum"><br /> <input type="text"
							name="goodNumPrice" id="goodNumPrice" v-model="Calculated"
							placeholder="货位总价值为：" readonly="readonly">
					</form>
				</div>
				<script type="text/javascript">
				var basepath="${basePath}";
					var vm = new Vue({
						el : '#addForm',
						data : {
							price : '',
							goodNum : '',
							Calculated : ''
						},
						watch : {
							goodNum : function(val) {
								
								this.Calculated = parseFloat(this.price)
										* parseInt(val);

								if(isNaN(this.Calculated)){
									this.Calculated="";
								}
								
					
							},
							price : function(val) {
								
								this.Calculated = parseFloat(val)
										* parseInt(this.goodNum);
								
									if(isNaN(this.Calculated)){
										this.Calculated="";
									}
							}
						}
					});
					function showAddGood(){
						$("#addGoods").modal('show');
					}
					
					$("#goodManage").click(function showGood(){
						$("#addGood").toggle();
					})
					
				</script>
				<div class="modal-footer center">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" id="btn_submit" class="btn btn-default"
						data-dismiss="modal" onclick="addGoodSubmit()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 查看（Modal） -->
	<div class="modal fade" id="findForm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">查看</h4>
				</div>
				<div class="modal-body" id="edit">

					<input id="checkOne" type="text" name="goodName"
						readonly="readonly"><br /> <input id="checkTwo"
						type="text" name="goodType" readonly="readonly"><br /> <input
						id="checkThird" type="text" name="goodProduct" readonly="readonly"><br />
					<input id="checkFour" type="text" name="goodPrice"
						readonly="readonly"><br /> <input id="checkFive"
						type="text" name="goodNum" readonly="readonly"><br /> <input
						id="checkSix" type="text" name="goodNumPrice" id="goodNumPrice"
						readonly="readonly">
					<script type="text/javascript">
						function query(id){
							$.ajax({
								url:"${basePath}"+"/queryGood/"+id,
								type:"post",
								data:{
									id:id
								},
								datatype:"json",
								success:function(data){
									$("#checkOne").val(data.goodName);
								    $("#checkTwo").val(data.goodType);
								    $("#checkThird").val(data.goodProduct);
								    $("#checkFour").val(data.goodPrice);
								    $("#checkFive").val(data.goodNum);
								    $("#checkSix").val(data.goodNumPrice);
						
								    // 显示模态框
								    $('#findForm').modal('show');
				
									
								},
								error:function(){
									alert("数据传输异常");
								}
							
							});
						}	
						
					</script>
				</div>
				<div class="modal-footer center">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 编辑（Modal） -->
	<div class="modal fade" id="editForm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑</h4>
				</div>
				<div class="modal-body">

					<form action="${basePath}/updateGood/updateForm" method="post">
						<input id="gId" type="text" name="gId" hidden="hidden"><br />
						<input id="goodName" type="text" name="goodName"><br /> <input
							id="goodType" type="text" name="goodType"><br /> <input
							id="goodProduct" type="text" name="goodProduct"><br /> <input
							type="text" name="goodPrice" id="egoodPrice"><br /> <input
							type="text" name="goodNum" id="egoodNum"><br /> <input
							type="text" name="goodNumPrice" id="egoodNumPrice"
							readonly="readonly"><br /> <input type="submit"
							value="保存">
					</form>
					<script>
					function edit(id){
						$.ajax({
							url:"${basePath}"+"/updateGoodById/"+id,
							type:"post",
							data:{
								id:id
							},
							datatype:"json",
							success:function(data){
								
								$("#gId").val(data.gId);
							    $("#goodName").val(data.goodName);
							    $("#goodType").val(data.goodType);
							    $("#goodProduct").val(data.goodProduct);
							    $("#egoodPrice").val(data.goodPrice);
							    $("#egoodNum").val(data.goodNum);
							    $("#egoodNumPrice").val(data.goodNumPrice);
					
							    // 显示模态框
							    $('#editForm').modal('show');
			
								
							},
							error:function(){
								alert("数据传输异常");
							}
						
						});
					}
					</script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 新增用户模态框（Modal） -->
	<div class="modal fade" id="addUserModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel">新增用户</h4>
				</div>
				<div class="modal-body">
					<form action="${basePath}/user" method="post" id="addUser">
						<input type="text" name="name" placeholder="请输入用户姓名" /><br /> <input
							type="text" name="telephone" placeholder="请输入手机号" /><br /> <input
							type="text" name="password" value="888888" /><br /> <input
							type="text" name="address" placeholder="请输入地址" /><br /> <input
							type="text" name="gender" placeholder="请输入性别" /><br />
					</form>
				</div>
				<div class="modal-footer center">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" id="btn_submit" class="btn btn-default"
						data-dismiss="modal" onclick="addUserSubmit()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 编辑用户（Modal） -->
	<div class="modal fade" id="editUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑</h4>
				</div>
				<div class="modal-body">

					<form action="${basePath}/updateUser/" method="post">
						<input id="uid" type="text" name="uid" hidden="hidden"><br />
						<input id="name" type="text" name="name"><br /> <input
							id="telephone" type="text" name="telephone"><br /> <input
							id="password" type="text" name="password"><br /> <input
							type="text" name="gender" id="gender"><br /> <input
							type="text" name="address" id="address"><br /> <input
							type="submit" value="保存">
					</form>
					<script>
					function editUser(id){
						$.ajax({
							url:"${basePath}"+"/updateUserById/",
							type:"post",
							data:{
								id:id
							},
							datatype:"json",
							success:function(data){
								
								$("#uid").val(data.uid);
							    $("#name").val(data.name);
							    $("#telephone").val(data.telephone);
							    $("#password").val(data.password);
							    $("#gender").val(data.gender);
							    $("#address").val(data.address);
							    // 显示模态框
							    $('#editUser').modal('show');
			
								
							},
							error:function(){
								alert("数据传输异常");
							}
						
						});
					}
					$(function(){ 
						pushHistory(); 
						 
						function pushHistory() { 
						var state = { 
						title: "title", 
						url: basepath+"/login"
						}; 
						window.history.pushState(state, "title", "${basePath}/login"); 
						} 
						});
					</script>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
</body>
</html>