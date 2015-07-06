<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/NEWS_login.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<style type="text/css">
.news_loginLeft_list li {
  padding-left:30px;
}
</style>
</head>
<body>
<div style="height:100px;width:100%;">
<div style="margin-left:40px;margin-top:10px;">
  <img src="imgs/logo.gif">
</div>
</div>
<div class="news_login" style="height:397px;">
		<div class="news_loginRight">
			<a href='#'target='_blank'><img src='imgs/1420710170036691181.png' width='367' height='321' border='0' style="float:right"/></a>
		</div>	  
		
		<div class="news_login_left">
	    <div class="login_form">
			  <h1 class="news_login_title">用户登录</h1>
			<form name="formLogin" action="user.php" method="post" onSubmit="return userLogin()">
				<div class="news_loginLeft">
					<ul class="news_loginLeft_list">
						<li>
							<input name="username" type="text" size="25" maxlength="50" class="new_loginTxt" placeholder="邮箱/手机号">
						</li>
						<li>
							<input name="password" type="password" size="15" maxlength="30" class="new_loginTxt" placeholder="密码">
						</li>
						<li style="padding:0px;">
						   <span id="message" class="login_error">错误信息</span>
						</li>
						<li style="text-align:center;margin-top:0px;padding:0px;">
							<input type="submit" name="submit" value="登录" class="login_btn" />
						</li>
						<li style="margin-left:80px;height:30px;line-height:30px;">
						  <a href="#" onclick="_czc.push(['_trackEvent','登陆','注册']);" style="float:left;">注册</a>
						  <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						  <a href="#" onclick="_czc.push(['_trackEvent','登陆','忘记密码']);">忘记密码?</a>
						</li>
						<li style="margin-left:80px;height:20px;"></li>
					</ul>
				</div>
				</form>
		  </div>
		 </div>
	</div>	  
<!-- 尾部jsp引用 -->
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>