package com.chunyu.front.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chunyu.front.service.ClassifyService;

@Controller
@RequestMapping("classify/")
public class ClassifyController {
	
	@Resource(name="classifyService")
	private ClassifyService classifyService;
	
	@RequestMapping("getAllClassify")
	public void getAllClassify(HttpServletRequest request) {
		
	}

}
