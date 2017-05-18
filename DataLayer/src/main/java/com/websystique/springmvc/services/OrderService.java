package com.websystique.springmvc.services;

import java.io.Serializable;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.OrdersDTO;

@Service
@Named("OrderService")
public class OrderService extends GenericService<OrdersDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

}
