package com.websystique.springmvc.request;

public class DataTableQueryForm {
	private int pageNumber;
	private int pageSize;
	private String searchText;

	public DataTableQueryForm() {
		pageNumber = 0;
		searchText = null;
	}

	public DataTableQueryForm(String searchText, int pageNumber, int pageSize) {
		this.pageSize = pageSize;
		this.pageNumber = pageNumber;
		this.searchText = searchText;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
