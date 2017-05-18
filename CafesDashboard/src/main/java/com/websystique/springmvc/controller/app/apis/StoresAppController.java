package com.websystique.springmvc.controller.app.apis;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springmvc.dtos.app.StoresDTO;
import com.websystique.springmvc.services.app.StoresAppService;

@RestController
public class StoresAppController {

    @Autowired
    private StoresAppService storesService;

    @RequestMapping(value = "/get-store", method = RequestMethod.GET)
    public Map<String, StoresDTO> getAllStores() {
	Map<String, StoresDTO> stores = new HashMap<>();
	stores.put("store", storesService.getStore() != null ? storesService.getStore() : new StoresDTO());
	return stores;
    }

}
