package com.chunyu.front.service;

import java.util.List;
import java.util.Map;

import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.model.CommentsEntity;
import com.chunyu.front.model.GoodsInfo;
import com.chunyu.front.model.ShowGoodEntity;
import com.chunyu.front.model.ShowImage;

public interface DetailService {
    String queryDetailInfo(int goodId) throws Exception;
    
	ShowImage querySubImg(int goodId);

	GoodsInfo queryGoodsInfo(int goodId);

	ClassifyEntity queryClassify(int oneC);

	List<Map<String,Object>>  queryGoodSizes(int goodId);

	List<CommentsEntity> queryCommentInfo(int goodId,int start,int end);

	int queryCommentsNum(int goodId);

	int addComments(CommentsEntity c);

	int queryUserId(String username);

	Map<String,List<ShowGoodEntity>> queryOtherUserBuy(int userId,int thirdC);

	int collection(int goodId, int userId);

	List<ShowGoodEntity> queryRecoment(int thirdC);


}
