<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath%>css/base.css" />
    <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath%>css/product.css" />
    <link type="text/css" rel="Stylesheet" media="screen" href="<%=basePath%>css/common.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/category.js"></script>
    <script type="text/javascript">
        var basePath='<%=basePath%>';
        $(document).ready(function() {
           $('.i_category').css('display','none');
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
             <div class="p_l_menu_p">
                <dl class="p_l_menu_1">
                 <dt class="p_l_menu_h"><a href="#">热销商品</a></dt>
             </dl>
            </div>
        </div>
        <div class="top_right">
         <% List<List<Object>> broadList=(List<List<Object>>)request.getAttribute("broadList"); %>
            <div class="mainAds">
                <div class="mainAds_left">
                    <ul>
                           <ul>
                    <%for(int i=0;i<broadList.size();i++) { 
                        List<Object> broad=broadList.get(i);
                    %>
                            <li _mark="1" style=" display: block; "><a href="#">
                                <img src="http://localhost:8080/chunyu/<%=broad.get(1)%>"/></a></li>
                     <%} %>
                    </ul>
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
                <span>(共<strong id="res_count">29767</strong>个商品)</span>
             </div>
            </div>
             
            <div class="mc attrs">
               <div class="brand-attr">
                 <div class="attr">
                   <div class="a-key">品牌：</div>
                   <div class="a-values">
                     <div class="v-tabs"><a>水果</a></div>
                   </div>
                </div>
               </div>
               
               <div class="prop-attrs">
                  <div id="select-price" class="attr">
                     <div class="a-key">价格：</div>
                      <div class="a-values">
                     <div class="v-fold" style="height:40px;width: 900px;">
                        <ul class="f-list">
                          <li><a onclick="pricefu(0);">0-15</a></li>
                          <li><a onclick="pricefu(1);">16-50</a></li>
                          <li><a onclick="pricefu(2);">51-100</a></li>
                          <li><a onclick="pricefu(3)">101-199</a></li>
                          <li><a onclick="pricefu(4)">199以上</a></li>
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
                 <form method="GET" class="sort" name="listform">
                   <a  href="javascript:orderfu(0,${classifyId});"><img src="<%=basePath%>imgs/goods_id_default.GIF" alt="按上架时间排序"></a>
                   <a  href="javascript:orderfu(1,${classifyId});"><img src="<%=basePath%>imgs/shop_price_default.GIF" alt="按价格排序"></a>
                   <a  href="javascript:orderfu(2,${classifyId});"><img src="<%=basePath%>imgs/sales_default.GIF" alt="销量排行"></a>
                </form>
             </div>
             
            <div class="f_r">
              <div class="pagertop">< <a onclick="changePage(0);">上一页</a><a onclick="changePage(1);">下一页</a>  > </div>
           </div>
          </div>
 
           </div>
            
           <div class="tow_buttombox">
               <%
                 int i=0; 
                 int pageSize=1;
                %>
            <div class="mainbox_2 clearBoth" id="catproductlist" >
              <!-- 分类及其其下的商品模块 -->
              <c:forEach items="${list}" var="map" >
               <%
               String id="region_right"+i;
               String cla="classifyId"+i;
               i++;
               %>
                <div id="region" class="region">
                    <div class="title">
                        <span class="left color_red1 b" id="<%=cla%>" classify2="${map.id2}">${map.classify2}</span>
                        <div class="right">
	                        <c:forEach items="${map.thirdClassify}" var="classify3">
	                          <span><a class="padding" href="${classify3.id}">${classify3.name}</a></span>
	                        </c:forEach>
                        </div>
                    </div>
                    <div class="content">
                       <div class="region_right" id="<%=id%>">
                        <ul>
                        <!-- 具体商品展现区域 -->
                         <c:forEach items="${map.listGoods}" var="goods">
                                <li class="pitem"  _trackproid="111014147" style="position:relative;" _hasstock="True">
                                    <div class="divproduct">
                                        <div class="divimg">
                                          <a href="<%=basePath%>detail.html?goodId=${goods.id}">
                                            <img src="http://localhost:8080/chunyu/${goods.image}" alt="${goods.name}${goods.size}">
                                           </a>
                                        </div>
                                        <div class="pname_div">
                                            <a href="<%=basePath%>detail.html?goodId=${goods.id}" title="${goods.name}${goods.size}">${goods.name}${goods.size}</a>
                                        </div>
                                        <div class="price_div">
                                            <span class="pcprice_sp">${goods.price}</span> <span class="pmprice_sp">￥<del>99.00</del></span>
                                        </div>
                                        <div class="divbtn">
                                            <div class="btn instock">
                                            </div>
                                        </div>
                                        <div class="tag" title="${goods.introduction}">
                                           ${goods.introduction}
                                        </div>
                                    </div>
                                </li>
                          </c:forEach>         
                        </ul>
                       </div>
                    </div>
                    <!-- 记录各个模块当前的商品数目，也就是页大小 -->
                    <div id="div" num="<%=i %>" page="<%=pageSize %>"></div>
                </div>
               </c:forEach>
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
    <script type="text/javascript" src="<%=basePath%>js/cp_cutdown.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/global.js"></script>
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