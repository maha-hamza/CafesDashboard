package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.Iterator;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.app.StoresDTO;
import com.websystique.springmvc.pojos.Store;
import com.websystique.springmvc.services.GenericService;

@Service
@Named("StoresAppService")
public class StoresAppService extends GenericService<StoresDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public StoresDTO getStore() {
		Iterator<Store> it = storesRepository.findAll().iterator();
		while (it.hasNext()) {
			Store store = (Store) it.next();
			return new StoresDTO(store);
		}
		return null;
	}

}
