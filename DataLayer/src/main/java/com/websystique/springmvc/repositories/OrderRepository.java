package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Order;

public abstract interface OrderRepository extends CrudRepository<Order, Integer> {

	@Query("FROM Order b WHERE b.uuid = :uuid ")
	Order checkExistanceOfUUID(@Param("uuid") String newUUID);

	@Query("FROM Order b WHERE b.branch.id = :id ")
	List<Order> getOrdersPErBranch(@Param("id") int bId);

}
