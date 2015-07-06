<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单结算页</title>
<link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/shopping.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/jquery-ui-1.10.4.custom.css" />
 <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="js/jquery.ui.js"></script>
 
    <script type="text/javascript">
        $(document).ready(function() {
           $('.i_category').css('display','none');
           $('.addr_div').find('li').eq(1).children('div').removeClass('border1').addClass('border2').addClass('default');
           
           $('.addr_div').find('li').hover(function() {
               $(this).children('div').not('.default').removeClass('border1').addClass('border2');
            },function() {
              $(this).children('div').not('.default').removeClass('border2').addClass('border1');
           });

           $('.payway').find('li').eq(0).children('div').removeClass('border1').addClass('border2').addClass('default');
           $('.payway').find('li').hover(function() {
               $(this).children('div').not('.default').removeClass('border1').addClass('border2');
            },function() {
              $(this).children('div').not('.default').removeClass('border2').addClass('border1');
           });

           $('#dialog-add-addr').dialog({
       		/*对话框标题*/
       		title: '新增收货人信息',
       		/*在对话框添加按钮，值所对应的函数是点击按钮所运行的函数，this表示对话框写内容的div元素*/
       		buttons: {
       			'确定': function() {
       				checkAddr(this);
       			},
       		},
       		width: 500,
       		minWidth: 400,
       		/*打开和关闭的动画效果*/
       		show: false,
       		hide: false,
       		/*调用.dialog是否显示对话框，如果用于初始化对话框，可以现不现实，然后用.dialog('open')打开对话框*/
       		autoOpen: false,
       		/*可不可以退调整对话框大小*/
       		resizable: false,
       		/*改变关闭按钮提示*/
       		closeText: '关闭',
       		/*是否有遮罩*/
       		modal: true,
       		dragStop: function(e, ui) {
       			alert(e.target + "," + ui.position.left + "," + ui.position.top);
       		}
       	});
          	
           $('#addNewAddr').click(function() {
               /*当重新打开输入窗口时，将前面的内容清空*/
        	   $('#dialog-add-addr').find('input').each(function() {
                   var $this=$(this);
                   $this.val('');
                   $this.siblings('.promt-msg').addClass('promt-hidden');
               });
               
              $('#dialog-add-addr').dialog('open');
           });

           $('.info-input').focus(function() {
              var $this=$(this);
              $this.siblings('.promt-msg').addClass('promt-hidden');//当input再次聚焦时，将提示信息消除
           });

        });

        function checkAddr(thisDom) {
             var $this=$(thisDom);
             var $input=$this.find('input');
             var accepter=$($input[0]).val().trim();
             var addr=$($input[1]).val().trim();
             var phone=$($input[2]).val().trim();
             if(accepter=='') {
                 $('.promt-user').text('收货人不能为空');
                 $('.promt-user').removeClass('promt-hidden');
                 return;
             }

             if(accepter.length>=20) {
                 $('.promt-user').text('收货人名太长');
                 $('.promt-user').removeClass('promt-hidden');
                 return;
             }
             
             if(addr=='') {
                 $('.promt-addr').text('地址不能为空');
                 $('.promt-addr').removeClass('promt-hidden');
                 return;
             }
             if(addr.length>=100) {
            	 $('.promt-addr').text('地址太长');
                 $('.promt-addr').removeClass('promt-hidden');
             }
             if(phone=='') {
                 $('.promt-phone').text('号码不能为空');
                 $('.promt-phone').removeClass('promt-hidden');
                 return;
             }
             var reg=/^1[3|4|5|6|7|8][0-9]\d{8}$/;
             if(!reg.test(phone)) {
            	 $('.promt-phone').text('号码格式不正确');
            	 $('.promt-phone').removeClass('promt-hidden');
            	 return;
             }
             alert('提交表单');
        }

        function updateAddr() {
           
            $('.dialog-accept-user').val(personname);
            $('.dialog-detail-addr').val(address);
            $('.dialog-mobile-phone').val(phonenum);
            $('#dialog-add-addr').dialog('open');
        }
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

.addr_div ul li {
 float:left;
 margin-left:6px;
}

.border1 {
  border:solid #525252 1px;
}
.border2 {
  border:solid red 1px;
}


h2 {
font-size: 16px;
font-family: 'microsoft yahei';
height: 44px;
line-height: 44px;
border-bottom: 1px solid #ddd;
}

.payway li {
  float:left;
  margin-left:100px;
}

.payway li div {
  width:100px;
  text-align:center;
  line-height:30px;
  height: 30px;
}

#dialog-add-addr div {
 padding: 1.5em 1.5em 0 1.5em;
 font-size: 1em/1.7em '微软雅黑';
}

.dialog-accept-user,.dialog-mobile-phone,.dialog-detail-addr {
width: 15em;
height: 1.6em;
/*border: #ccc 1px solid;*/
background: #fff;
-moz-outline:2px solid #ebc476;
-moz-outline-radius:3px;
}

.ui-dialog-buttonset {
 width:70px;
 margin-right:220px;
}

.promt-msg {
 font-size:0.8em;
 color:red;
}

.promt-hidden {
 display:none;
}
</style>
</head>
<body>
   <!-- 头部jsp引用 -->
   <jsp:include page="header.jsp"></jsp:include>
   
  <div class="wrapper" style="width:983px;margin:auto auto">
  <div class="blank"></div>
   <table class="orderbox" cellpadding="3" cellspacing="0" width="100%" height="32" style="border: none;">
     <tr>
       <td>
                 <h2>填写并核对订单信息</h2>   
       </td>
    </tr>
    <tr>
      <td height="10px"></td>
    </tr>
    <tr>
      <td>
         <h3 style="width: 822px;float:left">收货人信息</h3>
         <a id="addNewAddr">新增收货地址</a>
     </td>
     </tr>
     <tr>
       <td height="10px"></td>
     </tr>
     <tr>
      <td>
         <div class="addr_div" style="height:161px;">
                    <ul style="height:161px;">
                    <%for(int i=1;i<=4;i++) { %>
                          <li>
                              <div style="width:225px;height:160px;cursor:pointer;" class="border1">
                                <div style="width:205px;height:70px;margin-top:10px;margin-left:10px;margin-right:10px;">
                                  <div style="float:left;"> <strong title='曹辉' id="personname">曹辉</strong>&nbsp;收</div>
                                  <div style="float:right;" id="phonenum">186***4540</div> 
                                </div>
                                <div style="line-height:20px;overflow:hidden;" id="address">
                                                                       北京市北苑路86号院306号楼 完美世界大厦
                                </div>
                                <div style="text-align:right;margin-top:12px;">
                                   <span>
                                     <a href="#">删除</a>
                                   </span>
                                   <span>
                                     <a href="javascript:updateAddr();">编辑</a>
                                   </span>
                                   <span>
                                     <a href="#">默认</a>
                                   </span>
                                </div>
                              </div>
                          </li>    
                     <%} %>
                    </ul>
        </div>
      </td>
    </tr>
 </table>
 <div style="height:8px;margin-top:5px;"></div>
 <table class="payway" style="border: none;">
  <tr>
    <td>
      <h3>支付方式</h3>
    </td>
   </tr>
   <tr>
     <td height="20px;"></td>
   </tr>
   <tr>
     <td>
        <ul>
          <li>
            <div class="border1">在线付款</div>
          </li>
          <li>
            <div class="border1">货到付款</div>
          </li>
        </ul>
     </td>
   </tr> 
</table>
   
   
    <table class="orderbox" cellpadding="3" cellspacing="0" width="100%" height="32" style="border: none;">
    <tr>
      <td>
         <h3 style="width: 822px;float:left">送货清单</h3>
         <a>返回修改购物车</a>
     </td>
     </tr>
 </table>
     
     <div style="height:156px;">
         <div style="float: left">
           <img src="imgs/g1_150_0.jpg">
         </div>
         
         <div style="float: left;width:426px;height:155px;text-align: center">
           <div style="margin-top:10px;">商品名称</div>
           <div style="margin-top:50px;">
           <span>￥428.00</span>&nbsp;&nbsp;&nbsp;&nbsp;
           <span>x1</span>
           </div>
         </div>
         
         <div style="float: right;margin-top:100px;">
                      运费：￥5
         </div>
     </div>
     <div style="height:40px;margin-top:40px">
        <div>
                  添加订单备注
        </div>
        <div style="margin-top:10px;">
          <input size="120px">
        </div>
     </div>
     <div style="height:40px;"></div>
       <div style="background-color:#f0f0f0;height:100px;">
         <div style="width:100px;float:right;margin-top:15px">
           <div style="float:left;width:100px;">应付总额：￥428</div>
              <div class="tg-search-btn" style="background-color:#a40000;float:left;margin-left:8px;margin-top:5px;">
                 <button type="submit"><span>提交订单</span></button>
              </div>
         </div>
       </div>
    </div>
   
   <div style="height:40px;"></div>
     <!-- 底部jsp引引用 -->
   <jsp:include page="footer.jsp"></jsp:include>
   
   <!-- 新增收货人信息弹出框 -->
   <form action="#" id="dialog-add-addr" method="post">
      <div>
        <label for="dialog-accept-user"><font color="red">*</font>&nbsp;收货人&nbsp;&nbsp;&nbsp;：</label><input type="text" class="dialog-accept-user info-input" >
        <span class="promt-msg promt-user promt-hidden">不能为空</span>
      </div>
      <div>
        <label for="dialog-detail-addr"><font color="red">*</font>&nbsp;详细地址：</label><input type="text" class="dialog-detail-addr info-input">
        <span class="promt-msg promt-addr promt-hidden">不能为空</span>
      </div>
      <div>
        <label for="dialog-mobile-phone"><font color="red">*</font>&nbsp;手机号码：</label><input type="text" class="dialog-mobile-phone info-input">
        <span class="promt-msg promt-phone promt-hidden">不能为空</span>
      </div>
      
   </form>
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