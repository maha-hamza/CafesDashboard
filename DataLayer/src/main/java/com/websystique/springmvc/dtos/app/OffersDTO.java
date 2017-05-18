package com.websystique.springmvc.dtos.app;

import java.util.Date;
import java.util.List;

import com.websystique.springmvc.pojos.OffersAndEvent;

public class OffersDTO extends CommonDTO {

	private String offerType;
	private String description;
	private Date from;
	private Date to;
	private String offerImg;
	private String title;
	private String branch;
	private List<String> branches;

	public OffersDTO() {
	}

	public OffersDTO(OffersAndEvent offer) {
		super(offer.getId(), offer.getUuid());
		if (null != offer.getOffersAndEventsType())
			offerType = offer.getOffersAndEventsType().getType();
		this.description = offer.getDescription();
		this.from = offer.getStartAt();
		this.to = offer.getEndAt();
		offerImg = offer.getOfferImg();
		this.title = offer.getTitle();
	}

	public void setBranches(List<String> branches) {
		this.branches = branches;
	}

	public List<String> getBranches() {
		return branches;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setOfferImg(String offerImg) {
		this.offerImg = offerImg;
	}

	public String getOfferImg() {
		return offerImg;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOfferType() {
		return offerType;
	}

	public void setOfferType(String offerType) {
		this.offerType = offerType;
	}

}
