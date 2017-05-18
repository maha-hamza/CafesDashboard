package com.websystique.springmvc.dtos.app;

import java.util.Date;

public class ReservationDTO extends CommonDTO {

	private String description;
	private Date reservationDate;
	private String reservationTime;
	private int numberOfMembers;

	private String userUUID;
	private String branchUUID;

	public ReservationDTO() {
	}

	public String getUserUUID() {
		return userUUID;
	}

	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public String getBranchUUID() {
		return branchUUID;
	}

	public void setBranchUUID(String branchUUID) {
		this.branchUUID = branchUUID;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getNumberOfMembers() {
		return numberOfMembers;
	}

	public void setNumberOfMembers(int numberOfMembers) {
		this.numberOfMembers = numberOfMembers;
	}

}
