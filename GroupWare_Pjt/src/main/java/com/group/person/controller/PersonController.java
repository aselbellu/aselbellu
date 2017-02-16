package com.group.person.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group.person.dto.PersonDto;
import com.group.person.service.PersonService;
import com.group.util.paging.PageDto;

/**
 * �λ���� ��Ʈ�ѷ�
 */

@Controller
public class PersonController {

	@Autowired
	PersonService service;
	@RequestMapping("person_ManagerView.ps")
	public ModelAndView personManagerView(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Personel/Person_Management");
		
		return mv;
	}
	/*
	 *  Menu - �λ����� - �λ���� View
	 */
	@RequestMapping("person_Manager.ps")
	@ResponseBody
	public Map<String, Object> personManger(PersonDto personDto, PageDto pageDto){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("��Ʈ�ѷ� ���Ծ��");
		System.out.println("�з�����" + personDto.getSEARCHOPTION());
		System.out.println("�˻���" + personDto.getSEARCHVALUE());
		map = service.personList(personDto, pageDto);
		
		
		return map;
	}
	/*
	 * Menu - �λ����� - �λ���� - �λ��� View
	 */
	@RequestMapping("person_InsertView.ps")
	public ModelAndView personInsertView(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Personel/Person_JoinView");
		
		return mv;
	}
	
	/*
	 * Menu - �λ����� - �λ���� - �λ��� Insert
	 */
	@RequestMapping("person_Insert.ps")
	public String personInsert(PersonDto dto){
		int result = service.personInsert(dto);
		
		return "redirect:person_ManagerView.ps";
	}
	
	/*
	 * Menu - �λ����� - �λ���� - �󼼺���
	 */
	@RequestMapping("person_Detail.ps")
	public ModelAndView personDetail(@RequestParam("empnum")String empnum){
		ModelAndView mv = new ModelAndView();
		
		Map<String, PersonDto> map = service.personDetail(empnum);
		
		mv.addObject("info",map.get("info"));
		
		//mv = service.personDetail(empnum);
		mv.setViewName("Index");
		mv.addObject("page","./Group_Personel/Person_Detail");
		return mv;
	}
	/*
	 * Menu - �λ����� - �λ���� - �󼼺��� - ����View
	 */
	@RequestMapping("person_UpdateView.ps")
	public ModelAndView personUpdateView(@RequestParam("empnum")String empnum){
		Map<String,PersonDto> map = service.personDetail(empnum);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("info", map.get("info"));
		mv.setViewName("Index");
		mv.addObject("page","./Group_Personel/Person_UpdateView");
		return mv;
	}
	/*
	 * Menu - �λ����� - �λ���� - �󼼺��� - �����ϱ�
	 */
	@RequestMapping("person_Update.ps")
	public String personUpdate(PersonDto dto){
		ModelAndView mv = new ModelAndView();
		
		service.personUpdate(dto);
		return "redirect:person_Detail.ps?empnum="+dto.getEMPNUM()+"";
	}
		/*
			System.out.println("�����ȣ : "+dto.getEMPNUM());
			System.out.println("�������̵� : "+dto.getPERSON_ID());
			System.out.println("�����н����� : "+dto.getPERSON_PW());
			System.out.println("�ѱ� �̸� : "+dto.getNAME_KOR());
			System.out.println("���� �̸� : "+dto.getNAME_ENG());
			System.out.println("�ֹ� �� : "+dto.getSSN_FRONT());
			System.out.println("�ֹ� �� : "+dto.getSSN_BACK());
			System.out.println("��ȥ ���� :"+dto.getMARRIAGE());
			System.out.println("�ڳ� �� : "+dto.getCHILDREN());
			System.out.println("����/��å : "+dto.getPOSITION());
			System.out.println("�μ� : "+dto.getDEPARTMENT());
			System.out.println("�ٹ� ���� : "+dto.getWORKTYPE());
			System.out.println("�� �� : "+dto.getGENDER());
			System.out.println("����� ���� :"+dto.getPERSON_ACCOUNT());
			System.out.println("���� ���� : "+dto.getPERSON_ACCESS());
			System.out.println("����ó : "+dto.getCONTACT());
			System.out.println("�̸��� : "+dto.getEMAIL());
			System.out.println("�����ȣ : "+dto.getZIPCODE());
			System.out.println("���ּ� : "+dto.getADDR());
		*/
	
	
	/*
	 * Menu - �λ����� - �λ���� - �󼼺��� - �����ϱ�
	 */
	@RequestMapping("person_Delete.ps")
	public String personDelete(@RequestParam("empnum")String empnum){
		ModelAndView mv = new ModelAndView();
		return service.personDelete(empnum);
	}
	
	/*
	 * Menu - �λ����� - �λ���� - �˻�
	 */
	
	@RequestMapping("person_Search.ps")
	@ResponseBody
	public Map<String, Object> personSearch(PersonDto personDto, PageDto pageDto){
		System.out.println("controller connection");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("personDto", "�ȳ�");
		
		return map;
	}
	
	/*
	 * �μ� ���
	 */
	@RequestMapping("person_DepartmentList.ps")
	@ResponseBody
	public Map<String, ArrayList<PersonDto>> personDepartmentList(){
		System.out.println("DepartMentList Controller");
		Map<String, ArrayList<PersonDto>> map = service.personDepartmentList();
		
		return map;
	}
	
	/*
	 * �μ��� ���� �ִ� ���
	 */
	@RequestMapping("person_GroupList.ps")
	@ResponseBody
	public Map<String, ArrayList<PersonDto>> personGroupList(@RequestParam("department")String department){
		Map<String, ArrayList<PersonDto>> map = service.personGroupList(department.trim());
		
		return map;
	}
	
	/*
	 * ��� ��ȣ 
	 */
	@RequestMapping("person_MemberInfo.ps")
	@ResponseBody
	public Map<String, PersonDto> personMemberInfo(@RequestParam("empnum")String empnum){
		
		Map<String, PersonDto> map = service.personDetail(empnum);
		
		return map;
	}
}
