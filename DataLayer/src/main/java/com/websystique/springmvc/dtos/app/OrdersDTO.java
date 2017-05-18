package com.websystique.springmvc.dtos.app;

import java.util.List;

public class OrdersDTO {

	private String deliveryAddress;

	private int orderTotalPrice;

	private String branchUUID;

	private String userUUID;

	private List<OrderDetailsDTO> details;

	public void setDetails(List<OrderDetailsDTO> details) {
		this.details = details;
	}

	public List<OrderDetailsDTO> getDetails() {
		return details;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public String getBranchUUID() {
		return branchUUID;
	}

	public void setBranchUUID(String branchUUID) {
		this.branchUUID = branchUUID;
	}

	public String getUserUUID() {
		return userUUID;
	}

	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}

}
