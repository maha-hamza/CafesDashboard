package com.websystique.springmvc.pojos;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the stores database table.
 * 
 */
@Entity
@Table(name = "stores")
public class Store implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;

	private String description;

	private byte isDeleted;

	@Column(name = "logo_url")
	private String logoUrl;

	@Column(name = "store_name")
	private String storeName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at")
	private Date updatedAt;

	private String uuid;

	// bi-directional many-to-one association to Branch
	@OneToMany(mappedBy = "store", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Branch> branches;

	// bi-directional many-to-one association to OffersAndEventsType
	@OneToMany(mappedBy = "store")
	private List<OffersAndEventsType> offersAndEventsTypes;

	public Store() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getLogoUrl() {
		return this.logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public String getStoreName() {
		return this.storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public List<Branch> getBranches() {
		return this.branches;
	}

	public void setBranches(List<Branch> branches) {
		this.branches = branches;
	}

	public Branch addBranch(Branch branch) {
		getBranches().add(branch);
		branch.setStore(this);

		return branch;
	}

	public Branch removeBranch(Branch branch) {
		getBranches().remove(branch);
		branch.setStore(null);

		return branch;
	}

	public List<OffersAndEventsType> getOffersAndEventsTypes() {
		return this.offersAndEventsTypes;
	}

	public void setOffersAndEventsTypes(List<OffersAndEventsType> offersAndEventsTypes) {
		this.offersAndEventsTypes = offersAndEventsTypes;
	}

	public OffersAndEventsType addOffersAndEventsType(OffersAndEventsType offersAndEventsType) {
		getOffersAndEventsTypes().add(offersAndEventsType);
		offersAndEventsType.setStore(this);

		return offersAndEventsType;
	}

	public OffersAndEventsType removeOffersAndEventsType(OffersAndEventsType offersAndEventsType) {
		getOffersAndEventsTypes().remove(offersAndEventsType);
		offersAndEventsType.setStore(null);

		return offersAndEventsType;
	}

	

}