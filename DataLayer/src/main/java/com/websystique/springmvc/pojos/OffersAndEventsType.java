package com.websystique.springmvc.pojos;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the offers_and_events_type database table.
 * 
 */
@Entity
@Table(name="offers_and_events_type")
public class OffersAndEventsType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at")
	private Date createdAt;

	private String description;

	private byte isDeleted;

	private String type;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_at")
	private Date updatedAt;

	private String uuid;

	//bi-directional many-to-one association to OffersAndEvent
	@OneToMany(mappedBy="offersAndEventsType")
	private List<OffersAndEvent> offersAndEvents;

	//bi-directional many-to-one association to Store
	@ManyToOne
	private Store store;

	public OffersAndEventsType() {
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

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
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

	public List<OffersAndEvent> getOffersAndEvents() {
		return this.offersAndEvents;
	}

	public void setOffersAndEvents(List<OffersAndEvent> offersAndEvents) {
		this.offersAndEvents = offersAndEvents;
	}

	public OffersAndEvent addOffersAndEvent(OffersAndEvent offersAndEvent) {
		getOffersAndEvents().add(offersAndEvent);
		offersAndEvent.setOffersAndEventsType(this);

		return offersAndEvent;
	}

	public OffersAndEvent removeOffersAndEvent(OffersAndEvent offersAndEvent) {
		getOffersAndEvents().remove(offersAndEvent);
		offersAndEvent.setOffersAndEventsType(null);

		return offersAndEvent;
	}

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

}