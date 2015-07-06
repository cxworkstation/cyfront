<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/NEWS_login.css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <style>
<!--注册区域-->
input[type="button"], input[type="submit"], input[type="reset"] {
    background-color: transparent;
    border: 0 none;
    padding: 0;
}
input.register_loginbtn {
    background: none repeat scroll 0 0 #006400 !important;
    border: medium none;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
    height: 29px;
    letter-spacing: 1px;
    line-height: 29px;
    margin: 8px 0 0 10px;
    width: 103px;
}
input, select, textarea {
    font-size: 100%;
}

.blank {
 height: 5px;
}
</style>
</head>
<body>
<div style="height:100px;width:100%;">
<div style="margin-left:40px;margin-top:10px;">
  <img src="imgs/logo.gif">
</div>
</div>
   <div class="register" >
		<div class="register_right fl" style="float:left">
			<div class="register_right_list">
				<div class="register_right_listName">已是春雨农场在线用户：
					<input type="button" value="直接登录" onclick="javascript:window.location.href='user.php?act=login';_czc.push(['_trackEvent', '注册', 'Login']);" class="register_loginbtn">
				</div>
			</div>

			<div class="news_loginRight_pic" style="margin-left:-7px;">
				<a href='#' target='_blank'><img src='imgs/1420710170036691181.png' width='367' height='321' border='0' /></a>
			</div>

			<div class="crm_module zhuce">
		      <style type="text/css">
		      #subscription-prompt{position: absolute;top: 267px;left:5px;display:none;width: 250px;padding: 2px 0;text-align: center; color:#34772A;border:1px solid #D9D3BB;background:#FFFDEE;}
		      .zhuce {background: none;width: 430px;height: 97px;float: left;margin-top: 8px;margin-left: -7px;position: relative;}
		      </style>
		      <script type="text/javascript">
		        $('#form_dy').submit(function(){
		          var email=$(this).find('input[name=email]').val();
		          $.post($(this).attr('action'),{'email':email},function(data){
					$('#subscription-prompt').html(data.msg).show().delay(5000).fadeOut(400)();
		          },'json')
		          return false;
		        });
		      </script>
		    </div>
		</div>		
		
		<div class="register_left fl" style="width:600px;float:right">
			<div class="register_mail">
				<div class="register_numName fl">填写您的信息：</div>
				<div id="regDiv">
				 <form action="user.php" method="post" name="formUser" onsubmit="return register();">
				<ul class="register_list" style="">
					<li>
					    <div class="register_list_name">手机号：</div>
                        <input name="username" type="text" size="25" id="username" onblur="is_registered(this.value);" class="register_list_txt"/>
                        <span id="username_notice" style="color:#FF0000"> *</span>
					</li>
                    <li><div class="register_list_neirong">手机号是为了在送单时与您取得联系，也可以作为用户名</div></li>
					<li>
					    <div class="register_list_name">Email：</div>
                        <input name="email" type="text" size="25" id="email" onblur="checkEmail(this.value);"  class="register_list_txt"/>
						<span id="email_notice" style="color:#FF0000"> *</span>
					</li>
					<li><div class="register_list_neirong">Email方便接收账户信息、订单通知及密码找回等功能，也可以作为用户名</div></li>
					<li>
					    <div class="register_list_name">地址：</div>
                        <input name="email" type="text" size="25" id="email" onblur="checkEmail(this.value);"  class="register_list_txt"/>
						<span id="email_notice" style="color:#FF0000"> *</span>
					</li>
					<li><div class="register_list_neirong">默认收获地址，可以在用户管理中进行更改</div></li>
					<li><div class="register_list_name">密码：</div>
                        <input name="password" type="password" id="password1" onblur="check_password(this.value);" onkeyup="checkIntensity(this.value)" class="register_list_txt">
						<span style="color:#FF0000" id="password_notice"> *</span>
					</li>
                    <li class="blank"></li>
					<li><div class="register_list_name">确认密码：</div>
                        <input name="confirm_password" type="password" id="conform_password" onblur="check_conform_password(this.value);" class="register_list_txt">
						<span style="color:#FF0000" id="conform_password_notice"> *</span>
					</li>
					<li>
						<input type="hidden" name="back_act" value="">
						<input type="hidden" name="parent_id" value="0">
						<input type="hidden" name="act" value="act_register">
                        <label style="margin-left:120px;"><input name="agreement" type="checkbox" value="1" checked="checked" />我已看过并接受《<a href="#" style="color:blue" target="_blank">用户协议</a>》</label><br/>
						<input id="reg_email_submit" type="submit" class="register_list_regree" value="同意协议并注册" onclick="_czc.push(['_trackEvent', '注册', 'Agree']);">
					</li>
				</ul>
				</form>
				</div>
			</div>
		</div>
	</div>
    <!-- 底部jsp引引用 -->
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>