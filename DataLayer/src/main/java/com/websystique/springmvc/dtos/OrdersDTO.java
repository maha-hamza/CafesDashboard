package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.Order;

public class OrdersDTO extends CommonDTO {

	private String deliveryAddress;

	private int orderTotalPrice;

	private BranchesDTO branch;

	private UsersDTO user;

	public OrdersDTO() {

	}

	public OrdersDTO(Order order) {
		super(order.getId(), order.getCreatedAt(), order.getUpdatedAt(), order.getUuid(), order.getIsDeleted());
		this.deliveryAddress = order.getDeliveryAddress();
		this.orderTotalPrice = order.getOrderTotalPrice();
		this.branch = new BranchesDTO(order.getBranch(), true);
		this.user = new UsersDTO(order.getUser());

	}

	public OrdersDTO(Order order, boolean noBranch) {
		super(order.getId(), order.getCreatedAt(), order.getUpdatedAt(), order.getUuid(), order.getIsDeleted());
		this.deliveryAddress = order.getDeliveryAddress();
		this.orderTotalPrice = order.getOrderTotalPrice();

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

	public BranchesDTO getBranch() {
		return branch;
	}

	public void setBranch(BranchesDTO branch) {
		this.branch = branch;
	}

	public UsersDTO getUser() {
		return user;
	}

	public void setUser(UsersDTO user) {
		this.user = user;
	}

}
