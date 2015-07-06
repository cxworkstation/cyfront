package com.chunyu.front.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.chunyu.front.dao.CommonDao;
import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.model.GoodsEntity;
import com.chunyu.front.model.ShowGoodEntity;
import com.chunyu.front.service.CategoryService;
import com.chunyu.front.utils.PageModel;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	public List<List<Object>> getCateById(int id) throws Exception{
		String sql="select name,level from t_cy_classify where id=?";
		Object[]o=new Object[id];
		SqlRowSet rs=commonDao.getRs(sql, o);
		List<List<Object>> list=new ArrayList<List<Object>>();
		if(rs.next()) {
			List<Object> innerList=new ArrayList<Object>();
			String name=rs.getString(1);
			int level=rs.getInt(2);
			innerList.add(name);
			innerList.add(level);
			list.add(innerList);
		}
		return list;
	}
	
	public List<Map<String,Object>> getClassifyGoods(int classifyId_,int level) {
		List<Map<String,Object>> innerList=new ArrayList<Map<String,Object>>();
		String sql1=null;
		if(level==1) {
		  sql1="select id,name from t_cy_classify where parentId=?";//2级分类页
		}else if(level==2) {
		  sql1="select id,name from t_cy_classify where id=?";//2级分类页
		}
		Object[] o1={classifyId_};
		List<Map<String,Object>> l=commonDao.queryList(sql1,o1);
		int len=l.size();
		for(int i=0;i<len;i++){
			Map<String,Object> map=new HashMap<String,Object>();
			List<ShowGoodEntity> innerlist2=new ArrayList<ShowGoodEntity>();
			int classifyId=Integer.parseInt(l.get(i).get("id").toString());
			String name=l.get(i).get("name").toString();//2级分类的名字
			String id2=l.get(i).get("id").toString();
			map.put("classify2", name);
			map.put("id2", id2);
			//得到三级分类
			String sql3="select id,name from t_cy_classify where parentId=?";
			Object[] o3={classifyId};
			List<ClassifyEntity> innerList1=commonDao.queryObjList(sql3, o3, ClassifyEntity.class);//3级分类
			map.put("thirdClassify", innerList1);
			StringBuffer sql2=new StringBuffer();
			sql2.append("select id,name,introduction,image,price,size from ((select id,name,image,introduction from  t_cy_goods ");
			sql2.append("where id in (select goodId from t_cy_classify_good  where classifyId=?) )as a  left join ");
			sql2.append("(select price,size,goodId from t_cy_good_price where isShow=1)as b on b.goodId=a.id) order by price limit 0,10");
			Object[] o2={classifyId};
			innerlist2=commonDao.queryObjList(sql2.toString(), o2, ShowGoodEntity.class);//一个2级分类 的 list商品
			map.put("listGoods", innerlist2);
			innerList.add(map);
		}
		return innerList;
	}

	
	public List<GoodsEntity> getRecomentGoods(int firstClassifyId) {
		String sql="select id,name,image from t_cy_goods where recoment=1 and id in (select goodId from t_cy_classify_good where classifyId=?)limit 0,5";
		Object[] o={firstClassifyId};
		return commonDao.queryObjList(sql, o, GoodsEntity.class);
	}
	
	public String getCateNameById(int classifyId) throws Exception {
		String sql="select name from t_cy_classify where id=?";
		Object[]o=new Object[]{classifyId};
		SqlRowSet rs=commonDao.getRs(sql,o);
		String name="";
		if(rs.next()) {
			name=rs.getString(1);
		}
		return name;
	}
	
	public List<List<Object>> getBroadImg() throws Exception {
		String sql="select img1,img2,goodsId from t_category_broadcast order by ordernum";
		SqlRowSet rs=commonDao.getRs(sql);
		List<List<Object>> list=new ArrayList<List<Object>>();
		while(rs.next()) {
			List<Object> innerList=new ArrayList<Object>();
			innerList.add(rs.getObject(1));
			innerList.add(rs.getObject(2));
			innerList.add(rs.getObject(3));
			list.add(innerList);
		}
		return list;
	}
	
	public List<GoodsEntity> searchClassifyGoods(int classifyId,String price1,String price2,
			String priceOrder,String dateOrder,int pageOffset,int pageSize) {
		String priceSection="";
		if(!"".equals(price1)&&!"".equals(price2)) {
			priceSection=" where price between "+price1+" and "+price2;
		}else if("".equals(price1)&&!"".equals(price2)) {
			priceSection=" where price>="+price2;
		}
		
		String orderStr="";
		boolean flag=false;
		if(!"".equals(dateOrder)) {
			orderStr=" order by uploadTime desc ";;
			flag=true;
		}
		
		if(!"".equals(priceOrder)) {
			if(flag) {
				orderStr+=",price asc ";
			}else {
				orderStr=" order by price asc ";
			}
		}
		
		StringBuffer sql=new StringBuffer();
		sql.append("select id,name,introduction,image,price,size,uploadtime from (");
		sql.append("(select id,name,image,introduction,uploadTime from t_cy_goods where ");
	    sql.append("id in(select goodId from t_cy_classify_good where classifyId="+classifyId+"))aa ");
	    sql.append("left join (select price,size,goodId from t_cy_good_price where isShow=1) bb on bb.goodId=aa.id ) ");
	    sql.append(priceSection+" "+orderStr+" limit "+pageOffset+","+pageSize);
	    
	    List<GoodsEntity> list=commonDao.queryObjList(sql.toString(), null, GoodsEntity.class);
	    return list;
	}
	
	public int searchClassifyGoodsRecords(String price1,String price2,int classifyId) {
		StringBuffer sql=new StringBuffer();
		sql.append("select count(id) from (");
		sql.append("(select id from t_cy_goods where id in(select goodId from t_cy_classify_good where classifyId="+classifyId+")) aa ");
		sql.append("left join (select goodId,price from t_cy_good_price where isShow=1) bb on bb.goodId=aa.id ) ");
		
		if(!"".equals(price1)&&!"".equals(price2)) {
		 sql.append("where price between "+price1+" and "+price2);
		}else if("".equals(price1)&&!"".equals(price2)) {
		 sql.append("where price>="+price2);
		}
		
		return commonDao.queryForInt(sql.toString(),null);
		
	}
	
	public List<List<Object>> getHotCateGoods(int classifyId,int num) throws Exception {
		 String sql="SELECT id,image FROM t_cy_goods WHERE id in(SELECT goodId from t_cy_classify_good WHERE classifyId=?) " +
		 		"ORDER BY hasBuyNum DESC LIMIT 0,?";
		 Object[]o=new Object[]{classifyId,num};
		 SqlRowSet rs=commonDao.getRs(sql, o);
		 List<List<Object>> list=new ArrayList<List<Object>>();
		 while(rs.next()) {
			 List<Object> innerList=new ArrayList<Object> ();
			 innerList.add(rs.getObject(1));
			 innerList.add(rs.getObject(2));
			 list.add(innerList);
		 }
		 return list;
	}
	
	public List<Map<String,Object>> orderQuery(String type, int firstClassifyId,int pageSize) {
		StringBuffer sql2=new StringBuffer();
		if("0".equals(type)){
			//按时间
		  sql2.append("select id,name,introduction,image,price,size from ((select id,name,image,introduction from  ");
		  sql2.append("t_cy_goods where id in (select goodId from t_cy_classify_good  where classifyId=?) order by uploadTime desc)as a ");
		  sql2.append("left join (select price,size,goodId from t_cy_good_price where isShow=1)as b on b.goodId=a.id) limit ?,?");
		}else if("1".equals(type)){
			//按价格
		 sql2.append("select id,name,introduction,image,price,size from ((select id,name,image,introduction from  ");
		 sql2.append("t_cy_goods where id in (select goodId from t_cy_classify_good  where classifyId=?) )as a  ");
		 sql2.append("left join (select price,size,goodId from t_cy_good_price where isShow=1)as b on b.goodId=a.id)");
		 sql2.append("order by price desc  limit ?,?");
		}else if("2".equals(type)) {
			//按销量
		 sql2.append("select id,name,introduction,image,price,size from ((select id,name,image,introduction from  t_cy_goods ");
		 sql2.append("where id in (select goodId from t_cy_classify_good  where classifyId=?) order by hasBuyNum desc)as a  ");
		 sql2.append("left join (select price,size,goodId from t_cy_good_price where isShow=1)as b on b.goodId=a.id) limit ?,?");
		}
		List<Map<String,Object>> innerList=new ArrayList<Map<String,Object>>();
		String sql1="select id,name from t_cy_classify where parentId=?";//2级分类页
		Object[] o1={firstClassifyId};
		List<Map<String,Object>> l=commonDao.queryList(sql1,o1);
		for(int i=0;i<l.size();i++){
		Map<String,Object> map=new HashMap<String,Object>();
		List<ShowGoodEntity> innerlist2=new ArrayList<ShowGoodEntity>();
		int classifyId=Integer.parseInt(l.get(i).get("id").toString());
		Object[] o2={classifyId,(pageSize-1)*10,10};
		innerlist2=commonDao.queryObjList(sql2.toString(), o2, ShowGoodEntity.class);//一个2级分类 的 list商品
		map.put("listGoods", innerlist2);
		innerList.add(map);		
	}
		return innerList;
	}
	
	
	public List<Map<String,Object>> getPageGoods(int pageSize,int[] ids){
		List<Map<String,Object>> innerList=new ArrayList<Map<String,Object>>();
		
		for(int i=0;i<ids.length;i++){
			StringBuffer sql=new StringBuffer();
			sql.append("select c.id,c.name,c.image,d.size,d.price,c.introduction from (select id,name,image,");
			sql.append("introduction from t_cy_goods as a where id in  (select goodId from t_cy_classify_good where classifyId=?) )as c ");
			sql.append("left join (select goodId,price,size from t_cy_good_price where isShow=1) as d on c.id=d.goodId ");
			sql.append("where d.price!=null limit ?,?");
	        Object[] o={ids[i],(pageSize-1)*10,10};
	        Map<String,Object> map=new HashMap<String,Object>();
	        List<ShowGoodEntity> innerlist2=new ArrayList<ShowGoodEntity>();
	        innerlist2=commonDao.queryObjList(sql.toString(), o, ShowGoodEntity.class);
	        map.put("listGoods", innerlist2);
	        innerList.add(map);
	    }
		return innerList;
  }


}
