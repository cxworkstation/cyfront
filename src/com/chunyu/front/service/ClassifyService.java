package com.chunyu.front.service;

import java.util.List;

import com.chunyu.front.model.ClassifyEntity;

public interface ClassifyService {
	
	List<ClassifyEntity> getOneLevelClassify(int level);
	
	List<List<Object>> getClassifyByName(String name) throws Exception;
	
	List<List<Object>> getBroadByClassify(Integer classifyId) throws Exception;

	
}
