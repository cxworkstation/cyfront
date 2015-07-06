<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chunyu.front.model.BroadCastEntity" %>    
<%@ page import="com.chunyu.front.model.NoticeEntity" %>    
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
    <meta name="copyright" content="Copyright (c) 2010 cynmsx.com. All Rights Reserved." />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta name="robots" content="index, follow" />
    <meta name="revisit-after" content="1 days" />
    <meta name="rating" content="general" />
    <meta name="keywords" content="春雨，cy，网上购物，网上超市，进口食品，化妆品，水果，家居用品，母婴，进口零食,进口牛奶" />
    <meta name="description" content="美味七七是中国领先的生鲜购物网站，精选全球时鲜蔬果、肉禽蛋奶、海鲜水产、休闲食品、酒水饮料、粮油调味等多品类商品，24小时新鲜速达，48小时退换货" />
    <link type="text/css" rel="Stylesheet" media="screen" href="css/base.css" />
    <link type="text/css" rel="Stylesheet" media="screen" href="css/homepage.css" />
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/unslider.js"></script>
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
    background-color: #008000;
}
.tg-search-btn button span {
    color: #fff;
}
   </style>

<script type="text/javascript">
    $(function() {
        var url='<%=basePath%>index/getClassifyRight';
        var mainRight=$('.main_right');
        $.ajax({
            url:url,
            type:'GET',
            dataType:'json',
            success:function(dataJson) {
               var cateList=[dataJson.classify0,dataJson.classify1,dataJson.classify2,dataJson.classify3,
                             dataJson.classify4,dataJson.classify5,dataJson.classify6];
               for(var t=0;t<7;t++) {
            	var $mainRight0=$(mainRight[t]);
                var $lis=$mainRight0.find('li');
                var $imgs=$mainRight0.find('img');
                var cateList0=cateList[t];
                if(cateList0==undefined||cateList0.length==0) {
                	$mainRight0.html('<h3>正在囤货，敬请期待</h3>');
                	continue; 
                }
                
                for(var i=0;i<cateList0.length;i++) {
                   var cate=cateList0[i];
                   var pic=cate.img;
                   var goodsId=cate.goodsId;
                   var position=cate.position;
                   if('pic12'==position) {
                	   $($imgs[0]).attr('src','http://localhost:8080/chunyu/'+pic);
                   }else if('pic13'==position) {
                       $($imgs[1]).attr('src','http://localhost:8080/chunyu/'+pic);
                   }else if('pic14'==position) {
                       $($imgs[2]).attr('src','http://localhost:8080/chunyu/'+pic);
                   }else if('desc11'==position) {
                       $($lis[0]).html("<a href='#' target='_blank'>"+pic+"</a>");
                   }else if('desc12'==position) {
                	   $($lis[1]).html("<a href='#' target='_blank'>"+pic+"</a>");
                   }else if('desc13'==position) {
                	   $($lis[2]).html("<a href='#' target='_blank'>"+pic+"</a>");
                   }else if('desc21'==position) {
                	   $($lis[3]).html("<a href='#' target='_blank'>"+pic+"</a>");
                   }else if('desc22'==position) {
                	   $($lis[4]).html("<a href='#' target='_blank'>"+pic+"</a>");
                   }else if('desc23'==position) {
                	   $($lis[5]).html("<a href='#' target='_blank'>"+pic+"</a>");
                   }else if('pic15'==position) {
                	   $($imgs[0]).attr('src','http://localhost:8080/chunyu/'+pic);
                   }else if('pic16'==position) {
                	   $($imgs[1]).attr('src','http://localhost:8080/chunyu/'+pic);
                   }
               }
              }
            }
        });


        var url1='<%=basePath%>index/getHealthPic';
        var $img=$('#health');
        $.ajax({
            url:url1,
            type:'GET',
            dataType:'json',
            success:function(data) {
                var list=data.health;
                var id=list[0];
                var img=list[1];
                $img.attr('src','http://localhost:8080/chunyu/'+img);
            }
        });

        var url2='<%=basePath%>index/getEspecialPic';
        var $img1=$('#tab_img1');
        var $img2=$('#tab_img2');
        $.ajax({
           url:url2,
           type:'GET',
           dataType:'json',
           success:function(data) {
               var list=data.especial;
               var goodsId1=list[0][0];
               var goodsId2=list[1][0];
               $img1.attr('src','http://localhost:8080/chunyu/'+list[0][1]);
               $img2.attr('src','http://localhost:8080/chunyu/'+list[1][1]);
           }
        });
    });

</script>
</head>
<body>
    <!-- 头部jsp引用 -->
    <jsp:include page="header.jsp"></jsp:include>
    
    <!-- 轮播图区域 -->
    <div class="main" id="categoryProList" >
     <div class="i_category0" style="position: relative;margin-top:-40px;">
        <jsp:include page="classify.jsp"></jsp:include>
     </div>
           <% List<BroadCastEntity> broadCastList=(List<BroadCastEntity>)request.getAttribute("broadCastList");  
              int size=broadCastList.size();
           %>
        <div class="i_banner">
            <div class="i_slider  mainBanner">
                <div class="banner" id="banner">
                    <div id="banner_bg">
                    </div>
                    <!--标题背景-->
                    <div id="banner_info">
                    </div>
                    <ul>
                     <% for(int i=1;i<=size;i++) { 
                    	String str="";
                        if(i==1) {
                          str="class='on'";
                        }
                     %>
                        <li <%=str%>><%=i%></li>
                     <%} %>
                    </ul>
                    
                    <!-- 滚动图片 -->
                    <div id="banner_list">
                       <%for(int i=0;i<size;i++) {
                    	   BroadCastEntity broad=broadCastList.get(i);
                       %>
                            <div class="bitem">
                                    <div class="mi">
                                        <a href="#" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=broad.getPic()%>" alt="" />
                                        </a>
                                    </div>
                            </div>
                       <%}%>
                    </div>
                    
                </div>
            </div>
            
            <!-- 轮播图右边区域 -->
            <div class="i_right">
                <div style="overflow:hidden;">
                        <div class="tit on" style="width:203px; ">网站公告</div>
                </div>                
                <div class="i_trends">                    
                    <!-- 网站公告 -->
                    <ul >
                         <%Object obj=request.getAttribute("noticeList");
                            boolean flag=false;
                            List<NoticeEntity> noticeList1=null;
                           if(obj==null) {
                        	   flag=true;
                           }else {
                        	   noticeList1=(List<NoticeEntity>)obj;
                           }
                           
                           if(flag) {
                        	 %>
                        	 <li>暂无公告，敬请期待</li>
                        	 <%
                           }else {
                        	   for(int i=0;i<noticeList1.size();i++) {
                        		   NoticeEntity notice1=noticeList1.get(i);
                        	%>
                        	 <li><a href="#"   title="<%=notice1.getTitle()%>"><%=notice1.getTitle()%></a></li>
                        	<%
                        	   }
                           }
                         %>
                    </ul>
                </div>
                <div class="i_ad">
                      <% if(flag) {%>
                      <h4>暂无广告</h4>
                      <%}else {
                        List<NoticeEntity> noticeList2=(List<NoticeEntity>)request.getAttribute("noticeList1");
                        NoticeEntity notice1=noticeList2.get(0);
                      %>
                        <a href="#" >
                            <img  src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=notice1.getTitle()%>" width="207px" height="189px" /></a>
                      <%}%>
                </div>
            </div>
        </div>
        
        <div class="top_tab">
            <!-- 选项卡鼠标放上展现商品区域 -->
            <div class="i_tab">
                <div class="tab_tit">
                    <ul>
                            <li class="on">今日免费</li>
                            <li class="">热门商品</li>
                            <li class="">新品上市</li>
                            <li class="">季节推荐</li>
                    </ul>
                </div>
                <div class="tab_cont">
                    <div class="contents">
                         <!-- 第一个选项卡商品  aa.id,aa.name,aa.image,aa.introduction,bb.price,bb.size-->
                          <% 
                           String[] attrName=new String[]{"freeList","hotList","newList","promtList"};
                           for(int i=0;i<4;i++) {
                        	 String style="none";
                        	 if(i==0) {
                        		 style="block";
                        	}
                           %>
                             <ul style="display:<%=style%>">
                            <% Object o=request.getAttribute(attrName[i]);
                               if(o==null) {
                             %>
                             <%for(int z=0;z<6;z++) { %>
                              <li>
                                <h2>正在囤货，敬请期待</h2>
                              </li>
                              
                             <%}
                               }else {
                            	   List<List<Object>> list=(List<List<Object>>)o;
                            	   for(int j=0;j<list.size();j++) {
                            		   List<Object> objList=list.get(j);
                            %>
                            <li style=" position:relative;">
                                            <span class="spectag all"></span>
                                        <div class="t_img">
                                            <a href="<%=basePath%>detail.html?goodId=<%=objList.get(0) %>">
                                                <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=objList.get(2)%>" alt="<%=objList.get(1) %><%=objList.get(5) %>" width="150px" height="150px" /></a>
                                        </div>
                                        <div class="t_tit">
                                            <a href="<%=basePath%>detail.html?goodId=<%=objList.get(0) %>" title="<%=objList.get(1) %><%=objList.get(5)%>"><%=objList.get(1) %><%=objList.get(5) %></a></div>
                                        <div class="t_price">
                                            <span class="b_span">￥<%=objList.get(4) %></span><!-- <span class="gry_span">￥178.00</span> -->
                                        </div>
                           </li>
                            <%	   
                            	   }
                            	   
                               }
                            %>
                            </ul>
                            <%} %>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 第一大分类 -->
        
        <% Object secondObj=request.getAttribute("secondClassify");
           List<List<Object>> secondList=null;
           if(secondObj!=null) {
        	   secondList=(List<List<Object>>)secondObj;
           }
         
        %>
            <div class="main_list ">
                <div class="tit ptitle-shuiguo">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/1f.gif" /></a></div>
                    <a href="#" >
                        <div class="li_more" style="background-color:#669900">
                            <b>更多</b><em></em>
                        </div>
                    </a>
                    <ul>
                           <!-- 第一大分类中的三级分类 -->
                           <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(0);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                   </ul>
                </div>
                <div class="p_list">
                <!-- 分类左边区域 -->
                    <div class="main_left">
                        <!-- 左边区域滚动图 -->
                        <% 
                          Object leftObj=request.getAttribute("classifyLeft");
                          List<List<Object>> classifyLeft=null;
                          boolean leftFlag=false;
                          if(leftObj==null) {
                        	  leftFlag=true;
                          }else {
                        	  classifyLeft=(List<List<Object>>)leftObj;
                          }
                        
                        %>
                        <div class="l_silder">
                            <ul>
                                  <% 
                                   List<Object> left1=classifyLeft.get(0);
                                  if(leftFlag||"0".equals(left1.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                  <%} else {%>
                                    <li class="li_item">
                                      <a href="<%=basePath%>detail.html?goodId=<%=left1.get(0) %>" >
                                        <img src="http://localhost:8080/chunyu/<%=left1.get(1)%>" height="410px;" />
                                      </a>
                                    </li>
                                    
                                    <li class="li_item">
                                     <a href="<%=basePath%>detail.html?goodId=<%=left1.get(2) %>" >
                                       <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left1.get(3)%>" width="175px" height="410px;" />
                                     </a>
                                    </li>
                                    
                                    <li class="li_item">
                                      <a href="<%=basePath%>detail.html?goodId=<%=left1.get(4) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left1.get(5)%>" width="175px" height="410px;" />
                                      </a>
                                    </li>
                                 <%} %>
                            </ul>
                        </div>
                    </div>
                  <!-- 分类具体商品展现 -->
                  <%
                     List<Object> classifyGoodList=(List<Object>)request.getAttribute("classifyGoodList");
                  %>
                    <div class="mian_cont">
                        <ul>
                        <% List<List<Object>> classify1=( List<List<Object>>)classifyGoodList.get(0); 
                           for(int i=0;i<classify1.size();i++) {
                        	   List<Object> goods=classify1.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)){
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                               <li class="pro_item first">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=goods.get(4)%>" alt="<%=goods.get(1) %><%=goods.get(2) %>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" title="<%=goods.get(1) %> <%=goods.get(2) %>" ><%=goods.get(1) %> <%=goods.get(2) %></a></div>
                                    <div class="t_price">
                                        <span class="b_span">￥<%=goods.get(3) %></span><!-- <span class="gry_span">￥45.00</span>--></div> 
                                        <span class="spectag all"></span>
                                </li>
                          <%}} %>
                        </ul>
                    </div>
                     
                      <!-- 右边此类推荐商品 -->
                        <div class="main_right">
                            <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                <img src="imgs/207x110-018(2).jpg"  width="207px" height="110px" alt=""/>
                            </a>
                            <ul class="f2">
                                    <li><a href="#" >菲律宾菠萝1只装 仅售27.9元！</a></li>
                                    <li><a href="#" >椰王1粒装(单果约600g)仅售13.9元！</a></li>
                                    <li><a href="#" >法国加纳果12粒装 仅售49.7元！</a></li>
                            </ul>
                                <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/207x110T-018(2).jpg"  width="207px" height="110px" alt=""/>
                                </a>
                            <ul class="f2">
                                    <li><a href="#" >福建蜜柚3粒 仅售24.7元！ </a></li>
                                    <li><a href="#" >佳沛意大利绿果6粒 仅售19.9元！</a></li>
                                    <li><a href="#" >海南金桔柠檬2斤 仅售13.7元！</a></li>
                            </ul>
                                <a href="#"  style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/niuyouguo.jpg"  width="207px" height="110px" alt=""/>
                                </a>                 
                         </div>
                </div>
            </div>
            
            
            <!-- 第二大类 -->
            <div class="main_list ">
                <div class="tit ptitle-danrou">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/2f.gif" /></a></div>
                    <a href="/category/97.html" >
                        <div class="li_more" style="background-color:#cc3333">
                            <b>更多</b><em></em>
                         </div>
                    </a>
                    <!-- 第二大分类当中的第三级分类 -->
                    <ul>
                        <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(1);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="#" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                    </ul>
                </div>
                
                <div class="p_list">
                    <div class="main_left">
                     <!-- 左边滚动区域 -->
                        <div class="l_silder">
                            <ul>
                                 <% 
                                  List<Object> left2=classifyLeft.get(1);
                                  if(leftFlag||"0".equals(left2.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                  <%} else {%>
                                    <li class="li_item">
                                      <a href="<%=basePath%>detail.html?goodId=<%=left2.get(0) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left2.get(1) %>" width="175px" height="410px;" />
                                      </a>
                                    </li>
                                    <li class="li_item">
                                      <a href="<%=basePath%>detail.html?goodId=<%=left2.get(2) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left2.get(3) %>" width="175px" height="410px;" />
                                      </a>
                                    </li>
                                    <li class="li_item">
                                     <a href="<%=basePath%>detail.html?goodId=<%=left2.get(4) %>" >
                                       <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left2.get(5)%>" width="175px" height="410px;" />
                                     </a>
                                   </li>
                                  <%} %>   
                                       
                            </ul>
                        </div>
                    </div>
                    <!-- 第二大类具体商品展现 -->
                    <div class="mian_cont">
                        <ul>
                          <% List<List<Object>> classify2=( List<List<Object>>)classifyGoodList.get(1); 
                           for(int i=0;i<classify2.size();i++) {
                        	   List<Object> goods=classify2.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)) {
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                                <li class="pro_item first" _trackproid="211501015" _plink="#" _hasstock="True">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=goods.get(4) %>" 
                                            alt="<%=goods.get(1) %><%=goods.get(2) %>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" title="<%=goods.get(1) %><%=goods.get(2) %>" ><%=goods.get(1) %><%=goods.get(2) %></a></div>
                                    <div class="t_price">
                                        <span class="b_span">￥<%=goods.get(3) %></span><!-- <span class="gry_span">￥58.00</span> --></div>
                                        <span class="spectag all"></span>
                                </li>
                           <%}}%>
                        </ul>
                    </div>
                    <!-- 右边此类商品推荐 -->
                        <div class="main_right">
                            <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                <img src="imgs/207x110-01925.7.jpg"  width="207px" height="110px" alt=""/>
                            </a>
                            <ul class="f2">
                                    <li><a href="#" >金锣猪筒骨800g仅售26.90元！</a></li>
                                    <li><a href="#" >特等肥牛卷250g 仅售21.9！</a></li>
                                    <li><a href="#" >嫩肩牛排150g 仅售11.9元！</a></li>
                            </ul>
                                <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/gusiniulang.jpg"  width="207px" height="110px" alt=""/>
                                </a>
                            <ul class="f2">
                                    <li><a href="#" >樱桃谷鸭1000g 仅售19.9元！</a></li>
                                    <li><a href="#" >鸡中翅500g仅售22元！</a></li>
                                    <li><a href="#" >美味七七秘制牛排150g仅售12.9元！</a></li>
                            </ul>
                                <a href="#"  style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/yangtuipai.jpg"  width="207px" height="110px" alt=""/>
                                </a>                        
                       </div>
                </div>
            </div>
            
            
            <!-- 第三大类 -->
            <div class="main_list ">
                <div class="tit ptitle-haixian">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/3f.gif" /></a></div>
                    <a href="#" >
                        <div class="li_more" style="background-color:#3399cc">
                            <b>更多</b><em></em>
                        </div>
                    </a>
                    <!-- 第三大分类当中的第三级分类 -->
                    <ul>
                     <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(2);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="#" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                    </ul>
                </div>
                
                <div class="p_list">
                    <div class="main_left">
                    <!-- 左边滚动区域 -->
                        <div class="l_silder">
                            <ul>
                                <% 
                                  List<Object> left3=classifyLeft.get(2);
                                  if(leftFlag||"0".equals(left3.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                  <%} else {%>
                                    <li class="li_item">
                                     <a href="<%=basePath%>detail.html?goodId=<%=left3.get(0) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left3.get(1)%>" width="175px" height="410px;" />
                                     </a>
                                    </li>
                                    <li class="li_item">
                                     <a href="<%=basePath%>detail.html?goodId=<%=left3.get(2) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left3.get(3)%>" width="175px" height="410px;" />
                                     </a>
                                   </li>
                                   <li class="li_item">
                                      <a href="<%=basePath%>detail.html?goodId=<%=left3.get(4) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left3.get(5)%>" width="175px" height="410px;" />
                                      </a>
                                   </li>
                                 <%} %>
                            </ul>
                        </div>
                    </div>
                    <!-- 具体商品展现局域 -->
                    <div class="mian_cont">
                        <ul>
                        <% List<List<Object>> classify3=( List<List<Object>>)classifyGoodList.get(2); 
                           for(int i=0;i<classify3.size();i++) {
                        	   List<Object> goods=classify3.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)) {
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                                <li class="pro_item first">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=goods.get(4) %>" alt="<%=goods.get(1) %><%=goods.get(2) %>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0)%>" title="<%=goods.get(1) %><%=goods.get(2) %>" ><%=goods.get(1) %><%=goods.get(2) %></a></div>
                                    <div class="t_price">
                                        <span class="b_span">￥<%=goods.get(3) %></span><!--  <span class="gry_span">￥55.00</span>--></div>
                                        <span class="spectag all"></span>
                                </li>
                         <%}} %>
                        </ul>
                    </div>
                   <!-- 右边此类推荐商品 -->
                  <div class="main_right">
                          <a href="#" >
                              <img src="imgs/blank.gif" class="lazy" data-src="imgs/baoyu.jpg" width="207px" height="246px" /></a>
                          <a href="#" >
                              <img src="imgs/blank.gif" class="lazy" data-src="imgs/207x246-006.jpg" width="207px" height="246px" /></a>
                  </div>
                </div>
            </div>
            
            <!-- 第四大类 -->
            <div class="main_list ">
                <div class="tit ptitle-sushi">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/4f.gif" /></a></div>
                    <a href="#" >
                        <div class="li_more" style="background-color:#cc9933">
                            <b>更多</b><em></em>
                        </div>
                    </a>
                    <!-- 第三级分类 -->
                    <ul>
                            <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(3);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="#" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                    </ul>
                </div>
                <div class="p_list">
                    <div class="main_left">
                        <div class="l_silder">
                            <ul>
                               <% 
                                  List<Object> left4=classifyLeft.get(3);
                                  if(leftFlag||"0".equals(left4.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                  <%} else {%>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left4.get(0) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left4.get(1) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left4.get(2) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left4.get(3) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left4.get(4) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left4.get(5) %>" width="175px" height="410px;" /></a></li>
                                 <%} %>
                            </ul>
                        </div>
                    </div>
                    <!-- 具体商品展现局域 -->
                    <div class="mian_cont">
                        <ul>
                           <% List<List<Object>> classify4=( List<List<Object>>)classifyGoodList.get(3); 
                           for(int i=0;i<classify4.size();i++) {
                        	   List<Object> goods=classify4.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)) {
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                                <li class="pro_item first" _trackproid="121515042" _plink="#" _hasstock="True">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=goods.get(4) %>" 
                                            alt="<%=goods.get(1) %><%=goods.get(2) %>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" title="<%=goods.get(1) %><%=goods.get(2) %>" ><%=goods.get(1) %><%=goods.get(2) %></a></div>
                                    <div class="t_price"><span class="b_span">￥<%=goods.get(3) %></span><!--<span class="gry_span">￥12.90</span>  --></div>
                                        <span class="spectag all"></span>
                                        <span class="p-csttag ctag-zeng showzeng">
                                        </span>
                                </li>
                            <%} }%>
                        </ul>
                    </div>
                    <!-- 右边推荐商品区域 -->
                        <div class="main_right">
                            <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                <img src="imgs/subaoyu.jpg"  width="207px" height="110px" alt=""/>
                            </a>
                            <ul class="f2">
                                    <li><a href="#" >黄金奶条220g 买一送一 仅售9.9元</a></li>
                                    <li><a href="#" >良中良鱼面筋160g 仅售8.5元</a></li>
                                    <li><a href="#" >功德林速冻豆沙包300g 仅售9.9元</a></li>
                            </ul>
                                <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/207x110-027.jpg"  width="207px" height="110px" alt=""/>
                                </a>
                            <ul class="f2">
                                    <li><a href="#" >功德林速冻香菇烧卖250g 10.5元</a></li>
                                    <li><a href="#" >风味窝窝头280g 买一送一 仅售10元</a></li>
                                    <li><a href="#" >经典飘香炒菜培根85g 仅售10元</a></li>
                            </ul>
                                <a href="#"  style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/shanlinsushi.jpg"  width="207px" height="110px" alt="test"/>
                                </a>                       
                       </div>
                </div>
            </div>
            
            
            <!-- 第五大类 -->
            <div class="main_list ">
                <div class="tit ptitle-niunai">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/5f.gif" /></a></div>
                    <a href="#" >
                        <div class="li_more" style="background-color:#9999cc">
                            <b>更多</b><em></em>
                        </div>
                    </a>
                    <ul>
                    <!-- 第三级分类 -->
                        <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(4);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="#" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                    </ul>
                </div>
                
                <div class="p_list">
                    <div class="main_left">
                    <!-- 左边滚动区域 -->
                        <div class="l_silder">
                            <ul>
                                <% 
                                  List<Object> left5=classifyLeft.get(4);
                                  if(leftFlag||"0".equals(left5.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                 <%} else {%>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left5.get(0) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left5.get(1) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left5.get(2) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left5.get(3) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left5.get(4) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left5.get(5) %>" width="175px" height="410px;" /></a></li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- 具体商品展现区域 -->
                    <div class="mian_cont">
                        <ul>
                          <% List<List<Object>> classify5=( List<List<Object>>)classifyGoodList.get(4); 
                           for(int i=0;i<classify5.size();i++) {
                        	   List<Object> goods=classify5.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)) {
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                                <li class="pro_item first">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=classify5.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=classify5.get(4) %>" 
                                            alt="<%=classify5.get(1)%><%=classify5.get(2) %>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=classify5.get(0) %>" title="<%=classify5.get(1)%><%=classify5.get(2) %>" ><%=classify5.get(1)%><%=classify5.get(2) %></a></div>
                                    <div class="t_price">
                                        <span class="b_span">￥<%=classify5.get(3) %></span>
                                        <!-- <span class="gry_span">￥162.00</span> --></div>
                                        <span class="spectag all"></span>
                                </li>
                           <%} }%>
                        </ul>
                    </div>
                    <!-- 右边此类推荐商品 -->
                  <div class="main_right">
                          <a href="#" >
                              <img src="imgs/blank.gif" class="lazy" data-src="imgs/huadiao.jpg" width="207px" height="246px" /></a>
                          <a href="#" >
                              <img src="imgs/blank.gif" class="lazy" data-src="imgs//207x246-054.jpg" width="207px" height="246px" /></a>
                  </div>
                </div>
            </div>
            
            
            <!-- 第六大类 -->
            <div class="main_list ">
                <div class="tit ptitle-shishu">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/6f.gif" /></a></div>
                    <a href="#" >
                        <div class="li_more" style="background-color:#669933">
                            <b>更多</b><em></em></div>
                    </a>
                    <ul>
                            <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(5);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="#" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                        
                    </ul>
                </div>
                <div class="p_list">
                    <div class="main_left">
                    <!-- 左边滚动区域 -->
                        <div class="l_silder">
                            <ul>
                                <% 
                                  List<Object> left6=classifyLeft.get(5);
                                  if(leftFlag||"0".equals(left6.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                 <%} else {%>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left6.get(0) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left6.get(1) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left6.get(2) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left6.get(3) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left6.get(4) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left6.get(5) %>" width="175px" height="410px;" /></a></li>
                                 <%} %>
                            </ul>
                        </div>
                    </div>
                    <div class="mian_cont">
                        <ul>
                         <% List<List<Object>> classify6=( List<List<Object>>)classifyGoodList.get(5); 
                           for(int i=0;i<classify6.size();i++) {
                        	   List<Object> goods=classify6.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)) {
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                                <li class="pro_item first" _trackproid="111611294" _plink="#" _hasstock="True">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=classify6.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=classify6.get(4) %>" 
                                            alt="<%=classify6.get(1)%><%=classify6.get(2)%>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=classify6.get(0) %>" title="<%=classify6.get(1)%><%=classify6.get(2)%>" ><%=classify6.get(1)%><%=classify6.get(2)%></a></div>
                                    <div class="t_price">
                                        <span class="b_span">￥<%=classify6.get(3) %></span>
                                        <!-- <span class="gry_span">￥48.00</span> --></div>
                                        <span class="spectag all"></span>
                                </li>
                          <%} }%>
                        </ul>
                    </div>
                  <div class="main_right">
                          <a href="#" >
                              <img src="imgs/blank.gif" class="lazy" data-src="imgs/jingjida.jpg" width="207px" height="246px" /></a>
                          <a href="#" >
                              <img src="imgs/blank.gif" class="lazy" data-src="imgs/207x246-051.jpg" width="207px" height="246px" /></a>
                  </div>
                </div>
            </div>
            
            
            <!-- 第七大类 -->
            <div class="main_list ">
                <div class="tit ptitle-liangyou">
                    <div class="i_floor">
                        <a href="#" >
                            <img src="imgs/7f.gif" /></a></div>
                    <a href="#" >
                        <div class="li_more" style="background-color:#ff6666">
                            <b>更多</b><em></em>
                        </div>
                    </a>
                    <ul>
                       <%
                             if(secondList!=null) {
                            	 List<Object> secondNameList1=secondList.get(6);
                            	 for(int i=0;i<secondNameList1.size();i+=2) {
                            		 Object id=secondNameList1.get(i);
                            		 Object name=secondNameList1.get(i+1);
                            		 if(!"0".equals(id)) {
                            %>
                            <li><a href="#" ><%=name %></a></li>
                            <%
                            		 }
                            	 }
                             }
                           %>
                    </ul>
                </div>
                <div class="p_list">
                    <div class="main_left">
                        <div class="l_silder">
                            <ul>
                               <% 
                                  List<Object> left7=classifyLeft.get(6);
                                  if(leftFlag||"0".equals(left6.get(0).toString())) {%>
                                    <li class="li_item"><h3>正在囤货，敬请期待</h3></li>
                                 <%} else {%>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left7.get(0) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left7.get(1) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left7.get(2) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left7.get(3) %>" width="175px" height="410px;" /></a></li>
                                    <li class="li_item"><a href="<%=basePath%>detail.html?goodId=<%=left7.get(4) %>" >
                                        <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=left7.get(5) %>" width="175px" height="410px;" /></a></li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <div class="mian_cont">
                        <ul>
                        <% List<List<Object>> classify7=( List<List<Object>>)classifyGoodList.get(6); 
                           for(int i=0;i<classify7.size();i++) {
                        	   List<Object> goods=classify7.get(i);//id,名称,尺寸,价格,图片
                        	   String str=goods.get(0).toString();
                        	   if("0".equals(str)) {
                         %>
                            <li class="pro_item first">
                              <h4>
                                                               正在囤货，敬请期待
                              </h4>
                            </li>
                         <%
                        	   }else {
                         %>
                                <li class="pro_item first">
                                    <div class="t_img">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" >
                                            <img src="imgs/blank.gif" class="lazy" data-src="http://localhost:8080/chunyu/<%=goods.get(4) %>"
                                             alt="<%=goods.get(1)%><%=goods.get(2)%>"  width="150px" height="150px" /></a></div>
                                    <div class="t_tit">
                                        <a href="<%=basePath%>detail.html?goodId=<%=goods.get(0) %>" title="<%=goods.get(1)%><%=goods.get(2)%>" ><%=goods.get(1)%><%=goods.get(2)%></a></div>
                                    <div class="t_price">
                                        <span class="b_span">￥<%=goods.get(3) %></span><!--<span class="gry_span">￥44.28</span>  --></div>
                                        <span class="spectag all"></span>
                                </li>
                         <%}}%>
                        </ul>
                    </div>
                    
                        <div class="main_right">
                            <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                <img src="imgs/muying.jpg"  width="207px" height="110px" alt=""/>
                            </a>
                            <ul class="f2">
                                    <li><a href="#" >塞翁福东北黑木耳150g 仅售19.9元</a></li>
                                    <li><a href="#" >加拿大卡普莉芥花籽油1.89L 99元</a></li>
                                    <li><a href="#" >东北长粒香大米5kg 仅售40元</a></li>
                            </ul>
                                <a href="#"    style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/207x110-0221231.jpg"  width="207px" height="110px" alt=""/>
                                </a>
                            <ul class="f2">
                                    <li><a href="#" >风筝特一粉小麦粉1kg 仅售8元 </a></li>
                                    <li><a href="#" >梅林午餐肉340g 仅售11.9元</a></li>
                                    <li><a href="#" >萨瓦蒂泰国黑糯米1kg 仅售51.9元</a></li>
                            </ul>
                                <a href="#"  style="width:207px;height:110px;display:inline-block;">
                                    <img src="imgs/yangsheng.jpg"  width="207px" height="110px" alt=""/>
                                </a>                       
                      </div>
                </div>
            </div>
           
        <div class="clear">
        </div>
    </div>
    <!-- 底部jsp引用 -->
      <jsp:include page="footer.jsp"></jsp:include>    
     <script type="text/javascript" src="js/t.js"></script>
     <!--  
        <div class="right_float h_f_a_d">
            <ul class="r_banner">
                        <li class="first banner_item">
                            <div>
                                <a href="#" ><span>到家app</span>
                                    <div class="banner_img on">
                                        <img src="imgs/blank.gif" class="lazy" data-src="imgs/daojiameishihui.jpg" alt="到家app" /></div>
                                    <b></b></a>
                            </div>
                        </li>
                        <li class=" banner_item">
                            <div>
                                <a href="#" ><span>满额换购</span>
                                    <div class="banner_img on">
                                        <img src="imgs/blank.gif" class="lazy" data-src="imgs/134-016.jpg" alt="满额换购" /></div>
                                    <b></b></a>
                            </div>
                        </li>
                        <li class=" banner_item">
                            <div>
                                <a href="#" ><span>企业采购</span>
                                    <div class="banner_img on">
                                        <img src="imgs/blank.gif" class="lazy" data-src="imgs/qiyecaigou.jpg" alt="企业采购" /></div>
                                    <b></b></a>
                            </div>
                        </li>
                    <li class="last banner_item">
                        <div>
                            <a href="#" ><span>订单查询</span> </a>
                        </div>
                    </li>
            </ul>
        </div>
    -->
    <noscript>
        <div class="noscript">
            警告：由于您的浏览器禁止运行JavaScript，可能会导致部分功能不能正常运行。
        </div>
    </noscript>
    
    <script type="text/javascript" src="js/jquery.autocomplete-min.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript" src="js/cp_cutdown.js"></script>
    <script type="text/javascript" src="js/global.js"></script>
    <script type="text/javascript" src="js/jquery.alerts.js"></script>
    <script type="text/javascript" src="js/jquery.utility.js"></script>
    <script type="text/javascript" src="js/jquery.lazyload.js"></script>
    <script type="text/javascript">
       var showobj = new ShowBigImageAD();
        //限时抢购手动左右切换
        //参数含义：1：左边按钮、2：右边按钮、3：需要应用动画的元素、4：子元素个数、5：移动宽度、6：动画速度
        cir_element($(".q_left"),$(".q_right"),$(".i_p_left ul"),$(".i_p_left ul li").length,$(".i_p_left ul li").width(),500);

        //分类效果
        CategoryShow(true);
        CategoryShow(false);;
        /**
           right_float、h_f_a_d都是首页右边悬停的滑条区域，
           当窗口的宽度小于1190px时，这个区域将会隐藏起来，如果大于1190px，那么这个区域将会停悬在右边一个固定的区域。
        */
        var home_float_ad_scroll = function(){
            var left_fad =$(".left_float");
            var right_fad =$(".right_float");
            var winWidth = $(window).width();
            if(winWidth<1190){
                $(".h_f_a_d").hide();
            }else{
               $(".h_f_a_d").show();
               left_fad.css("left", (winWidth / 2 - 739) + "px");
               right_fad.css("right", (winWidth / 2 - 729) + "px");
            }
        };

        $("#right_float_close_btn").data("hide", "no").click(function(){
            $(this).data("hide", "yes");
            $(this).parent().hide();
        });

        $("#right_float_close_btn2").data("hide", "no").click(function(){
            $(this).data("hide", "yes");
            $(this).parent().hide();
        });

        $(document).ready(function () {
          /**
          jQuery Unveil是一款轻量的延迟加载插件，提供用于支持视网膜显示设备的高分辨率图像。
          这个插件非常有用，它能提高长网页中图像的加载性能，因为视口以外的图像不会被加载，直到用户滚动到它们所在的区域。
          */
        	$("img.lazy").unveil(150);
            addGotoTopBar(home_float_ad_scroll);

           /**
           应用场景：分类区域左边的图片轮放动画效果
           知识普及：Unslider是一款非常轻量的jQuery插件(压缩后只有1KB)，能够用于任何HTML内容的滚动。
           可以相应容器的大小变化，自动排布不同大小的滑块。可以通过整合jquery.event.swipe来让其支持触屏设备的滑动功能。
           */
            $(".l_silder").unslider({
                 fluid: true, //是否支持响应式
                 dots: true,  //是否支持点导航
                 speed: 500,  //滚动速度
                 pause: true  
            });

    var silders = $(".l_silder");
    $(silders).each(function (index) {
        var licount = $(this).find("ul").find("li").length;
        if (licount < 2) {//如果现在滚动的元素少于2个，则将点导航去掉
            $(this).find(".dots").remove();
        }
    });
    });
    </script>
</body>
</html>