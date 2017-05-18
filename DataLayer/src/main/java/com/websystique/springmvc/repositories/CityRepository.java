package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.City;

public abstract interface CityRepository extends CrudRepository<City, Integer> {

	@Query("FROM City b WHERE b.country.id = :id ")
	public List<City> getRequiredStates(@Param("id") int uuid);

	@Query("FROM City b WHERE b.uuid = :uuid ")
	public City checkExistanceOfUUID(@Param("uuid") String userUUID);

	@Query("FROM City b WHERE b.country.id = :id  and b.isDeleted=0")
	public List<City> getRequiredUndeletedStates(@Param("id") int uuid);

}
