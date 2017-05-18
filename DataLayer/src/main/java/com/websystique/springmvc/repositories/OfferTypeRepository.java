package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.OffersAndEventsType;

public abstract interface OfferTypeRepository extends CrudRepository<OffersAndEventsType, Integer> {
	@Query("FROM OffersAndEventsType b WHERE b.uuid = :uuid ")
	public OffersAndEventsType checkExistanceOfUUID(@Param("uuid") String uuid);
}
