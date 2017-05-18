package com.websystique.springmvc.controller.app.apis;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springmvc.dtos.app.GenericDTO;
import com.websystique.springmvc.services.app.OffersAppService;

@RestController
public class OffersAppController {

    @Autowired
    private OffersAppService offersService;

    @RequestMapping(value = "/get-all-offers", method = RequestMethod.POST)
    public Map<String, GenericDTO> getAllOffers(@RequestParam("last") int last,
	    @RequestParam(name = "city") String cityuuid, @RequestParam(name = "type") String type) {
	System.out.println(last+"   "+cityuuid+"   "+type);
	Map<String, GenericDTO> offers = new HashMap<>();
	offers.put("offers", offersService.getOffersForApp(last, cityuuid, type));
	return offers;
    }

}
