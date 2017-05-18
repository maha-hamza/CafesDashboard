package com.websystique.springmvc.dtos.app;

import java.util.Date;

public class CommonDTO {

	private int id;

	private String uuid;

	public CommonDTO() {

	}

	public CommonDTO(int id, String uuid) {
		super();
		this.id = id;
		this.uuid = uuid;
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

}
