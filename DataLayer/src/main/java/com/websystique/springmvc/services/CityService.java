package com.websystique.springmvc.services;

import java.io.Serializable;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.CitiesDTO;
import com.websystique.springmvc.pojos.City;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("CityService")
public class CityService extends GenericService<CitiesDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdateCity(CitiesDTO role) {
		City saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new City();
			Country c = new Country();
			c.setId(role.getCountry().getId());
			saviour.setCountry(c);
			saviour.setCity(role.getCity());
			saviour.setIsDeleted(Byte.valueOf("0"));
			String userUUID = "";
			boolean userUUIDChecker = true;
			if (getAllData() == null) {
				userUUID = Utilities.generateRandomUUID();
			} else {
				do {
					userUUID = Utilities.generateRandomUUID();
					City exited = cityRepository.checkExistanceOfUUID(userUUID);
					if (exited != null)
						userUUIDChecker = false;
					else if (exited == null)
						userUUIDChecker = true;
				} while (!userUUIDChecker);
			}
			saviour.setUuid(userUUID);
		} else {
			saviour = cityRepository.findOne(role.getId());
			Country c = new Country();
			c.setId(role.getCountry().getId());
			saviour.setCountry(c);
			saviour.setCity(role.getCity());
		}

		System.out.println("saving");
		City result = cityRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
