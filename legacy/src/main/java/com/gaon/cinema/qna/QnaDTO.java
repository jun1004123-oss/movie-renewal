package com.gaon.cinema.qna;

import java.sql.Date;

public class QnaDTO {//필드이름
	
	private int qna_id;
	private String userid;
	private String title;
	private String contents;
	private Date wdate;
	private int count;
	
	private int rn;
	private String skey;
	private String sval;
	private int start;
	private int end;
	private int pagenum;
	
	public int getQna_id() { return qna_id; }
	public void setQna_id(int qna_id) { this.qna_id = qna_id; }
	
	public String getUserid() { return userid; }
	public void setUserid(String userid) { this.userid = userid; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public String getContents() { return contents; }
	public void setContents(String contents) { this.contents = contents; }
	
	public Date getWdate() { return wdate; }
	public void setWdate(Date wdate) { this.wdate = wdate; }
	
	public int getCount() { return count; }
	public void setCount(int count) { this.count = count; }
	
	public String getSkey() { return skey; }
	public void setSkey(String skey) { this.skey = skey; }
	
	public String getSval() { return sval; }
	public void setSval(String sval) { this.sval = sval; }
	
	public int getStart() { return start; }
	public void setStart(int start) { this.start = start; }
	
	public int getEnd() { return end; }
	public void setEnd(int end) { this.end = end; }
	
	public int getPagenum() { return pagenum; }
	public void setPagenum(int pagenum) { this.pagenum = pagenum; }
	
	public int getRn() { return rn; }
	public void setRn(int rn) { this.rn = rn; }
	
}//QnaDTO class END 
