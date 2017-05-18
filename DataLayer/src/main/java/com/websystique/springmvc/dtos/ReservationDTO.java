package com.websystique.springmvc.dtos;

import java.util.Date;

import com.websystique.springmvc.pojos.GuestReservation;

public class ReservationDTO extends CommonDTO {

	private String description;
	private StoresDTO store;
	private BranchesDTO branch;
	private Date reservationDate;
	private int numberOfMembers;
	private UsersDTO user;
	private String operation;

	// single user attributes
	private int userId;
	private int branchId;
	private String reservationTime;

	public ReservationDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservationDTO(GuestReservation reservation) {
		super(reservation.getId(), reservation.getCreatedAt(), reservation.getUpdatedAt(), reservation.getUuid(),
				reservation.getIsDeleted());
		this.description = reservation.getDescription();
		this.reservationDate = reservation.getReservationDate();
		this.numberOfMembers = reservation.getNumberOfMembers();
		this.store = new StoresDTO(reservation.getBranch().getStore());
		this.branch = new BranchesDTO(reservation.getBranch(), true);
		this.user = new UsersDTO(reservation.getUser());
		userId = reservation.getUser().getId();
		branchId = reservation.getBranch().getId();
		reservationTime = reservation.getReservationTime();
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public int getBranchId() {
		return branchId;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public StoresDTO getStore() {
		return store;
	}

	public void setStore(StoresDTO store) {
		this.store = store;
	}

	public BranchesDTO getBranch() {
		return branch;
	}

	public void setBranch(BranchesDTO branch) {
		this.branch = branch;
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

	public UsersDTO getUser() {
		return user;
	}

	public void setUser(UsersDTO user) {
		this.user = user;
	}

}
