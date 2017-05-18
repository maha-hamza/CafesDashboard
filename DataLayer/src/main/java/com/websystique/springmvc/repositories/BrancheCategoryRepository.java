package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.MenuCategory;

public abstract interface BrancheCategoryRepository extends CrudRepository<MenuCategory, Integer> {
	@Query("FROM MenuCategory b WHERE b.uuid = :uuid ")
	public MenuCategory checkExistanceOfUUID(@Param("uuid") String uuid);
}
