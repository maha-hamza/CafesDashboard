package com.websystique.springmvc.model;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.websystique.springmvc.dtos.CommonDTO;

public class MenuRequest extends CommonDTO {
    private String itemName;
    private String itemDescription;
    private String itemPrice;
    private String category;
    private String type;
    private String operation;
    private String uuid;
    private String img;
    private int id;
    private String $$hashKey;

    public MenuRequest() {

    }

    public MenuRequest(String s) {
	ObjectMapper mapper = new ObjectMapper();

	try {
	    MenuRequest obj = mapper.readValue(s, MenuRequest.class);
	    this.itemName = obj.getItemName();
	    this.itemDescription = obj.getItemDescription();
	    this.itemPrice = obj.getItemPrice();
	    this.category = obj.getCategory();
	    this.type = obj.getType();
	    this.operation = obj.getOperation();
	    this.img = obj.getImg();
	} catch (IOException e) {
	    e.printStackTrace();
	}
    }

    public void set$$hashKey(String $$hashKey) {
	this.$$hashKey = $$hashKey;
    }

    public String get$$hashKey() {
	return $$hashKey;
    }

    public void setImg(String img) {
	this.img = img;
    }

    public String getImg() {
	return img;
    }

    public String getUuid() {
	return uuid;
    }

    public void setUuid(String uuid) {
	this.uuid = uuid;
    }

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
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

    public String getItemPrice() {
	return itemPrice;
    }

    public void setItemPrice(String itemPrice) {
	this.itemPrice = itemPrice;
    }

    public String getCategory() {
	return category;
    }

    public void setCategory(String category) {
	this.category = category;
    }

    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }

    public String getOperation() {
	return operation;
    }

    public void setOperation(String operation) {
	this.operation = operation;
    }

    @Override
    public String toString() {
	return "MenuRequest [itemName=" + itemName + ", itemDescription=" + itemDescription + ", itemPrice=" + itemPrice
		+ ", category=" + category + ", type=" + type + ", operation=" + operation + "]";
    }

}
