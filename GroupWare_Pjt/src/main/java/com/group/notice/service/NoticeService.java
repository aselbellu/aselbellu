package com.group.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.group.notice.dto.NoticeDto;

public interface NoticeService {

	public ModelAndView noticeList(HttpServletRequest request);
	public int noticeWrite(NoticeDto dto);
}
