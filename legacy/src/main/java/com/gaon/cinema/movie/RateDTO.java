package com.gaon.cinema.movie;

public class RateDTO {
	private String MOVIE_ID;
	private String MOVIE_RATE;
	private String MOVIE_LIKE;
	private String NowUser;
	
	
	public String getMOVIE_ID() {
		return MOVIE_ID;
	}
	public void setMOVIE_ID(String mOVIE_ID) {
		MOVIE_ID = mOVIE_ID;
	}
	public String getNowUser() {
		return NowUser;
	}
	public void setNowUser(String nowUser) {
		NowUser = nowUser;
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
