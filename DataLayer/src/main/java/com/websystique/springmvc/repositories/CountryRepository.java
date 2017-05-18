package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Country;

public abstract interface CountryRepository extends CrudRepository<Country, Integer> {

	@Query("FROM Country b WHERE b.uuid = :uuid ")
	public Country checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM Country b WHERE b.isDeleted = 0 ")
	public List<Country> getAllUndeletedCountries();

	
//	@Procedure(procedureName = "getAllCitiesCountries")
//	public List<Country> callTestProcedure(); 
}
