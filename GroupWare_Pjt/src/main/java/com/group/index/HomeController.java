package com.group.index;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	/**
	 * Menu - 메인 페이지
	 * 로그인 안된 상태면 로그인 페이지 전환
	 */
	@RequestMapping(value = "index.gr", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("id") == null){
			mv.setViewName("redirect:member_LoginView.me");
		} else {
			mv.setViewName("Index");
		}
		
		return mv;
	}
}
