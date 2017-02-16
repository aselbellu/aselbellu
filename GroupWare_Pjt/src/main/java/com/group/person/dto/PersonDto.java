package com.group.person.dto;

import org.springframework.web.multipart.MultipartFile;

public class PersonDto {
	private int EMPNUM;
	private String PERSON_ID;
	private String PERSON_PW;
	private String NAME_KOR;
	private String NAME_ENG;
	private String SSN_FRONT;
	private String SSN_BACK;
	private String MARRIAGE;
	private String CHILDREN;
	private String POSITION;
	private String DEPARTMENT;
	private String WORKTYPE;
	private String GENDER;
	private String CONTACT;
	private String EMAIL;
	private String ZIPCODE;
	private String ADDR;
	private String PHOTO_PERSON;
	private String PHOTO_LICENSE;
	private String PERSON_ACCOUNT;	// 관리자 권한
	private String PERSON_ACCESS;	// 접근권한
	private MultipartFile PHOTO_PERSONFILE;
	private MultipartFile PHOTO_LICENSEFILE;
	
	private String SEARCHOPTION;
	private String SEARCHVALUE;
	
	public String getSEARCHOPTION() {
		return SEARCHOPTION;
	}
	public void setSEARCHOPTION(String sEARCHOPTION) {
		SEARCHOPTION = sEARCHOPTION;
	}
	public String getSEARCHVALUE() {
		return SEARCHVALUE;
	}
	public void setSEARCHVALUE(String sEARCHVALUE) {
		SEARCHVALUE = sEARCHVALUE;
	}
	public String getPERSON_ID() {
		return PERSON_ID;
	}
	public void setPERSON_ID(String pERSON_ID) {
		PERSON_ID = pERSON_ID;
	}
	public String getPERSON_PW() {
		return PERSON_PW;
	}
	public void setPERSON_PW(String pERSON_PW) {
		PERSON_PW = pERSON_PW;
	}
	public String getPERSON_ACCOUNT() {
		return PERSON_ACCOUNT;
	}
	public void setPERSON_ACCOUNT(String aCCOUNT) {
		PERSON_ACCOUNT = aCCOUNT;
	}
	public String getPERSON_ACCESS() {
		return PERSON_ACCESS;
	}
	public void setPERSON_ACCESS(String aCCESS) {
		PERSON_ACCESS = aCCESS;
	}
	public int getEMPNUM() {
		return EMPNUM;
	}
	public void setEMPNUM(int eMPNUM) {
		EMPNUM = eMPNUM;
	}
	public String getNAME_KOR() {
		return NAME_KOR;
	}
	public void setNAME_KOR(String nAME_KOR) {
		NAME_KOR = nAME_KOR;
	}
	public String getNAME_ENG() {
		return NAME_ENG;
	}
	public void setNAME_ENG(String nAME_ENG) {
		NAME_ENG = nAME_ENG;
	}
	public String getSSN_FRONT() {
		return SSN_FRONT;
	}
	public void setSSN_FRONT(String sSN_FRONT) {
		SSN_FRONT = sSN_FRONT;
	}
	public String getSSN_BACK() {
		return SSN_BACK;
	}
	public void setSSN_BACK(String sSN_BACK) {
		SSN_BACK = sSN_BACK;
	}
	public String getMARRIAGE() {
		return MARRIAGE;
	}
	public void setMARRIAGE(String mARRIAGE) {
		MARRIAGE = mARRIAGE;
	}
	public String getCHILDREN() {
		return CHILDREN;
	}
	public void setCHILDREN(String cHILDREN) {
		CHILDREN = cHILDREN;
	}
	public String getPOSITION() {
		return POSITION;
	}
	public void setPOSITION(String pOSITION) {
		POSITION = pOSITION;
	}
	public String getDEPARTMENT() {
		return DEPARTMENT;
	}
	public void setDEPARTMENT(String dEPARTMENT) {
		DEPARTMENT = dEPARTMENT;
	}
	public String getWORKTYPE() {
		return WORKTYPE;
	}
	public void setWORKTYPE(String wORKTYPE) {
		WORKTYPE = wORKTYPE;
	}
	public String getGENDER() {
		return GENDER;
	}
	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}
	public String getCONTACT() {
		return CONTACT;
	}
	public void setCONTACT(String cONTACT) {
		CONTACT = cONTACT;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getZIPCODE() {
		return ZIPCODE;
	}
	public void setZIPCODE(String zIPCODE) {
		ZIPCODE = zIPCODE;
	}
	public String getADDR() {
		return ADDR;
	}
	public String getPHOTO_PERSON() {
		return PHOTO_PERSON;
	}
	public void setPHOTO_PERSON(String pHOTO_PERSON) {
		PHOTO_PERSON = pHOTO_PERSON;
	}
	public String getPHOTO_LICENSE() {
		return PHOTO_LICENSE;
	}
	public void setPHOTO_LICENSE(String pHOTO_LICENSE) {
		PHOTO_LICENSE = pHOTO_LICENSE;
	}
	public MultipartFile getPHOTO_PERSONFILE() {
		return PHOTO_PERSONFILE;
	}
	public void setPHOTO_PERSONFILE(MultipartFile pHOTO_PERSONFILE) {
		PHOTO_PERSONFILE = pHOTO_PERSONFILE;
	}
	public MultipartFile getPHOTO_LICENSEFILE() {
		return PHOTO_LICENSEFILE;
	}
	public void setPHOTO_LICENSEFILE(MultipartFile pHOTO_LICENSEFILE) {
		PHOTO_LICENSEFILE = pHOTO_LICENSEFILE;
	}
	public void setADDR(String aDDR) {
		ADDR = aDDR;
	}
	
	
}
