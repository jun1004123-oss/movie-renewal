package com.gaon.cinema.theater;

public class TheaterDTO {
	private int theater_id;
	private String cname;
	private int corder;
	private String lname;
	private String tname;
	private String ttype;
	private String timg;
	private int seatcount;
	private int seatrowcount;
	private int seatcolcount;
	private int seatstyle;
	
	private int start;
	private int end;
	private int pagenum;
	
	public int getTheater_id() { return theater_id;}
	public void setTheater_id(int theater_id) { this.theater_id = theater_id;}
	public String getCname() { return cname;}
	public void setCname(String cname) { this.cname = cname;}
	public int getCorder() { return corder;}
	public void setCorder(int corder) { this.corder = corder; }
	public String getLname() { return lname; }
	public void setLname(String lname) { this.lname = lname; }
	public String getTname() { return tname; }
	public void setTname(String tname) { this.tname = tname; }
	public String getTtype() { return ttype; }
	public void setTtype(String ttype) { this.ttype = ttype; }
	public String getTimg() { return timg; }
	public void setTimg(String timg) { this.timg = timg; }
	public int getSeatcount() { return seatcount; }
	public void setSeatcount(int seatcount) { this.seatcount = seatcount; }
	public int getSeatrowcount() { return seatrowcount; }
	public void setSeatrowcount(int seatrowcount) { this.seatrowcount = seatrowcount; }
	public int getSeatcolcount() { return seatcolcount; }
	public void setSeatcolcount(int seatcolcount) { this.seatcolcount = seatcolcount; }
	public int getSeatstyle() { return seatstyle; }
	public void setSeatstyle(int seatstyle) { this.seatstyle = seatstyle; }
	
	public int getStart() { return start; }
	public void setStart(int start) { this.start = start; }
	public int getEnd() { return end; }
	public void setEnd(int end) { this.end = end; }
	public int getPagenum() { return pagenum; }
	public void setPagenum(int pagenum) { this.pagenum = pagenum; }
}
