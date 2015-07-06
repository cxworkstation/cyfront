package com.chunyu.front.service;

import java.util.List;

import com.chunyu.front.model.BroadCastEntity;
import com.chunyu.front.model.CategoryEntity;
import com.chunyu.front.model.Module;
import com.chunyu.front.model.NoticeEntity;

public interface IndexService {
	//得到首页轮播图
	List<BroadCastEntity> getBroadCast();
	
	//得到首页公告
	List<NoticeEntity> getNoticeList();
	
	//得到首页四大模块
	List<Module> getModuleList();
	Module getModuleByName(String name);
	
	//得到分类左边区域
	List<List<Object>> getClassifyLeft() throws Exception;
	
	//得到分类主区域
	List<List<Object>> getClassifyMain() throws Exception;
	
	//得到分类右边区域
	List<CategoryEntity> getClassifyRight(); 
	
	//得到健康膳食
   List<Object> getHealthPic() throws Exception;
   
   //得到特别推荐区域
   List<List<Object>> getEspecialPic() throws Exception;

}
