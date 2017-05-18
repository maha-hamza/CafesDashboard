package com.websystique.springmvc.dtos.app;

import com.websystique.springmvc.pojos.Menu;

public class MenuDTO extends CommonDTO {

	private String itemName;
	private String itemDescription;
	private float itemPrice;
	private String img;
	private String itemType;

	public MenuDTO() {

	}

	public MenuDTO(Menu menu) {
		super(menu.getId(), menu.getUuid());
		this.itemDescription = menu.getItemDescription();
		this.itemName = menu.getItemName();
		this.itemPrice = menu.getItemPrice();
		this.img = menu.getImg();
		this.itemType = menu.getItemType();
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

}
