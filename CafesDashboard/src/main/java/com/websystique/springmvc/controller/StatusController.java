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
import com.websystique.springmvc.dtos.StatusDTO;
import com.websystique.springmvc.services.StatusService;

@RestController
public class StatusController {

	@Autowired
	private StatusService statusService;

	@RequestMapping(value = "/get-status", method = RequestMethod.GET)
	public List<StatusDTO> getAllStatuses() {
		return statusService.getAllData();
	}

	@RequestMapping(value = "/status-functions", method = RequestMethod.POST)
	public ResponseEntity<Void> statusFunctions(@RequestBody Object user) {
		ObjectMapper mapper = new ObjectMapper();
		StatusDTO status = null;

		status = mapper.convertValue(user, StatusDTO.class);
		boolean res = statusService.saveCreateUpdate(status);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

	}

	@RequestMapping(value = "/status-delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {

		boolean res = statusService.delete(id);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}

	}
}
