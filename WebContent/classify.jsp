<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.chunyu.front.model.ClassifyEntity" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<ul id="main_cat">   
       <% ServletContext sc=request.getSession().getServletContext(); 
       List<ClassifyEntity> list1=(List<ClassifyEntity>)sc.getAttribute("level1Classify");
       for(int i=0;i<list1.size();i++) {
         ClassifyEntity ce1=list1.get(i);
         int id1=ce1.getId();
         List<ClassifyEntity> list2=(List<ClassifyEntity>)sc.getAttribute("level2Classify"+id1);
        %>
        <li _index="<%=i+1%>" class="li">
           <!-- 第一级分类 -->
           <div class="cat_tit" id="catlistul">
            <a href="<%=basePath%>category/<%=id1%>/1/<%=id1%>.html" style="color:#525252"><%=ce1.getName()%></a>
           </div>
           <div class="cat_menu" style="display: none;">
            <div class="cat_m">
                <% for(int j=0;j<list2.size();j++) { 
                   ClassifyEntity ce2=list2.get(j);
                   int id2=ce2.getId();
                   List<ClassifyEntity> list3=(List<ClassifyEntity>)sc.getAttribute("level3Classify"+id2);
                %>
                <dl class="cat_dl">
                   <!-- 第二级分类 -->
                   <dt><a href="<%=basePath%>category/<%=id1%>/2/<%=id2%>.html"><%=ce2.getName() %></a> </dt>
                   <!-- 第三级分类 -->
                    <dd>
                   <%for(int z=0;z<list3.size();z++) { 
                     ClassifyEntity ce3=list3.get(z);
                     int id3=ce3.getId();
                   %>
                    <a href="<%=basePath%>category/<%=id1%>/3/<%=id3%>.html"><%=ce3.getName()%></a>
                    <%} %>
                   </dd>
                </dl>
               <%}%>
            </div>
           
                <div class="brand">
                 <div class="title0">推荐品牌 </div>
                 <div class="content">
                    <a href="/product/search?key=%E6%96%B0%E8%A5%BF%E5%85%B0%E4%BD%B3%E6%B2%9B">新西兰佳沛</a>
                    <a href="/product/search?key=%E6%96%B0%E5%A5%87%E5%A3%AB">新奇士</a>
                 </div>
              </div>
          </div>
        </li>	  
        		<%	  
         }
          %>	  
      </ul>		  
