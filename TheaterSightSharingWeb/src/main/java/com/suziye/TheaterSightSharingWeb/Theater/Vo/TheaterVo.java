package com.suziye.TheaterSightSharingWeb.Theater.Vo;

public class TheaterVo {
	private String theaterId;
	private String theaterName;
	private String mappingData;
	private String theaterLat;
	private String theaterLog;
	private String address;
	private int seats;
	private int seatingCapacity;
	
	
	public String getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}
	public String getMappingData() {
		return mappingData;
	}
	public void setMappingData(String mappingData) {
		this.mappingData = mappingData;
	}
	public String getTheaterLat() {
		return theaterLat;
	}
	public void setTheaterLat(String theaterLat) {
		this.theaterLat = theaterLat;
	}
	public String getTheaterLon() {
		return theaterLog;
	}
	public void setTheaterLon(String theaterLon) {
		this.theaterLog = theaterLon;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public int getSeatingCapacity() {
		return seatingCapacity;
	}
	public void setSeatingCapacity(int seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}
	
	
}
