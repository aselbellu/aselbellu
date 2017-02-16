package com.group.member.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.member.dao.MemberDao;
import com.group.person.dto.PersonDto;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	SqlSession sqlSession;
	
	/* Login */
	@Override
	public void memberLogin(PersonDto dto, HttpSession session) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		String id = dto.getPERSON_ID();
		String pw = dto.getPERSON_PW();
		
		System.out.println(id);
		System.out.println(pw);
		
		dto = dao.memberLogin(id, pw);
		
		
		
		
		if (!dto.getNAME_KOR().equals("")){
			// 사원 이름이 존재할 경우 
			session.setAttribute("empnum", dto.getEMPNUM());
			session.setAttribute("name", dto.getNAME_KOR());
			session.setAttribute("id", dto.getPERSON_ID());
			session.setAttribute("department", dto.getDEPARTMENT());
			session.setAttribute("position", dto.getPOSITION());
			session.setAttribute("account", dto.getPERSON_ACCOUNT());
			session.setAttribute("access", dto.getPERSON_ACCESS());
			if(!dto.getPHOTO_PERSON().equals("")){
				session.setAttribute("photo", dto.getPHOTO_PERSON());
			} else {
				session.setAttribute("photo", "admin.png");
			}
			
		} 
	}
}
