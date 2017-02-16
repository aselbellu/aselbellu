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
		// �λ���
		
		FileInOut fileInput = new FileInOut();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		
		
		if (!dto.getPHOTO_PERSONFILE().isEmpty()){
			// ������ �����Ѵٸ�...
			dto.setPHOTO_PERSON(fileInput.inputFile(dto.getPHOTO_PERSONFILE()));
		} else {
			dto.setPHOTO_PERSON("NoImage.png");
		}
		if (!dto.getPHOTO_LICENSEFILE().isEmpty()){
			// ������ �����Ѵٸ� ..
			dto.setPHOTO_LICENSE(fileInput.inputFile(dto.getPHOTO_LICENSEFILE()));
		} else {
			dto.setPHOTO_LICENSE("NoImage.png");
		}
		
		// �λ��� ���̵� ����
		String id = "";
		String tempDepart = "";
		tempDepart = dto.getDEPARTMENT();
		
		if (tempDepart != "" || tempDepart != null){
			
			//�ҼӺ� ���̵� ����
			if (tempDepart.equals("�ְ���ȣ")){
				//�Ҽ� �ְ���ȣ
				id = "care";
			} else if (tempDepart.equals("���κ���")){
				//�Ҽ� ���κ���
				id = "silver";
				
			} else if (tempDepart.equals("Ǫ���ũ")){
				//�Ҽ� Ǫ���ũ
				id = "food";
			}
			
			int resultNum = dao.personCount()+1;
			dto.setEMPNUM(resultNum);
			dto.setPERSON_ID(id+resultNum);
		
		}
		
		// �λ��� ��й�ȣ ���� �ʱ� ��й�ȣ�� �������
		if (dto.getSSN_FRONT() != "" || dto.getSSN_FRONT() != null){
			dto.setPERSON_PW(dto.getSSN_FRONT());
		}
		
		int result = dao.personInsert(dto);
		
		
		/*System.out.println("�����ȣ : "+dto.getEMPNUM());
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
		return 0;
	}

	@Override
	public Map<String, Object> personList(PersonDto personDto, PageDto pageDto) {
		// �λ� ���
		Map<String, Object> map = new HashMap<String, Object>();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		PagiNation pagiNation = new PagiNation();
		
		System.out.println( "���� ���Ӿ��");
		
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
			System.out.println("�����ȣ : " + dtos.get(i).getEMPNUM());
		}
		
		map.put("personList", dtos);
		map.put("pageDto", pageDto);
		
		return map;
	}

	@Override
	public Map<String, PersonDto> personDetail(String empnum) {
		// �λ����� �󼼺���
		Map<String,PersonDto> map = new HashMap<String, PersonDto>();
		
		PersonDto dto = new PersonDto();
		
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		dto = dao.personDetail(Integer.parseInt(empnum));
		
		map.put("info", dto);
		return map;
	}
	
	// �λ����� ����
	@Override
	public ModelAndView personUpdate(PersonDto dto){
		ModelAndView mv = new ModelAndView();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		
		FileInOut fileInput = new FileInOut();
		//.isEmpty() ������ ��������� true ������ �����ϸ� false
		
		if (!dto.getPHOTO_PERSONFILE().isEmpty()){
			System.out.println("�ξƴ�");
			dto.setPHOTO_PERSON(fileInput.inputFile(dto.getPHOTO_PERSONFILE()));
		}
		if (!dto.getPHOTO_LICENSEFILE().isEmpty()){
			System.out.println("�ξƴ�");
			dto.setPHOTO_LICENSE(fileInput.inputFile(dto.getPHOTO_LICENSEFILE()));
		} 
		
		dao.personUpdate(dto);
		return mv;
	}

	// �λ����� ����
	@Override
	public String personDelete(String empnum) {
		ModelAndView mv = new ModelAndView();
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		PersonDto dto = new PersonDto();
		FileInOut file = new FileInOut();
		int dataDelete = 0;	// DB ���� ���
		String location = "";
		// DB���� ������ ���� ����  �λ����� dto ��Ƶα�
		dto = dao.personDetail(Integer.parseInt(empnum));
	
		// DB ���� �õ�
		dataDelete = dao.personDelete(Integer.parseInt(empnum));
		
		//DB �������� 
		if (dataDelete == 1){
			// ���� �̹��� ����
			if(!dto.getPHOTO_PERSON().equals("NoImage.png")){
				//�⺻ �̹����� �ƴҰ�� ����
				file.deleteFile(dto.getPHOTO_PERSON());
			}
			// �ڰ��� �̹��� ����
			if(!dto.getPHOTO_LICENSE().equals("NoImage.png")){
				//�⺻ �̹����� �ƴ� ��� ����
				file.deleteFile(dto.getPHOTO_LICENSE());
			}
			//�λ� ������� redirect
			location = "redirect:person_ManagerView.ps";
		} else {	// DB ���� ����
			System.out.println("������ ������ ���� �Ͽ����ϴ�.");
			//�ش� �λ������� redirect
			location = "redirect:person_Detail.ps?empnum="+dto.getEMPNUM()+"";
		}

		return location;
	}

	// �μ� ���
	@Override
	public Map<String, ArrayList<PersonDto>> personDepartmentList() {
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		
		Map<String, ArrayList<PersonDto>> map = new HashMap<String, ArrayList<PersonDto>>();
				
		ArrayList<PersonDto> departments = dao.personDepartMentList();
		
		map.put("departList", departments);
		
		return map;
	}

	// �μ��� �����ִ� �λ���
	@Override
	public Map<String, ArrayList<PersonDto>> personGroupList(String department) {
		PersonDao dao = sqlSession.getMapper(PersonDao.class);
		Map<String, ArrayList<PersonDto>> map = new HashMap<String, ArrayList<PersonDto>>();
		ArrayList<PersonDto> members = dao.personGroupList(department);
		map.put("members", members);
		return map;
	}

}
