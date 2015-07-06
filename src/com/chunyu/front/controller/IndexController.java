package com.chunyu.front.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chunyu.front.model.BroadCastEntity;
import com.chunyu.front.model.CategoryEntity;
import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.model.Module;
import com.chunyu.front.model.NoticeEntity;
import com.chunyu.front.service.ClassifyService;
import com.chunyu.front.service.GoodsService;
import com.chunyu.front.service.IndexService;

import flexjson.JSONSerializer;

@Controller
public class IndexController {
	Logger log=LoggerFactory.getLogger(IndexController.class);
	@Resource(name="indexService")
	private IndexService indexService;
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	@Resource(name="classifyService")
	private ClassifyService classifyService;
	
	
	@RequestMapping(value="index.html",method=RequestMethod.GET)
	public String index(HttpServletRequest request) throws Exception{
		//得到轮播图
		List<BroadCastEntity> broadCastList=indexService.getBroadCast();
		if(broadCastList==null||broadCastList.size()==0) {
			log.info("轮播图为空。。");
			return "common/exception";
		}
		request.setAttribute("broadCastList",broadCastList);
		
		//得到首页公告
		List<NoticeEntity> noticeList=indexService.getNoticeList();
		if(noticeList.size()==0) {
			log.info("首页-公告为空。。");
			request.setAttribute("noticeList",null);
		}else {
			List<NoticeEntity> notices1=new ArrayList<NoticeEntity>();
			List<NoticeEntity> notices2=new ArrayList<NoticeEntity>();
			for(int i=0;i<noticeList.size();i++) {
				NoticeEntity ne=noticeList.get(i);
				int flag=ne.getFlag();
				if(flag==0) {
					notices2.add(ne);
				}else if(flag==1) {
					notices1.add(ne);
				}
			}
			
			//将文字公告和图片公告区分开，noticeList为文字公告，noticeList1为图片公告
			request.setAttribute("noticeList",notices1);
			request.setAttribute("noticeList1",notices2);
		}
		
		//得到首页四个模块
		String[] mName=new String[]{"今日免费","热门商品","新品上市","推荐食品"};
		String[] attrName=new String[]{"freeList","hotList","newList","promtList"};
		for(int i=0;i<mName.length;i++) {
			Module m=indexService.getModuleByName(mName[i]);
			if(m!=null) {
				List<Integer> idList=new ArrayList<Integer>();
				idList.add(m.getGoodsId1());idList.add(m.getGoodsId2());
				idList.add(m.getGoodsId3());idList.add(m.getGoodsId4());
				idList.add(m.getGoodsId5());idList.add(m.getGoodsId6());
				List<List<Object>> list=goodsService.getGoodsByIds(idList);
				if(list.size()==0) {
					request.setAttribute(attrName[i],null);
				}else {
					request.setAttribute(attrName[i],list);
				}
			}
		}
		
		//得到分类左边的滑动图片classify,position,img,goodsId 
		List<List<Object>> classifyLeftList=indexService.getClassifyLeft();
		List<List<Object>> leftList=new ArrayList<List<Object>> ();
		String[] classifys=new String[]{"蔬菜水果区","水产冻品区","肉禽蛋品区","面点豆制品区","粮油调料区","副食干货区","日常用品区"};
		for(int i=0;i<classifys.length;i++) {
			List<Object> innerList=new ArrayList<Object> ();
			for(int j=0;j<6;j++) {//每个区块有3张图片，每个图片有两个属性，一个是对应的商品Id，一个是图片地址，所以需要6个空间
				innerList.add("0");//来存储每个区块的图片信息
			}
			leftList.add(innerList);
		}
		
		for(int i=0;i<classifys.length;i++) {
			String classifyName=classifys[i];
			List<Object> leftPicInfo=leftList.get(i);
			int t=0;
			for(int j=0;j<classifyLeftList.size();j++) {
				List<Object> innerList=classifyLeftList.get(j);
				String classifyName0=innerList.get(0).toString();
				Object img=innerList.get(2);
				Object goodsId=innerList.get(3);
				if(goodsId==null) {
					log.info("前台首页-还没有给分类左边图片添加相应的对应商品");
					goodsId="0";
				}
				if(classifyName.equals(classifyName0)) {
					for(int z=0;z<leftPicInfo.size();z+=2) {
						Object o=leftPicInfo.get(z);
						String flag=null;
						if(o!=null) {//当还没有给图片添加对应的商品时会出现此种情况，如果不作处理将会抛出异常
							 flag=o.toString();
						}
						
						if("0".equals(flag)) {
							t++;
							leftPicInfo.set(z, goodsId);
							leftPicInfo.set(z+1, img);
							break;
						}
					}
				}
				
				if(t==3) {
					break;
				}
			}
		}
	    request.setAttribute("classifyLeft",leftList);
		
		
		//得到分类中间商品classify,position,img,goodsId
		List<List<Object>> classifyMainList=indexService.getClassifyMain();
		List<Integer> classifyToGoodsIdList=new ArrayList<Integer>();
		for(int i=0;i<classifyMainList.size();i++) {
			List<Object> classifyInfo=classifyMainList.get(i);
			Object idObj=classifyInfo.get(3);
			int goodId=0;
			if(idObj==null) {
				log.info("前台首页-还没有给中间分类图片添加相应的商品");
			}else {
				goodId=Integer.parseInt(classifyInfo.get(3).toString());
			}
			classifyToGoodsIdList.add(goodId);
		}
		
		//aa.id,aa.name,aa.image,aa.introduction,bb.price,bb.size
		List<List<Object>> goodInfoList=goodsService.getGoodsByIds(classifyToGoodsIdList);
		
		List<Object> classifyGoodList=new ArrayList<Object> ();
		//id,名称,尺寸,价格,图片
		for(int i=0;i<classifys.length;i++) {
			List<Object> classifyList=new ArrayList<Object> ();
			for(int j=0;j<8;j++) {
				List<Object> goodsList=new ArrayList<Object>();
				for(int z=0;z<5;z++) {
					goodsList.add("0");
				}
				classifyList.add(goodsList);
			}
			
			classifyGoodList.add(classifyList);
		}
		
		for(int i=0;i<classifys.length;i++) {
			String classifyName=classifys[i];
			List<List<Object>> classifyList=(List<List<Object>>)classifyGoodList.get(i);
			int t=0;
			for(int j=0;j<classifyMainList.size();j++) {
				List<Object> inMainList=classifyMainList.get(j);
				String classifyName2=inMainList.get(0).toString();
				String goodId="0";
				Object idObj=inMainList.get(3);
				if(idObj!=null) {
				 goodId=inMainList.get(3).toString();
				}
				Object img=inMainList.get(2);
				if(classifyName.equals(classifyName2)) {
					for(int z=0;z<goodInfoList.size();z++) {
						 List<Object> goodInfo=goodInfoList.get(z);
						 String id=goodInfo.get(0).toString();
						 if(goodId.equals(id)) {
							 for(int x=0;x<8;x++) {
								 List<Object> goods=classifyList.get(x);
								 String str=goods.get(0).toString();
								 if("0".equals(str)) {
									 t++;
									 goods.set(0,id);
									 goods.set(1,goodInfo.get(1));
									 goods.set(2, goodInfo.get(5));
									 goods.set(3, goodInfo.get(4));
									 goods.set(4, img);
									 break;
								 }
							 }
							 break;
						 }
					}
				}
				
				if(t==8) {
					break;
				}
			}
		}
		
		request.setAttribute("classifyGoodList", classifyGoodList);
		
		getSecondClassify(request);
	   return "index";
	}
	
	
	@RequestMapping(value="index/getClassifyRight",method=RequestMethod.GET)
	public void getClassifyRight(HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		//采用不询问服务器的浏览器缓存，缓存时长3个月
		response.setHeader("Expires",getAfterThreeMonthDate());//设置过期绝对时间
		//response.setHeader("Cache-Control","max-age="+1000*3600*24*30*3);//设置过期相对时间
		PrintWriter out=response.getWriter();
		List<CategoryEntity> list=indexService.getClassifyRight();
		String[] classifys=new String[]{"蔬菜水果区","水产冻品区","肉禽蛋品区","面点豆制品区","粮油调料区","副食干货区","日常用品区"};
		Map<String,Object> inMap=new HashMap<String,Object>();
		
		for(int i=0;i<classifys.length;i++) {
			String classify=classifys[i];
			List<CategoryEntity> cateList=new ArrayList<CategoryEntity>();
			int flag=0;
			for(int j=0;j<list.size();j++) {
				CategoryEntity cate=list.get(j);
				if(classify.equals(cate.getClassify())) {
					cateList.add(cate);
					flag++;
				}
				if(flag>=9) {//减少循环次数，一个区域最多9个元素，6条链接商品外加3张图片
					break;
				}
			}
			inMap.put("classify"+i, cateList);
		}
		
		JSONSerializer jsonSerializer=new JSONSerializer();
		String jsonStr=jsonSerializer.deepSerialize(inMap);
		log.info("首页分类右边："+jsonStr);
		out.print(jsonStr);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="index/getHealthPic",method=RequestMethod.GET)
	public void getHealthPic(HttpServletResponse response) throws Exception{
		List<Object> list=indexService.getHealthPic();
		Map<String,Object> datamap=new HashMap<String,Object>();
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Expires", getAfterOneYearDate());
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		if(list.size()>0) {
			datamap.put("health", list);
		}else {
			datamap.put("health",null);
		}
		JSONSerializer jsonSerializer=new JSONSerializer();
		String jsonStr=jsonSerializer.deepSerialize(datamap);
		log.info("健康合理膳食区域："+jsonStr);
		out.print(jsonStr);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="index/getEspecialPic",method=RequestMethod.GET)
	public void getEspecialPic(HttpServletResponse response) throws Exception {
		List<List<Object>> list=indexService.getEspecialPic();
		Map<String,Object> datamap=new HashMap<String,Object>();
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Expires", getAfterOneYearDate());
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		if(list.size()>0) {
			datamap.put("especial", list);
		}else {
			datamap.put("especial",null);
		}
		JSONSerializer jsonSerializer=new JSONSerializer();
		String jsonStr=jsonSerializer.deepSerialize(datamap);
		log.info("特别推荐区域："+jsonStr);
		out.print(jsonStr);
		out.flush();
		out.close();
		
	}
	
	private String getAfterThreeMonthDate() {
		Calendar calendar=Calendar.getInstance();
		calendar.add(Calendar.MONTH,3);
		Date date=calendar.getTime();
		return date.toGMTString();//浏览器缓存采用的格林威治时间，我们时间为GMG+8(即我们的时间比格林威治时间早8个小时)
	}
	private String getAfterOneYearDate() {
		Calendar calendar=Calendar.getInstance();
		calendar.add(Calendar.YEAR,1);
		Date date=calendar.getTime();
		return date.toGMTString();//浏览器缓存采用的格林威治时间，我们时间为GMG+8(即我们的时间比格林威治时间早8个小时)
	}
	
	public void getSecondClassify(HttpServletRequest request) {
		ServletContext context=request.getSession().getServletContext();
		Object o=context.getAttribute("level1Classify");
		if(o==null) {
           request.setAttribute("secondClassify",null);
           return;
		}
		List<ClassifyEntity> list1=(List<ClassifyEntity>)o;
		List<List<Object>> secondClassify=new ArrayList<List<Object>>();
		for(int i=0;i<list1.size();i++) {
			List<Object> innerList=new ArrayList<Object>();
			ClassifyEntity classify=list1.get(i);
			int id=classify.getId();
			Object o2=context.getAttribute("level2Classify"+id);
			List<ClassifyEntity> list2=new ArrayList<ClassifyEntity>();
			if(o2==null) {
				log.info("存在第二级目录没有的情况");
				innerList.add("0");
				innerList.add("0");
			}else {
				list2=(List<ClassifyEntity>)o2;
			}
			for(int j=0;j<list2.size()&&j<6;j++) {
				ClassifyEntity classify2=list2.get(j);
				int id2=classify2.getId();
				String name=classify2.getName();
				innerList.add(id2);
				innerList.add(name);
			}
			secondClassify.add(innerList);
		}
		
		request.setAttribute("secondClassify", secondClassify);
	}
	@RequestMapping("index/getClassify")
	public void getClassify(HttpServletResponse response,String name) throws Exception{
		//String[] classifys=new String[]{"蔬菜水果区","水产冻品区","肉禽蛋品区","面点豆制品区","粮油调料区","副食干货区","日常用品区"};
		Map<String,Object> resultMap=new HashMap<String,Object> ();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		//每个分类区域中的position,img,goodsId,mode
		List<List<Object>> list=classifyService.getClassifyByName(name);
		if(list.size()==0) {
			log.info("首页分类-根据名字查询分类为空。。");
			resultMap.put("sign",0);
			out.print(resultMap);
			return;
		}
		//每个分类中所有商品Id
		List<Integer> idList=new ArrayList<Integer> ();
		for(int i=0;i<list.size();i++) {
			List<Object> innerList=list.get(i);
			try {
			 idList.add(Integer.parseInt(innerList.get(2).toString()));
			}catch(Exception e) {
				log.info("首页分类-根据名字查询分类记录当中字段存在为空的情况。。");
				resultMap.put("sign", 0);
				out.print(resultMap);
				return;
			}
		}
		//aa.id,aa.name,aa.image,aa.introduction,bb.price,bb.size
		List<List<Object>> goodList=goodsService.getGoodsByIds(idList);
		if(goodList.size()==0) {
			log.info("首页分类-根据id序列查找商品为空。。");
			resultMap.put("sign", 0);
			out.print(resultMap);
			return;
		}
		
		for(int i=0;i<list.size();i++) {
			List<Object> innerList=list.get(i);
			int goodsId=Integer.parseInt(innerList.get(2).toString());
			Object img=innerList.get(1);
			Object position=innerList.get(0);
			for(int j=0;j<goodList.size();j++) {
				List<Object> goodInfo=goodList.get(j);
				int id=Integer.parseInt(goodInfo.get(0).toString());
				if(id==goodsId) {
					goodInfo.set(2, img);
					goodInfo.add(position);
					break;
				}
			}
		}
		
		JSONSerializer jsonSerializer=new JSONSerializer();
		resultMap.put("goodList",goodList);
		out.println(jsonSerializer.deepSerialize(resultMap));
		out.flush();
		out.close();
	}

}
