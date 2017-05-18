package com.websystique.springmvc.statics;

import javax.inject.Inject;

import com.websystique.springmvc.repositories.BrancheCategoryRepository;
import com.websystique.springmvc.repositories.BrancheOfferRepository;
import com.websystique.springmvc.repositories.BrancheRelatedRepository;
import com.websystique.springmvc.repositories.BranchesRepository;
import com.websystique.springmvc.repositories.CityRepository;
import com.websystique.springmvc.repositories.CountryRepository;
import com.websystique.springmvc.repositories.MenuRepository;
import com.websystique.springmvc.repositories.OfferTypeRepository;
import com.websystique.springmvc.repositories.OffersRepository;
import com.websystique.springmvc.repositories.OrderDetailsRepository;
import com.websystique.springmvc.repositories.OrderRepository;
import com.websystique.springmvc.repositories.ReservationRepository;
import com.websystique.springmvc.repositories.RolesRepository;
import com.websystique.springmvc.repositories.StatusRepository;
import com.websystique.springmvc.repositories.StoresRepository;
import com.websystique.springmvc.repositories.TelephoneRepository;
import com.websystique.springmvc.repositories.UserLoginHistoryRepository;
import com.websystique.springmvc.repositories.UsersRepository;

public abstract class CommonAutoWiringDefinitions {

	@Inject
	protected RolesRepository rolesRepository;
	@Inject
	protected StatusRepository statusRepository;
	@Inject
	protected StoresRepository storesRepository;
	@Inject
	protected UsersRepository usersRepository;
	@Inject
	protected OffersRepository offersRepository;
	@Inject
	protected BranchesRepository branchRepository;
	@Inject
	protected ReservationRepository reservationRepository;
	@Inject
	protected OrderRepository orderRepository;
	@Inject
	protected BrancheCategoryRepository brancheCategoryRepository;
	@Inject
	protected MenuRepository menuRepository;
	@Inject
	protected TelephoneRepository telephoneRepository;
	@Inject
	protected OfferTypeRepository offerTypeRepository;
	@Inject
	protected BrancheOfferRepository brancheOfferRepository;
	@Inject
	protected UserLoginHistoryRepository userLoginHistoryRepository;
	@Inject
	protected CountryRepository countryRepository;
	@Inject
	protected CityRepository cityRepository;

	@Inject
	protected OrderDetailsRepository orderDetailsRepository;
	@Inject
	protected BrancheRelatedRepository brancheRelatedRepository;
}
