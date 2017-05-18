package com.websystique.springmvc.dtos;

import java.io.IOException;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OfferAdminRequest {
	private int branch;
	private String description;
	private String from;
	private String to;
	private String title;
	private int offerType;

	public OfferAdminRequest() {

	}

	public OfferAdminRequest(String s) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY);
		try {
			OfferAdminRequest obj = mapper.readValue(s, OfferAdminRequest.class);
			this.description = obj.getDescription();
			this.from = obj.getFrom();
			this.to = obj.getTo();
			this.title = obj.getTitle();
			this.offerType = obj.getOfferType();
			this.branch = obj.getBranch();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void setOfferType(int offerType) {
		this.offerType = offerType;
	}

	public int getOfferType() {
		return offerType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setBranch(int id) {
		this.branch = id;
	}

	public int getBranch() {
		return branch;
	}
}
