<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContextPath();
    %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CJSmart</title>
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path %>/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path %>/js/main.js"></script>
<script>
	function exit(){
        window.location.href = "<%=path %>/user/exit"
	}
</script>
	<style>
		a{
			text-decoration:none;
		}
	</style>
</head>
<body class="easyui-layout">
		<div data-options="region:'north'" style="height:60px">
			<img src="<%=path%>/images/2131.png" class="logo" />
			<div id="wel">
				欢迎您：<shiro:principal/>,<a href="javascript:;" onclick="exit();">退出登入</a>
			</div>
		</div>
		<div data-options="region:'west',split:true" title="菜单" style="width:240px;">
			<div class="easyui-accordion menu" style="width:240px;">
				<div title="供货卡盟管理">
					<ul>
						<li><a href="javascript:;" onclick="addTab('所有订单','<%=path %>/product/showProduct');">所有订单</a></li>
						<li><a href="javascript:;" onclick="addTab('起点卡盟','http://qdian.99ka.cn');">起点卡盟</a></li>
						<%--<li><a href="javascript:;" onclick="addTab('俊轩卡盟','http://www.jxwlcw.com');">俊轩卡盟</a></li>--%>
						<li><a href="javascript:;" onclick="addTab('哎哟卡盟','http://www.aiyowokao.com');">哎哟卡盟</a></li>
					</ul>
				</div>
				<div title="用户管理">
					<ul>
						<li><a href="#">修改密码</a></li>
						<li>系统参数</li>
						<li>系统公告</li>
						<li>系统监测</li>
					</ul>
			</div>
				<div title="消息管理">
					<ul>
						<li><a href="#">修改密码</a></li>
						<li>系统参数</li>
						<li>系统公告</li>
						<li>
							<ul class="easyui-tree">
								<!-- 这是第一个一级菜单 -->
								<li>
									<span>多级目录1</span>
									<ul>
										<li><a href="javascript:;" onclick="addTab('修改密码','http://www.baidu.com');">目录1</a></li>
										<li>目录2</li>
										<li>目录3</li>
									</ul>
								</li>
								<!-- 这是第二个一级菜单 -->
								<li data-options="state:'closed'"><!-- 默认为关闭状态 -->
									<span>多级目录2</span>
									<ul>
										<li>目录1</li>
										<li>目录2</li>
										<li>目录3</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">
				<div title="主页" style="padding:10px">
					<img src="<%=path%>/images/2131.png" style="width:100%;height:475px;">
				</div>
			</div>
		</div>
		<div data-options="region:'south',split:false" style="text-align:center;">Copyright&copy;junxuan 2017-2020</div>

		<!-- 菜单窗口 -->
		<div id="mm" class="easyui-menu cs-tab-menu">
			<div id="mm-tabupdate">刷新</div>
			<div class="menu-sep"></div>
			<div id="mm-tabclose">关闭</div>
			<div id="mm-tabcloseleft">关闭左边选项卡</div>
			<div id="mm-tabcloseright">关闭右边选项卡</div>
			<div id="mm-tabcloseother">关闭其他</div>
			<div id="mm-tabcloseall">关闭全部</div>
		</div>
</body>
</html>