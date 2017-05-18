package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.UserAppRequestDTO;
import com.websystique.springmvc.dtos.UsersDTO;
import com.websystique.springmvc.pojos.City;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.pojos.Role;
import com.websystique.springmvc.pojos.Status;
import com.websystique.springmvc.pojos.Telephone;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.services.GenericService;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("UsersAppService")
public class UsersAppService extends GenericService<UsersDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public String registerUserForApp(UserAppRequestDTO role) {
		User saviour = new User();
		// ====basic data=====
		saviour.setFName(role.getfName());
		saviour.setLName(role.getlName());
		saviour.setAddress(role.getAddress());
		saviour.setBirthdate(role.getBirthDate());
		// =======address=========
		City city = new City();
		city.setId(role.getCity());
		saviour.setCity(city);

		Country country = new Country();
		country.setId(role.getCountry());
		saviour.setCountry(country);

		saviour.setAddress(role.getAddress());
		saviour.setEmail(role.getEmail());
		// =========other data============

		saviour.setCreatedAt(new Date());
		saviour.setUpdatedAt(new Date());
		// =================================

		saviour.setGender(role.getGender());
		// ====================================
		saviour.setIsDeleted(Byte.parseByte("0"));
		// =====================================
		saviour.setBranch(branchRepository.checkExistanceOfUUID("GENERICBRANCHE"));
		// =====================================
		Status status = new Status();
		status.setId(1);
		saviour.setStatus(status);

		Role rol = rolesRepository.getGuestRole("GUEST");
		saviour.setRole(rol);
		List<Telephone> telList = new ArrayList<Telephone>();

		Telephone t = new Telephone();
		t.setCreatedAt(new Date());
		t.setUpdatedAt(new Date());
		t.setNumber(role.getTelephone());
		t.setType(role.getPhoneType());
		t.setUser(saviour);
		telList.add(t);
		saviour.setTelephones(telList);

		String userUUID = "";
		boolean userUUIDChecker = true;
		if (getAllData() == null) {
			userUUID = Utilities.generateRandomUUID();
		} else {
			do {
				userUUID = Utilities.generateRandomUUID();
				User exited = usersRepository.checkExistanceOfUUID(userUUID);
				if (exited != null)
					userUUIDChecker = false;
				else if (exited == null)
					userUUIDChecker = true;
			} while (!userUUIDChecker);
		}
		saviour.setUuid(userUUID);

		System.out.println("saving");

		User result = usersRepository.save(saviour);
		if (result != null) {
			return result.getUuid();
		} else {
			return null;
		}
	}

}
