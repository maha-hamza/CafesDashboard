package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.Menu;

public class MenusDTO extends CommonDTO {

	private String itemName;
	private String itemDescription;
	private float itemPrice;
	private BrancheCategoryDTO category;
	private String operation;
	private String type;
	private String img;
	private int quantity;

	public MenusDTO() {
	}

	public MenusDTO(Menu menu, int quan) {
		super(menu.getId(), menu.getCreatedAt(), menu.getUpdatedAt(), menu.getUuid(), menu.getIsDeleted());
		this.itemName = menu.getItemName();
		this.itemDescription = menu.getItemDescription();
		this.itemPrice = menu.getItemPrice();
		this.type = menu.getItemType();
		this.category = new BrancheCategoryDTO(menu.getMenuCategory());
		this.img = menu.getImg();
		this.quantity = quan;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getImg() {
		return img;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
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

	public BrancheCategoryDTO getCategory() {
		return category;
	}

	public void setCategory(BrancheCategoryDTO category) {
		this.category = category;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getQuantity() {
		return quantity;
	}

}
