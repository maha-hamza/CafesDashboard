package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.Branch;

public abstract interface BranchesRepository extends CrudRepository<Branch, Integer> {

	@Query("FROM Branch b WHERE b.uuid = :uuid ")
	public Branch checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM Branch b WHERE b.city.uuid = :uuid and b.isDeleted =:deleted")
	public List<Branch> getBranchesByCity(@Param("uuid") String uuid, @Param("deleted") byte del);

	@Query("FROM Branch b WHERE b.uuid = :uuid ")
	public Branch getBranchByUUID(@Param("uuid") String uuid);

	@Query("FROM Branch b WHERE  b.isDeleted =0")
	public List<Branch> getUndeBranches();

	@Query("FROM Branch b WHERE  b.isDeleted =1")
	public List<Branch> getDeBranches();
	
	@Query("FROM Branch b WHERE b.branchCode = :code ")
	public Branch getBranchByBCode(@Param("code") String uuid);


}
