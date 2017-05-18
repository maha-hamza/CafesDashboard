package com.websystique.springmvc.dtos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.websystique.springmvc.pojos.Order;
import com.websystique.springmvc.pojos.OrderDetail;
import com.websystique.springmvc.pojos.Telephone;
import com.websystique.springmvc.pojos.User;

public class UsersDTO extends CommonDTO {

	private String fName;
	private String lName;
	private RolesDTO role;
	private StatusDTO status;
	private String email;
	private String gender;
	private Date birthDate;
	private CountryDTO country;
	private CityDTO city;
	private String address;
	private List<TelephoneDTO> telephone;
	private String operation;
	private String password;
	private StoresDTO store;
	private BranchesDTO branch;
	private List<OrdersDTO> orders;

	public UsersDTO() {
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setStore(StoresDTO storeId) {
		this.store = storeId;
	}

	public StoresDTO getStore() {
		return store;
	}

	public UsersDTO(User user) {
		super(user.getId(), user.getCreatedAt(), user.getUpdatedAt(), user.getUuid(), user.getIsDeleted());
		this.fName = user.getFName();
		this.lName = user.getLName();
		this.role = new RolesDTO(user.getRole());
		if (null != user.getStatus())
			this.status = new StatusDTO(user.getStatus());
		this.gender = user.getGender();
		this.email = user.getEmail();
		this.birthDate = user.getBirthdate();
		this.country = new CountryDTO(user.getCountry());
		this.city = new CityDTO(user.getCity());
		telephone = new ArrayList<TelephoneDTO>();
		for (Telephone tel : user.getTelephones()) {
			telephone.add(new TelephoneDTO(tel));
		}
		this.address = user.getAddress();
		this.password = user.getPassword();
		if (user.getBranch() != null && user.getBranch().getStore() != null)
			store = new StoresDTO(user.getBranch().getStore());
		if (null != user.getBranch())
			this.branch = new BranchesDTO(user.getBranch(), false);
		if (user.getOrders() != null) {
			orders = new ArrayList<OrdersDTO>();
			for (Order order : user.getOrders()) {
				orders.add(new OrdersDTO(order, false));
			}
		}

	}

	public void setOrders(List<OrdersDTO> orders) {
		this.orders = orders;
	}

	public List<OrdersDTO> getOrders() {
		return orders;
	}

	public void setBranch(BranchesDTO branch) {
		this.branch = branch;
	}

	public BranchesDTO getBranch() {
		return branch;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public void setTelephone(List<TelephoneDTO> telephone) {
		this.telephone = telephone;
	}

	public List<TelephoneDTO> getTelephone() {
		return telephone;
	}

	public CountryDTO getCountry() {
		return country;
	}

	public void setCountry(CountryDTO country) {
		this.country = country;
	}

	public CityDTO getCity() {
		return city;
	}

	public void setCity(CityDTO city) {
		this.city = city;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGender() {
		return gender;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public RolesDTO getRole() {
		return role;
	}

	public void setRole(RolesDTO role) {
		this.role = role;
	}

	public StatusDTO getStatus() {
		return status;
	}

	public void setStatus(StatusDTO status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UsersDTO [fName=" + fName + ", lName=" + lName + ", role=" + role + ", status=" + status + ", email="
				+ email + ", gender=" + gender + ", birthDate=" + birthDate + ", country=" + country + ", city=" + city
				+ ", address=" + address + ", telephone=" + telephone + ", operation=" + operation + ", password="
				+ password + ", store=" + store + ", branch=" + branch + "]";
	}

}
