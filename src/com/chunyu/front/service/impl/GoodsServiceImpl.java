package com.chunyu.front.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.jdbc.support.rowset.SqlRowSetMetaData;
import org.springframework.stereotype.Service;

import com.chunyu.front.dao.CommonDao;
import com.chunyu.front.model.GoodsEntity;
import com.chunyu.front.service.GoodsService;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	public List<List<Object>> getGoodsByIds(List<Integer> ids) throws Exception{
		String idStr="";
		for(int i=0;i<ids.size();i++) {
			idStr+=ids.get(i)+",";
		}
		
		if(!"".equals(idStr)) {
			idStr=idStr.substring(0,idStr.length()-1);
		}
		
		String sql="select aa.id,aa.name,aa.image,aa.introduction,bb.price,bb.size from t_cy_goods aa LEFT JOIN (SELECT goodId,price," +
		"size from t_cy_good_price where goodId in("+idStr+") and isShow=1)bb on aa.id=bb.goodId WHERE aa.id in("+idStr+")";
		
		SqlRowSet rs=commonDao.getRs(sql);
		SqlRowSetMetaData meta=rs.getMetaData();
		int colCount=meta.getColumnCount();
		List<List<Object>> list=new ArrayList<List<Object>> ();
		while(rs.next()) {
			List<Object> innerList=new ArrayList<Object> ();
			for(int i=1;i<=colCount;i++) {
				innerList.add(rs.getObject(i));
			}
			list.add(innerList);
		}
		
		return list;
	}
	
	public List<GoodsEntity> getGoodsByCateId(int id,int start,int len) {
		StringBuffer sql=new StringBuffer();
		sql.append("select aa.id,aa.name,aa.image,bb.size,bb.price FROM (");
		sql.append("SELECT id,name,image from t_cy_goods where id in(SELECT goodId from t_cy_classify_good where classifyId=?) )aa ");
		sql.append("LEFT JOIN (SELECT goodId,size,price from t_cy_good_price where isShow=1)bb on aa.id=bb.goodId order by price limit ?,?");
		Object[]args=new Object[]{id,start,len};
		List<GoodsEntity> list=commonDao.queryObjList(sql.toString(), args,GoodsEntity.class);
		return list;
	}
	
	public int getTotalRecordsByCateId(int id) {
		String sql="SELECT count(aa.id) from (SELECT id from t_cy_goods where id in" +
				"(SELECT goodId from t_cy_classify_good where classifyId=?))aa";
		Object[]o=new Object[]{id};
		return commonDao.queryForInt(sql.toString(), o);
	}
	
}
