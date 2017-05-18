package com.websystique.springmvc.controller.app.apis;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springmvc.dtos.CityDTO;
import com.websystique.springmvc.dtos.CountryDTO;

@RestController
public class SettingsAppController {

    @Autowired
    private EntityManager em;

    class Holder {
	private int countryId;
	private String countryName;
	private String countryUUID;
	private int cityId;
	private String cityUUID;
	private String cityName;

	public int getCountryId() {
	    return countryId;
	}

	public void setCountryId(int countryId) {
	    this.countryId = countryId;
	}

	public String getCountryName() {
	    return countryName;
	}

	public void setCountryName(String countryName) {
	    this.countryName = countryName;
	}

	public String getCountryUUID() {
	    return countryUUID;
	}

	public void setCountryUUID(String countryUUID) {
	    this.countryUUID = countryUUID;
	}

	public int getCityId() {
	    return cityId;
	}

	public void setCityId(int cityId) {
	    this.cityId = cityId;
	}

	public String getCityUUID() {
	    return cityUUID;
	}

	public void setCityUUID(String cityUUID) {
	    this.cityUUID = cityUUID;
	}

	public String getCityName() {
	    return cityName;
	}

	public void setCityName(String cityName) {
	    this.cityName = cityName;
	}

	@Override
	public String toString() {
	    return "Holder [countryId=" + countryId + ", countryName=" + countryName + ", countryUUID=" + countryUUID
		    + ", cityId=" + cityId + ", cityUUID=" + cityUUID + ", cityName=" + cityName + "]";
	}

    }

    @RequestMapping(value = "/get-countries-with-cities", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<CountryDTO>>> getAllCountriesWithCities() throws NoSuchAlgorithmException {
	List<CountryDTO> countriesDTO = new ArrayList<>();
	try {
	    javax.persistence.Query query = em.createNativeQuery("call getAllCitiesCountries()");
	    @SuppressWarnings("rawtypes")
	    List list = query.getResultList();

	    List<Holder> holders = new ArrayList<>();
	    for (Object object : list) {
		Object[] o = (Object[]) object;
		Holder holder = new Holder();
		holder.setCountryId((int) o[0]);
		holder.setCountryName((String) o[1]);
		holder.setCountryUUID((String) o[2]);
		holder.setCityId((int) o[3]);
		holder.setCityUUID((String) o[4]);
		holder.setCityName((String) o[5]);
		holders.add(holder);

	    }

	    for (Holder holder : holders) {

		if (!checkExistanceOfCountryName(holder.getCountryName(), countriesDTO)) {
		    CountryDTO country = new CountryDTO();
		    country.setCountry(holder.getCountryName());
		    country.setId(holder.getCountryId());
		    country.setUuid(holder.getCountryUUID());
		    countriesDTO.add(country);
		}

	    }

	    for (CountryDTO country : countriesDTO) {
		List<CityDTO> cities = new ArrayList<>();
		for (Holder holder : holders) {
		    if (country.getCountry().equals(holder.getCountryName())) {
			CityDTO city = new CityDTO();
			city.setId(holder.getCityId());
			city.setCity(holder.getCityName());
			city.setUuid(holder.getCityUUID());
			cities.add(city);
		    }
		}
		country.setCities(cities);
	    }

	    for (CountryDTO countryDTO : countriesDTO) {
		System.out.println(countryDTO.getCountry());
		for (CityDTO city : countryDTO.getCities()) {
		    System.out.println("  " + city.getCity());
		}
		System.out.println("---");
	    }
	} catch (Exception e) {
	    return new ResponseEntity<Map<String, List<CountryDTO>>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	Map<String, List<CountryDTO>> cmap = new HashMap<>();
	cmap.put("countries", countriesDTO);
	System.out.println(new Date());

	return new ResponseEntity<Map<String, List<CountryDTO>>>(cmap, HttpStatus.OK);

    }

    private boolean checkExistanceOfCountryName(String name, List<CountryDTO> countries) {
	for (CountryDTO countryDTO : countries) {
	    if (countryDTO.getCountry().equals(name)) {
		return true;
	    }
	}
	return false;
    }

}
