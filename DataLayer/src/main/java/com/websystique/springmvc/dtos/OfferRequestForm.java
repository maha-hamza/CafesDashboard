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
public class OfferRequestForm {
	private String id;
	private int offerType;
	private String description;
	private String from;
	private String to;
	private String branches;
	private String operation;
	private String title;
	private List<Integer> branchz;
	private String createdAt;
	private String updatedAt;
	private String isDeleted;
	

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public OfferRequestForm() {

	}

	public OfferRequestForm(String s) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY);
		try {
			OfferRequestForm obj = mapper.readValue(s, OfferRequestForm.class);
			this.offerType = obj.getOfferType();
			this.description = obj.getDescription();
			this.from = obj.getFrom();
			this.to = obj.getTo();
			this.title = obj.getTitle();
			// ============
			this.branches = obj.getBranches().replaceAll("\"", "");
			StringTokenizer tok = new StringTokenizer(this.branches, ",");
			this.branchz = new ArrayList<Integer>();
			while (tok.hasMoreTokens()) {
				String type = tok.nextToken();
				this.branchz.add(Integer.parseInt(type));
			}
			// ============
			this.operation = obj.getOperation();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Integer> getBranchz() {
		return branchz;
	}

	public void setBranchz(List<Integer> branchz) {
		this.branchz = branchz;
	}

	public int getOfferType() {
		return offerType;
	}

	public void setOfferType(int offerType) {
		this.offerType = offerType;
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

	public String getBranches() {
		return branches;
	}

	public void setBranches(String branches) {
		this.branches = branches;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}
}
