package com.gaon.cinema.reservation;

public class ReservationShowDTO {
	private int movie_id;
	private String name_k;
	private String age;
	private String cname;
	private int corder;
	private int corder2;
	private String lname;
	private String tname;
	private String mstartdate;
	private String mstarthour;
	private String mendhour;
	private int THEATER_ID;
	private int THEATER_SCHEDULE_ID;
	
	
	public int getMovie_id() { return movie_id; }
	public void setMovie_id(int movie_id) { this.movie_id = movie_id; }
	public String getName_k() { return name_k; }
	public void setName_k(String name_k) { this.name_k = name_k; }
	public String getAge() { return age; }
	public void setAge(String age) { this.age = age; }
	public String getCname() { return cname; }
	public void setCname(String cname) { this.cname = cname; }
	public int getCorder() { return corder; }
	public void setCorder(int corder) { this.corder = corder; }
	public String getLname() { return lname; }
	public void setLname(String lname) { this.lname = lname; }
	public String getTname() { return tname; }
	public void setTname(String tname) { this.tname = tname; }
	public String getMstartdate() { return mstartdate; }
	public void setMstartdate(String mstartdate) { this.mstartdate = mstartdate; }
	public String getMstarthour() { return mstarthour; }
	public void setMstarthour(String mstarthour) { this.mstarthour = mstarthour; }
	
	public int getTHEATER_ID() {
		return THEATER_ID;
	}
	public void setTHEATER_ID(int tHEATER_ID) {
		THEATER_ID = tHEATER_ID;
	}
	public int getTHEATER_SCHEDULE_ID() {
		return THEATER_SCHEDULE_ID;
	}
	public void setTHEATER_SCHEDULE_ID(int tHEATER_SCHEDULE_ID) {
		THEATER_SCHEDULE_ID = tHEATER_SCHEDULE_ID;
	}
	public String getMendhour() {
		return mendhour;
	}
	public void setMendhour(String mendhour) {
		this.mendhour = mendhour;
	}
	public int getCorder2() {
		return corder2;
	}
	public void setCorder2(int corder2) {
		this.corder2 = corder2;
	}
}

