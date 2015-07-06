package com.chunyu.front.service;

import java.util.List;

import com.chunyu.front.model.GoodsEntity;


public interface GoodsService {
	List<List<Object>> getGoodsByIds(List<Integer> ids) throws Exception;
	
	List<GoodsEntity> getGoodsByCateId(int id,int start,int len); 
	
    int getTotalRecordsByCateId(int id);

}
