package com.websystique.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.websystique.springmvc.dtos.RolesDTO;
import com.websystique.springmvc.services.RolesService;

@RestController
public class RolesController {

	@Autowired
	private RolesService rolesService;

	@RequestMapping(value = "/get-roles", method = RequestMethod.GET)
	public List<RolesDTO> getAllStatuses() {		
		return rolesService.getAllData();
	}

	@RequestMapping(value = "/role-functions", method = RequestMethod.POST)
	public ResponseEntity<Void> statusFunctions(@RequestBody Object user) {
		ObjectMapper mapper = new ObjectMapper();
		RolesDTO role = null;

		role = mapper.convertValue(user, RolesDTO.class);
		boolean res = rolesService.saveCreateUpdate(role);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

	}

	@RequestMapping(value = "/role-delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {

		boolean res = rolesService.delete(id);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}

	}
}
