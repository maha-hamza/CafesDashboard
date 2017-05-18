package com.websystique.springmvc.dtos.app;

import com.websystique.springmvc.pojos.Store;

public class MinifiedStoreDTO {

	private int id;
	private String uuid;
	private String storeName;
	private String logoURL;

	public MinifiedStoreDTO(Store store) {
		this.id = store.getId();
		this.uuid = store.getUuid();
		this.storeName = store.getStoreName();
		this.logoURL = store.getLogoUrl();
	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getLogoURL() {
		return logoURL;
	}

	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}


}
