
/*
 *提交新增按钮
 */
function addGoodSubmit() {
	$("#addForm").submit();
}
function addUserSubmit() {
	document.getElementById("addUser").submit();
}
/*
 * 实现二级菜单按钮的显示与隐藏
 */
$(document).ready(function (){
	$("#UserManage").click(function showUser(){
		$("#addU").toggle();
		
		$("#listU").toggle();

	});
	
})
	/*显示新增用户模态框*/
function showAddUserModal(){
	$("#addUserModel").modal('show');
}
/*
 * 获取用户列表信息
 */
var isActive=false;
function showUserList(){
	
	if(!isActive){
	$.ajax({
		url:basepath+"/users",
		type:"post",
		
		dataType:"json",
		timeout : 3000,
		success:function(data){
			console.log(data);
			var str="";
			for(var i in data){
				str+="<tr><td>"+data[i].name+"</td><td>"+data[i].telephone+"</td><td>"+data[i].gender+"</td><td>"+data[i].address+"</td></tr>";
			}
			var result="<table><tr><th>姓名</th><th>电话</th><th>年龄</th><th>住址</th></tr>"+str+"</table>";
			$("#goodsTable").html(result);
			
		},
		error:function(){
			alert("数据传输失败");
		}
		
	});  isActive=true;
	}
}

