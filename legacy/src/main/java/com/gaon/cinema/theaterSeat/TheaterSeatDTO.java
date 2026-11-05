package com.gaon.cinema.theaterSeat;

public class TheaterSeatDTO {
	private int theater_seat_id;
	private int theater_id;
	private String seat;
	private String isreserved;
	
	public int getTheater_seat_id() { return theater_seat_id; }
	public void setTheater_seat_id(int theater_seat_id) { this.theater_seat_id = theater_seat_id; }
	public int getTheater_id() { return theater_id; }
	public void setTheater_id(int theater_id) { this.theater_id = theater_id; }
	public String getSeat() { return seat; }
	public void setSeat(String seat) { this.seat = seat; }
	public String getIsreserved() { return isreserved; }
	public void setIsreserved(String isreserved) { this.isreserved = isreserved; }
}
