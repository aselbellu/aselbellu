package com.group.person.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.group.person.dto.PersonDto;
import com.group.util.paging.PageDto;


public interface PersonService {
	public int personInsert(PersonDto dto);
	public Map<String, Object> personList(PersonDto personDto, PageDto pageDto);
	public Map<String, PersonDto> personDetail(String empnum);
	public ModelAndView personUpdate(PersonDto dto);
	public String personDelete(String empnum);
	public Map<String, ArrayList<PersonDto>> personDepartmentList();
	public Map<String, ArrayList<PersonDto>> personGroupList(String department);
	
}
