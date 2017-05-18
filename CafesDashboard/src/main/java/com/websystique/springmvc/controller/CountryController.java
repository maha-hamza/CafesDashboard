package com.websystique.springmvc.controller;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.websystique.springmvc.dtos.CitiesDTO;
import com.websystique.springmvc.dtos.CityDTO;
import com.websystique.springmvc.dtos.CountryDTO;
import com.websystique.springmvc.services.CityService;
import com.websystique.springmvc.services.CountryService;

@RestController
public class CountryController {

    private final Logger log = Logger.getLogger(CountryController.class.getName());

    @Autowired
    private CountryService countryService;
    @Autowired
    private CityService cityService;

    @RequestMapping(value = "/get-countries", method = RequestMethod.GET)
    public List<CountryDTO> getAll() {
	log.info("***calling***: get-countries , Controller: CountryController , Start of call: " + new Date());
	List<CountryDTO> countries = countryService.getAllData();
	log.info("***calling***: get-countries , Controller: CountryController , end of call: " + new Date());
	return countries;
    }

    @RequestMapping(value = "/get-cities", method = RequestMethod.GET)
    public List<CitiesDTO> getAllCities() {
	log.info("***calling***: /get-cities , Controller: CountryController");
	return cityService.getAllData();
    }

    @RequestMapping(value = "/get-cities/{id}", method = RequestMethod.GET)
    public List<CityDTO> getRequiredCities(@PathVariable("id") int id) {
	log.info("***calling***: /get-cities/{id} , Controller: CountryController");
	return countryService.loadRequiredCities(id);
    }

    @RequestMapping(value = "/country-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> countryFunctions(@RequestBody Object countryReq) {
	log.info("***calling***: country-functions , Controller: CountryController");
	ObjectMapper mapper = new ObjectMapper();
	CountryDTO country = null;
	country = mapper.convertValue(countryReq, CountryDTO.class);
	boolean res = countryService.saveCreateUpdateCountry(country);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/city-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> cityFunctions(@RequestBody Object offer) {
	ObjectMapper mapper = new ObjectMapper();
	CitiesDTO role = null;

	role = mapper.convertValue(offer, CitiesDTO.class);
	boolean res = cityService.saveCreateUpdateCity(role);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/country-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteCountry(@PathVariable("id") int id) {

	boolean res = countryService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

    @RequestMapping(value = "/city-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteCity(@PathVariable("id") int id) {

	boolean res = cityService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

}
