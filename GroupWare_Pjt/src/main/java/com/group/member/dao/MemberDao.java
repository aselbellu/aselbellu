package com.group.member.dao;

import com.group.person.dto.PersonDto;

public interface MemberDao {
	public PersonDto memberLogin(String id,String pw);
}
