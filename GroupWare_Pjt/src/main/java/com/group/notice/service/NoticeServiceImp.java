package com.group.notice.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.group.notice.dao.NoticeDao;
import com.group.notice.dto.NoticeDto;

@Service
public class NoticeServiceImp implements NoticeService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ModelAndView noticeList(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		
		return mv;
	}

	@Override
	public int noticeWrite(NoticeDto dto) {
		return 0;
	}

}
