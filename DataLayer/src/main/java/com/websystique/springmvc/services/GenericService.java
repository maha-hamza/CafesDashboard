package com.websystique.springmvc.services;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.websystique.springmvc.dtos.BrancheCategoryDTO;
import com.websystique.springmvc.dtos.BranchesDTO;
import com.websystique.springmvc.dtos.CitiesDTO;
import com.websystique.springmvc.dtos.CountryDTO;
import com.websystique.springmvc.dtos.MenusDTO;
import com.websystique.springmvc.dtos.OfferTypeDTO;
import com.websystique.springmvc.dtos.OffersDTO;
import com.websystique.springmvc.dtos.OrderDetailsDTO;
import com.websystique.springmvc.dtos.OrdersDTO;
import com.websystique.springmvc.dtos.ReservationDTO;
import com.websystique.springmvc.dtos.RolesDTO;
import com.websystique.springmvc.dtos.StatusDTO;
import com.websystique.springmvc.dtos.StoresDTO;
import com.websystique.springmvc.dtos.UsersDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.BranchOffer;
import com.websystique.springmvc.pojos.City;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.pojos.GuestReservation;
import com.websystique.springmvc.pojos.Menu;
import com.websystique.springmvc.pojos.MenuCategory;
import com.websystique.springmvc.pojos.OffersAndEvent;
import com.websystique.springmvc.pojos.OffersAndEventsType;
import com.websystique.springmvc.pojos.Order;
import com.websystique.springmvc.pojos.OrderDetail;
import com.websystique.springmvc.pojos.Role;
import com.websystique.springmvc.pojos.Status;
import com.websystique.springmvc.pojos.Store;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.statics.CommonAutoWiringDefinitions;

public class GenericService<T> extends CommonAutoWiringDefinitions {

	private Class<T> typeOfT;

	public GenericService() {
		this.typeOfT = getTypeOfT();
	}

	@SuppressWarnings("unchecked")
	protected Class<T> getTypeOfT() {
		ParameterizedType pType = getGeneralAPIServiceAsParameterizedType(getClass());
		return (Class<T>) pType.getActualTypeArguments()[0];
	}

	private ParameterizedType getGeneralAPIServiceAsParameterizedType(Class<?> clazz) {
		Object gstype = clazz.getGenericSuperclass();
		if (gstype instanceof ParameterizedType) {
			ParameterizedType ptype = (ParameterizedType) gstype;
			Type rawtype = ptype.getRawType();
			if (GenericService.class.equals(rawtype)) {
				return ptype;
			}
		}
		return getGeneralAPIServiceAsParameterizedType(clazz.getSuperclass());
	}

	/**
	 * Generic all data obtainer
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> getAllData() {
		if (typeOfT == RolesDTO.class) {
			Iterator<Role> statuses = rolesRepository.findAll().iterator();
			List<RolesDTO> dtos = new ArrayList<RolesDTO>();
			while (statuses.hasNext()) {
				dtos.add(new RolesDTO(statuses.next()));
			}
			return (List<T>) dtos;
		} else if (typeOfT == StatusDTO.class) {
			Iterator<Status> statuses = statusRepository.findAll().iterator();
			List<StatusDTO> dtos = new ArrayList<StatusDTO>();
			while (statuses.hasNext()) {
				dtos.add(new StatusDTO(statuses.next()));
			}
			return (List<T>) dtos;
		} else if (typeOfT == CountryDTO.class) {
			Iterator<Country> statuses = countryRepository.findAll().iterator();
			List<CountryDTO> dtos = new ArrayList<CountryDTO>();
			while (statuses.hasNext()) {
				dtos.add(new CountryDTO(statuses.next()));
			}
			Collections.sort(dtos, new Comparator<CountryDTO>() {

				public int compare(CountryDTO o1, CountryDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == CitiesDTO.class) {
			Iterator<City> statuses = cityRepository.findAll().iterator();
			List<CitiesDTO> dtos = new ArrayList<CitiesDTO>();
			while (statuses.hasNext()) {
				dtos.add(new CitiesDTO(statuses.next()));
			}
			Collections.sort(dtos, new Comparator<CitiesDTO>() {

				public int compare(CitiesDTO o1, CitiesDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == StoresDTO.class) {
			Iterator<Store> statuses = storesRepository.findAll().iterator();
			List<StoresDTO> dtos = new ArrayList<StoresDTO>();
			while (statuses.hasNext()) {
				dtos.add(new StoresDTO(statuses.next()));
			}
			return (List<T>) dtos;
		} else if (typeOfT == UsersDTO.class) {
			Iterator<User> users = usersRepository.findAll().iterator();
			List<UsersDTO> dtos = new ArrayList<UsersDTO>();
			while (users.hasNext()) {
				dtos.add(new UsersDTO(users.next()));
			}
			Collections.sort(dtos, new Comparator<UsersDTO>() {

				public int compare(UsersDTO o1, UsersDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == OffersDTO.class) {
			Iterator<OffersAndEvent> offers = offersRepository.findAll().iterator();
			List<OffersDTO> dtos = new ArrayList<OffersDTO>();
			while (offers.hasNext()) {
				dtos.add(new OffersDTO(offers.next()));
			}
			Collections.sort(dtos, new Comparator<OffersDTO>() {

				public int compare(OffersDTO o1, OffersDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == BranchesDTO.class) {
			Iterator<Branch> branches = branchRepository.findAll().iterator();
			List<BranchesDTO> dtos = new ArrayList<BranchesDTO>();

			while (branches.hasNext()) {
				dtos.add(new BranchesDTO(branches.next(), true));
			}
			Collections.sort(dtos, new Comparator<BranchesDTO>() {

				public int compare(BranchesDTO o1, BranchesDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});

			return (List<T>) dtos;
		} else if (typeOfT == ReservationDTO.class) {
			Iterator<GuestReservation> branches = reservationRepository.findAll().iterator();
			List<ReservationDTO> dtos = new ArrayList<ReservationDTO>();
			while (branches.hasNext()) {
				dtos.add(new ReservationDTO(branches.next()));
			}
			Collections.sort(dtos, new Comparator<ReservationDTO>() {

				public int compare(ReservationDTO o1, ReservationDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == OrdersDTO.class) {
			Iterator<Order> branches = orderRepository.findAll().iterator();
			List<OrdersDTO> dtos = new ArrayList<OrdersDTO>();
			while (branches.hasNext()) {
				dtos.add(new OrdersDTO(branches.next()));
			}
			Collections.sort(dtos, new Comparator<OrdersDTO>() {

				public int compare(OrdersDTO o1, OrdersDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == BrancheCategoryDTO.class) {
			Iterator<MenuCategory> branches = brancheCategoryRepository.findAll().iterator();
			List<BrancheCategoryDTO> dtos = new ArrayList<BrancheCategoryDTO>();
			while (branches.hasNext()) {
				dtos.add(new BrancheCategoryDTO(branches.next()));
			}
			Collections.sort(dtos, new Comparator<BrancheCategoryDTO>() {

				public int compare(BrancheCategoryDTO o1, BrancheCategoryDTO o2) {
					return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == MenusDTO.class) {
			Iterator<Menu> branches = menuRepository.findAll().iterator();
			List<MenusDTO> dtos = new ArrayList<MenusDTO>();
			while (branches.hasNext()) {
				dtos.add(new MenusDTO(branches.next(), 0));
			}
			Collections.sort(dtos, new Comparator<MenusDTO>() {

				public int compare(MenusDTO o1, MenusDTO o2) {
					return o2.getCreatedAt().compareTo(o1.getCreatedAt());
					// return o2.getId() < o1.getId() ? -1 : 0;
				}
			});
			return (List<T>) dtos;
		} else if (typeOfT == OfferTypeDTO.class) {
			Iterator<OffersAndEventsType> statuses = offerTypeRepository.findAll().iterator();
			List<OfferTypeDTO> dtos = new ArrayList<OfferTypeDTO>();
			while (statuses.hasNext()) {
				dtos.add(new OfferTypeDTO(statuses.next()));
			}
			return (List<T>) dtos;
		} else if (typeOfT == OrderDetailsDTO.class) {
			Iterator<OrderDetail> statuses = orderDetailsRepository.findAll().iterator();
			List<OrderDetailsDTO> dtos = new ArrayList<OrderDetailsDTO>();
			while (statuses.hasNext()) {
				OrderDetail d = statuses.next();
				dtos.add(new OrderDetailsDTO(d));
			}
			return (List<T>) dtos;
		}
		return null;
	}

	public boolean delete(int id) {
		System.out.println("in delete");
		try {
			/**
			 * users
			 */
			if (typeOfT == UsersDTO.class) {
				User saviour = usersRepository.findOne(id);
				if (saviour != null) {
					// law heya not deleted
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						Status s = statusRepository.getStatusByName("INACTIVE");
						saviour.setStatus(s);
						saviour.setUpdatedAt(new Date());
						usersRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						Status s = statusRepository.getStatusByName("ACTIVE");
						saviour.setStatus(s);
						saviour.setUpdatedAt(new Date());
						usersRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * branches
			 */
			else if (typeOfT == BranchesDTO.class) {
				Branch saviour = branchRepository.findOne(id);
				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						saviour.setUpdatedAt(new Date());
						List<Order> orders = orderRepository.getOrdersPErBranch(saviour.getId());
						if (null != orders) {

							for (Order order : orders) {
								order.setUpdatedAt(new Date());
								order.setIsDeleted(Byte.valueOf("1"));
							}
						}
						List<GuestReservation> res = reservationRepository.getReservationByBranch(saviour.getId());
						if (null != res) {
							for (GuestReservation order : res) {
								order.setUpdatedAt(new Date());
								order.setIsDeleted(Byte.valueOf("1"));
							}
						}
						if (null != saviour.getBranchOffers()) {
							for (BranchOffer order : saviour.getBranchOffers()) {
								order.getOffersAndEvent().setUpdatedAt(new Date());
								order.getOffersAndEvent().setIsDeleted(Byte.valueOf("1"));
							}
						}
						branchRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						saviour.setUpdatedAt(new Date());

						branchRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * offers
			 */
			else if (typeOfT == OffersDTO.class) {
				OffersAndEvent saviour = offersRepository.findOne(id);

				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						saviour.setUpdatedAt(new Date());
						offersRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						saviour.setUpdatedAt(new Date());
						offersRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * menu
			 */
			else if (typeOfT == MenusDTO.class) {
				Menu saviour = menuRepository.findOne(id);
				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						saviour.setUpdatedAt(new Date());
						menuRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						saviour.setUpdatedAt(new Date());
						menuRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * categories
			 */
			else if (typeOfT == BrancheCategoryDTO.class) {
				MenuCategory saviour = brancheCategoryRepository.findOne(id);
				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						saviour.setUpdatedAt(new Date());
						if (null != saviour.getMenus()) {
							for (Menu menu : saviour.getMenus()) {
								menu.setUpdatedAt(new Date());
								menu.setIsDeleted(Byte.valueOf("1"));
							}
						}
						brancheCategoryRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						saviour.setUpdatedAt(new Date());
						if (null != saviour.getMenus()) {
							for (Menu menu : saviour.getMenus()) {
								menu.setUpdatedAt(new Date());
								menu.setIsDeleted(Byte.valueOf("0"));
							}
						}
						brancheCategoryRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * orders
			 */
			else if (typeOfT == OrdersDTO.class) {
				Order saviour = orderRepository.findOne(id);
				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						saviour.setUpdatedAt(new Date());
						orderRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						saviour.setUpdatedAt(new Date());
						orderRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * reservation
			 */
			else if (typeOfT == ReservationDTO.class) {
				GuestReservation saviour = reservationRepository.findOne(id);
				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						saviour.setUpdatedAt(new Date());
						reservationRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						saviour.setUpdatedAt(new Date());
						reservationRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
			/**
			 * offer type
			 */
			else if (typeOfT == OfferTypeDTO.class) {
				OffersAndEventsType saviour = offerTypeRepository.findOne(id);
				if (saviour != null) {
					saviour.setIsDeleted(Byte.valueOf("1"));
					saviour.setUpdatedAt(new Date());
					offerTypeRepository.save(saviour);
					return true;
				} else {
					return false;
				}
			}
			/**
			 * country
			 */
			else if (typeOfT == CountryDTO.class) {
				// =========== get country========
				Country saviour = countryRepository.findOne(id);
				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));

						List<City> cities = cityRepository.getRequiredUndeletedStates(saviour.getId());
						for (City city : cities) {
							city.setIsDeleted(Byte.valueOf("1"));
						}
						saviour.setCities(cities);
						countryRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						List<City> cities = saviour.getCities();
						for (City city : cities) {
							city.setIsDeleted(Byte.valueOf("0"));
						}
						saviour.setCities(cities);
						countryRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
				// =========================================
			}
			/**
			 * cities
			 */
			else if (typeOfT == CitiesDTO.class) {
				City saviour = cityRepository.findOne(id);

				if (saviour != null) {
					if (saviour.getIsDeleted() == Byte.valueOf("0")) {
						saviour.setIsDeleted(Byte.valueOf("1"));
						cityRepository.save(saviour);
						return true;
					} else {
						saviour.setIsDeleted(Byte.valueOf("0"));
						cityRepository.save(saviour);
						return true;
					}
				} else {
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}

}
