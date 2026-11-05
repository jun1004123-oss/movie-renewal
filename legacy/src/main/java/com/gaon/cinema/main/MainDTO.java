package com.gaon.cinema.main;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MainDTO {
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
	private int R_TIME;
	private Date STARTDATE;
	private Date ENDDATE;
	private int dday;
	private String today;
	
	private String D_DAYSTRING;
	private String STARTDATESTRING;
	private String ENDDATESTRING;
	private MultipartFile POSTERFILE;
	
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
}
