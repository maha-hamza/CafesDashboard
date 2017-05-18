package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Role;

public abstract interface RolesRepository extends CrudRepository<Role, Integer> {

	@Query("FROM Role role WHERE role.uuid = :uuid ")
	public Role checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM Role role WHERE role.roleName = :uuid ")
	public Role getGuestRole(@Param("uuid") String uuid);
}
