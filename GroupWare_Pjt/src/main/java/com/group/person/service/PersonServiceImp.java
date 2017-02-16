package com.group.person.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.group.person.dao.PersonDao;
import com.group.person.dto.PersonDto;
import com.group.util.file.FileInOut;
import com.group.util.paging.PageDto;
import com.group.util.paging.PagiNation;

@Service
public class PersonServiceImp implements PersonService {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public int personInsert(PersonDto dto) {
		// 인사등록
		
		FileInOut fileInput = new FileInOut();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		
		
		if (!dto.getPHOTO_PERSONFILE().isEmpty()){
			// 파일이 존재한다면...
			dto.setPHOTO_PERSON(fileInput.inputFile(dto.getPHOTO_PERSONFILE()));
		} else {
			dto.setPHOTO_PERSON("NoImage.png");
		}
		if (!dto.getPHOTO_LICENSEFILE().isEmpty()){
			// 파일이 존재한다면 ..
			dto.setPHOTO_LICENSE(fileInput.inputFile(dto.getPHOTO_LICENSEFILE()));
		} else {
			dto.setPHOTO_LICENSE("NoImage.png");
		}
		
		// 인사등록 아이디 생성
		String id = "";
		String tempDepart = "";
		tempDepart = dto.getDEPARTMENT();
		
		if (tempDepart != "" || tempDepart != null){
			
			//소속별 아이디 생성
			if (tempDepart.equals("주간보호")){
				//소속 주간보호
				id = "care";
			} else if (tempDepart.equals("노인복지")){
				//소속 노인복지
				id = "silver";
				
			} else if (tempDepart.equals("푸드뱅크")){
				//소속 푸드뱅크
				id = "food";
			}
			
			int resultNum = dao.personCount()+1;
			dto.setEMPNUM(resultNum);
			dto.setPERSON_ID(id+resultNum);
		
		}
		
		// 인사등록 비밀번호 생성 초기 비밀번호는 생년월일
		if (dto.getSSN_FRONT() != "" || dto.getSSN_FRONT() != null){
			dto.setPERSON_PW(dto.getSSN_FRONT());
		}
		
		int result = dao.personInsert(dto);
		
		
		/*System.out.println("사원번호 : "+dto.getEMPNUM());
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
		return 0;
	}

	@Override
	public Map<String, Object> personList(PersonDto personDto, PageDto pageDto) {
		// 인사 목록
		Map<String, Object> map = new HashMap<String, Object>();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		PagiNation pagiNation = new PagiNation();
		
		System.out.println( "서비스 들어왓어요");
		
		int listCount = dao.personListCount(personDto);
		System.out.println("ListCount " + listCount);
		
		pageDto = pagiNation.paging(pageDto, listCount);
		
		if(personDto.getSEARCHOPTION() != null && personDto.getSEARCHVALUE() != null){
			map.put("SEARCHOPTION", personDto.getSEARCHOPTION());
			map.put("SEARCHVALUE", personDto.getSEARCHVALUE());
		}
		System.out.println(map.get("SEARCHOPTION"));
		System.out.println(map.get("SEARCHVALUE"));
		
		map.put("STARTROW", pageDto.getStartRow());
		map.put("ENDROW", pageDto.getEndRow());
		
		ArrayList<PersonDto> dtos = dao.personList(map);
		
		for (int i = 0 ; i < dtos.size() ; i++){
			System.out.println("사원번호 : " + dtos.get(i).getEMPNUM());
		}
		
		map.put("personList", dtos);
		map.put("pageDto", pageDto);
		
		return map;
	}

	@Override
	public Map<String, PersonDto> personDetail(String empnum) {
		// 인사정보 상세보기
		Map<String,PersonDto> map = new HashMap<String, PersonDto>();
		
		PersonDto dto = new PersonDto();
		
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		dto = dao.personDetail(Integer.parseInt(empnum));
		
		map.put("info", dto);
		return map;
	}
	
	// 인사정보 수정
	@Override
	public ModelAndView personUpdate(PersonDto dto){
		ModelAndView mv = new ModelAndView();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		
		FileInOut fileInput = new FileInOut();
		//.isEmpty() 파일이 비어있으면 true 파일이 존재하면 false
		
		if (!dto.getPHOTO_PERSONFILE().isEmpty()){
			System.out.println("널아님");
			dto.setPHOTO_PERSON(fileInput.inputFile(dto.getPHOTO_PERSONFILE()));
		}
		if (!dto.getPHOTO_LICENSEFILE().isEmpty()){
			System.out.println("널아님");
			dto.setPHOTO_LICENSE(fileInput.inputFile(dto.getPHOTO_LICENSEFILE()));
		} 
		
		dao.personUpdate(dto);
		return mv;
	}

	// 인사정보 삭제
	@Override
	public String personDelete(String empnum) {
		ModelAndView mv = new ModelAndView();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		PersonDto dto = new PersonDto();
		FileInOut file = new FileInOut();
		int dataDelete = 0;	// DB 삭제 결과
		String location = "";
		// DB삭제 성공후 파일 삭제  인사정보 dto 담아두기
		dto = dao.personDetail(Integer.parseInt(empnum));
	
		// DB 삭제 시도
		dataDelete = dao.personDelete(Integer.parseInt(empnum));
		
		//DB 삭제성공 
		if (dataDelete == 1){
			// 사진 이미지 삭제
			if(!dto.getPHOTO_PERSON().equals("NoImage.png")){
				//기본 이미지가 아닐경우 삭제
				file.deleteFile(dto.getPHOTO_PERSON());
			}
			// 자격증 이미지 삭제
			if(!dto.getPHOTO_LICENSE().equals("NoImage.png")){
				//기본 이미지가 아닐 경우 삭제
				file.deleteFile(dto.getPHOTO_LICENSE());
			}
			//인사 목록으로 redirect
			location = "redirect:person_ManagerView.ps";
		} else {	// DB 삭제 실패
			System.out.println("데이터 삭제를 실패 하였습니다.");
			//해당 인사정보로 redirect
			location = "redirect:person_Detail.ps?empnum="+dto.getEMPNUM()+"";
		}

		return location;
	}

	// 부서 목록
	@Override
	public Map<String, ArrayList<PersonDto>> personDepartmentList() {
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		
		Map<String, ArrayList<PersonDto>> map = new HashMap<String, ArrayList<PersonDto>>();
				
		ArrayList<PersonDto> departments = dao.personDepartMentList();
		
		map.put("departList", departments);
		
		return map;
	}

	// 부서의 속해있는 인사목록
	@Override
	public Map<String, ArrayList<PersonDto>> personGroupList(String department) {
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		Map<String, ArrayList<PersonDto>> map = new HashMap<String, ArrayList<PersonDto>>();
		ArrayList<PersonDto> members = dao.personGroupList(department);
		map.put("members", members);
		return map;
	}

}
