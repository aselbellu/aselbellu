package com.group.docu.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.docu.dao.DocuDao;

@Service
public class DocuServiceImpl implements DocuService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Map<String, Object> docuDepartCount(String department) {
		Map<String, Object> map = new HashMap<String, Object>();
		DocuDao dao = sqlSession.getMapper(DocuDao.class);
		
		String tempDepartCount = dao.docuDepartCount();
		
		
		if (tempDepartCount == null || tempDepartCount == ""){
			// Return Value 0 or Null
			tempDepartCount = "1";
		}
		map.put("departNum", tempDepartCount);
		return map;
	}

}
