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
import com.websystique.springmvc.dtos.ReservationDTO;
import com.websystique.springmvc.services.ReservationService;

@RestController
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@RequestMapping(value = "/get-reservations", method = RequestMethod.GET)
	public List<ReservationDTO> getAll() {
		return reservationService.getAllData();
	}

	@RequestMapping(value = "/reservation-functions", method = RequestMethod.POST)
	public ResponseEntity<Void> statusFunctions(@RequestBody Object user) {
		ObjectMapper mapper = new ObjectMapper();
		ReservationDTO role = null;

		role = mapper.convertValue(user, ReservationDTO.class);
		boolean res = reservationService.saveCreateUpdate(role);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

	}

	@RequestMapping(value = "/reservation-delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {

		boolean res = reservationService.delete(id);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}

	}
}
