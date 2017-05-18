package com.websystique.springmvc.pojos;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the branch_offer database table.
 * 
 */
@Entity
@Table(name="branch_offer")
public class BranchOffer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	//bi-directional many-to-one association to Branch
	@ManyToOne
	private Branch branch;

	//bi-directional many-to-one association to OffersAndEvent
	@ManyToOne
	@JoinColumn(name="offer_id")
	private OffersAndEvent offersAndEvent;

	public BranchOffer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Branch getBranch() {
		return this.branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public OffersAndEvent getOffersAndEvent() {
		return this.offersAndEvent;
	}

	public void setOffersAndEvent(OffersAndEvent offersAndEvent) {
		this.offersAndEvent = offersAndEvent;
	}

}