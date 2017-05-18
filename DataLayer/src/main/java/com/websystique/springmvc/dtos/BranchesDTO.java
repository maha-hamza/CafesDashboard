package com.websystique.springmvc.dtos;

import java.util.ArrayList;
import java.util.List;

import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.StoreRelatedPhoto;
import com.websystique.springmvc.pojos.Telephone;

public class BranchesDTO extends CommonDTO {

	private CityDTO city;
	private CountryDTO country;
	private String open;
	private String close;
	private String address;
	private String operation;
	private String branchCode;
	private String description;
	private StoresDTO store;
	List<TelephoneDTO> telephone;
	private String latitude;
	private String langitude;
	private String logo;
	private List<String> images;

	public BranchesDTO() {

	}

	public BranchesDTO(String id) {
		super.setId(Integer.parseInt(id));

	}

	public BranchesDTO(Branch branch, boolean addStore) {
		super(branch.getId(), branch.getCreatedAt(), branch.getUpdatedAt(), branch.getUuid(), branch.getIsDeleted());
		this.description = branch.getDescription();
		if (null != branch.getCity())
			this.city = new CityDTO(branch.getCity());
		if (null != branch.getCountry())
			this.country = new CountryDTO(branch.getCountry());
		this.open = String.valueOf(branch.getOpenTime());
		this.close = String.valueOf(branch.getCloseTime());
		this.address = branch.getAddress();
		this.branchCode = branch.getBranchCode();
		if (addStore)
			this.store = new StoresDTO(branch.getStore());
		telephone = new ArrayList<TelephoneDTO>();
		for (Telephone tel : branch.getTelephones()) {
			telephone.add(new TelephoneDTO(tel));
		}
		this.setLatitude(branch.getLatitude());
		this.langitude = branch.getLangitude();

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

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setStore(StoresDTO store) {
		this.store = store;
	}

	public StoresDTO getStore() {
		return store;
	}

	public CityDTO getCity() {
		return city;
	}

	public void setCity(CityDTO city) {
		this.city = city;
	}

	public CountryDTO getCountry() {
		return country;
	}

	public void setCountry(CountryDTO country) {
		this.country = country;
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

	@Override
	public String toString() {
		return "BranchesDTO [city=" + city + ", country=" + country + ", open=" + open + ", close=" + close
				+ ", address=" + address + ", operation=" + operation + ", branchCode=" + branchCode + ", description="
				+ description + ", store=" + store + ", telephone=" + telephone + ", latitude=" + latitude
				+ ", langitude=" + langitude + "]";
	}

}
