package com.chunyu.front.servlet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.chunyu.front.model.ClassifyEntity;
import com.chunyu.front.service.ClassifyService;

public class InitClassifyServlet extends HttpServlet{
	private final static Logger log=LoggerFactory.getLogger(InitClassifyServlet.class);
	
	@Override
	public void init() throws ServletException {
		super.init();
		ServletContext sc=this.getServletContext();
		WebApplicationContext context=WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		ClassifyService cs=(ClassifyService)context.getBean("classifyService");
		log.info("服务器启动，初始化分类。。");
		try {
			//id,parentId,name,isCount,onlyReservation
			List<ClassifyEntity> list1=cs.getOneLevelClassify(1);
			List<ClassifyEntity> list2=cs.getOneLevelClassify(2);
			List<ClassifyEntity> list3=cs.getOneLevelClassify(3);
			sc.setAttribute("level1Classify",list1);
			String prefix1="level2Classify";
			for(int i=0;i<list1.size();i++) {
				ClassifyEntity ce=list1.get(i);
				int id=ce.getId();
				List<ClassifyEntity> child2List=new ArrayList<ClassifyEntity> ();
				for(int j=0;j<list2.size();j++) {
					ClassifyEntity ce2=list2.get(j);
					int id2=ce2.getParentId();
					if(id==id2) {
						child2List.add(ce2);
					}
				}
				sc.setAttribute(prefix1+id, child2List);
			}
			String prefix2="level3Classify";
			for(int i=0;i<list2.size();i++) {
				ClassifyEntity ce=list2.get(i);
				int id=ce.getId();
				List<ClassifyEntity> child3List=new ArrayList<ClassifyEntity> ();
				for(int j=0;j<list3.size();j++) {
					ClassifyEntity ce3=list3.get(j);
					int id3=ce3.getParentId();
					if(id==id3) {
						child3List.add(ce3);
					}
				}
				sc.setAttribute(prefix2+id,child3List);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	

}
