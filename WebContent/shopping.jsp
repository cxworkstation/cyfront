<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物流程</title>
<link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/shopping.css" />

 <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 
 
    <script type="text/javascript">
        $(document).ready(function() {
           $('.i_category').css('display','none');
           
        });
    </script>
    
    <style type="text/css">
        .noaction
        {
            padding-left: 10px;
        }
      
/*
@media all and (min-width: 0px) and (max-width: 1190px) {
.search {
    width: 415px;
}
}
@media all and (min-width: 1191px) and (max-width: 99999px) {
.search {
    width: 635px;
}
}  
*/
 .tg-search-box {
    background-color: #fff;
    float: left;
    height: 41px;
    margin-left: 2px;
    margin-top: 2px;
    width: 350px;
}
/*
@media all and (min-width: 0px) and (max-width: 1190px) {
 .tg-search-box {
    width: 300px;
}
}
@media all and (min-width: 1191px) and (max-width: 99999px) {
.tg-search-box {
    width: 510px;
}
}
*/
.tg-search-box input {
    border: 0 none;
    color: #333;
    font-size: 14px;
    height: 20px;
    line-height: 20px;
    margin: 12px 10px 0;
    outline: 0 none;
    padding: 0;
    text-indent: 0;
    width: 300px;
}
/*
@media all and (min-width: 0px) and (max-width: 1190px) {
.tg-search-box input {
    width: 200px;
}
}
@media all and (min-width: 1191px) and (max-width: 99999px) {
.tg-search-box input {
    width: 490px;
}
}
*/
.tg-search-btn {
    float: right;
    height: 45px;
    width: 80px;
}
.tg-search-btn button {
    background: none repeat scroll 0 center rgba(0, 0, 0, 0);
    border: 0 none;
    cursor: pointer;
    font-size: 18px;
    height: 100%;
    line-height: 45px;
    margin: 0;
    outline: 0 none;
    padding: 0;
    text-align: center;
    width: 100%;
}
.tg-search-btn button span {
    color: #fff;
}

<!--选项卡-->
.i_tab {
    float: left;
    margin-left: 10px;
    width: 791px;
}
.tab_tit ul {
    border-bottom: 2px solid #be000e;
    color: #9f9f9f;
    font-size: 14px;
    height: 29px;
    text-align: center;
}
.tab_tit ul li {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #f3f3f3;
    border-color: #d2d2d2 #d2d2d2 #be000e -moz-use-text-color;
    border-image: none;
    border-style: solid solid solid none;
    border-width: 1px 1px 2px medium;
    cursor: default;
    float: left;
    height: 29px;
    line-height: 29px;
    width: 196px;
}
.tab_tit .on {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background: url("imgs/tab_bj.gif") repeat-x scroll 0 0 rgba(0, 0, 0, 0);
    border-color: #be000e #be000e -moz-use-text-color;
    border-image: none;
    border-style: solid solid none;
    border-width: 2px 2px medium;
    color: #9a2d0f;
}
.tab_cont {
    margin-top: 11px;
    text-align: center;
}
.tab_cont ul li {
    background: url("imgs/li_line.gif") no-repeat scroll 176px center rgba(0, 0, 0, 0);
    float: left;
    height: 200px;
    width: 196px;
}
.tab_cont .t_tit {
    height: 20px;
    line-height: 20px;
    margin-top: 5px;
    overflow: hidden;
}
.tab_cont .t_price {
    line-height: 20px;
    margin-top: 5px;
}
.tab_cont .t_price .b_span {
    color: #9d2910;
    display: inline-block;
    font-size: 14px;
    font-weight: bold;
    margin-right: 10px;
}
.tab_cont .t_price .gry_span {
    text-decoration: line-through;
}
.tab_ad {
    float: left;
    width: 207px;
}
.tab_ad .weixin {
    height: 80px;
    width: 207px;
}
.tab_ad .weixin .tip {
    color: #000000;
    display: inline-block;
    float: right;
    width: 128px;
}
.tab_ad .weixin .tip p {
    line-height: 17px;
    margin-top: 3px;
}
.tab_ad img {
    display: inline-block;
    float: left;
    margin-left: 6px;
}

</style>
</head>
<body>
   <!-- 头部jsp引用 -->
   <jsp:include page="header.jsp"></jsp:include>
   
  <div class="wrapper" style="width:983px;margin:auto auto">
   <div style="border:dashed gray 0.5px;width:982px;">
	 <font color="#f40" style="font-size:2em;font-weight:bold;">我的购物车</font>
   </div>
  <div class="blank"></div>
  <form id="formCart" name="formCart" method="post" action="flow.php">
   <table align="center" class="orderbox" bgcolor="#eeeeee" border="0" cellpadding="3" cellspacing="0" width="100%" height="32">
    <tbody>
     <tr>
       <td class="flowtitle" align="center" valign="middle" width="100" style="line-height:16px;">
         <input type="checkbox" >&nbsp;全选
       </td>
       <td class="flowtitle" align="center" valign="middle" width="300"><div class="pl10">商品名称</div></td> 
       <td class="flowtitle" align="center" valign="middle" width="100">属性</td>
       <td class="flowtitle" align="center" valign="middle" width="100">市场价</td>
       <td class="flowtitle" align="center" valign="middle" width="100">本店价</td>
       <td class="flowtitle" align="center" valign="middle" width="100">购买数量</td>
       <td class="flowtitle" align="center" valign="middle" width="100">小计</td>
       <td class="flowtitle" align="center" valign="middle" width="100">操作</td>
    </tr>
  </tbody>
 </table>
 
 <table class="orderboxn" style="font-size: 12px; line-height: 18px;" align="center" border="0" cellpadding="3" cellspacing="0" width="100%">
  <tr>
    <td  width="100" align="center">
      <input type="checkbox" >
    </td>
    <td bgcolor="#ffffff" align="center" width="300">
      <div class='p-img'><a href="#" target="_blank">
      <img src="imgs/g1_150_0.jpg" border="0" title="美国新奇士脐橙 40个/箱 2箱起售" style="margin-left:52px;"/></a></div>
      <div class="p-text">
        <a href="#" target="_blank">美国新奇士脐橙 40个/箱 2箱起售</a>
      </div>
   </td>
   <td bgcolor="#ffffff" align="center" width="100"></td>
   <td align="center" bgcolor="#ffffff" width="100" class="market_s">￥160.00元</td>
   <td align="center" bgcolor="#ffffff" width="100">￥320.00元</td>
   <td align="center" bgcolor="#ffffff" width="100">
          <script language="javascript" type="text/javascript">
                function goods_cut($val){
                    var num_val=document.getElementById('number'+$val);
                    var new_num=num_val.value;
                    if(isNaN(new_num)){alert('请输入数字');return false}
                    var Num = parseInt(new_num);
                    if(Num>1)Num=Num-1;
                    num_val.value=Num;
                    document.getElementById('updatecart').click();
                }
                function goods_add($val){
                    var num_val=document.getElementById('number'+$val);
                    var new_num=num_val.value;
                    if(isNaN(new_num)){alert('请输入数字');return false}
                    var Num = parseInt(new_num);
                    Num=Num+1;
                    num_val.value=Num;
                    document.getElementById('updatecart').click();
                }
            </script>
       <div class="cartnum">              
        <a href="javascript:void(0);"  onclick="goods_cut('282');" class="imgl"></a>
        <input type="text" name="goods_number[282]" onchange="document.getElementById('update_btn').click()" id="number282" value="1" size="4" class="inum" title=""/>
        <a href="javascript:void(0);"  onclick="goods_add('282');" class="imgr"></a>
      </div>
    </td>
    <td align="center" bgcolor="#ffffff" width="100" class="f1 f5">￥320.00元</td>
    <td align="center" bgcolor="#ffffff" width="100">
      <a href="javascript:if (confirm('您确实要把该商品移出购物车吗？')) location.href='flow.php?step=drop_goods&amp;id=282'; " class="f7">删除</a>
    </td>
   </tr>
   <tr>
    <td colspan="8">
		<table width="100%" align="center" border="0" cellpadding="5" cellspacing="0">
		   <tr>
			<td bgcolor="#ffffff">
			</td>
			<td align="right" bgcolor="#ffffff">
			 <font class="catrf1"><b>应付总额</b>(不含运费)</font>：<font class="fcart2">购物金额小计 ￥0.00元</font>
			</td>
		  </tr>	
		</table>
       </td>
     </tr> 
   </table>
   
   <div class="blank5"></div>
   <input type="hidden" name="step" value="update_cart" />
  </form>
  
   <div class="blank5"></div>
     <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" bgcolor="#dddddd">
       <tr>
         <td bgcolor="#ffffff" align="left"></td>
         <td bgcolor="#ffffff" align="right">
           <a href="./"><img src="imgs/continue.gif" alt="continue" /></a> 
           <a href="#"><img src="imgs/checkout.gif" alt="checkout" /></a></td>
       </tr>
     </table>
     
     <div style="height:40px;"></div>
     
     <!-- 选项卡鼠标放上展现商品区域 -->
            <div class="i_tab" style="height:520px;">
                <div class="tab_tit">
                    <ul>
                            <li class="on">猜你喜欢</li>
                            <li class="">最近浏览</li>
                            <li class="">新品上架</li>
                    </ul>
                </div>
                <div class="tab_cont">
                    <div class="contents">
                         <!-- 第一个选项卡商品 -->
                            <ul style="display:block">
                            <%for(int i=1;i<=8;i++) { %>
                                    <li _trackproid="111019005" style=" position:relative;">
                                            <span class="spectag all"></span>
                                        <div class="t_img">
                                            <a href="#" target="_blank">
                                                <img src="imgs/g1_150_0.jpg" alt="进口蓝莓125g*4盒" width="150px" height="150px" /></a>
                                        </div>
                                        <div class="t_tit">
                                            <a href="#" target="_blank" title="进口蓝莓125g*4盒">第<%=i%>进口蓝莓125g*4盒</a></div>
                                        <div class="t_price">
                                            <span class="b_span">￥49.00</span><span class="gry_span">￥178.00</span>
                                        </div>
                                    </li>
                              <%} %>
                            </ul>
                            
                            <!-- 第二个选项卡商品 -->
                            <ul style="display:none">
                              <% for(int i=1;i<=8;i++) { %>
                                    <li _trackproid="111016007" style=" position:relative;">
                                            <span class="spectag all"></span>
                                        <div class="t_img">
                                            <a href="#" target="_blank">
                                                <img src="imgs/g1_150_0.jpg" alt="泰国芒果1粒装（单果约230g以上）" width="150px" height="150px" /></a></div>
                                        <div class="t_tit">
                                            <a href="#" target="_blank" title="泰国芒果1粒装（单果约230g以上）">第<%=i%>泰国芒果1粒装（单果约230g以上）</a>
                                        </div>
                                        <div class="t_price">
                                            <span class="b_span">￥29.90</span><span class="gry_span">￥52.00</span>
                                        </div>

                                    </li>
                                <%} %>
                            </ul>
                            
                            <!-- 第三个选项卡商品 -->
                            <ul style="display:none">
                                 <%for(int i=1;i<=8;i++) { %>
                                    <li _trackproid="125706007" style=" position:relative;">
                                            <span class="spectag all"></span>
                                        <div class="t_img">
                                            <a href="#" target="_blank">
                                                <img src="imgs/g1_150_0.jpg" alt="和田玉枣五星500g" width="150px" height="150px" /></a>
                                        </div>
                                        <div class="t_tit">
                                            <a href="#" target="_blank" title="和田玉枣五星500g">第<%=i%>和田玉枣五星500g</a></div>
                                        <div class="t_price">
                                            <span class="b_span">￥41.90</span><span class="gry_span">￥72.00</span>
                                        </div>
                                    </li>
                                   <%} %>
                            </ul>
                    </div>
                </div>
            </div>
    </div>
     <!-- 底部jsp引引用 -->
    <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="js/global.js"></script>
    <script type="text/javascript">
       var showobj = new ShowBigImageAD();
        //分类效果
        CategoryShow(true);
        $(".i_category").show();
        
        PresentHintView("pro_item", "_trackproid");
    </script>
</body>
</html>