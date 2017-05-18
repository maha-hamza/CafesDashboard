package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.app.OrderDetailsDTO;
import com.websystique.springmvc.dtos.app.OrdersDTO;
import com.websystique.springmvc.pojos.GuestReservation;
import com.websystique.springmvc.pojos.Order;
import com.websystique.springmvc.pojos.OrderDetail;
import com.websystique.springmvc.services.GenericService;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("OrderAppService")
public class OrderAppService extends GenericService<OrdersDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean placeOrder(OrdersDTO order) {
		Order saviour = new Order();
		// ================================
		saviour.setCreatedAt(new Date());
		saviour.setUpdatedAt(new Date());
		saviour.setIsDeleted(Byte.valueOf("0"));
		// ==============================
		String newUUID = "";
		boolean checker = true;
		if (getAllData() == null) {
			newUUID = Utilities.generateRandomUUID();
		} else {
			do {
				newUUID = Utilities.generateRandomUUID();
				Order exited = orderRepository.checkExistanceOfUUID(newUUID);
				if (exited != null)
					checker = false;
				else if (exited == null)
					checker = true;
			} while (!checker);
		}
		saviour.setUuid(newUUID);
		// ===============================
		saviour.setDeliveryAddress(order.getDeliveryAddress());
		saviour.setBranch(branchRepository.getBranchByUUID(order.getBranchUUID()));
		saviour.setOrderTotalPrice(order.getOrderTotalPrice());
		saviour.setUser(usersRepository.checkExistanceOfUUID(order.getUserUUID()));
		// ============================order details====================
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		List<OrderDetailsDTO> details = order.getDetails();
		for (OrderDetailsDTO dto : details) {
			OrderDetail det = new OrderDetail();
			det.setCreatedAt(new Date());
			det.setUpdatedAt(new Date());
			det.setIsDeleted(Byte.parseByte("0"));
			det.setQuantity(dto.getQuantity());
			det.setMenu(menuRepository.checkExistanceOfUUID(dto.getItemUUID()));
			det.setOrder(saviour);
			String newUUID2 = "";
			boolean checker2 = true;
			if (getAllData() == null) {
				newUUID2 = Utilities.generateRandomUUID();
			} else {
				do {
					newUUID2 = Utilities.generateRandomUUID();
					OrderDetail exited = orderDetailsRepository.checkExistanceOfUUID(newUUID2);
					if (exited != null)
						checker2 = false;
					else if (exited == null)
						checker2 = true;
				} while (!checker2);
			}
			det.setUuid(newUUID2);

			orderDetails.add(det);
		}
		saviour.setOrderDetails(orderDetails);
		Order result = orderRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
