package com.websystique.springmvc.dtos.app;

import com.websystique.springmvc.pojos.Store;

public class StoresDTO {

	private String storeName;
	private String description;
	private String logoURL;

//	private List<BranchesDTO> branches;

	public StoresDTO() {

	}



	public StoresDTO(Store store) {
		this.storeName = store.getStoreName();
		this.description = store.getDescription();
		this.logoURL = store.getLogoUrl();
		// if (null != store.getBranches()) {
		// branches = new ArrayList<BranchesDTO>();
		// for (Branch branch : store.getBranches()) {
		// branches.add(new BranchesDTO(branch));
		// }
		// }
	}

	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}

	public String getLogoURL() {
		return logoURL;
	}

	// public void setBranches(List<BranchesDTO> branches) {
	// this.branches = branches;
	// }
	//
	// public List<BranchesDTO> getBranches() {
	// return branches;
	// }

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}