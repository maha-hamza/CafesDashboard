package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.BranchOffer;

public abstract interface BrancheOfferRepository extends CrudRepository<BranchOffer, Integer> {

	@Query("FROM BranchOffer b WHERE b.branch.id = :bid and b.offersAndEvent.id=:oid")
	public BranchOffer check(@Param("bid") int bid, @Param("oid") int oid);

	@Query("FROM BranchOffer b WHERE  b.offersAndEvent.id=:id")
	public List<BranchOffer> getBO(@Param("id") int bid);

	@Query("FROM BranchOffer b WHERE  b.branch.id=:bid and b.offersAndEvent.id=:oid")
	public List<BranchOffer> checkExistanceOfOfferInTheSameBranchTwice(@Param("bid") int bid, @Param("oid") int oid);

	@Query("delete FROM BranchOffer b WHERE  b.id=:bid")
	@Modifying
	void delete(@Param("bid") int id);

}
