package com.websystique.springmvc.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 * The persistent class for the branches database table.
 * 
 */
@Entity
@Table(name = "branches")
public class Branch implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String address;

	@Column(name = "branch_code")
	private String branchCode;

	@Column(name = "close_time")
	private String closeTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;

	private String description;

	private byte isDeleted;

	private String langitude;

	private String latitude;

	@Column(name = "open_time")
	private String openTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at")
	private Date updatedAt;

	private String uuid;

	// bi-directional many-to-one association to BranchOffer
	@OneToMany(mappedBy = "branch", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<BranchOffer> branchOffers;

	// bi-directional many-to-one association to City
	@ManyToOne
	private City city;

	// bi-directional many-to-one association to Country
	@ManyToOne
	private Country country;

	// bi-directional many-to-one association to Store
	@ManyToOne(fetch = FetchType.EAGER)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Store store;

	// bi-directional many-to-one association to GuestReservation
	@OneToMany(mappedBy = "branch", cascade = CascadeType.ALL)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<GuestReservation> guestReservations;

	// bi-directional many-to-one association to Order
	@OneToMany(mappedBy = "branch", cascade = CascadeType.ALL)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Order> orders;

	// bi-directional many-to-one association to StoreRelatedPhoto
	@OneToMany(mappedBy = "branch")
	private List<StoreRelatedPhoto> storeRelatedPhotos;

	// bi-directional many-to-one association to Telephone
	@OneToMany(mappedBy = "branch", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Telephone> telephones;

	// bi-directional many-to-one association to User
	@OneToMany(mappedBy = "branch")
	private List<User> users;

	public Branch() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBranchCode() {
		return this.branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getCloseTime() {
		return this.closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
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

	public String getLangitude() {
		return this.langitude;
	}

	public void setLangitude(String langitude) {
		this.langitude = langitude;
	}

	public String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getOpenTime() {
		return this.openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
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
		branchOffer.setBranch(this);

		return branchOffer;
	}

	public BranchOffer removeBranchOffer(BranchOffer branchOffer) {
		getBranchOffers().remove(branchOffer);
		branchOffer.setBranch(null);

		return branchOffer;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Store getStore() {
		return this.store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public List<GuestReservation> getGuestReservations() {
		return this.guestReservations;
	}

	public void setGuestReservations(List<GuestReservation> guestReservations) {
		this.guestReservations = guestReservations;
	}

	public GuestReservation addGuestReservation(GuestReservation guestReservation) {
		getGuestReservations().add(guestReservation);
		guestReservation.setBranch(this);

		return guestReservation;
	}

	public GuestReservation removeGuestReservation(GuestReservation guestReservation) {
		getGuestReservations().remove(guestReservation);
		guestReservation.setBranch(null);

		return guestReservation;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setBranch(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setBranch(null);

		return order;
	}

	public List<StoreRelatedPhoto> getStoreRelatedPhotos() {
		return this.storeRelatedPhotos;
	}

	public void setStoreRelatedPhotos(List<StoreRelatedPhoto> storeRelatedPhotos) {
		this.storeRelatedPhotos = storeRelatedPhotos;
	}

	public StoreRelatedPhoto addStoreRelatedPhoto(StoreRelatedPhoto storeRelatedPhoto) {
		getStoreRelatedPhotos().add(storeRelatedPhoto);
		storeRelatedPhoto.setBranch(this);

		return storeRelatedPhoto;
	}

	public StoreRelatedPhoto removeStoreRelatedPhoto(StoreRelatedPhoto storeRelatedPhoto) {
		getStoreRelatedPhotos().remove(storeRelatedPhoto);
		storeRelatedPhoto.setBranch(null);

		return storeRelatedPhoto;
	}

	public List<Telephone> getTelephones() {
		return this.telephones;
	}

	public void setTelephones(List<Telephone> telephones) {
		this.telephones = telephones;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<User> getUsers() {
		return users;
	}

	public Telephone addTelephone(Telephone telephone) {
		getTelephones().add(telephone);
		telephone.setBranch(this);

		return telephone;
	}

	public Telephone removeTelephone(Telephone telephone) {
		getTelephones().remove(telephone);
		telephone.setBranch(null);

		return telephone;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setBranch(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setBranch(null);

		return user;
	}

}