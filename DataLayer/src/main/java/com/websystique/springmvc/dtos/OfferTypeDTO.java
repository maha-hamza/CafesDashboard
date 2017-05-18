package com.websystique.springmvc.dtos;

import java.util.Date;

import com.websystique.springmvc.pojos.OffersAndEventsType;

public class OfferTypeDTO {

	private int id;
	private Date createdAt;
	private String description;
	private byte isDeleted;
	private String type;
	private Date updatedAt;
	private String uuid;
	private String operation;
	private StoresDTO store;

	public OfferTypeDTO() {
	}

	public OfferTypeDTO(String id) {
		this.id = Integer.parseInt(id);
	}

	public OfferTypeDTO(OffersAndEventsType type) {
		this.id = type.getId();
		this.createdAt = type.getCreatedAt();
		this.description = type.getDescription();
		this.isDeleted = type.getIsDeleted();
		this.type = type.getType();
		this.updatedAt = type.getUpdatedAt();
		this.uuid = type.getUuid();
		if (type.getStore() != null) {
			store = new StoresDTO(type.getStore());
		}

	}

	public void setStore(StoresDTO store) {
		this.store = store;
	}

	public StoresDTO getStore() {
		return store;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
