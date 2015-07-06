package com.chunyu.front.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.chunyu.front.dao.CommonDao;
import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.model.CommentsEntity;
import com.chunyu.front.model.GoodsInfo;
import com.chunyu.front.model.ShowGoodEntity;
import com.chunyu.front.model.ShowImage;
import com.chunyu.front.service.DetailService;

@Service("detailService")
public class DetailServiceImpl implements DetailService {
	
	@Resource(name="commonDao")
	private CommonDao commonDao;

	public ShowImage querySubImg(int goodId) {
		String sql="select id,goodsId,img0,subImg0,img1,subImg1,img2,subImg2,img3,subImg3 from t_goods_subimg where goodsId=?";
		Object[] o={goodId};
		return commonDao.queryObj(sql, o,ShowImage.class);
	}
	
	public GoodsInfo queryGoodsInfo(int goodId){
		String sql="select id,goodId,name,introduction,price,size from t_cy_goods as a right join (select goodId,price,size from t_cy_good_price where isShow=1 and goodId=?)as b on b.goodId=a.id";
		Object[] o={goodId};
		return commonDao.queryObj(sql, o, GoodsInfo.class);
		
	}

	public ClassifyEntity queryClassify(int classifyId) {
		String sql="select id,name,level,isCount,parentId,onlyReservation from t_cy_classify where id=?";
		Object[] o={classifyId};
		return commonDao.queryObj(sql, o, ClassifyEntity.class);
	}

	public List<Map<String,Object>> queryGoodSizes(int goodId) {
		String sql="select price,size from t_cy_good_price where goodId=?";
		Object[] o={goodId};
		return commonDao.queryList(sql,o);
	}

	public List<CommentsEntity> queryCommentInfo(int goodId,int start,int end) {
		String sql="select a.id,goodId,username,content,commentTime from t_cy_comments as a left join t_cy_users as b on b.id=a.userId where goodId=? order by commentTime desc limit ?,?";
		Object[] o={goodId,start,end};
		return commonDao.queryObjList(sql, o, CommentsEntity.class);
	}

	public int queryCommentsNum(int goodId) {
		String sql="select count(*) from t_cy_comments where goodId=?";
		Object[] o={goodId};
		return commonDao.queryForInt(sql, o);
	}

	public int addComments(CommentsEntity c) {
		String sql="insert into t_cy_comments(goodId,userId,content,commentTime) values(?,?,?,?)";
		Object[] o={c.getGoodId(),c.getUserId(),c.getContent(),c.getCommentTime()};
		return commonDao.addOrUpdate(sql, o);
	}

	public int queryUserId(String username) {
		String sql="select id from t_cy_users where username=?";
		Object[] o={username};
		return commonDao.queryForInt(sql, o);
	}

	public String queryDetailInfo(int goodId) throws Exception{
		String sql="select content from t_cy_ueditor where goodId="+goodId;
		SqlRowSet rs=commonDao.getRs(sql);
		String content="";
		if(rs.next()) {
			content=rs.getString(1);
		}
		return content;
	}
	
	public Map<String,List<ShowGoodEntity>> queryOtherUserBuy(int userId,int thirdC) {
		Map<String,List<ShowGoodEntity>> map=new HashMap<String,List<ShowGoodEntity>>();
		StringBuffer sql=new StringBuffer();
		sql.append("select id,image,name,size,price from (select id,image,name from t_cy_goods as a right join ");
		sql.append("(select goodId from t_cy_collection where userId=?) as b on a.id=b.goodId) as d left join (");
		sql.append("select price,size,goodId from t_cy_good_price where isShow=1)as c on c.goodId=d.id");
		Object[] o={userId};
		List<ShowGoodEntity> list=commonDao.queryObjList(sql.toString(), o, ShowGoodEntity.class);
		map.put("collection1", list);
		if(list.size()<5){
			int numbers=5-list.size();
			sql=new StringBuffer();
			sql.append("select id,image,name,size,price from (select id,image,name from t_cy_goods as a right join (");
			sql.append("select goodId from t_cy_classify_good where classifyId=?) as b on a.id=b.goodId) as d left join (");
			sql.append("select price,size,goodId from t_cy_good_price where isShow=1)as c on c.goodId=d.id limit ?,?");
			Object[] o1={thirdC,0,numbers};
			List<ShowGoodEntity> olist=commonDao.queryObjList(sql.toString(), o1, ShowGoodEntity.class);
			map.put("collection2", olist);
		}
		return map;
	}

	public int collection(int goodId, int userId) {
		String sql="insert into t_cy_collection(userId,goodId) values(?,?)";
		Object[] o={userId,goodId};
		return commonDao.addOrUpdate(sql, o);
	}

	public List<ShowGoodEntity> queryRecoment(int thirdC) {
		String sql="select id,image,name,size,price from (select id,image,name from t_cy_goods as a right join (select goodId from t_cy_classify_good where classifyId=?) as b on a.id=b.goodId) as d left join (select price,size,goodId from t_cy_good_price where isShow=1)as c on c.goodId=d.id limit ?,?";
		Object[] o={thirdC,0,8};
		return commonDao.queryObjList(sql, o, ShowGoodEntity.class);
	}

}
