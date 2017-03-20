
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>	
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="<%=path%>/css/style.css" rel='stylesheet' type='text/css' />
<script src="<%=path%>/js/jquery.min.js"></script>
</head>
<body>
<script>$(document).ready(function(c) {
	$('.close').on('click', function(c){
		$('.login-form').fadeOut('slow', function(c){
	  		$('.login-form').remove();
		});
	});	  
});
</script>
 <!--SIGN UP-->
 <h1>供货订单管理系统</h1>
<div class="login-form">
	<div class="close"> </div>
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar">
		<img src="<%=path%>/images/avtar.png" />
	</div>
			<form action="<%=path%>/user/login" method="post">
					<input type="text" class="email" value="邮箱"  name="email"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '邮箱';}" >
						<div class="key">
					<input type="password" value="密码" name="pwd" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码';}" >
						</div>

	<div class="signin">
		<input type="submit" value="Login" >
	</div>
			</form>
</div>
 <div class="copy-rights">
					<p>Copyright &copy; 2017.Company</p>
 </div>

</body>
</html>