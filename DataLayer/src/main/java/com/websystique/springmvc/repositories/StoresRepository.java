package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Store;

public abstract interface StoresRepository extends CrudRepository<Store, Integer> {

	@Query("FROM Store store WHERE store.uuid = :uuid ")
	public Store checkExistanceOfUUID(@Param("uuid") String uuid);


}
