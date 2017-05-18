package com.websystique.springmvc.dtos;

import java.util.ArrayList;
import java.util.List;

import com.websystique.springmvc.pojos.Country;

public class CountryDTO {

	private int id;
	private String country;
	private String uuid;
	private List<CityDTO> cities;
	private String operation;
	private byte isDeleted;

	public CountryDTO() {

	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public CountryDTO(String id) {
		this.id = Integer.parseInt(id);
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

	public byte getIsDeleted() {
		return isDeleted;
	}

	public CountryDTO(Country country) {

		this.id = country.getId();
		this.country = country.getCountry();
		this.uuid = country.getUuid();
		this.cities = new ArrayList<CityDTO>();
		
		// if (null != country.getCities())
		// for (City city : country.getCities()) {
		// this.cities.add(new CityDTO(city));
		// }
		this.isDeleted = country.getIsDeleted();
	}

	public CountryDTO(Country country, boolean dummy) {

		this.id = country.getId();
		this.country = country.getCountry();
		this.uuid = country.getUuid();

	}

	public void setCities(List<CityDTO> cities) {
		this.cities = cities;
	}

	public List<CityDTO> getCities() {
		return cities;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}
