package com.websystique.springmvc.dtos.app;

import java.util.ArrayList;
import java.util.List;

import com.websystique.springmvc.dtos.TelephoneDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.StoreRelatedPhoto;
import com.websystique.springmvc.pojos.Telephone;

public class BranchesDTO extends com.websystique.springmvc.dtos.app.CommonDTO {

	private String open;
	private String close;
	private String address;
	private String branchName;
	private String description;
	List<TelephoneDTO> telephone;
	private String latitude;
	private String langitude;
	private List<String> images;
	private String logo;

	public BranchesDTO() {

	}

	public BranchesDTO(Branch branch) {
		super(branch.getId(), branch.getUuid());
		this.description = branch.getDescription();
		this.open = String.valueOf(branch.getOpenTime());
		this.close = String.valueOf(branch.getCloseTime());
		this.address = branch.getAddress();
		this.branchName = branch.getBranchCode();
		this.logo = branch.getStore().getLogoUrl();
		telephone = new ArrayList<TelephoneDTO>();
		for (Telephone tel : branch.getTelephones()) {
			telephone.add(new TelephoneDTO(tel));
		}
		
		this.langitude = branch.getLangitude();
		this.latitude = branch.getLatitude();
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLogo() {
		return logo;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public List<String> getImages() {
		return images;
	}

	public void setLangitude(String langitude) {
		this.langitude = langitude;
	}

	public String getLangitude() {
		return langitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setTelephone(List<TelephoneDTO> telephones) {
		this.telephone = telephones;
	}

	public List<TelephoneDTO> getTelephone() {
		return telephone;
	}

	public void setBranchName(String branchCode) {
		this.branchName = branchCode;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
