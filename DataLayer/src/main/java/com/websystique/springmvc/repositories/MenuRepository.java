package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Menu;

public abstract interface MenuRepository extends CrudRepository<Menu, Integer> {

	
	@Query("FROM Menu b WHERE b.uuid = :uuid ")
	public Menu checkExistanceOfUUID(@Param("uuid") String uuid);
	
}
