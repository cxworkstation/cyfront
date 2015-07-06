package com.chunyu.front.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.model.CommentsEntity;
import com.chunyu.front.model.GoodsInfo;
import com.chunyu.front.model.ShowGoodEntity;
import com.chunyu.front.model.ShowImage;
import com.chunyu.front.service.DetailService;
import com.chunyu.front.utils.TypeConversion;

@Controller
public class DetailController extends BaseController{

	@Resource(name="detailService")
	private DetailService detailService;
	
	@RequestMapping(value="detail.html",method=RequestMethod.GET)
	public String detail(HttpServletRequest request,Integer goodId) throws Exception{
		//String goodIdStr="77";
      //  int oneC=34;
      //  int twoC=35;
      //  int thirdC=36;
        String username="xlq";
         int userId=detailService.queryUserId(username);
//        HttpSession s=request.getSession();
//        String username=s.getAttribute("username").toString();
		//int goodId=Integer.parseInt(goodIdStr);
		//展示商品分类选择
		//List<ClassifyEntity> classifyList=new ArrayList<ClassifyEntity>();
		//ClassifyEntity c1=detailService.queryClassify(oneC);
		//ClassifyEntity c2=detailService.queryClassify(twoC);
		//ClassifyEntity c3=detailService.queryClassify(thirdC);
		//classifyList.add(c1);
		//classifyList.add(c2);
		//classifyList.add(c3);
		//查询商品浓缩图和细节图
		ShowImage showImg=detailService.querySubImg(goodId);
		//查询该商品的详细信息，如商品名称、单价等信息
		GoodsInfo goodsInfo=detailService.queryGoodsInfo(goodId); 
		//查询商品规格
		List<Map<String,Object>> sizes=detailService.queryGoodSizes(goodId);
		//查询商品的详情图片
		String content=detailService.queryDetailInfo(goodId);
		//得到商品评论(这里有问题，现在查询的是该用户的评论)
		List<CommentsEntity> comments=detailService.queryCommentInfo(goodId,0,18);
		//得到评论数(一页18个)
		int commentsNum=detailService.queryCommentsNum(goodId);
		int totalPageNum=(commentsNum+17)/18;
		//该用户收藏的商品（猜你喜欢）
	//	Map<String,List<ShowGoodEntity>> goods=detailService.queryOtherUserBuy(userId,thirdC);
		//相关推荐
	//	List<ShowGoodEntity> recoment=detailService.queryRecoment(thirdC);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("showImg", showImg);//商品浓缩图与细节图
		map.put("goodsInfo", goodsInfo);//商品信息
		//map.put("classifyList", classifyList);
		map.put("sizes",sizes);//商品规格
		map.put("comments", comments);//商品评论
		map.put("commentsNum", commentsNum);//商品评论数
		map.put("username", username);//用户名
		map.put("totalPageNum", totalPageNum);
		map.put("detailImgs", content);//商品详情
	//	map.put("goods", goods);
	//	map.put("recoments", recoment);
		request.setAttribute("goodDetail", map);
		return "detail";
	}
	
	@RequestMapping(value="gotoPage.html",method=RequestMethod.POST)
	public void gotoPage(String type,String goodId,HttpServletResponse response){
		int id=Integer.parseInt(goodId);
		if("1".equals(type)){
			List<CommentsEntity> comments=detailService.queryCommentInfo(id, 0, 18);
			printListToHtml(response, comments);
			return;
		}
		int numbers=detailService.queryCommentsNum(id);
		int n=numbers-((numbers+17)/18-1)*18;
		int start=numbers-n-1;
		List<CommentsEntity> comments=detailService.queryCommentInfo(id, start, 18);
		printListToHtml(response, comments);
	}
	
	
	@RequestMapping(value="changePager.html",method=RequestMethod.POST)
	public void changePager(HttpServletResponse response,String pageSize,String goodId){
		int PageSize=Integer.parseInt(pageSize);
		int id=Integer.parseInt(goodId);
		int start=(PageSize-1)*18;
		List<CommentsEntity> comments=detailService.queryCommentInfo(id, start, 18);
		printListToHtml(response, comments);
	}
	
	@RequestMapping(value="submitit.html",method=RequestMethod.POST)
	public void submitit(HttpServletResponse response,HttpServletRequest request,String goodId,String username,String content,String noName){
		int id=Integer.parseInt(goodId);
		int userId=detailService.queryUserId(username);
		CommentsEntity c=new CommentsEntity();
		c.setContent(content);
		if("1".equals(noName)){
		   c.setUsername("匿名");
		   c.setUserId(-1);
		}else{
		   c.setUsername(username);
		   c.setUserId(userId);
		}
		c.setCommentTime(TypeConversion.DateToString(new Date()));
		c.setGoodId(id);
		int result=detailService.addComments(c);
		if(result==1){
		printStrToHtml(response, "1");
		return;
		}
		printStrToHtml(response, "0");
	}
	
	@RequestMapping(value="collection.html",method=RequestMethod.POST)
	public void collection(HttpServletResponse response,HttpServletRequest request,String goodId){
//		HttpSession s=request.getSession();
//		String username=s.getAttribute("username").toString();
		String username="xlq";
		int id=Integer.parseInt(goodId);
		int userId=detailService.queryUserId(username);
		int result=detailService.collection(id,userId);
		if(result==1){
			printStrToHtml(response, "1");
			return;
		}
		printStrToHtml(response, "0");
	}
	
}
