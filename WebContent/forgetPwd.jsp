<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <style type="text/css">
        .noaction
        {
            padding-left: 10px;
        }
      
 .login_btn {
    background: none repeat scroll 0 0 #008000;
    border: medium none;
    border-radius: 2px;
    color: #fff;
    font-family: "Microsoft YaHei";
    height: 35px;
    letter-spacing: 1px;
    line-height: 35px;
    text-align: center;
    width: 140px;
}

.blank {
  height:5px;
}

.login_form{
width:500px;
box-shadow: 2px 1px 5px rgba(0,0,0,0.4);
border: 1px solid #EEE;
opacity: 0.95;
font-size:14px;
margin:auto auto;
text-align:center;
}
</style>
</head>
<body>
<div style="height:100px;width:100%;">
<div style="margin-left:40px;margin-top:10px;">
  <img src="imgs/logo.gif">
</div>
</div>
 <div class="login_form">
    <div style="height:300px;width:230px;margin:auto auto">
       <div style="margin-top:100px"><h3>请输入您的邮箱</h3></div>
       <div class="blank"></div>
       <div>
         <input type="text" size="50px"></input>
       </div>
       <div class="blank"></div>
       <div>
         <input type="submit" size="50px" class="login_btn" value="确定"></input>
       </div>
    </div>
 </div>
 <!-- 底部jsp引用 -->
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>