package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.app.GenericDTO;
import com.websystique.springmvc.dtos.app.OffersDTO;
import com.websystique.springmvc.dtos.app.OffersFinalDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.BranchOffer;
import com.websystique.springmvc.services.GenericService;

@Service
@Named("OffersAppService")
public class OffersAppService extends GenericService<OffersDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public GenericDTO getOffersForApp(int last, String cityuuid, String type) {
		System.out.println("--------------");
		// ---1- getundeleted branches--------
		List<Branch> undeletedBranches = branchRepository.getBranchesByCity(cityuuid, Byte.parseByte("0"));
		// ---2-extract undeleted offers from previous------------
		List<BranchOffer> offers = new ArrayList<BranchOffer>();
		for (Branch branch : undeletedBranches) {
			List<BranchOffer> uniBranchOffers = branch.getBranchOffers();
			for (BranchOffer offer : uniBranchOffers) {
				if (offer.getOffersAndEvent().getOffersAndEventsType().getType().equalsIgnoreCase(type)
						&& offer.getOffersAndEvent().getIsDeleted() == Byte.parseByte("0")) {
					offers.add(offer);
				}
			}
		}
		// -------------------------filter--------------
		List<OffersDTO> offersDto = new ArrayList<OffersDTO>();
		for (BranchOffer off : offers) {

			if (off.getOffersAndEvent().getEndAt().after(new Date())) {
				OffersDTO of = new OffersDTO(off.getOffersAndEvent());
				of.setBranch(off.getBranch().getBranchCode());
				offersDto.add(of);
			}

		}

		// ----------------------------------------------

		// ----------------------------------------------
		// subselect
		if (last == 0) {
			int to = Math.min(offersDto.size(), 19);
			offersDto = offersDto.subList(0, to);
		} else {
			int to = Math.min(offersDto.size(), last + 19);
			if (last <= to)
				offersDto = offersDto.subList(last, to);
			else {
				offersDto = offersDto.subList(offersDto.size(), offersDto.size());
			}
		}

		// ----------------------------------

		// wanna do what? loop on orders, if the order existed twice, with
		// different branch, then add him to new menu
		List<OffersDTO> finalOffers = new ArrayList<OffersDTO>();
		for (OffersDTO offer1 : offersDto) {

			List<String> brna = new ArrayList<String>();
			for (OffersDTO offer2 : offersDto) {
				if (offer1.getId() == offer2.getId()) {
					brna.add(offer2.getBranch());
				}
			}
			System.out.println(isListContainMethod(finalOffers, offer1));
			if (isListContainMethod(finalOffers, offer1)) {
				offer1.setBranches(brna);
				finalOffers.add(offer1);
			}
		}

		List<OffersFinalDTO> offersFinalDTO = new ArrayList<OffersFinalDTO>();
		for (OffersDTO oo : finalOffers) {
			offersFinalDTO.add(new OffersFinalDTO(oo));
		}

		// ---sofrting---
		Collections.sort(offersFinalDTO, new Comparator<OffersFinalDTO>() {

			public int compare(OffersFinalDTO o1, OffersFinalDTO o2) {
				return o2.getId() < o1.getId() ? -1 : 0;
			}
		});

		GenericDTO generic = new GenericDTO();
		generic.setData(offersFinalDTO);
		generic.setDataSetLength(offersFinalDTO.size());
		return generic;

		// ----------------------------------
		// GenericDTO generic = new GenericDTO();
		// generic.setData(offersDto);
		// generic.setDataSetLength(offersDto.size());
		// return generic;
	}

	public static boolean isListContainMethod(List<OffersDTO> arraylist, OffersDTO offer1) {
		for (OffersDTO str : arraylist) {
			if (str.getId() == offer1.getId()) {
				return false;
			}
		}
		return true;
	}

}
