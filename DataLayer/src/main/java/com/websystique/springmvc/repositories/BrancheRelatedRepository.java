package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.StoreRelatedPhoto;

public abstract interface BrancheRelatedRepository extends CrudRepository<StoreRelatedPhoto, Integer> {

	@Query("FROM StoreRelatedPhoto b WHERE b.branch.uuid = :uuid ")
	public List<StoreRelatedPhoto> checkExistanceOfUUID(@Param("uuid") String uuid);

}
