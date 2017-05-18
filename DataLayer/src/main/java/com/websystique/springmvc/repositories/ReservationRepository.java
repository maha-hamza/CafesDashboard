package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.GuestReservation;

public abstract interface ReservationRepository extends CrudRepository<GuestReservation, Integer> {

	@Query("FROM GuestReservation u WHERE u.uuid = :uuid ")
	public GuestReservation checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM GuestReservation u WHERE u.branch.id = :uuid ")
	public List<GuestReservation> getReservationByBranch(@Param("uuid") int uuid);
}
