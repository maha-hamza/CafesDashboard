package com.websystique.springmvc.dtos;

import java.util.ArrayList;
import java.util.List;

import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.Store;

public class StoresDTO extends CommonDTO {

	private String storeName;
	private String description;
	private String operation;
	private String logoURL;
	private List<BranchesDTO> branches;

	public StoresDTO() {

	}

	public StoresDTO(String id) {
		setId(1);
	}

	public StoresDTO(Store store) {
		super(store.getId(), store.getCreatedAt(), store.getUpdatedAt(), store.getUuid(), store.getIsDeleted());

		this.storeName = store.getStoreName();
		this.description = store.getDescription();
		this.logoURL = store.getLogoUrl();
		if (store.getBranches().size() > 0) {

			this.branches = new ArrayList<BranchesDTO>();
			for (Branch branch : store.getBranches()) {
				branches.add(new BranchesDTO(branch, false));
			}
		}
	}

	
	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}

	public String getLogoURL() {
		return logoURL;
	}

	public void setBranches(List<BranchesDTO> branches) {
		this.branches = branches;
	}

	public List<BranchesDTO> getBranches() {
		return branches;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

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

	@Override
	public String toString() {
		return "StoresDTO [storeName=" + storeName + ", description=" + description + ", operation=" + operation
				+ ", logoURL=" + logoURL + ", branches=" + branches + "]";
	}
	
	

}