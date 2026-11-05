package com.gaon.cinema.movie;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MovieDTO {
	private int rn;
	private int MOVIE_ID;
	private String NAME_K ;
	private String NAME_E ; 
	private String  AGE   ;
	private String AGEtext ;  
	private Date  D_DAY	; 
	private String DIRECTOR  ;
	private String  ACTOR  ;  
	private String GENRE   ; 
	private String PAGE	;
	private double AVG		;
	private int AVG_NUM;
	private String CONTENT	;
	private String POSTER	;
	private String MOVIE 	;
	private String STEEL1	;
	private String STEEL2	;
	private String STEEL3	;
	private String STEEL4	;
	private String STEEL5	;
	private String STEEL6	;
	private String STEEL7;
	private int R_TIME;
	private Date STARTDATE;
	private Date ENDDATE;
	private int dday;
	private String today;
	private String ratevalue;
	
	private String D_DAYSTRING;
	private String STARTDATESTRING;
	private String ENDDATESTRING;
	private MultipartFile POSTERFILE;
	private MultipartFile STEEL1FILE;
	private MultipartFile STEEL2FILE;
	private MultipartFile STEEL3FILE;
	private MultipartFile STEEL4FILE;
	private MultipartFile STEEL5FILE;
	private MultipartFile STEEL6FILE;
	private MultipartFile STEEL7FILE;
	
	public int getMOVIE_ID() { return MOVIE_ID; }
	public void setMOVIE_ID(int mOVIE_ID) { MOVIE_ID = mOVIE_ID; }
	public String getNAME_K() { return NAME_K; }
	public void setNAME_K(String nAME_K) { NAME_K = nAME_K; }
	public String getNAME_E() { return NAME_E; }
	public void setNAME_E(String nAME_E) { NAME_E = nAME_E; }
	public String getAGE() { return AGE; }
	public void setAGE(String aGE) { AGE = aGE; }
	public String getAGEtext() { return AGEtext; }
	public void setAGEtext(String aGEtext) { AGEtext = aGEtext; }
	public Date getD_DAY() { return D_DAY; }
	public void setD_DAY(Date d_DAY) { D_DAY = d_DAY; }
	public String getDIRECTOR() { return DIRECTOR; }
	public void setDIRECTOR(String dIRECTOR) { DIRECTOR = dIRECTOR; }
	public String getACTOR() { return ACTOR; }
	public void setACTOR(String aCTOR) { ACTOR = aCTOR; }
	public String getGENRE() { return GENRE; }
	public void setGENRE(String gENRE) { GENRE = gENRE; }
	public String getPAGE() { return PAGE; }
	public void setPAGE(String pAGE) { PAGE = pAGE; }
	public double getAVG() { return AVG; }
	public void setAVG(double aVG) { AVG = aVG; }
	public int getAVG_NUM() { return AVG_NUM; }
	public void setAVG_NUM(int aVG_NUM) { AVG_NUM = aVG_NUM; }
	public String getCONTENT() { return CONTENT; }
	public void setCONTENT(String cONTENT) { CONTENT = cONTENT; }
	public String getPOSTER() { return POSTER; }
	public void setPOSTER(String pOSTER) { POSTER = pOSTER; }
	public String getMOVIE() { return MOVIE; }
	public void setMOVIE(String mOVIE) { MOVIE = mOVIE; }
	public String getSTEEL1() { return STEEL1; }
	public void setSTEEL1(String sTEEL1) { STEEL1 = sTEEL1; }
	public String getSTEEL2() { return STEEL2; }
	public void setSTEEL2(String sTEEL2) { STEEL2 = sTEEL2; }
	public String getSTEEL3() { return STEEL3; }
	public void setSTEEL3(String sTEEL3) { STEEL3 = sTEEL3; }
	public String getSTEEL4() { return STEEL4; }
	public void setSTEEL4(String sTEEL4) { STEEL4 = sTEEL4; }
	public String getSTEEL5() { return STEEL5; }
	public void setSTEEL5(String sTEEL5) { STEEL5 = sTEEL5; }
	public String getSTEEL6() { return STEEL6; }
	public void setSTEEL6(String sTEEL6) { STEEL6 = sTEEL6; }
	public String getSTEEL7() { return STEEL7; }
	public void setSTEEL7(String sTEEL7) { STEEL7 = sTEEL7; }
	
	public Date getSTARTDATE() { return STARTDATE; }
	public void setSTARTDATE(Date sTARTDATE) { STARTDATE = sTARTDATE; }
	public Date getENDDATE() { return ENDDATE; }
	public void setENDDATE(Date eNDDATE) { ENDDATE = eNDDATE; }
	public int getRn() { return rn; }
	public void setRn(int rn) { this.rn = rn; }
	public int getDday() { return dday; }
	public void setDday(int dday) { this.dday = dday; }
	public String getToday() { return today; }
	public void setToday(String today) { this.today = today; }
	public String getRatevalue() { return ratevalue; }
	public void setRatevalue(String ratevalue) { this.ratevalue = ratevalue; }
	public int getR_TIME() { return R_TIME; }
	public void setR_TIME(int r_TIME) { R_TIME = r_TIME; }
	public String getD_DAYSTRING() { return D_DAYSTRING; }
	public void setD_DAYSTRING(String d_DAYSTRING) { D_DAYSTRING = d_DAYSTRING; }
	public String getSTARTDATESTRING() { return STARTDATESTRING; }
	public void setSTARTDATESTRING(String sTARTDATESTRING) { STARTDATESTRING = sTARTDATESTRING; }
	public String getENDDATESTRING() { return ENDDATESTRING; }
	public void setENDDATESTRING(String eNDDATESTRING) { ENDDATESTRING = eNDDATESTRING; }
	public MultipartFile getPOSTERFILE() { return POSTERFILE; }
	public void setPOSTERFILE(MultipartFile pOSTERFILE) { POSTERFILE = pOSTERFILE; }
	public MultipartFile getSTEEL1FILE() { return STEEL1FILE; }
	public void setSTEEL1FILE(MultipartFile sTEEL1FILE) { STEEL1FILE = sTEEL1FILE; }
	public MultipartFile getSTEEL2FILE() { return STEEL2FILE; }
	public void setSTEEL2FILE(MultipartFile sTEEL2FILE) { STEEL2FILE = sTEEL2FILE; }
	public MultipartFile getSTEEL3FILE() { return STEEL3FILE; }
	public void setSTEEL3FILE(MultipartFile sTEEL3FILE) { STEEL3FILE = sTEEL3FILE; }
	public MultipartFile getSTEEL4FILE() { return STEEL4FILE; }
	public void setSTEEL4FILE(MultipartFile sTEEL4FILE) { STEEL4FILE = sTEEL4FILE; }
	public MultipartFile getSTEEL5FILE() { return STEEL5FILE; }
	public void setSTEEL5FILE(MultipartFile sTEEL5FILE) { STEEL5FILE = sTEEL5FILE; }
	public MultipartFile getSTEEL6FILE() { return STEEL6FILE; }
	public void setSTEEL6FILE(MultipartFile sTEEL6FILE) { STEEL6FILE = sTEEL6FILE; }
	public MultipartFile getSTEEL7FILE() { return STEEL7FILE; }
	public void setSTEEL7FILE(MultipartFile sTEEL7FILE) { STEEL7FILE = sTEEL7FILE; }
}
