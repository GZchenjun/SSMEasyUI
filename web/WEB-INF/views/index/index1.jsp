<%--
  Created by IntelliJ IDEA.
  User: interface
  Date: 2017/2/16
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <head>
    <title>SSMEasyUI</title>
    <!-- 配置文件 -->
    <script type="text/javascript"  charset="utf-8"  src="<%=path%>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"  src="<%=path%>/ueditor/ueditor.all.min.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
  </head>
<body>
<script id="container" name="content" type="text/plain" style="width:800px;height:400px;"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
    ue.ready(function() { // 整个编辑器准备好后设置其他属性
        ue.setHeight(300);
    });
</script>

  <form action="<%=path%>/user/login" method="post">
    <input type="email" name="email">
    <input type="password" name="Pwd">
    <input type="submit" value="登入">
  </form>
</body>
</html>
