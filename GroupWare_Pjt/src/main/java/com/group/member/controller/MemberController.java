package com.group.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.member.service.MemberService;
import com.group.person.dto.PersonDto;

/**
 * �α��� / �α׾ƿ�
 * @author ��ȭ��
 *
 */

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	/*
	 * �α��� View
	 */
	@RequestMapping("member_LoginView.me")
	public String memberLoginView(){
		
		return "./Group_Member/Member_LoginView";
	}
	
	/*
	 * �α��� ��û ���� ����
	 */
	@RequestMapping("member_Login.me")
	public String memberLogin(PersonDto dto, HttpSession session){
		
		service.memberLogin(dto, session);
		return "redirect:index.gr";
	}
	
	/*
	 * �α׾ƿ� ��û
	 */
	@RequestMapping("member_Logout.me")
	public String memberLogout(HttpSession session){
		
		if(session.getAttribute("name") != null){
			session.invalidate();
		}
		return "redirect:index.gr";
	}
}
