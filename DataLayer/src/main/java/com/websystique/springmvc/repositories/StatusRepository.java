package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Status;

public interface StatusRepository extends CrudRepository<Status, Integer> {

	@Query("FROM Status status WHERE status.uuid = :uuid ")
	public Status checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM Status status WHERE status.status = :string ")
	public Status getStatusByName(@Param("string")String string);

}
