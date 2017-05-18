package com.websystique.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springmvc.dtos.OrderDetailsDTO;
import com.websystique.springmvc.dtos.OrdersDTO;
import com.websystique.springmvc.services.OrderDetailsService;
import com.websystique.springmvc.services.OrderService;

@RestController
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailsService orderDetailsService;

	@RequestMapping(value = "/get-orders", method = RequestMethod.GET)
	public List<OrdersDTO> getAll() {
		return orderService.getAllData();
	}

	@RequestMapping(value = "/order-delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {

		boolean res = orderService.delete(id);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}

	}

	
	@RequestMapping(value = "/get-order_details", method = RequestMethod.POST)
	public OrderDetailsDTO getOrderDetails(@RequestBody String uuid) {
		return orderDetailsService.get(uuid);
	}
}
