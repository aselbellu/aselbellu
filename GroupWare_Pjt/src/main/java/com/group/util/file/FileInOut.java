package com.group.util.file;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 파일 업로드 및 다운로드
 * @author j_bel
 *
 */


public class FileInOut {
	private static final String savePath = "E:\\MIT\\GroupWare\\GroupWare_Pjt\\src\\main\\webapp\\resources\\Person_Image\\";
	
	
	//파일 저장
	public String inputFile(MultipartFile requestFile) {
		
		String resultName = null;
		
		
		File file = new File(savePath);
		
		if (file.exists() == false){
			// 해당 디렉토리가 없을경우 디렉터리 생성
			file.mkdirs();
		}
		
		file = new File(savePath + requestFile.getOriginalFilename());
		try{
			
			if (file.exists() == true){
				// 해당이름의 파일이 존재할 경우 UUID.Randon Api 이용 기존파일명 + UUID.Random 추가
				String reNameFile = UUID.randomUUID().toString().replaceAll("-", "");
				file = new File(savePath + reNameFile + requestFile.getOriginalFilename());
				resultName = reNameFile + requestFile.getOriginalFilename();
				
			} else {
				// 해당 파일 없을경우 이름 그대로 저장
				resultName = requestFile.getOriginalFilename();
			}
			
			requestFile.transferTo(file);
		} catch (Exception e){
			System.out.println("파일 저장 오류");
		}
		
		return resultName;
	}
	
	//파일 삭제
	public boolean deleteFile(String tempFileName){
		
		File file = new File(savePath + tempFileName);
		boolean result = false;
		
		if(file.exists() == true){
			result = file.delete();
		} 
		
		return result;
	}
	
}
