package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.Telephone;

public class TelephoneDTO extends CommonDTO {

	private String description;

	private String number;

	private String type;

	private int branchId;

	private int userId;

	public TelephoneDTO() {
	}

	public TelephoneDTO(Telephone tel) {
		super(tel.getId(), tel.getCreatedAt(), tel.getUpdatedAt(), "", Byte.parseByte("0"));
		if (null != tel.getBranch())
			this.branchId = tel.getBranch().getId();
		this.number = tel.getNumber();
		this.type = tel.getType();
		if (null != tel.getUser())
			this.userId = tel.getUser().getId();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
