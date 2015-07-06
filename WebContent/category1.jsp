<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>春雨农贸在线</title>
    <link rel="shortcut icon" href="/images/favicon.ico" type="images/x-icon" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="expires" content="0" />
    <meta name="resource-type" content="document" />
    <meta name="distribution" content="global" />
    <meta name="author" content="春雨农贸" />
    <meta name="copyright" content="Copyright (c) 2010 yummy77.com. All Rights Reserved." />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta name="robots" content="index, follow" />
    <meta name="revisit-after" content="1 days" />
    <meta name="rating" content="general" />
    <meta name="keywords" content="美味七七，yummy77，网上购物，网上超市，进口食品，化妆品，水果，家居用品，母婴，进口零食,进口牛奶" />
    <meta name="description" content="美味七七是中国领先的生鲜购物网站，精选全球时鲜蔬果、肉禽蛋奶、海鲜水产、休闲食品、酒水饮料、粮油调味等多品类商品，24小时新鲜速达，48小时退换货" />
    <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath %>css/base.css" />
    <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath %>css/product.css" />
    <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath %>css/common.css" />
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.json.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
           $('.i_category').css('display','none');
           var position='<%=request.getAttribute("position")%>';
           if(position!='null') {
               $(document).scrollTop(position);
           }

          $('form[name=listform]').children('a').click(function() {
              var $img=$(this).children('img');
              var src=$img.attr('src');
              src=src.substring(src.lastIndexOf('/')+1,src.lastIndexOf('.'));
              var strArray=src.split('_');
              if('default'==strArray[2]) {
                  if('goods'==strArray[0]) {
                      $img.attr('src','<%=basePath%>imgs/goods_id_DESC.GIF');
                  }else 
                  if('shop'==strArray[0]) {
                	  $img.attr('src','<%=basePath%>imgs/shop_price_ASC.GIF');
                  }
              }else {
            	  if('goods'==strArray[0]) {
                      $img.attr('src','<%=basePath%>imgs/goods_id_default.GIF');
                  }else
                  if('shop'==strArray[0]) {
                	  $img.attr('src','<%=basePath%>imgs/shop_price_default.GIF');
                  }
              }
             var $form=$('form[name=listform]');
             var $imgs=$form.find('img');
             var src1=$($imgs[0]).attr('src');
             var src2=$($imgs[1]).attr('src');
             $('input[name=img1]').val(src1);
             $('input[name=img2]').val(src2);
             var dateOrder=null,priceOrder=null;
            
             src1=src1.substring(src1.lastIndexOf('_')+1);
             src2=src2.substring(src2.lastIndexOf('_')+1);
             
             if(src1=='DESC.GIF') {
                 dateOrder='DESC';
             }

             if(src2=='ASC.GIF') {
                 priceOrder='ASC';
             }

             var position=$(document).scrollTop();
             $('input[name=position]').val(position);
             $('input[name=dateOrder]').val(dateOrder);
             $('input[name=priceOrder]').val(priceOrder);
            
             $form.submit();
          });


          $('.f-list li').children('a').click(function() {
                var $this=$(this);
                var section=$this.text().trim();
                var index=section.indexOf('-');
                var price1='',price2='';
                if(index!=-1) {
                   var priceArray=section.split('-');
                   price1=priceArray[0];
                   price2=priceArray[1];
                }else {
                    price2=600;
                }

                var $imgs=$('form[name=listform]').find('img');
                var dateOrder=null,priceOrder=null;
                var srcArray=[];
                $imgs.each(function(i,e) {
                    var $obj=$(e);
                    var imgSrc=$obj.attr('src');
                    srcArray[i]=imgSrc;
                    imgSrc=imgSrc.substring(imgSrc.lastIndexOf('/')+1);
                    imgSrc=imgSrc.substring(0,imgSrc.lastIndexOf('.'));
                    var strArray=imgSrc.split('_');
                    if(strArray[0]=='goods'&&strArray[2]=='DESC') { 
                        dateOrder='DESC';
                    }else if(strArray[0]=='shop'&&strArray[2]=='ASC') {
                        priceOrder='ASC';
                    }
                });

                var position=$(document).scrollTop();
                $('input[name=position]').val(position);
                $('input[name=price1]').val(price1);
                $('input[name=price2]').val(price2);
                $('input[name=dateOrder]').val(dateOrder);
                $('input[name=priceOrder]').val(priceOrder);
                $('input[name=img1]').val(srcArray[0]);
                $('input[name=img2]').val(srcArray[1]);
                $('form[name=listform]').submit();
          });

          getHostGoods();
        });


        function getHostGoods() {
            var classifyId='${classifyId}';
            var url='<%=basePath%>category/getHotCateGoods.html?classifyId='+classifyId;
            $.ajax({
                url:url,
                type:'GET',
                dataType:'json',
                success:function(data) {
                    var hotGoodsList=data.hotGoodsList;
                    var $container=$('.p_l_menu_h');
                    var str='';
                    for(var i=0;i<hotGoodsList.length;i++) {
                        var goodsInfo=hotGoodsList[i];
                        var goodsId=goodsInfo[0];
                        var img=goodsInfo[1];
                        str+=' <dd class="p_l_menu_i clearfix"><img src="http://localhost:8080/chunyu/'+img+'"></dd>';
                    }
                    $container.append(str);
                }
            });
        }
        /*
        <dd class="p_l_menu_i clearfix">
                   <img src="imgs/g1_150_01.jpg">
                </dd>
        */
        function getThridLevelTop() {
            var classifyId='${classifyId}';
            var cateName='${cateName}';
            cateName=encodeURIComponent(encodeURIComponent(cateName));
            var url='<%=basePath%>category/getLeftTopCate?classifyId='+classifyId+'&cateName='+cateName;
            $.get(url);
        }

        function doPage(v) {
             var position=$(document).scrollTop();
             $('input[name=position]').val(position);
             $('input[name=orient]').val(v);
             $('form[name=listform]').submit();
        }

    </script>
</head>

<body>
   <!-- 头部jsp引用 -->
   <jsp:include page="header.jsp"></jsp:include>
  <div id="body">
   <div id="main" class="clearfix">
            

<div class="clearfix mainwidth">
 <!-- 当前页面路径 -->
<div class="bread"><a href="/">首页</a>〉<a href="/category/1.html">所有分类</a>〉<a href="/category/98.html">时鲜水果</a></div>

<div class="mainwidth clearfix">
    <div class="tow_topbox">
       <!-- 右侧该分类下的小分类 -->
        <div class="top_left">
             <div class="p_l_menu_p" style="margin-top: 20px;">
                <dl class="p_l_menu_1">
                 <dt class="p_l_menu_h"><a href="#">热销商品</a></dt>
             </dl>
            </div>
        </div>
        <div class="top_right">
         <!-- 轮播图 goodsId,img1,img2-->
         <% List<List<Object>> broadList=(List<List<Object>>)request.getAttribute("broadList"); %>
            <div class="mainAds">
                <div class="mainAds_left">
                    <ul>
                    <%for(int i=0;i<broadList.size();i++) { 
                        List<Object> broad=broadList.get(i);
                    %>
                            <li _mark="1" style=" display: block; "><a href="#">
                                <img src="http://localhost:8080/chunyu/<%=broad.get(1)%>"/></a></li>
                     <%} %>
                    </ul>
                </div>
                <div class="mainAds_right">
                    <ul>
                     <%for(int i=0;i<broadList.size();i++) { 
                        List<Object> broad=broadList.get(i);
                    %>
                            <li _mark="1"><a href="#">
                                <img src="http://localhost:8080/chunyu/<%=broad.get(2)%>"/></a></li>
                     <%} %>
                    </ul>
                </div>
            </div>
            
            <div class="brand" style="border:solid #a0bd2b 1px;height:200px">
              <div class="mt">
             <h1>水果<strong>商品筛选</strong>
             </h1>
             <div class="total">
                <span>(共<strong id="res_count">${pm.totalRecords }</strong>个商品)</span>
             </div>
            </div>
             
            <div class="mc attrs">
               <div class="brand-attr">
                 <div class="attr">
                   <div class="a-key">品牌：</div>
                   <div class="a-values">
                     <div class="v-tabs">${cateName}</div>
                   </div>
                </div>
               </div>
               
               <div class="prop-attrs">
                  <div id="select-price" class="attr">
                     <div class="a-key">价格：</div>
                      <div class="a-values">
                     <div class="v-fold" style="height:40px;width: 900px;">
                        <ul class="f-list">
                          <li><a style="cursor:pointer;">0-39</a></li>
                          <li><a style="cursor:pointer;">40-79</a></li>
                          <li><a style="cursor:pointer;">80-199</a></li>
                          <li><a style="cursor:pointer;">200-399</a></li>
                          <li><a style="cursor:pointer;">400-599</a></li>
                          <li><a style="cursor:pointer;">600以上</a></li>
                        </ul>
                     </div>
                  </div>
                  </div>
               </div>
             </div>
             
             <div style="height:10px;"></div>
             <div class="protop">
              <div class="f_l distext"> 显示方式：</div>
               <div class="protopimg f_l"> <a name='goods_list'></a>
                 <form method="POST" class="sort" name="listform" action="<%=basePath%>category/classifySearch.html">
                   <a style="cursor:pointer;"><img src="${img1}" alt="按上架时间排序"></a>
                   <a style="cursor:pointer;"><img src="${img2}" alt="按价格排序"></a>
                   <input type="hidden" name="classifyId" value="${classifyId }" />
                   <input type="hidden" name="cateName" value="${cateName }" />
                   <input type="hidden" name="price1" value="${price1 }">
                   <input type="hidden" name="price2" value="${price2 }">
                   <input type="hidden" name="priceOrder" value="${priceOrder }">
                   <input type="hidden" name="dateOrder" value="${dateOrder }">
                   <input type="hidden" name="position" value="${position }">
                   <input type="hidden" name="img1" value="${img1 }">
                   <input type="hidden" name="img2" value="${img2 }">
                   <input type="hidden" name="pageOffset" value="${pageOffset}">
                   <input type="hidden" name="orient" value="${orient}">
                </form>
             </div>
            <div class="f_r">
                <span>总页数：${pm.totalPage}</span>
                <span>当前页：${pm.currentPage}</span>
                &nbsp; &nbsp; &nbsp;
                <a href="javascript:doPage('pre');">上一页</a>
     
                <a href="javascript:doPage('next');">下一页</a>
           </div>
          </div>
        </div>
            
             <div class="tow_buttombox">
              <div class="mainbox_2 clearBoth" id="catproductlist">
                <div id="region" class="region">
                   <!--点击第三级分类进来的  -->
                   <!-- 第三极分类名称 -->
                    <div class="title">
                        <span class="left color_red1 b">${cateName}</span>
                    </div>
                    
                   <!-- 点击的第三级分类下的商品 -->
                    <div class="content">
                        <div class="region_right">
                         <ul>
                           <c:if test="${!empty pm.list}">
                             <c:forEach items="${pm.list}" var="goods">
                                <li class="pitem"  style="position:relative;">
                                    <div class="divproduct">
                                        <div class="divimg">
                                            <a href="<%=basePath%>detail.html?goodId=${goods.id}">
                                                <img src="http://localhost:8080/chunyu/${goods.image}" alt="${goods.name}${goods.size}"></a>
                                        </div>
                                        <div class="pname_div">
                                            <a href="<%=basePath%>detail.html?goodId=${goods.id}" title="${goods.name}${goods.size}">${goods.name}${goods.size}</a>
                                        </div>
                                        <div class="price_div">
                                            <span class="pcprice_sp">￥${goods.price}</span> <!--<span class="pmprice_sp">￥<del>99.00</del></span>  -->
                                        </div>
                                        <div class="divbtn">
                                            <div class="btn instock">
                                            </div>
                                        </div>
                                        <div class="tag" title="${goods.introduction }">
                                          ${goods.introduction }
                                        </div>
                                    </div>
                                </li>
                               </c:forEach>
                             </c:if>
                           </ul>
                        </div>
                    </div>
                 </div>
              </div>
            </div>
        </div>
    </div>
</div>
</div>
  </div>
    </div>

   
   <!-- 底部jsp引引用 -->
   <jsp:include page="footer.jsp"></jsp:include>
    <script type="text/javascript" src="<%=basePath %>js/cp_cutdown.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/global.js"></script>
    <script type="text/javascript">
    var _setI=null;
    $(document).ready(function(){
         $("img.lazy").unveil(150);
         $(".mainAds_right li").bind("mouseover",function(){
            clearInterval(_setI);
            var mark=$(this).attr("_mark");
            $(".mainAds_left li").each(function(a,b){
                if(mark==$(b).attr("_mark")){
                    $(b).fadeIn("slow");
                    $(".mainAds_left li:visible").not(b).hide();
                }
            });
           _setI=setInterval(mainAdsLb,3000);
        });
         /*
        $(".flashp").bind("click",flashPanel);
        LimitTimeBuy();*/
    });
    
    _setI=setInterval(mainAdsLb,3000);
    function mainAdsLb(){
        var el=$(".mainAds_left li:visible").hide().next().fadeIn("slow");
        if(el.attr("_mark")==null){
            $(".mainAds_left li").first().fadeIn("slow");
        }
    }
    function flashPanel(){
        var id=$(this).attr("id");
        if(id=="flashfirst"){
            $("#flashFirst").show();
            $("#flashTwo").hide();
        }else{
            $("#flashFirst").hide();
            $("#flashTwo").show();
        }
    }
    
       var showobj = new ShowBigImageAD();

        //分类效果
        CategoryShow(true);
        $(".i_category").show();
        
        PresentHintView("pro_item", "_trackproid");
    </script>
</body>
</html>