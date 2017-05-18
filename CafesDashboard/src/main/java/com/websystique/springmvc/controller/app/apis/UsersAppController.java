package com.websystique.springmvc.controller.app.apis;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.websystique.springmvc.dtos.UserAppRequestDTO;
import com.websystique.springmvc.services.app.UsersAppService;

@RestController
public class UsersAppController {

	@Autowired
	private UsersAppService usersService;

	@RequestMapping(value = "/user-registeration", method = RequestMethod.POST)
	public ResponseEntity<Map<String, String>> userFunctions(@RequestBody String offer) {
		ObjectMapper mapper = new ObjectMapper();
		UserAppRequestDTO role = null;

		role = mapper.convertValue(offer, UserAppRequestDTO.class);
		String res = usersService.registerUserForApp(role);
		
		Map<String, String> st=new HashMap<>();
		st.put("uuid", res);
		if (res != null) {
			return new ResponseEntity<Map<String, String>>(st, HttpStatus.CREATED);
		} else {
			return new ResponseEntity<Map<String, String>>(st, HttpStatus.NOT_FOUND);
		}

	}

}
