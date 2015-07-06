package com.chunyu.front.controller;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chunyu.front.model.GoodsEntity;
import com.chunyu.front.service.CategoryService;
import com.chunyu.front.service.ClassifyService;
import com.chunyu.front.service.GoodsService;
import com.chunyu.front.utils.PageModel;

import flexjson.JSONSerializer;

@Controller
public class CategoryController extends BaseController{
	 @Resource(name="categoryService")
	 private CategoryService categoryService;
	 @Resource(name="goodsService")
	 private GoodsService goodsService;
	 @Resource(name="classifyService")
	 private ClassifyService classifyService;
	 
	//进来的方式有1.点击全部分类的某一个分类进入 2.搜索栏进入
	@RequestMapping(value="category/{topId}/{level}/{id}.html",method=RequestMethod.GET)
	public String category(HttpServletRequest request,String classify,@PathVariable(value="id") Integer classifyId,
			@PathVariable(value="level") Integer level,@PathVariable(value="topId") Integer topId) throws Exception{
		//得到该大类下的轮播图
		List<List<Object>> broadList=classifyService.getBroadByClassify(topId);
		request.setAttribute("broadList", broadList);
		
		if(level==3) {
			//得到该类别下的所有商品数目
			int totalRecord=goodsService.getTotalRecordsByCateId(classifyId);
			
			PageModel<GoodsEntity> pm=new PageModel<GoodsEntity>();
			int flag=totalRecord%pm.pageSize;
			int pagenum=totalRecord/pm.pageSize;
			if(flag==0) {//说明满页
				pm.totalPage=pagenum;
			}else {
				pm.totalPage=pagenum+1;
			}
			
			pm.currentPage=1;
			pm.totalRecords=totalRecord;
			
			List<GoodsEntity> goodsList=goodsService.getGoodsByCateId(classifyId,0,pm.pageSize);
			pm.list=goodsList;
			request.setAttribute("pm",pm);
			String cateName=categoryService.getCateNameById(classifyId);
			request.setAttribute("cateName",cateName);
			request.setAttribute("classifyId",classifyId);
			request.setAttribute("pageOffset",0);
			request.setAttribute("img1","http://localhost:8080/cyfront/imgs/goods_id_default.GIF");
			request.setAttribute("img2","http://localhost:8080/cyfront/imgs/shop_price_ASC.GIF");
			String position=request.getParameter("position");
			request.setAttribute("position",position);
			return "category1";
		}
		
		//展示出来商品(以下就展示两个）
		List<Map<String,Object>> goodList=categoryService.getClassifyGoods(classifyId,level);
		request.setAttribute("list", goodList);
		request.setAttribute("classifyId",classifyId);
		return "category";
	}
	
	
	
	//三级分类按条件排序查询
	
	@RequestMapping("category/classifySearch.html")
	public String thirdClassifySearch(HttpServletRequest request,String cateName,String price1,String price2,
			String priceOrder,String dateOrder,Integer classifyId,Integer position,String img1,String img2,
			Integer pageOffset,String orient) {
		PageModel<GoodsEntity> pm=new PageModel<GoodsEntity>();
		int totalRecords= categoryService.searchClassifyGoodsRecords(price1,price2,classifyId);
		int pagenum=totalRecords/pm.pageSize;
		int flag=totalRecords%pm.pageSize;
		
		if(flag==0) {//说明满页
			pm.totalPage=pagenum;
		}else {
			pm.totalPage=pagenum+1;
		}
		
		if("pre".equals(orient)) {//上一页，要将当期偏移量减去一页的大小，如果当前为第一页，且为残缺页，那么就会出现负数，抛出异常
			pageOffset-=pm.pageSize;
			if(pageOffset<0) {
				pageOffset=0;
			}
		}else if("next".equals(orient)) {//下一页，说明要将当前偏移量加上一页的大小，如果当前偏移量加上一页的大小大于总的记录数，那么就展示最后一页
			if(pageOffset+pm.pageSize>=totalRecords) {//说明再往下就没有记录了，此时就展现最后一页
				if(flag==0) {//说明刚好满页
					pageOffset=totalRecords-(pagenum-1)*pm.pageSize;
				}else {//说明有残缺页
					pageOffset=totalRecords-pagenum*pm.pageOffset;
				}
			}else {
				pageOffset+=pm.pageSize;
			}
		}
		
		
		
		List<GoodsEntity> list=categoryService.searchClassifyGoods(classifyId,price1,price2,priceOrder,dateOrder,pageOffset,pm.pageSize);
		
		pagenum=pageOffset/pm.pageSize;
		pm.currentPage=pagenum+1;
		
		pm.list=list;
		pm.totalRecords=totalRecords;
		
		
		request.setAttribute("cateName",cateName);
		request.setAttribute("price1",price1);
		request.setAttribute("price2",price2);
		request.setAttribute("priceOrder",priceOrder);
		request.setAttribute("dateOrder",dateOrder);
		request.setAttribute("classifyId",classifyId);
		request.setAttribute("position",position);
		request.setAttribute("img1",img1);
		request.setAttribute("img2",img2);
		request.setAttribute("pm",pm);
		request.setAttribute("pageOffset",pageOffset);
		return "category1";
	}
	 
	
	
	@RequestMapping(value="category/getBroadImg",method=RequestMethod.GET)
	public void getBroadImg(HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		String dateStr=getOneDayAffter();
		System.out.println(dateStr);
		response.setHeader("Expires", dateStr);
		PrintWriter out=response.getWriter();
		List<List<Object>> list=categoryService.getBroadImg();
		Map<String,Object> datamap=new HashMap<String,Object>();
		if(list.size()==0) {
			datamap.put("sign", null);
		}
		
		JSONSerializer jsonSerializer=new JSONSerializer();
		datamap.put("cateBroadList",list);
		out.println(jsonSerializer.deepSerialize(datamap));
		out.flush();
		out.close();
	}
	
	
	@RequestMapping(value="category/getHotCateGoods.html",method=RequestMethod.GET)
	 public void getHotCateGoods(HttpServletResponse response,Integer classifyId) throws Exception{
		    response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/json");
		    PrintWriter out=response.getWriter();
	      	List<List<Object>> list=categoryService.getHotCateGoods(classifyId,5);
	      	Map<String,Object> dataMap=new HashMap<String,Object> ();
	      	dataMap.put("hotGoodsList", list);
	      	JSONSerializer jsonSerializer=new JSONSerializer();
			out.println(jsonSerializer.deepSerialize(dataMap));
			out.flush();
			out.close();
	 }
	 
	@RequestMapping(value="category/orderby.html",method=RequestMethod.GET)
	public void orderBy(HttpServletRequest request,HttpServletResponse response,String type,Integer classifyId,Integer page){
		//type=0是上架时间 1是价格 2是销量
		List<Map<String,Object>> list=categoryService.orderQuery(type,classifyId,page);
		printListToHtml(response, list);
	}
	
	
	@RequestMapping(value="category/changePage.html",method=RequestMethod.POST)
	public void changePage(HttpServletRequest request,HttpServletResponse response,Integer page,String number){
		int n=Integer.parseInt(number);
		int[] numbers=new int[n];
		for(int i=0;i<n;i++){
			numbers[i]=Integer.parseInt(request.getParameter("num"+i));
		}
		List<Map<String,Object>>  list=categoryService.getPageGoods(page,numbers);
		printListToHtml(response, list);
	}
	
	 public String getOneDayAffter() {
		 Calendar calendar=Calendar.getInstance();
			calendar.add(Calendar.DATE,1);
			Date date=calendar.getTime();
			return date.toGMTString();//浏览器缓存采用的格林威治时间，我们时间为GMG+8(即我们的时间比格林威治时间早8个小时)
	 }
	 
	 private Map<String,Object> jsonToMap(String param) {
			JSONArray jsonArray=JSONArray.fromObject(param);
			Map<String,Object> map=new HashMap<String,Object>();
			for(Object obj:jsonArray) {
				JSONObject jsonObject=JSONObject.fromObject(obj);
				map.put(jsonObject.getString("name"), jsonObject.getString("value"));
			}
			return map;
	 }

}
