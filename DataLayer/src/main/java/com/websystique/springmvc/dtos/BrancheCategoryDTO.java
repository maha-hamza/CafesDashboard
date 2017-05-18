package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.MenuCategory;

public class BrancheCategoryDTO extends CommonDTO {

	private String categoryName;
	private StoresDTO store;
	private String operation;
	private String branchId;

	public BrancheCategoryDTO() {
	}

	public BrancheCategoryDTO(String id) {
		super.setId(Integer.parseInt(id));
	}

	public BrancheCategoryDTO(MenuCategory category) {
		super(category.getId(), category.getCreatedAt(), category.getUpdatedAt(), category.getUuid(),
				category.getIsDeleted());
		this.categoryName = category.getCategoryName();
	
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setStore(StoresDTO store) {
		this.store = store;
	}

	public StoresDTO getStore() {
		return store;
	}

}
