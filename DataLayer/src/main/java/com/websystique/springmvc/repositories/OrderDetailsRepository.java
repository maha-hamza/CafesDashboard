package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.OrderDetail;

public abstract interface OrderDetailsRepository extends CrudRepository<OrderDetail, Integer> {

	@Query("FROM OrderDetail b WHERE b.order.uuid = :uuid ")
	public List<OrderDetail> getOrderDetailsByOrder(@Param("uuid") String uuid);

	@Query("FROM OrderDetail b WHERE b.uuid = :uuid ")
	OrderDetail checkExistanceOfUUID(@Param("uuid")String newUUID);
}
