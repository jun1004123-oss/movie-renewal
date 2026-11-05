package com.gaon.cinema.login;

import java.sql.Date;

public class LoginDTO {
	private String USERID;
	private String USERPW;
	private String NAME;
	private int point;
	private String img_file;                                     
	private String GENDER;            
	private Date BIRTH;     
	
  public String getImg_file() {
		return img_file;
	}
	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}
	public String getGENDER() {
		return GENDER;
	}
	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}
	public Date getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(Date bIRTH) {
		BIRTH = bIRTH;
	}
	public String getTELNUM() {
		return TELNUM;
	}
	public void setTELNUM(String tELNUM) {
		TELNUM = tELNUM;
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
	public String getADDRESS1() {
		return ADDRESS1;
	}
	public void setADDRESS1(String aDDRESS1) {
		ADDRESS1 = aDDRESS1;
	}
	public String getADDRESS2() {
		return ADDRESS2;
	}
	public void setADDRESS2(String aDDRESS2) {
		ADDRESS2 = aDDRESS2;
	}
	private String TELNUM;
  private String EMAIL;
  private String ZIPCODE;
  private String ADDRESS1;
  private String ADDRESS2;
	
	
	
	
	
	
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String USERID) {
		this.USERID = USERID;
	}
	public String getUSERPW() {
		return USERPW;
	}
	public void setUSERPW(String USERPW) {
		this.USERPW = USERPW;
	}
}//class END
