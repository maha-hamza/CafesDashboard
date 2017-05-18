package com.websystique.springmvc.dtos;

import java.util.List;

import com.websystique.springmvc.pojos.OrderDetail;

public class OrderDetailsDTO extends CommonDTO {

	private OrdersDTO order;
	private List<MenusDTO> menu;
	private long totalOrderPrice;

	public OrderDetailsDTO() {

	}

	public OrderDetailsDTO(OrderDetail order) {
		super(order.getId(), order.getCreatedAt(), order.getUpdatedAt(), order.getUuid(), order.getIsDeleted());

	}

	public void setTotalOrderPrice(long totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}

	public long getTotalOrderPrice() {
		return totalOrderPrice;
	}

	public OrdersDTO getOrder() {
		return order;
	}

	public void setOrder(OrdersDTO order) {
		this.order = order;
	}

	public void setMenu(List<MenusDTO> menu) {
		this.menu = menu;
	}

	public List<MenusDTO> getMenu() {
		return menu;
	}


}
