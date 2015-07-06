<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/MagicZoom.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/handu_style.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/handu_detail.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/jqzoom.css" />
<link type="text/css" rel="Stylesheet" media="screen" href="css/detail1.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/mzp-packed-me.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/detail.js"></script>
<script type="text/javascript">
      $(document).ready(function() {
    	 $('.i_category').css('display','none');
         var $h2Objs=$("#com_b").find("h2");
         var $blockquote=$('blockquote');
         $.each($blockquote,function(i,o) {
             if(i!=0) {
              $(o).hide();
             }
         });
          $.each($h2Objs,function(i,v) {
              var $obj=$(v);
              $obj.click(function() {
            	  $obj.removeClass('h2bg').siblings().addClass('h2bg');
            	  $.each($blockquote,function(j,obj) {
                	var $block=$(obj);
                    if(i==j) {
                    	$block.show();
                    }else {
                    	$block.hide();
                    }
                  });
              });
          });
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

.detail-content {
  width:1050px;
  border:solid white 1px;
  margin:0 auto;
}
li{
  list-style:none;
}

#weight_size {
 width:60%;
 height:100px;
}

#weight_size li {
 float:left;
 height: 25px;
 padding-left:0px;
 margin-right:15px;
 margin-top:4px;
 border:solid green 1px;
}
</style>

</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
 <div class="detail-content">
  <div class='detail_wrap' style="margin:auto auto">
  <!-- 
<div class="handu_crumb" id='detail_crumb'> 当前位置: <a href=".">首页</a> <code>&gt;</code> 
<c:forEach items="${goodDetail.classifyList}" var="attr">
<a href="http://www.fm422.com/category-583-b0.html${attr.id}">${attr.name}</a> <code>&gt;</code>
</c:forEach>
 ${goodDetail.goodsInfo.name}
</div>
 -->
<!-- 左边相关推荐和浏览记录 -->
<div class='side_bar'>
<div><img src="imgs/best_tit.gif"/></div>
<div style="width:165px;padding:14px;border:1px solid #DDD;">

<c:forEach items="${goodDetail.recoments}" var="good">			
<li style="border-bottom:1px solid #DDD;margin-bottom:15px;padding-bottom:15px;">
<p>
<a href="#" class="pro_img" target="_blank">
<img src="http://localhost:8080/chunyu/${good.image}" alt="${good.name}/${good.size} width="165"></a></p>
<p class="name" style="text-align:center;">
<a href="#" title="${good.name}/${good.size}" class="pro_name">${good.name}/${good.size}</a></p>
<p style="text-align:center;" class="f1"><strong>${good.price}</strong></p>
</li>
</c:forEach>
</div>
<div style="height: 20px;"></div>
<div style="text-align: center">
  <h2>浏览历史</h2>
</div>
<div style="width:165px;padding:14px;border:1px solid #DDD;">
<ul>
<c:forEach items="${goodDetail.recoments}" var="good">			
<li style="border-bottom:1px solid #DDD;margin-bottom:15px;padding-bottom:15px;">
<p><a href="#" class="pro_img" target="_blank"><img src="http://localhost:8080/chunyu/${good.image}" alt="${good.name}/${good.size} width="165"></a></p>
<p class="name" style="text-align:center;"><a href="#" title="${good.name}/${good.size}" class="pro_name">${good.name}/${good.size}</a></p>
<p style="text-align:center;" class="f1"><strong>${good.price}</strong></p>
</li>
</c:forEach>
</ul>				
</div>
<div class="blank"></div>
<div class="blank5"></div>
<!-- -
<script type="text/javascript">
if (document.getElementById('history_list').innerHTML.replace(/\s/g,'').length<1)
{
    document.getElementById('history_div').style.display='none';
}
else
{
    document.getElementById('history_div').style.display='block';
}
function clear_history()
{
Ajax.call('user.php', 'act=clear_history',clear_history_Response, 'GET', 'TEXT',1,1);
}
function clear_history_Response(res)
{
document.getElementById('history_list').innerHTML = '您已清空最近浏览过的商品';
}
</script>
 -->
</div>


<div class='product_detail'>

<!-- 主体商品信息 -->
  <div class='detail_top'>
   <div class='goods_detail_left '>
    <div class='gallery' >
        <div class='gallery_content'>
	    <a href="http://localhost:8080/chunyu/${goodDetail.showImg.subImg0}" id="Zoomer" class="MagicZoomPlus" rel="selectors-effect:false;zoom-fade:true;background-opacity:70;zoom-width:250;zoom-height:250;caption-source:img:title;thumb-change:mouseover" title="">
	    	<img id="img_url" name="goods_img" src="http://localhost:8080/chunyu/${goodDetail.showImg.img0}" alt="${goodDetail.goodsInfo.name}/${goodDetail.goodsInfo.size}" class="thumb" width="430" />
	    </a>
        </div>
        <ul class='gallery_nav'>
	      <li>
			 <a href="http://localhost:8080/chunyu/${goodDetail.showImg.subImg0}" rel="zoom-id:Zoomer" rev="http://localhost:8080/chunyu/${goodDetail.showImg.subImg0}" title="">
			 <img src="http://localhost:8080/chunyu/${goodDetail.showImg.img0}" alt="${goodDetail.goodsInfo.name}/${goodDetail.goodsInfo.size}" class="onbg" onmouseover="chkimgcss(this)"/>
			 </a>
		 </li>
		  <li>
			 <a href="http://localhost:8080/chunyu/${goodDetail.showImg.subImg1}" rel="zoom-id:Zoomer" rev="http://localhost:8080/chunyu/${goodDetail.showImg.subImg1}" title="">
			 <img src="http://localhost:8080/chunyu/${goodDetail.showImg.img1}" alt="${goodDetail.goodsInfo.name}/${goodDetail.goodsInfo.size}" class="onbg" onmouseover="chkimgcss(this)"/>
			 </a>
		 </li>
		  <li>
			 <a href="http://localhost:8080/chunyu/${goodDetail.showImg.subImg2}" rel="zoom-id:Zoomer" rev="http://localhost:8080/chunyu/${goodDetail.showImg.subImg2}" title="">
			 <img src="http://localhost:8080/chunyu/${goodDetail.showImg.img2}" alt="${goodDetail.goodsInfo.name}/${goodDetail.goodsInfo.size}" class="onbg" onmouseover="chkimgcss(this)"/>
			 </a>
		 </li>
		  <li>
			 <a href="http://localhost:8080/chunyu/${goodDetail.showImg.subImg3}" rel="zoom-id:Zoomer" rev="http://localhost:8080/chunyu/${goodDetail.showImg.subImg3}" title="">
			 <img src="http://localhost:8080/chunyu/${goodDetail.showImg.img3}" alt="${goodDetail.goodsInfo.name}/${goodDetail.goodsInfo.size}" class="onbg" onmouseover="chkimgcss(this)"/>
			 </a>
		 </li>
	   </ul>
    </div>
	
	<!-- 
	 <li>
		<a href="imgs/1654_P_1373916002516.jpg" rel="zoom-id:Zoomer" rev="imgs/1654_P_1373916002516.jpg" title="">
		 <img src="imgs/1654_P_1373916002516.jpg" alt="台湾水仙芒/芒果/原装箱6斤" class="autobg" />
		 </a>
	 </li>
	<li>
		 <a href="imgs/1654_P_1365449323425.jpg" rel="zoom-id:Zoomer" rev="imgs/2.jpg" title="">
		 //rev里面是上面展现的 //src是下面的小图  href里面是鼠标放上去的结果
		 <img src="imgs/1654_P_1373916002516.jpg" alt="台湾水仙芒/芒果/原装箱6斤" class="autobg" />
		 </a>
	 </li>
	 -->
     
    
<script type="text/javascript">
    $('.gallery_nav a').click(function(){
        $('.videoplayer').hide();
        $('.colorImg').hide();
    });
    $('.btn_playvideo').click(function(){  
        var _vsrc='';
        if($(".videoplayer embed").length==0){
            $(".videoplayer").html('<embed src="'+_vsrc+'" allowFullScreen="true" quality="high" width="480" height="480" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>');
        }
        $('.colorImg').hide();
        $(".videoplayer").show();
   
    });
</script>
            <!--<div class='dashed'></div>-->
            
            <p>
                <a class='like fl' style="cursor: pointer;" onclick="collection();">收藏</a>
          <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                <span class="bds_more">分享到：</span>
                <a class="bds_qzone"></a>
                <a class="bds_tsina"></a>
                <a class="bds_tqq"></a>
                <a class="bds_renren"></a>
                <a class="bds_t163"></a>
                <a class="shareCount"></a>
          </div>
                <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=0" ></script>
                <script type="text/javascript" id="bdshell_js"></script>
                <script type="text/javascript">
                document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
                </script>
                
            </p>
        </div>
        
        <form action="javascript:addToCart(1654)" method="post" name="ECS_FORMBUY" id="ECS_FORMBUY">
        <div class="gooods_detail_right">
        <div id="goods_detail_1" class='product_detail_info' goodId="${goodDetail.goodsInfo.goodId}">
            <h1 class="product_name">
           		 ${goodDetail.goodsInfo.name}/${goodDetail.goodsInfo.size}
            <br><em></em></h1>
           <ul> 
            <li>
                        商品货号：&nbsp;&nbsp;<span class='code'>Goods-${goodDetail.goodsInfo.id}</span></li>
               <!--   促 销 价 ：<del class='li_relative'>${goodDetail.goodsInfo.price}</del> </li>-->
            <li class="market_price">  
                          售价 ：${goodDetail.goodsInfo.price}
                <em class='promote_price ' id="ECS_SHOPPRICE"></em> 
                </li>
              
              <!--<span class="vipPrice"> 
              <span class="vipPrice_span1">会员专享优惠</span>
                <span class="vipPrice_span2"><img src="http://www.fm422.com/themes/green/images/d.png" class="d_list"></span>
                  <div class="vipPriceMain" status="hide" >
                    <div class="vipPriceContent">
                        <p><b>升级成为普通会员：</b>您只需要成功交易一笔订单，就可以享受正价商品<a>9.8</a>折优惠</p>
                        <p><b>升级成为黄金会员：</b>您只需要消费500.00元，就可以享受正价商品<a>9.5</a>折优惠</p>
                        <p><b>升级成为白金会员：</b>您只需要消费2000.00元，就可以享受正价商品<a>8.5</a>折优惠</p>
                        <p><b >升级成为钻石会员：</b>您只需要消费5000.00元，就可以享受正价商品<a >8</a>折优惠</p> 
                           <div class="vipPriceMore"><a href="#"><span class="vipPrice_more fr"></span><span class="fr">更多</span></a></div>
                    </div>
                  </div>
              </span>    -->         
                  
            <li>简介：
                  <span class="star-off">${goodDetail.goodsInfo.introduction}</span>
            </li>
            </ul>   
        </div> 
        
        <div id="goods_detail_2" class='product_detail_info'>  
        <div class="set1">
       
           <ul id="weight_size">
              <li>
               <a href="#">一斤</a>
              </li>
              <li>
               <a href="#">一斤</a>
              </li>
              <li> <a href="#">一斤</a></li>
              <li> <a href="#">一斤</a></li>
              <li> <a href="#">一斤</a></li>
              <li> <a href="#">一斤</a></li>
              <li> <a href="#">一斤</a></li>
              <li> <a href="#">一斤</a></li>
           </ul>
           <!--  <c:forEach items="${goodDetail.sizes}" var="map"> -->
            <!--  <div class="sizeDiv">${map.size}</div>-->
       <!--  </c:forEach>-->
         </div>
              <div class="set" style="border:solid red 1px;margin-top:10px;">
              <span class="label">数　　量：</span>
              
              <span class="amount-widget">
                  <span class="increase" onclick="goods_add();changePrice()">+</span>
                  <span class="decrease" onclick="goods_cut();changePrice()">-</span>
                  <input onblur="changePrice();get_shipping_list(forms['ECS_FORMBUY'],1654);" name="number" id="number" class="text" value="1" maxlength="3" title="请输入购买量" type="text"> 
              </span>
              <div class="blank"></div>
              商品总价：<font id="ECS_GOODS_AMOUNT" class="shop"></font> 库存：<font id="shows_number">8件</font>
              <script language="javascript" type="text/javascript">
			function goods_cut(){
				var num_val=document.getElementById('number');
				var new_num=num_val.value;
				 if(isNaN(new_num)){alert('请输入数字');return false}
				var Num = parseInt(new_num);
				if(Num>1)Num=Num-1;
				num_val.value=Num;
			}
			function goods_add(){
				var num_val=document.getElementById('number');
				var new_num=num_val.value;
				 if(isNaN(new_num)){alert('请输入数字');return false}
				var Num = parseInt(new_num);
				Num=Num+1;
				num_val.value=Num;
			}
	    </script>
            </div>  
           <div class="blank"></div>
              <p class='detail_btn_set'>
                 <a class='fl detail_btn buy' href="javascript:addToCart(1654)" title='点击购买'>点击购买</a>
                 <a class='fl detail_btn addCart' href="javascript:addToCart(1654)" title='加入购物车'>加入购物车</a>
              </p>
               <div style="clear:both"></div> 
        </div>
        <div class='product_detail_info' style='border-bottom:none;'>       
            
            <div class='extra_info'>
                <ul class="line1">  
                   <li class="et_qqonline">
                    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=894879&amp;site=qq&amp;menu=yes">
                      <span >在线客服:</span>
                      <span class="payway3"></span>                    </a>                  </li>
                    <li class="et_weixian" >
                        <a id="zzy_weixin">
                            <span>官方微信:</span>
                            <img src="http://www.fm422.com/themes/green/images/weixin.png" alt="官方微信" id="weixin">
                           <img src="http://www.fm422.com/themes/green/images/wx1.jpg" class="qrcode">                        </a>
                    <img src="http://www.fm422.com/themes/green/images/sys.gif" style="position: absolute;top: -6px;left: 70px;">                    </li>
                    <li class="et_shouji" style="">
                        <a><span >手机下单更优惠&nbsp;</span>
                           <img src="http://www.fm422.com/themes/green/images/client_code.jpg" class="qrcode_thumb"alt="手机客户端" width="20">
                           <img src="http://www.fm422.com/themes/green/images/client_code.jpg" class="qrcode">                        </a>                  </li>
                 
                  <div class="clear"></div>
                </ul>
                <div class="goods_payway line2">
                    <label >支付方式:</label>
                    <a href="#">
                      <span class="payway1 spanr"></span>
                      <span>支付宝</span>                    </a>
                    <a href="#">
                      <span class="payway2 spanr"></span>
                      <span>网上银行付款</span>                    </a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <label for="">服务承诺：</label>
                     <img src="http://www.fm422.com/themes/green/images/service.png" alt="100%正品保证 安全快速退款 7天无理由退换货" title="100%正品保证 安全快速退款 7天无理由退换货">
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        </div>
         </form>
        <br class="clear" />    
    </div>
     <div class="box">
       <div id="com_b" class="history clearfix_">
        <h2 style="cursor: pointer;">商品简介</h2>
        <h2 style="cursor: pointer;" class="h2bg">用户评价</h2>
      </div>
      <div id="com_v"></div>
      <div id="com_h">
       <!-- 商品简介选项卡内容 -->
       <blockquote>
	    <div class="blank"></div>
	    ${goodDetail.detailImgs }
       </blockquote>
      
      <!-- 用户评价选项卡内容 -->                   	 
     <blockquote>
      <div id="ECS_COMMENT"> 
       <div class="box">
        <div class="box_1">
         <h3>
            <span class="text">用户评论</span>(共<font class="f1">${goodDetail.commentsNum}</font>条评论)
         </h3>
         <div class="boxCenterList clearfix_" style="height:1%;">
         <div  id="boxCenterList">
          <ul class="comments">
          <c:forEach items="${goodDetail.comments}" var="comment">
              <li class="word">
                 <c:if test="${comment.username eq null}">
	             <font class="f2">匿名</font>
	             </c:if>
	             <c:if test="${comment.username ne null}">
	             <font class="f2">${comment.username}</font>
	             </c:if>
	             <font class="f3">( ${comment.commentTime} )</font><br>
	             <p>${comment.content}</p>
             </li>
          </c:forEach>
            <!-- 
            <li class="word">
             <font class="f2">上校</font>
             <font class="f3">( 2013-02-26 11:10:11 )</font><br>
             <img alt="" src="imgs/stars5.gif">
             <p>和老家带回的土鸡蛋一样香，还不错的</p>
            </li>
             -->
          </ul>
       </div>
       <div id="pagebar" class="f_r">
       <!--  <form name="selectPageForm" action="/goods.php" method="get"> -->
          <div id="pager" style="float:right" pageSize="1">总计${goodDetail.commentsNum}个记录，共 ${goodDetail.totalPageNum} 页。 
           <span> 
             <a style="cursor: pointer;" onclick="goToPage(1);">第一页</a> 
             <a style="cursor: pointer;" onclick="changePage(0);">上一页</a> 
             <a style="cursor: pointer;" onclick="changePage(1);">下一页</a> 
             <a style="cursor: pointer;" onclick="goToPage(-1);">最末页</a> 
           </span>
          </div>
        <!-- </form> -->
      </div>
      
      <div class='blank5'></div>
      <div class="commentsList">
      <form name="commentForm" id="commentForm">
       <table width="710" border="0" cellspacing="5" cellpadding="0">
        <tr>
          <td width="68" align="center">用户名：</td>
          <td width="628"><input type="text" name="username" value="${goodDetail.username}"/></td>
        </tr>
        <tr>
          <td align="right" valign="top">评论内容：</td>
          <td>
          <textarea name="content" class="inputBorder" style="height:100px; width:590px;"></textarea>
          </td>
        </tr>
        <tr>
        <td align="center">匿名评论:</td>
        <td><input type="radio" name="noName" value="1"/>是
         <input type="radio" name="noName" value="0" checked="checked"/>否</td>
        </tr>
		<tr>
		  <td align="right" valign="top"></td>
		  <td> <input type="button"  value="评论" onclick="submitComments();" style="border:none; float:right; width:85px; height:30px; margin-right:8px; cursor:pointer">
          </td>
		</tr>
      </table>
      </form>
      </div>
      </div>
     </div>
    </div>
    <div class="blank5"></div>
  <!--  
<script type="text/javascript">
//<![CDATA[
var cmt_empty_username = "请输入您的用户名称";
var cmt_empty_email = "请输入您的电子邮件地址";
var cmt_error_email = "电子邮件地址格式不正确";
var cmt_empty_content = "您没有输入评论的内容";
var captcha_not_null = "验证码不能为空!";
var cmt_invalid_comments = "无效的评论内容!";

/**
 * 提交评论信息
*/
function submitComment(frm)
{
  var cmt = new Object;

  //cmt.username        = frm.elements['username'].value;
  cmt.email           = frm.elements['email'].value;
  cmt.content         = frm.elements['content'].value;
  cmt.type            = frm.elements['cmt_type'].value;
  cmt.id              = frm.elements['id'].value;
  cmt.enabled_captcha = frm.elements['enabled_captcha'] ? frm.elements['enabled_captcha'].value : '0';
  cmt.captcha         = frm.elements['captcha'] ? frm.elements['captcha'].value : '';
  cmt.rank            = 0;

  for (i = 0; i < frm.elements['comment_rank'].length; i++)
  {
    if (frm.elements['comment_rank'][i].checked)
    {
       cmt.rank = frm.elements['comment_rank'][i].value;
     }
  }

//  if (cmt.username.length == 0)
//  {
//     alert(cmt_empty_username);
//     return false;
//  }

  if (cmt.email.length > 0)
  {
     if (!(Utils.isEmail(cmt.email)))
     {
        alert(cmt_error_email);
        return false;
      }
   }
   else
   {
        alert(cmt_empty_email);
        return false;
   }

   if (cmt.content.length == 0)
   {
      alert(cmt_empty_content);
      return false;
   }

   if (cmt.enabled_captcha > 0 && cmt.captcha.length == 0 )
   {
      alert(captcha_not_null);
      return false;
   }

   Ajax.call('comment.php', 'cmt=' + cmt.toJSONString(), commentResponse, 'POST', 'JSON');
   return false;
}

/**
 * 处理提交评论的反馈信息
*/
  function commentResponse(result)
  {
    if (result.message)
    {
      alert(result.message);
    }

    if (result.error == 0)
    {
      var layer = document.getElementById('ECS_COMMENT');

      if (layer)
      {
        layer.innerHTML = result.content;
      }
    }
  }

//]]>
</script>
-->
</div>
     </blockquote>
      </div>
    </div>
  <div class="blank"></div>
     <div class="box">
     <div class="box_1">
      <h3><span class="text">猜你喜欢</span></h3>
      <div class="clearfix_">
       <c:forEach items="${goodDetail.goods.collection1}" var="good1">
        <div class="goodsItem">
          <a href="#"><img src="${good1.image}" alt="${good1.name}/${good1.size}"  class="goodsimg" /></a><br />
          <p style="height:38px;line-height:16px;overflow:hidden"><a href="#" title="${good1.name}/${good1.size}">${good1.name}/${good1.size}${good1.price}</a></p> 
          <font class="shop_s">${good1.price}</font>
        </div>
       </c:forEach>
       <c:forEach items="${goodDetail.goods.collection2}" var="good2">
        <div class="goodsItem">
          <a href="#"><img src="${good2.image}" alt="${good2.name}/${good2.size}"  class="goodsimg" /></a><br />
          <p style="height:38px;line-height:16px;overflow:hidden"><a href="#" title="${good2.name}/${good2.size}">${good2.name}/${good1.size}${good2.price}</a></p> 
          <font class="shop_s">${good2.price}</font>
        </div>
       </c:forEach>
       </div>
     </div>
    </div>
    <div class="blank5"></div>
    
  </div>
</div>
<!--  
<div class="float_box" style="display: block;">
  <div class="float_app"></div>
  <a href="http://www.fm422.com/flow.php" target="_blank" class="a1" onclick="_czc.push(['_trackEvent', '悬浮', '购物车']);"></a>
  <a href="javascript:NTKF.im_openInPageChat();" class="a2" onclick="_czc.push(['_trackEvent', '悬浮', '在线客服']);"></a>
  <a href="http://www.fm422.com/message.php" target="_blank" class="a3" onclick="_czc.push(['_trackEvent', '悬浮', '在线反馈']);"></a>
  <a href="#" class="a4 backTop" onclick="_czc.push(['_trackEvent', '悬浮', '返回顶部']);"></a>
</div>


<script language="javascript" type="text/javascript">
$(window).scroll(function(){
      var t = document.documentElement.scrollTop||document.body.scrollTop;
      if(t>450){
    $(".float_box").fadeIn();
      }
      else{
     $(".float_box").hide();
      }
})
$('.float_box .backTop').click(function(){
    $("html, body").animate({'scrollTop':0},320);
})
</script>
<script type=text/javascript>
var obj11 = document.getElementById("winner");
var top11 = getTop(obj11);
var isIE6 = /msie 6/i.test(navigator.userAgent);
window.onscroll = function(){
	var bodyScrollTop = document.documentElement.scrollTop || document.body.scrollTop;
	if (bodyScrollTop > top11){
		obj11.style.position = (isIE6) ? "absolute" : "fixed";
		obj11.style.top = (isIE6) ? bodyScrollTop + "px" : "0px";
	} else {
		obj11.style.position = "static";
	}
}
function getTop(e){
	var offset = e.offsetTop;
	if(e.offsetParent != null) offset += getTop(e.offsetParent);
	return offset;
}
</script></body>
<script type="text/javascript">
var goods_id = 1654;
var goodsattr_style = 1;
var gmt_end_time = 0;
var day = "天";
var hour = "小时";
var minute = "分钟";
var second = "秒";
var end = "结束";
var goodsId = 1654;
var now_time = 1423308699;
onload = function(){
  changePrice();
  fixpng();
  try {onload_leftTime();}
  catch (e) {}
}
/**
 * 点选可选属性或改变数量时修改商品价格的函数
 */
function changePrice()
{
  var attr = getSelectedAttributes(document.forms['ECS_FORMBUY']);
  var qty = document.forms['ECS_FORMBUY'].elements['number'].value;
  Ajax.call('goods.php', 'act=price&id=' + goodsId + '&attr=' + attr + '&number=' + qty, changePriceResponse, 'GET', 'JSON');
}
/**
 * 接收返回的信息
 */
function changePriceResponse(res)
{
  if (res.err_msg.length > 0)
  {
    alert(res.err_msg);
  }
  else
  {
    document.forms['ECS_FORMBUY'].elements['number'].value = res.qty;
    if (document.getElementById('ECS_GOODS_AMOUNT'))
      document.getElementById('ECS_GOODS_AMOUNT').innerHTML = res.result;
  }
}
/*
*选择信息处理
*/
function changeP(b, c) {
	var frm=document.forms['ECS_FORMBUY'];
	var cur_id="";
    document.getElementById('spec_value_' + c).checked=true;
	document.getElementById('url_' + c).className="selected";
	for (var i = 0; i < frm.elements[b].length; i++) {
		cur_id=frm.elements[b][i].id.substr(11);
        document.getElementById('url_' + cur_id).className="";
		if (frm.elements[b][i].checked)
		{
		   document.getElementById('url_' + c).className="selected";
		}
    }
	changePrice();
}
//
var btn_buy = "购买";
var is_cancel = "取消";
var select_spe = "请选择商品属性";
function changeAtt(t,a,goods_id) {
t.lastChild.checked='checked';
for (var i = 0; i<t.parentNode.childNodes.length;i++) {
if (t.parentNode.childNodes[i].className == 'cattsel') {
t.parentNode.childNodes[i].className = '';
}
}
t.className = "cattsel";
var formBuy = document.forms['ECS_FORMBUY'];
spec_arr = getSelectedAttributes(formBuy);
Ajax.call('goods.php?act=get_products_info', 'id=' + spec_arr+ '&goods_id=' + goods_id, shows_number,
'GET', 'JSON');
changePrice();
}
function shows_number(result)
{
if(result.product_number !=undefined)
{
//这里我把$换成了document.getElementById，因为ecshop有时候不兼容jquery
//$('shows_number').innerHTML = result.product_number+'件';
document.getElementById('shows_number').innerHTML = result.product_number+'件';
}
else
{
document.getElementById('shows_number').innerHTML = '未设置';
//$('shows_number').innerHTML = '未设置';
}
}
</script>
 -->
 </div>
 <jsp:include page="footer.jsp"></jsp:include>
 <script type="text/javascript" src="js/cp_cutdown.js"></script>
  <script type="text/javascript" src="js/jquery.lazyload.js"></script>
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