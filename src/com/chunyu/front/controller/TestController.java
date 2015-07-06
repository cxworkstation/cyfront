package com.chunyu.front.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.chunyu.front.model.ClassifyEntity;

@Controller
@RequestMapping("test")
public class TestController {

	
	@RequestMapping(method=RequestMethod.GET)
	public void test(HttpServletRequest request) {
		ServletContext sc=request.getSession().getServletContext();
		List<ClassifyEntity> list1=(List<ClassifyEntity>)sc.getAttribute("level1Classify");
		for(int i=0;i<list1.size();i++) {
			ClassifyEntity ce=list1.get(i);
			System.out.println(ce.getName());
			int id=ce.getId();
			List<ClassifyEntity> list2=(List<ClassifyEntity>)sc.getAttribute("level2Classify"+id);
			
			for(int j=0;j<list2.size();j++) {
				ClassifyEntity ce2=list2.get(j);
				System.err.print("第二级分类：");
				System.out.print(ce2.getName());
			}
			System.out.println();
		}
		
	}
}
