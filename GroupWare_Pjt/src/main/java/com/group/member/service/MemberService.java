package com.group.member.service;

import javax.servlet.http.HttpSession;

import com.group.person.dto.PersonDto;

public interface MemberService {
	public void memberLogin(PersonDto dto,HttpSession session);
}
