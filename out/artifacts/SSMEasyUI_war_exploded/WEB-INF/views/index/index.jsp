<%--
  Created by IntelliJ IDEA.
  User: interface
  Date: 2017/2/16
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
  <head>
    <title>SSMEasyUI</title>
  </head>
  <body>
<form action="<%=path%>/user/login" method="post">
  <input type="email" name="email">
  <input type="password" name="Pwd">
  <input type="submit" value="登入">
</form>
  </body>
</html>
