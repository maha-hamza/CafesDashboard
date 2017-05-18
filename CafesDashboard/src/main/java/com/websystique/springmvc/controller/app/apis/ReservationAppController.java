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

import com.websystique.springmvc.dtos.app.ReservationDTO;
import com.websystique.springmvc.services.app.ReservationAppService;

@RestController
public class ReservationAppController {

    @Autowired
    private ReservationAppService reservationService;

    @RequestMapping(value = "/guest-reservation", method = RequestMethod.POST)
    public ResponseEntity<Map<String, String>> reserve(@RequestBody ReservationDTO reservation) {

	String res = reservationService.placeReservation(reservation);
	Map<String, String> resu = new HashMap<>();
	resu.put("Reservation", res);
	if (!res.equals("")) {
	    return new ResponseEntity<Map<String, String>>(resu, HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Map<String, String>>(resu, HttpStatus.CONFLICT);
	}

    }

}
