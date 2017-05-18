package com.websystique.springmvc.dtos;

import java.util.Date;

public class CommonDTO {

	private int id;

	private Date createdAt;

	private Date updatedAt;

	private String uuid;

	private byte isDeleted;

	public CommonDTO() {

	}

	public CommonDTO(int id, Date createdAt, Date updatedAt, String uuid, byte isDeleted) {
		super();
		this.id = id;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.uuid = uuid;
		this.isDeleted = isDeleted;
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

	public byte getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

}
