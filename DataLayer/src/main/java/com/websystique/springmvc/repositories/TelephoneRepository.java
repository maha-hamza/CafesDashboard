package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.pojos.Telephone;

public abstract interface TelephoneRepository extends CrudRepository<Telephone, Integer> {

	@Query("FROM Telephone b WHERE b.id = :id")
	public Telephone checkExistanceOfPhone(@Param("id") int id);

	@Query("FROM Telephone b WHERE b.number = :number and b.user.id!= null")
	public Telephone checkExistanceOfPhoneOfUser(@Param("number") String number);

	@Query("FROM Telephone b WHERE b.number = :number and b.branch.id!= null")
	public Telephone checkExistanceOfNumberBranch(@Param("number") String number);

	@Modifying
	@Transactional
	@Query("delete from Telephone b WHERE b.id = :id")
	public void deleteT(@Param("id") int number);

}
