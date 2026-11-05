package com.gaon.cinema.event;

import java.util.Date;

public class EventDTO {
	private int event_id;
	private String title;
	private String contents;
	private String poster;
	private String img;
	private Date wdate;
	private Date e_start;
	private Date e_end;
	private String today;
	private int dday;
	
	public int getEvent_id() {		return event_id;	}
	public void setEvent_id(int event_id) {		this.event_id = event_id;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getContents() {		return contents;	}
	public void setContents(String contents) {		this.contents = contents;	}
	public String getPoster() {		return poster;	}
	public void setPoster(String poster) {		this.poster = poster;	}
	public String getImg() {		return img;	}
	public void setImg(String img) {		this.img = img;	}
	public Date getWdate() {		return wdate;	}
	public void setWdate(Date wdate) {		this.wdate = wdate;	}
	public Date getE_start() {
		return e_start;
	}
	public void setE_start(Date e_start) {
		this.e_start = e_start;
	}
	public Date getE_end() {
		return e_end;
	}
	public void setE_end(Date e_end) {
		this.e_end = e_end;
	}
	
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
}
