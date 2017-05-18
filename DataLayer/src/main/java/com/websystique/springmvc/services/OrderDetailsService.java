package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.MenusDTO;
import com.websystique.springmvc.dtos.OrderDetailsDTO;
import com.websystique.springmvc.dtos.OrdersDTO;
import com.websystique.springmvc.pojos.OrderDetail;

@Service
@Named("OrderDetailsService")
public class OrderDetailsService extends GenericService<OrderDetailsDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public OrderDetailsDTO get(String uuid) {
		System.out.println(new Date());
		List<OrderDetail> order = orderDetailsRepository.getOrderDetailsByOrder(uuid);
		System.out.println(new Date());
		OrderDetailsDTO details = new OrderDetailsDTO();

		List<MenusDTO> dto = new ArrayList<MenusDTO>();
		long totalPrice = 0;
		for (OrderDetail det : order) {
			details.setOrder(new OrdersDTO(det.getOrder()));
			dto.add(new MenusDTO(det.getMenu(), det.getQuantity()));
			totalPrice+=det.getQuantity()*det.getMenu().getItemPrice();
			details.setTotalOrderPrice(totalPrice);

		}

		details.setMenu(dto);

		return details;
	}

}
