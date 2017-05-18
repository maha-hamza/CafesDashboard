package com.websystique.springmvc.pojos;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name = "users")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String address;

	@Temporal(TemporalType.TIMESTAMP)
	private Date birthdate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at")
	private Date createdAt;

	private String email;

	@Column(name = "f_name")
	private String fName;

	private String gender;

	private byte isDeleted;

	@Column(name = "l_name")
	private String lName;

	private String password;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at")
	private Date updatedAt;

	private String uuid;

	// bi-directional many-to-one association to GuestReservation
	@OneToMany(mappedBy = "user")
	private List<GuestReservation> guestReservations;

	// bi-directional many-to-one association to Order
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Order> orders;

	// bi-directional many-to-one association to Telephone
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Telephone> telephones;

	// bi-directional many-to-one association to UserLoginHistory
	@OneToMany(mappedBy = "user")
	private List<UserLoginHistory> userLoginHistories;

	// bi-directional many-to-one association to City
	@ManyToOne
	private City city;

	// bi-directional many-to-one association to Country
	@ManyToOne
	private Country country;

	// bi-directional many-to-one association to Role
	@ManyToOne
	private Role role;

	// bi-directional many-to-one association to Status
	@ManyToOne
	private Status status;

	// bi-directional many-to-one association to Store
	@ManyToOne
	private Branch branch;

	public User() {
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

	public Date getBirthdate() {
		return this.birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFName() {
		return this.fName;
	}

	public void setFName(String fName) {
		this.fName = fName;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public byte getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getLName() {
		return this.lName;
	}

	public void setLName(String lName) {
		this.lName = lName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public List<GuestReservation> getGuestReservations() {
		return this.guestReservations;
	}

	public void setGuestReservations(List<GuestReservation> guestReservations) {
		this.guestReservations = guestReservations;
	}

	public GuestReservation addGuestReservation(GuestReservation guestReservation) {
		getGuestReservations().add(guestReservation);
		guestReservation.setUser(this);

		return guestReservation;
	}

	public GuestReservation removeGuestReservation(GuestReservation guestReservation) {
		getGuestReservations().remove(guestReservation);
		guestReservation.setUser(null);

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
		order.setUser(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setUser(null);

		return order;
	}

	public List<Telephone> getTelephones() {
		return this.telephones;
	}

	public void setTelephones(List<Telephone> telephones) {
		this.telephones = telephones;
	}

	public Telephone addTelephone(Telephone telephone) {
		getTelephones().add(telephone);
		telephone.setUser(this);

		return telephone;
	}

	public Telephone removeTelephone(Telephone telephone) {
		getTelephones().remove(telephone);
		telephone.setUser(null);

		return telephone;
	}

	public List<UserLoginHistory> getUserLoginHistories() {
		return this.userLoginHistories;
	}

	public void setUserLoginHistories(List<UserLoginHistory> userLoginHistories) {
		this.userLoginHistories = userLoginHistories;
	}

	public UserLoginHistory addUserLoginHistory(UserLoginHistory userLoginHistory) {
		getUserLoginHistories().add(userLoginHistory);
		userLoginHistory.setUser(this);

		return userLoginHistory;
	}

	public UserLoginHistory removeUserLoginHistory(UserLoginHistory userLoginHistory) {
		getUserLoginHistories().remove(userLoginHistory);
		userLoginHistory.setUser(null);

		return userLoginHistory;
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

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Branch getBranch() {
		return this.branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

}