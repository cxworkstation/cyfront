package com.chunyu.front.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.jdbc.support.rowset.SqlRowSetMetaData;
import org.springframework.stereotype.Service;

import com.chunyu.front.dao.CommonDao;
import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.service.ClassifyService;

@Service("classifyService")
public class ClassifyServiceImpl implements ClassifyService{
	
	@Resource(name="commonDao")
	private CommonDao commonDao;

	public List<ClassifyEntity> getOneLevelClassify(int level){
		String sql="select id,parentId,name,isCount,onlyReservation from t_cy_classify where level=? order by id";
		Object[]args=new Object[]{level};
		List<ClassifyEntity> list=commonDao.queryObjList(sql, args, ClassifyEntity.class);
		return list;
	}
	
	public List<List<Object>> getClassifyByName(String name) throws Exception {
		String sql="select position,img,goodsId,mode from t_homepage_classify where classify='"+name+"'";
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
	
	public List<List<Object>> getBroadByClassify(Integer classifyId) throws Exception {
		String sql="select goodsId,img1,img2 FROM t_category_broadcast where category="+classifyId;
		SqlRowSet rs=commonDao.getRs(sql);
		List<List<Object>> list=new ArrayList<List<Object>>();
		while(rs.next()) {
			List<Object> inList=new ArrayList<Object>();
			inList.add(rs.getInt(1));
			inList.add(rs.getString(2));
			inList.add(rs.getString(3));
			list.add(inList);
		}
		return list;
	}
}
