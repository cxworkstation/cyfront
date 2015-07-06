<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.chunyu.front.model.ClassifyEntity" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 头部区域 -->
    <div class="topheader" style="background-color: #f7f5f5; margin: 0 auto;">
        <div class="top">
            <div class="login">
               <ul class="atopBar">
                 <li><span class="star"></span></li>
                 <li><a href="javascript:;" id="favoritecptrue"><span>收藏本站</span>&nbsp;&nbsp;</a></li>
             </ul>
          </div>

<!-- 登陆注册区域-->
<div class="mem_index">
    <ul>
    <li id="lilogon" class="logon">欢迎来到春雨在线 <a href="#" class="mr10" style="color:#ff0000;">请登录</a> <span style="padding-left:1px;">或</span> <a href="#" style="color:#ff0000;">
            免费注册</a> <b class="barLine"></b></li>
        <li>
            <div>
                <a href="#">我的订单</a>
            </div>
        </li>         
        <li>
            <div>
                <span><a href="#">积分商城</a></span>
            </div>
        </li>
        <li class="more">
            <div>
                <span class="my77"><a href="#">帮助中心<em></em></a></span>
                <div class="hover-list" style="display: none">
                    <div>
                        <a href="#">购物指南</a></div>
                    <div>
                        <a href="#">退换货</a></div>
                    <div>
                        <a href="#">投诉</a></div>
                </div>
            </div>
        </li>
        <li>
            <div>
                <span class="my_tel"><em></em><strong>客服热线：<font>400-020-8877</font></strong></span>
            </div>
        </li>
    </ul>
  </div>
 </div>
</div>
    <div class="topheader" id="topBar">
     </div>
     
    <!-- 头部横屏广告 -->
    <div class="bigpromo pagewidth hide ">
                         <div class="bigpromo pagewidth hide " >
                           <a href="#" id="hrefBigPromo1" title="" target="_blank">
                            <img src="<%=basePath %>imgs/sheguoding.jpg" alt="" />
                           </a>
                        </div>
    </div>
            
               
        <div class="header_main">
        <!-- LOGO区域 -->
        <div class="logo">
                <a href="/" title="点此可以回到首页">
                    <img src="<%=basePath %>imgs/logo.gif" width="180px" height="70px" /></a> 
                    <a class="amazonline" href="javascript:void(0)"></a><a target="_blank" href="#"title="">
                    <img class="amazonimg" src="<%=basePath %>imgs/amazonlog.gif" width="90px" height="70px" />
               </a>
             <a target="_blank" href="#"><img class="amazonimg" src="<%=basePath %>imgs/wawa.gif" width="90px" height="70px" /></a>      
        </div>
        
        <!-- 搜索区域 -->
            <div class="search" style="background-color:#008000;">
              <form method="get" action="#" data-id="search-form" name="search-box">
                <div class="tg-search-box">
                    <input type="search" x-webkit-grammar="builtin:translate" autocomplete="off" autofocus="true" placeholder="输入关键词进行搜索" name="q" accesskey="s" data-id="search-input">
                </div>
                <div class="tg-search-btn">
                   <button data-id="search-button" type="submit"><span>搜索</span></button>
               </div>
             </form>
           </div>
        </div>

    <div id="winner" class="menu_nav" style=" z-index: 999999999; position: static; top: 0px;">
          <div class="nav" id="topchannel">
         <ul>
                <li class="lichannel firstli"><a href="/category/1.html" >商品分类</a>
                    <div class="i_category" style="display:none;z-index:999999">
                      <jsp:include page="classify.jsp"></jsp:include>
                    </div>
                </li>
                
               <!-- 导航栏区域 -->
                <li class="lichannel liindex">
                    <a href="<%=basePath%>index.html">首页</a>
                </li>
                 <li class="lichannel">
                    <a href="">团购</a>
                </li>
                <li class="lichannel">
                    <a href="<%=basePath%>agent.jsp" >农贸市场</a>
                </li>
                <li class="lichannel">
                    <a href="">安心承若</a>
                </li>
                <li class="lichannel">
                    <a href="">购买细则</a>
                </li>
            </ul>
        </div>
    </div>
<script type="text/javascript" src="js/common.js"></script>