package com.websystique.springmvc.pojos;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the offers_and_events database table.
 * 
 */
@Entity
@Table(name = "offers_and_events")
public class OffersAndEvent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;

	private String description;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "end_at")
	private Date endAt;

	private byte isDeleted;

	@Column(name = "offer_img")
	private String offerImg;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_at")
	private Date startAt;

	private String title;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at")
	private Date updatedAt;

	private String uuid;

	// bi-directional many-to-one association to BranchOffer
	@OneToMany(mappedBy = "offersAndEvent", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<BranchOffer> branchOffers;

	// bi-directional many-to-one association to OffersAndEventsType
	@ManyToOne
	@JoinColumn(name = "offer_type_id")
	private OffersAndEventsType offersAndEventsType;

	public OffersAndEvent() {
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

	public Date getEndAt() {
		return this.endAt;
	}

	public void setEndAt(Date endAt) {
		this.endAt = endAt;
	}

	public byte getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getOfferImg() {
		return this.offerImg;
	}

	public void setOfferImg(String offerImg) {
		this.offerImg = offerImg;
	}

	public Date getStartAt() {
		return this.startAt;
	}

	public void setStartAt(Date startAt) {
		this.startAt = startAt;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public List<BranchOffer> getBranchOffers() {
		return this.branchOffers;
	}

	public void setBranchOffers(List<BranchOffer> branchOffers) {
		this.branchOffers = branchOffers;
	}

	public BranchOffer addBranchOffer(BranchOffer branchOffer) {
		getBranchOffers().add(branchOffer);
		branchOffer.setOffersAndEvent(this);

		return branchOffer;
	}

	public BranchOffer removeBranchOffer(BranchOffer branchOffer) {
		getBranchOffers().remove(branchOffer);
		branchOffer.setOffersAndEvent(null);

		return branchOffer;
	}

	public OffersAndEventsType getOffersAndEventsType() {
		return this.offersAndEventsType;
	}

	public void setOffersAndEventsType(OffersAndEventsType offersAndEventsType) {
		this.offersAndEventsType = offersAndEventsType;
	}

}