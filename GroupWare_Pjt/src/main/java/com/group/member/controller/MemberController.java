package com.group.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.member.service.MemberService;
import com.group.person.dto.PersonDto;

/**
 * 로그인 / 로그아웃
 * @author 전화윤
 *
 */

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	/*
	 * 로그인 View
	 */
	@RequestMapping("member_LoginView.me")
	public String memberLoginView(){
		
		return "./Group_Member/Member_LoginView";
	}
	
	/*
	 * 로그인 요청 세션 생성
	 */
	@RequestMapping("member_Login.me")
	public String memberLogin(PersonDto dto, HttpSession session){
		
		service.memberLogin(dto, session);
		return "redirect:index.gr";
	}
	
	/*
	 * 로그아웃 요청
	 */
	@RequestMapping("member_Logout.me")
	public String memberLogout(HttpSession session){
		
		if(session.getAttribute("name") != null){
			session.invalidate();
		}
		return "redirect:index.gr";
	}
}
