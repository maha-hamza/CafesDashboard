package com.websystique.springmvc.dtos;

import java.util.List;

public class BranchOfferDTO {

	private List<OffersDTO> offers;
	private List<BranchesDTO> branches;

	public List<OffersDTO> getOffers() {
		return offers;
	}

	public void setOffers(List<OffersDTO> offers) {
		this.offers = offers;
	}

	public List<BranchesDTO> getBranches() {
		return branches;
	}

	public void setBranches(List<BranchesDTO> branches) {
		this.branches = branches;
	}

}
