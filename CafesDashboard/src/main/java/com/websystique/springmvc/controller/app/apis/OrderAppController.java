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

import com.websystique.springmvc.dtos.app.OrdersDTO;
import com.websystique.springmvc.services.app.OrderAppService;

@RestController
public class OrderAppController {

    @Autowired
    private OrderAppService orderService;

    @RequestMapping(value = "/place-order", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Boolean>> placeOrder(@RequestBody OrdersDTO order) {
	boolean res = orderService.placeOrder(order);
	Map<String, Boolean> resu = new HashMap<>();
	resu.put("order", res);
	if (res) {
	    return new ResponseEntity<Map<String, Boolean>>(resu, HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Map<String, Boolean>>(resu, HttpStatus.CONFLICT);
	}
    }
}
