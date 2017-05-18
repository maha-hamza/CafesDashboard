package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.persistence.EntityManager;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.CityDTO;
import com.websystique.springmvc.dtos.CountryDTO;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("CountryService")
public class CountryService extends GenericService<CountryDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager em;

	public List<CityDTO> loadRequiredCities(int cid) {

		@SuppressWarnings("unchecked")
		List<Object[]> rl = em.createNativeQuery("select * from cities c where c.isDeleted=0 and  c.country_id=" + cid)
				.getResultList();

		List<CityDTO> dtos = new ArrayList<CityDTO>();
		for (Object[] object : rl) {
			CityDTO city = new CityDTO();
			city.setId((Integer) object[0]);
			city.setUuid((String) object[1]);
			city.setCity((String) object[2]);

			city.setIsDeleted((Byte) ((Boolean) object[4] == true ? Byte.valueOf("1") : Byte.valueOf("0")));
			dtos.add(city);
		}

		Collections.sort(dtos, new Comparator<CityDTO>() {

			public int compare(CityDTO o1, CityDTO o2) {
				return o2.getId() < o1.getId() ? -1 : 0;
			}
		});

		return dtos;
	}

	public boolean saveCreateUpdateCountry(CountryDTO role) {
		Country saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new Country();
			saviour.setCountry(role.getCountry());
			saviour.setIsDeleted(Byte.valueOf("0"));
			String userUUID = "";
			boolean userUUIDChecker = true;
			if (getAllData() == null) {
				userUUID = Utilities.generateRandomUUID();
			} else {
				do {
					userUUID = Utilities.generateRandomUUID();
					Country exited = countryRepository.checkExistanceOfUUID(userUUID);
					if (exited != null)
						userUUIDChecker = false;
					else if (exited == null)
						userUUIDChecker = true;
				} while (!userUUIDChecker);
			}
			saviour.setUuid(userUUID);
		} else {
			saviour = countryRepository.findOne(role.getId());
			saviour.setCountry(role.getCountry());
		}

		System.out.println("saving");
		Country result = countryRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
