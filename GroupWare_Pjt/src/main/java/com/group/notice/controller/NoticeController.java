package com.group.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.group.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	
	@Autowired
	NoticeService service;
	/*
	 * 공지사항 메인 페이지
	 */
	@RequestMapping("notice_List.no")
	public ModelAndView notice_List(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		mv = service.noticeList(request);
		
		return mv;
	}
	
	/*
	 * Menu - 공지사항 - 공지 작성 View
	 */
	@RequestMapping("notice_WriteView.no")
	public ModelAndView notice_WriteView(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Notice/Notice_WriteView");
		
		return mv;
	}
	
	/*
	 * Menu - 공지사항 - 공지상세 정보 View
	 * 
	 * @Parameter 게시번호
	 */
	@RequestMapping("notice_DetailView.no")
	public ModelAndView notice_DetailView(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Notice/Notice_DetailView");
		
		return mv;
	}
	
}
