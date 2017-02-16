package com.group.person.dao;

import java.util.ArrayList;
import java.util.Map;

import com.group.person.dto.PersonDto;

public interface PersonDao {

	public int personCount();
	public int personListCount(PersonDto dto);
	public int personInsert(PersonDto dto);
	public ArrayList<PersonDto> personList(Map<String, Object> map);
	public PersonDto personDetail(int empnum);
	public int personUpdate(PersonDto dto);
	public int personDelete(int empnum);
	public ArrayList<PersonDto> personSearch(String option, String value);
	public ArrayList<PersonDto> personDepartMentList();
	public ArrayList<PersonDto> personGroupList(String department);
}
