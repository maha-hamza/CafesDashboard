package com.websystique.springmvc.dtos.app;

public class OrderDetailsDTO {

	private String itemUUID;
	private int quantity;

	public String getItemUUID() {
		return itemUUID;
	}

	public void setItemUUID(String itemUUID) {
		this.itemUUID = itemUUID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
