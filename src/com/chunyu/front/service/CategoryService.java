package com.chunyu.front.service;

import java.util.List;
import java.util.Map;

import com.chunyu.front.model.GoodsEntity;
import com.chunyu.front.utils.PageModel;

public interface CategoryService {
	
	List<List<Object>> getCateById(int id) throws Exception;

	List<Map<String,Object>> getClassifyGoods(int classifyId,int level);
	
	List<GoodsEntity> getRecomentGoods(int firstClassifyId);
	
	String getCateNameById(int classifyId) throws Exception;
	
	List<List<Object>> getBroadImg() throws Exception;
	
	List<GoodsEntity> searchClassifyGoods(int classifyId,String price1,String price2,
			String priceOrder,String dateOrder,int pageOffset,int pageSize);
	
	int searchClassifyGoodsRecords(String price1,String price2,int classifyId);
	
	List<List<Object>> getHotCateGoods(int classifyId ,int num) throws Exception;
	
	List<Map<String,Object>> orderQuery(String type, int firstClassifyId,int pageSize);
	
	List<Map<String,Object>> getPageGoods(int pageSize,int[] ids);
}
