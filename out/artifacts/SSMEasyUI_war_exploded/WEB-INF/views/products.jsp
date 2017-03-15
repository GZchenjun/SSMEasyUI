<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
    
    <%
    	String path = request.getContextPath();
    %>
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path%>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path%>/css/main.css" />
	<!-- 配置文件 -->
<script type="text/javascript"  charset="utf-8"  src="<%=path%>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"  src="<%=path%>/ueditor/ueditor.all.min.js"></script>
	<!-- 编辑器源码文件 -->
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>

<script>
	$(function() {
		setPagination("list");
	});
	
	function showAddProductWin() {
		$("#addForm").form("clear"); // 清除表单里的所有数据
		$("#addWin").window("open"); // 打开指定的window， open表示打开，close表示关闭
	}
	
	function addProduct() {
		if ($("#addForm").form("validate")) {
			$.post("<%=path %>/product/add",
				$("#addForm").serialize(),
				function (data) {
					if (data.result == "success") {
						$("#addWin").window("close"); // 关闭指定的窗口
						$("#list").datagrid("reload"); // 重新加载指定数据网格数据
						$.messager.alert("提示", data.message, "info");
					} else if (data.result == "fail") {
						$.messager.alert("提示", data.message, "info");
					}
			}, "json"
			);
		} else {
			$.messager.alert("提示", "请输入正确的数据", "info");
		}
	}
	
	function showEditProductWin() {
		var row = $("#list").datagrid("getSelected"); // 获取数据表格中被选中的行数据
		if (row) { // 有选中的行
			$("#editForm").form("load", row);
		 	$("#editWin").window("open");
		} else {
			$.messager.alert("提示", "请先选择需要修改的商品", "info");
		}
	}
	
	function editProduct() {
		if ($("#editForm").form("validate")) {
			$.post("<%=path %>/product/update",
					$("#editForm").serialize(),
					function (data) {
						if (data.result == "success") {
							$("#editWin").window("close"); // 关闭指定的窗口
							$("#list").datagrid("reload"); // 重新加载指定数据网格数据
							$.messager.alert("提示", data.message, "info");
						} else if (data.result == "fail") {
							$.messager.alert("提示", data.message, "info");
						}
				}, "json"
				);
		} else {
			$.messager.alert("提示", "请输入正确的表单数据", "info");
		}
	}
	
	function removeProduct() {
		var row = $("#list").datagrid("getSelected");
		if (row) {
			$.messager.confirm("提示", "确定删除吗？", function (r) {
				if (r) { // 点击了确定按键
					$.get("<%=path %>/product/deleteProduct?id=" + row.id, function (data) {
						$("#list").datagrid("reload");
					}, "json");
				}
			})
		} else {
			$.messager.alert("提示", "请先选择需要删除的商品", "info");
		}
	}
	
	function showDlg() {
		$("#dlg").dialog("open"); // 打开对话框   close关闭对话框 
	}
    function pwdName(value, row, index){
        if(row.pwd == " "){
            return "未填写密码"
        }else{
            return row.pwd
		}
    }
    function phoneName(value,row,index){
        if(row.phone == "0"){
            return "未填写手机号码"
		}else{
          return row.phone
		}
	}
	function qqName(value,row,index){
        if(row.qq =="0"){
            return "未填写QQ"
		}else{
            return row.qq
		}
	}
</script>

</head>
<body style="height:100%;">

<table id="list" class="easyui-datagrid"
			data-options="toolbar:'#tb',singleSelect:true,
			collapsible:true,
			url:'<%=path %>/product/pager',
			method:'get',
			rownumbers:true,
			autoRowHeight:true,
			pagination:true,
			pageSize:20" style="height:100%;">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true">编号</th>
				<th data-options="field:'name_id',width:150">业务名称</th>
				<th data-options="field:'number_id',width:180">订单号</th>
				<shiro:hasRole name="admin">
					<th data-options="field:'price',width:50">业务价格</th>
				</shiro:hasRole>

				<th data-options="field:'qq',width:80" formatter="qqName">QQ</th>
				<th data-options="field:'pwd',width:150" formatter="pwdName" >密码</th>
				<th data-options="field:'phone',width:150" formatter="phoneName">手机号码</th>
				<th data-options="field:'des',width:180">处理状态</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<shiro:hasRole name="admin">
				<a href="javascript:;" onclick="showAddProductWin();" class="easyui-linkbutton" iconCls="icon-add">添加订单</a>
				<a href="javascript:;" onclick="removeProduct();" class="easyui-linkbutton" iconCls="icon-remove">删除订单</a>
				<a href="javascript:;" onclick="showDlg();" class="easyui-linkbutton" iconCls="icon-search">显示对话框</a>
				<a href="javascript:;" onclick="showEditProductWin();" class="easyui-linkbutton" iconCls="icon-edit">编辑订单</a>
			</shiro:hasRole>
			<a target="_blank"  class="easyui-linkbutton" href="http://wpa.qq.com/msgrd?v=3&uin=206350917&site=qq&menu=yes" class="easyui-linkbutton" ><img border="0" src="http://wpa.qq.com/pa?p=2:206350917:51" alt="联系客服" title="联系客服" /></a>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" title="添加订单" data-options="closed:true" style="width:500px;height:300px;">
		<form id="addForm">
			<table>
				<tr>
					<td>业务名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="name_id" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>订单号</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="number_id" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>业务价格</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="price" data-options="required:true,precision:2"/></td>
				</tr>
				<tr>
					<td>QQ号码</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="qq" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input class="easyui-textbox" name="pwd" data-options="required:false"/></td>
				</tr>
				<tr>
					<td>手机号码</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="phone" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>处理结果</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="des" style="height:100px;"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="addProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window" title="修改订单" data-options="closed:true" style="width:500px;height:300px;">
		<form id="editForm">
			<input type="hidden" name="id" />
			<table>
				<tr>
					<td>业务名称</td>
					<td><input class="easyui-validatebox easyui-textbox" name="name_id" data-options="required:true,validType:'length[2,20]'"/></td>
				</tr>
				<tr>
					<td>订单号</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="number_id" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>业务价格</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="price" data-options="required:true,precision:2"/></td>
				</tr>
				<tr>
					<td>QQ号码</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="qq" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><input class="easyui-textbox" name="pwd" data-options="required:false"/></td>
				</tr>
				<tr>
					<td>手机号码</td>
					<td><input class="easyui-validatebox easyui-numberbox" name="phone" data-options="required:true"/></td>
				</tr>
				<tr>
					<td>处理结果</td>
					<td><input class="easyui-textbox" data-options="multiline:true" name="des" style="height:100px;"/></td>
				</tr>
				<tr>
					<td>
						<a href="javascript:;" onclick="editProduct();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">确认</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg" class="easyui-dialog" title="记事本" data-options="closed:true" style="width:75%;height:500px;">
		<script id="container" name="content" type="text/plain" style="width:800px;height:400px;"></script>
		<!-- 实例化编辑器 -->
		<script type="text/javascript">
            var ue = UE.getEditor('container');
            ue.ready(function() { // 整个编辑器准备好后设置其他属性
                ue.setHeight(300);
            });
		</script>
	</div>

</body>
</html>