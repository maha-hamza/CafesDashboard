package com.websystique.springmvc.services;

import java.io.Serializable;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.BranchesDTO;
import com.websystique.springmvc.dtos.TelephoneDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.City;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.pojos.Store;
import com.websystique.springmvc.pojos.StoreRelatedPhoto;
import com.websystique.springmvc.pojos.Telephone;
import com.websystique.springmvc.repositories.BrancheRelatedRepository;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("BranchesService")
public class BranchesService extends GenericService<BranchesDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager em;

	@Inject
	private BrancheRelatedRepository branchRelatedRepository;

	private void fillBasicData(Branch saviour, BranchesDTO role) throws ParseException {
		saviour.setUpdatedAt(new Date());
		saviour.setIsDeleted(Byte.valueOf("0"));
		// fill extra new data
		saviour.setAddress(role.getAddress());
		City c = new City();
		c.setId(role.getCity().getId());
		saviour.setCity(c);
		Country co = new Country();
		co.setId(role.getCountry().getId());
		saviour.setCountry(co);
		saviour.setBranchCode(role.getBranchCode());

		saviour.setOpenTime(role.getOpen());
		saviour.setCloseTime(role.getClose());

		saviour.setDescription(role.getDescription());

		Store s = new Store();
		s.setId(1);
		saviour.setStore(s);
		saviour.setLangitude(role.getLangitude());
		saviour.setLatitude(role.getLatitude());
	}

	private void fillAdd(Branch saviour, BranchesDTO role) {

		// fill basic related Data
		saviour.setCreatedAt(new Date());
		try {
			fillBasicData(saviour, role);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// ====== assign uuid to user=========
		String userUUID = "";
		boolean userUUIDChecker = true;
		if (getAllData() == null) {
			userUUID = Utilities.generateRandomUUID();
		} else {
			do {
				userUUID = Utilities.generateRandomUUID();
				Branch exited = branchRepository.checkExistanceOfUUID(userUUID);
				if (exited != null)
					userUUIDChecker = false;
				else if (exited == null)
					userUUIDChecker = true;
			} while (!userUUIDChecker);
		}
		saviour.setUuid(userUUID);
		// ======= add phone numbers to user========
		List<Telephone> telList = new ArrayList<Telephone>();
		for (TelephoneDTO dto : role.getTelephone()) {
			Telephone t = new Telephone();
			t.setCreatedAt(new Date());
			t.setUpdatedAt(new Date());
			t.setNumber(dto.getNumber());
			t.setType(dto.getType());
			t.setBranch(saviour);
			telList.add(t);
		}
		saviour.setTelephones(telList);
	}

	private void fillEdit(Branch saviour, BranchesDTO role) {
		System.out.println("start = " + new Date());
		System.out.println(role.getTelephone().size());
		try {
			System.out.println("b b data = " + new Date());
			fillBasicData(saviour, role);
			System.out.println("a b data = " + new Date());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ========add/edit telephones====
		List<Telephone> telList = new ArrayList<Telephone>();
		System.out.println("proc 1 = " + new Date());
		// -----------------
		// small edit, before adding new,
		// 1- get all phones related to this branch
		List<Telephone> telephones = saviour.getTelephones();
		boolean indicator = false;
		for (Telephone telephone : telephones) {
			for (TelephoneDTO tel : role.getTelephone()) {
				if (telephone.getNumber().equals(tel.getNumber())) {
					indicator = true;
				}
			}
			System.out.println(indicator + "  indicator");
			if (!indicator) {
				System.out.println("inside");
				Telephone tel = telephoneRepository.checkExistanceOfNumberBranch(telephone.getNumber());
				System.out.println("to delete" + tel.getId());
				telephoneRepository.deleteT(tel.getId());
			}
			indicator = false;
		}
		System.out.println("proc 2 = " + new Date());
		// -------------------
		for (TelephoneDTO dto : role.getTelephone()) {
			System.out.println("db tr 1 = " + new Date());
			Telephone existed = telephoneRepository.checkExistanceOfPhone(dto.getId());

			System.out.println("db tr 2 = " + new Date());
			// add new to list
			if (null == existed) {
				existed = new Telephone();
				existed.setCreatedAt(new Date());
				existed.setNumber(dto.getNumber());
				existed.setType(dto.getType());
				existed.setUpdatedAt(new Date());
				existed.setBranch(saviour);
				telList.add(existed);
			} else {
				existed.setNumber(dto.getNumber());
				existed.setType(dto.getType());
				existed.setUpdatedAt(new Date());
				existed.setBranch(saviour);
				telList.add(existed);
			}
		}
		saviour.setTelephones(telList);
		System.out.println("end ");
	}

	public boolean saveCreateUpdate(BranchesDTO role) {
		Branch saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new Branch();
			fillAdd(saviour, role);
		} else {
			TypedQuery<Branch> query = em.createQuery("SELECT c FROM Branch  c where c.id=" + role.getId(),
					Branch.class);
			saviour = query.getSingleResult();
			// saviour = branchRepository.findOne(role.getId());
			fillEdit(saviour, role);
		}

		System.out.println("saving");
		Branch result = branchRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

	public BranchesDTO getBranchByUUID(String uuid) {
		Branch branch = branchRepository.getBranchByUUID(uuid);
		if (null != branch) {
			BranchesDTO branc = new BranchesDTO(branch, false);
			// -------------------------------------------------
			// TODO
			List<StoreRelatedPhoto> brancP = branchRelatedRepository.checkExistanceOfUUID(branc.getUuid());
			List<String> images = new ArrayList<String>();
			if (brancP != null) {
				for (StoreRelatedPhoto img : brancP) {
					if (img.getType().equals("branch"))
						images.add(img.getPhotoUrl());
				}
			}
			// -------------------------------------------------
			branc.setImages(images);
			branc.setLogo(branch.getStore().getLogoUrl());
			return branc;
		}
		return null;
	}

	public List<BranchesDTO> getAllDeletedData() {
		List<Branch> del = branchRepository.getDeBranches();
		List<BranchesDTO> dto = new ArrayList<BranchesDTO>();
		for (Branch branch : del) {
			dto.add(new BranchesDTO(branch, true));
		}
		Collections.sort(dto, new Comparator<BranchesDTO>() {

			public int compare(BranchesDTO o1, BranchesDTO o2) {
				return o2.getId() < o1.getId() ? -1 : 0;
			}
		});
		return dto;
	}

}
