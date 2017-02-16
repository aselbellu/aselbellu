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
 * 인사관련 컨트롤러
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
	 *  Menu - 인사정보 - 인사관리 View
	 */
	@RequestMapping("person_Manager.ps")
	@ResponseBody
	public Map<String, Object> personManger(PersonDto personDto, PageDto pageDto){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("컨트롤러 들어왔어요");
		System.out.println("분류선택" + personDto.getSEARCHOPTION());
		System.out.println("검색어" + personDto.getSEARCHVALUE());
		map = service.personList(personDto, pageDto);
		
		
		return map;
	}
	/*
	 * Menu - 인사정보 - 인사관리 - 인사등록 View
	 */
	@RequestMapping("person_InsertView.ps")
	public ModelAndView personInsertView(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("Index");
		mv.addObject("page","./Group_Personel/Person_JoinView");
		
		return mv;
	}
	
	/*
	 * Menu - 인사정보 - 인사관리 - 인사등록 Insert
	 */
	@RequestMapping("person_Insert.ps")
	public String personInsert(PersonDto dto){
		int result = service.personInsert(dto);
		
		return "redirect:person_ManagerView.ps";
	}
	
	/*
	 * Menu - 인사정보 - 인사관리 - 상세보기
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
	 * Menu - 인사정보 - 인사관리 - 상세보기 - 수정View
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
	 * Menu - 인사정보 - 인사관리 - 상세보기 - 수정하기
	 */
	@RequestMapping("person_Update.ps")
	public String personUpdate(PersonDto dto){
		ModelAndView mv = new ModelAndView();
		
		service.personUpdate(dto);
		return "redirect:person_Detail.ps?empnum="+dto.getEMPNUM()+"";
	}
		/*
			System.out.println("사원번호 : "+dto.getEMPNUM());
			System.out.println("생성아이디 : "+dto.getPERSON_ID());
			System.out.println("생성패스워드 : "+dto.getPERSON_PW());
			System.out.println("한글 이름 : "+dto.getNAME_KOR());
			System.out.println("영문 이름 : "+dto.getNAME_ENG());
			System.out.println("주민 앞 : "+dto.getSSN_FRONT());
			System.out.println("주민 뒤 : "+dto.getSSN_BACK());
			System.out.println("결혼 여부 :"+dto.getMARRIAGE());
			System.out.println("자녀 수 : "+dto.getCHILDREN());
			System.out.println("직위/직책 : "+dto.getPOSITION());
			System.out.println("부서 : "+dto.getDEPARTMENT());
			System.out.println("근무 형태 : "+dto.getWORKTYPE());
			System.out.println("성 별 : "+dto.getGENDER());
			System.out.println("사용자 권한 :"+dto.getPERSON_ACCOUNT());
			System.out.println("접근 권한 : "+dto.getPERSON_ACCESS());
			System.out.println("연락처 : "+dto.getCONTACT());
			System.out.println("이메일 : "+dto.getEMAIL());
			System.out.println("우편번호 : "+dto.getZIPCODE());
			System.out.println("상세주소 : "+dto.getADDR());
		*/
	
	
	/*
	 * Menu - 인사정보 - 인사관리 - 상세보기 - 삭제하기
	 */
	@RequestMapping("person_Delete.ps")
	public String personDelete(@RequestParam("empnum")String empnum){
		ModelAndView mv = new ModelAndView();
		return service.personDelete(empnum);
	}
	
	/*
	 * Menu - 인사정보 - 인사관리 - 검색
	 */
	
	@RequestMapping("person_Search.ps")
	@ResponseBody
	public Map<String, Object> personSearch(PersonDto personDto, PageDto pageDto){
		System.out.println("controller connection");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("personDto", "안녕");
		
		return map;
	}
	
	/*
	 * 부서 목록
	 */
	@RequestMapping("person_DepartmentList.ps")
	@ResponseBody
	public Map<String, ArrayList<PersonDto>> personDepartmentList(){
		System.out.println("DepartMentList Controller");
		Map<String, ArrayList<PersonDto>> map = service.personDepartmentList();
		
		return map;
	}
	
	/*
	 * 부서의 속해 있는 사원
	 */
	@RequestMapping("person_GroupList.ps")
	@ResponseBody
	public Map<String, ArrayList<PersonDto>> personGroupList(@RequestParam("department")String department){
		Map<String, ArrayList<PersonDto>> map = service.personGroupList(department.trim());
		
		return map;
	}
	
	/*
	 * 사원 번호 
	 */
	@RequestMapping("person_MemberInfo.ps")
	@ResponseBody
	public Map<String, PersonDto> personMemberInfo(@RequestParam("empnum")String empnum){
		
		Map<String, PersonDto> map = service.personDetail(empnum);
		
		return map;
	}
}
