package com.websystique.springmvc.dtos;

import java.io.IOException;
import java.util.Date;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UserAppRequestDTO {

	private String fName;
	private String lName;
	private String email;
	private String gender;
	private Date birthDate;
	private int country;
	private int city;
	private String address;
	private String telephone;
	private String phoneType;

	public UserAppRequestDTO() {

	}

	public UserAppRequestDTO(String val) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			UserAppRequestDTO user = mapper.readValue(val, UserAppRequestDTO.class);
			this.fName = user.getfName();
			this.lName = user.getlName();
			this.email = user.getEmail();
			this.gender = user.getGender();
			this.birthDate = user.getBirthDate();
			this.country = user.getCountry();
			this.city = user.getCity();
			this.address = user.getAddress();
			this.telephone = user.getTelephone();
			this.phoneType = user.getPhoneType();
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void setPhoneType(String phoneType) {
		this.phoneType = phoneType;
	}

	public String getPhoneType() {
		return phoneType;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

}
