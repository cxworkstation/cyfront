package com.chunyu.front.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.jdbc.support.rowset.SqlRowSetMetaData;
import org.springframework.stereotype.Service;

import com.chunyu.front.dao.CommonDao;
import com.chunyu.front.model.BroadCastEntity;
import com.chunyu.front.model.CategoryEntity;
import com.chunyu.front.model.Module;
import com.chunyu.front.model.NoticeEntity;
import com.chunyu.front.service.IndexService;

@Service("indexService")
public class IndexServiceImpl implements IndexService{

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	public List<BroadCastEntity> getBroadCast(){
		 String sql="select id,pic,goodId from t_homepage_broadcast order by 'index' limit 0,6";
		 List<BroadCastEntity> list=commonDao.queryObjList(sql, null, BroadCastEntity.class);
		 return list;
	}
	
	public List<NoticeEntity> getNoticeList() {
		String sql="select id,flag,title from t_homepage_notice order by addtime desc";
		List<NoticeEntity> list=commonDao.queryObjList(sql, null, NoticeEntity.class);
		return list;
	}
	
	public List<Module> getModuleList() {
		String sql="select id,pic1,pic2,pic3,pic4,goodsId1,goodsId2,goodsId3,goodsId4,module from t_homepage_module";
		List<Module> list=commonDao.queryObjList(sql, null, Module.class);
		return list;
	}
	
	public Module getModuleByName(String name) {
		String sql="select id,pic1,pic2,pic3,pic4,pic5,pic6,goodsId1,goodsId2,goodsId3,goodsId4,goodsId5,goodsId6,module from t_homepage_module where module='"+name+"'";
	    return commonDao.queryObj(sql, null, Module.class);
	}
	
	public List<List<Object>> getClassifyLeft() throws Exception {
		String sql="select classify,position,img,goodsId from t_homepage_classify where position in('pic1','pic2','pic3') " +
				"group by classify,id order by id,position";
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
	
	public List<List<Object>> getClassifyMain() throws Exception {
		String str="";
		for(int i=4;i<=11;i++) {
			str+="'pic"+i+"',";
		}
		if(!"".equals(str)) {
			str=str.substring(0,str.length()-1);
		}
		String sql="select classify,position,img,goodsId from t_homepage_classify where position in("+str+") " +
			"group by classify,id order by id,position";
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
	
	public List<CategoryEntity> getClassifyRight() {
		String sql="SELECT id,classify,position,img,goodsId from t_homepage_classify where position in " +
		"('pic12','pic13','pic14','pic15','pic16','desc11','desc12','desc13','desc21','desc22','desc23') " +
		"GROUP BY id,classify";
		return commonDao.queryObjList(sql, null, CategoryEntity.class);
	}
	
	public List<Object> getHealthPic() throws Exception {
		String sql="select id,img from t_homepage_health";
		SqlRowSet rs=commonDao.getRs(sql);
		List<Object> list=new ArrayList<Object>();
		if(rs.next()) {
			list.add(rs.getObject(1));
			list.add(rs.getObject(2));
		}
		return list;
	}
	
	public List<List<Object>> getEspecialPic() throws Exception {
		String sql="select goodsId,img from t_homepage_especial order by position";
		SqlRowSet rs=commonDao.getRs(sql);
		List<List<Object>> list=new ArrayList<List<Object>>();
		while(rs.next()) {
			List<Object> innerList=new ArrayList<Object>();
			innerList.add(rs.getObject(1));
			innerList.add(rs.getObject(2));
			list.add(innerList);
		}
		return list;
	}
}
