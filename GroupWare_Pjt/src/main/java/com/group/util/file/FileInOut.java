package com.group.util.file;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * ���� ���ε� �� �ٿ�ε�
 * @author j_bel
 *
 */


public class FileInOut {
	private static final String savePath = "E:\\MIT\\GroupWare\\GroupWare_Pjt\\src\\main\\webapp\\resources\\Person_Image\\";
	
	
	//���� ����
	public String inputFile(MultipartFile requestFile) {
		
		String resultName = null;
		
		
		File file = new File(savePath);
		
		if (file.exists() == false){
			// �ش� ���丮�� ������� ���͸� ����
			file.mkdirs();
		}
		
		file = new File(savePath + requestFile.getOriginalFilename());
		try{
			
			if (file.exists() == true){
				// �ش��̸��� ������ ������ ��� UUID.Randon Api �̿� �������ϸ� + UUID.Random �߰�
				String reNameFile = UUID.randomUUID().toString().replaceAll("-", "");
				file = new File(savePath + reNameFile + requestFile.getOriginalFilename());
				resultName = reNameFile + requestFile.getOriginalFilename();
				
			} else {
				// �ش� ���� ������� �̸� �״�� ����
				resultName = requestFile.getOriginalFilename();
			}
			
			requestFile.transferTo(file);
		} catch (Exception e){
			System.out.println("���� ���� ����");
		}
		
		return resultName;
	}
	
	//���� ����
	public boolean deleteFile(String tempFileName){
		
		File file = new File(savePath + tempFileName);
		boolean result = false;
		
		if(file.exists() == true){
			result = file.delete();
		} 
		
		return result;
	}
	
}
