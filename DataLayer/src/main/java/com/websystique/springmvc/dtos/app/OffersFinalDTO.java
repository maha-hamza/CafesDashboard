package com.websystique.springmvc.dtos.app;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OffersFinalDTO extends CommonDTO {

	private String offerType;
	private String description;
	private Date from;
	private Date to;
	private String offerImg;
	private String title;
	private List<String> branches;

	public OffersFinalDTO() {
	}

	public OffersFinalDTO(OffersDTO offer) {
		super(offer.getId(), offer.getUuid());
		this.offerType = offer.getOfferType();
		this.description = offer.getDescription();
		this.from = offer.getFrom();
		this.to = offer.getTo();
		this.offerImg = offer.getOfferImg();
		this.title = offer.getTitle();
		this.branches = new ArrayList<String>();
		if (offer.getBranches().size() > 0) {
			for (String s : offer.getBranches()) {
				branches.add(s);
			}
		}
	}

	public void setBranches(List<String> branches) {
		this.branches = branches;
	}

	public List<String> getBranches() {
		return branches;
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
