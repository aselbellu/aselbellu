package com.group.notice.dto;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDto {
	// DB Type
	private int POSTNUM;
	private String TITLE;
	private String KINDS;
	private String WRITER;
	private String WRITE_DATE;
	private String CONTENTS;
	private MultipartFile[] NOTICE_FILES;
	
	// Search Type
	private String SEARCHOPTION;
	private String SEARCHVALUE;
	
	public int getPOSTNUM() {
		return POSTNUM;
	}
	public void setPOSTNUM(int pOSTNUM) {
		POSTNUM = pOSTNUM;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getKINDS() {
		return KINDS;
	}
	public void setKINDS(String kINDS) {
		KINDS = kINDS;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getWRITE_DATE() {
		return WRITE_DATE;
	}
	public void setWRITE_DATE(String wRITE_DATE) {
		WRITE_DATE = wRITE_DATE;
	}
	public String getCONTENTS() {
		return CONTENTS;
	}
	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
	}
	public MultipartFile[] getNOTICE_FILES() {
		return NOTICE_FILES;
	}
	public void setNOTICE_FILES(MultipartFile[] nOTICE_FILES) {
		NOTICE_FILES = nOTICE_FILES;
	}
}
