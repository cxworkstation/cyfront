<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath%>css/base.css" />
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath%>css/common.css" />
</head>
<body>
 <!-- 头部jsp引用 -->
   <jsp:include page="../header1.jsp"></jsp:include>
<div class="wrapper clearfix">
  <div class="AreaL">
  <div id="categortyu">
    	<dl>
        	<dt><strong>用户中心</strong></dt>
			<div style="clear:both"></div>
            <dd>
	             <h2 class="curs1">帐户中心</h2>
	              <ul>
			 		<li ><p><a href="user.php?act=profile">用户信息</a></p></li>  
                   </ul>
				<h2 class="curs1">订单管理</h2>
	             <ul>
					<li class="curs"><p><a rel="nofollow" href="#">我的订单</a></p></li>
					<li ><p><a href="#">收货地址</a></p></li>
					<li ><p><a href="#">我的收藏</a></p></li>
					<li ><p><a href="#">我的评论</a></p></li>	
					<li><p><a href="#">安全退出</a></p></li>
                </ul>
            </dd>
        </dl>
     </div>
  </div>
  
  <div class="AreaR">
    <div class="box">
     <div class="box_1">
      <div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
      <h5><span>我的订单</span></h5>
       <div class="blank"></div>
       <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
          <tr align="center">
            <td bgcolor="#ffffff">订单号</td>
            <td bgcolor="#ffffff">下单时间</td>
            <td bgcolor="#ffffff">订单总金额</td>
            <td bgcolor="#ffffff">订单状态</td>
            <td bgcolor="#ffffff">操作</td>
          </tr>
                    </table>
        <div class="blank5"></div>
       
       <form name="selectPageForm" action="#" method="get">
          <div class="turnpage clearfix">
            <div class="turnpage_4">共<span class="zi14hong">0</span>个</div>
			  <div class="turnpage_2">
				<div class="pages">
                    <a>上一页</a>							
					<a>下一页</a>  
				</div>
			 </div>
		 </div>
      </form>
      <div class="blank"></div>
      </div>
     </div>
    </div>
  </div>
</div>
<div class="blank"></div>
</html>