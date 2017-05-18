package com.websystique.springmvc.dtos;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OfferRequest {
	private int id;
	private String description;
	private Date from;
	private Date to;
	private String title;
	private OfferTypeDTO offerType;

	public OfferRequest() {

	}

	public OfferRequest(String s) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY);
		try {
			OfferRequest obj = mapper.readValue(s, OfferRequest.class);
			this.description = obj.getDescription();
			this.from = obj.getFrom();
			this.to = obj.getTo();
			this.title = obj.getTitle();
			this.offerType = obj.getOfferType();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public OfferTypeDTO getOfferType() {
		return offerType;
	}

	public void setOfferType(OfferTypeDTO offerType) {
		this.offerType = offerType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "OfferRequest [id=" + id + ", description=" + description + ", from=" + from + ", to=" + to + ", title="
				+ title + ", offerType=" + offerType + "]";
	}
	
	
	
}
