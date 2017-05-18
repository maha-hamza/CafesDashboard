package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.StoreRelatedPhoto;

public abstract interface BranchRelatedPhotosRepository extends CrudRepository<StoreRelatedPhoto, Integer> {

	@Query("FROM StoreRelatedPhoto b WHERE b.uuid = :uuid ")
	public StoreRelatedPhoto checkExistanceOfUUID(@Param("uuid") String uuid);

}
