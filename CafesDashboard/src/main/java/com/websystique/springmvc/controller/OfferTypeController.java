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
import com.websystique.springmvc.dtos.OfferTypeDTO;
import com.websystique.springmvc.services.OfferTypeService;

@RestController
public class OfferTypeController {

	@Autowired
	private OfferTypeService offerTypeService;

	@RequestMapping(value = "/get-types", method = RequestMethod.GET)
	public List<OfferTypeDTO> getAll() {
		return offerTypeService.getAllData();
	}

	@RequestMapping(value = "/type-functions", method = RequestMethod.POST)
	public ResponseEntity<Void> statusFunctions(@RequestBody Object user) {
		ObjectMapper mapper = new ObjectMapper();
		OfferTypeDTO role = null;

		role = mapper.convertValue(user, OfferTypeDTO.class);
		boolean res = offerTypeService.saveCreateUpdate(role);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

	}

	@RequestMapping(value = "/type-delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {

		boolean res = offerTypeService.delete(id);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}

	}
}
