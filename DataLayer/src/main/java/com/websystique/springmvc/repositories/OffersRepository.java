package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.OffersAndEvent;

public abstract interface OffersRepository extends CrudRepository<OffersAndEvent, Integer> {
	@Query("FROM OffersAndEvent b WHERE b.uuid = :uuid ")
	public OffersAndEvent checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM OffersAndEvent b WHERE b.offersAndEventsType.type = :type and b.isDeleted=0")
	public List<OffersAndEvent> getUndeletedOffers(@Param("type") String type);

}
