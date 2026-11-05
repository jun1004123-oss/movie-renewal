package com.gaon.cinema.join;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class JoinDTO {
	private int member_id;
	private String userid;
	private String userpw;
	private String name;
	private Date birth;
	private String telnum;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private String gender;
	private String img_file;
	private MultipartFile upload;
	private int point;
	private String MOVIE_RATE;
	private String MOVIE_LIKE;
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getImg_file() {
		return img_file;
	}
	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		gender="남";
		this.gender = gender;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMOVIE_RATE() {
		return MOVIE_RATE;
	}
	public void setMOVIE_RATE(String mOVIE_RATE) {
		MOVIE_RATE = mOVIE_RATE;
	}
	public String getMOVIE_LIKE() {
		return MOVIE_LIKE;
	}
	public void setMOVIE_LIKE(String mOVIE_LIKE) {
		MOVIE_LIKE = mOVIE_LIKE;
	}
	
	
	
}
