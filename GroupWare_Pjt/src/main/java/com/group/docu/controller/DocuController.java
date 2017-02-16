package com.group.docu.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group.docu.service.DocuService;

@Controller
public class DocuController {
	
	@Autowired
	DocuService service;
	
	@RequestMapping("docu_Main.dc")
	public ModelAndView docuMain(){
		System.out.println("docuController");
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Document/Docu_Main");
		return mv;
	}
	
	@RequestMapping("docu_WriteView.dc")
	public ModelAndView docuWriteView(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Document/Docu_WriteView2");
		
		return mv;
	}
	
	@RequestMapping("docu_WriteCount.dc")
	@ResponseBody
	public Map<String, Object> docuCount(@RequestParam("department")String department){
		
		Map<String, Object> map = service.docuDepartCount(department);
		return map; 
	}

}
