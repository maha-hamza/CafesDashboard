package com.websystique.springmvc.dtos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.websystique.springmvc.pojos.BranchOffer;
import com.websystique.springmvc.pojos.OffersAndEvent;

public class OffersDTO extends CommonDTO {

	private OfferTypeDTO offerType;
	private String description;
	private Date from;
	private Date to;
	private List<BranchesDTO> branches;
	private String operation;
	private String title;
	private String imgLogo;

	public OffersDTO() {
	}

	public OffersDTO(OffersAndEvent offer) {
		super(offer.getId(), offer.getCreatedAt(), offer.getUpdatedAt(), offer.getUuid(), offer.getIsDeleted());
		if (null != offer.getOffersAndEventsType())
			this.offerType = new OfferTypeDTO(offer.getOffersAndEventsType());
		this.description = offer.getDescription();
		this.from = offer.getStartAt();
		this.to = offer.getEndAt();
		branches = new ArrayList<BranchesDTO>();
		for (BranchOffer branch : offer.getBranchOffers()) {
			branches.add(new BranchesDTO(branch.getBranch(), true));
		}
		this.title = offer.getTitle();
		this.imgLogo = offer.getOfferImg();
	}

	public void setImgLogo(String imgLogo) {
		this.imgLogo = imgLogo;
	}

	public String getImgLogo() {
		return imgLogo;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
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

	public void setOfferType(OfferTypeDTO offerType) {
		this.offerType = offerType;
	}

	public OfferTypeDTO getOfferType() {
		return offerType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<BranchesDTO> getBranches() {
		return branches;
	}

	public void setBranches(List<BranchesDTO> branches) {
		this.branches = branches;
	}

}
