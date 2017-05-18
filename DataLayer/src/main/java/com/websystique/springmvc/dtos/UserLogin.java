package com.websystique.springmvc.dtos;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UserLogin {

	private String email;
	private String password;

	public UserLogin() {
		// TODO Auto-generated constructor stub
	}
	
	public UserLogin(String val) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			UserLogin user = mapper.readValue(val, UserLogin.class);
			email = user.getEmail();
			password = user.getPassword();
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
