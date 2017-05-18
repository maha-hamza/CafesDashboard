package com.websystique.springmvc.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.SftpException;
import com.websystique.springmvc.dtos.StoresDTO;
import com.websystique.springmvc.services.StoresService;

@RestController
public class StoresController {

    @Autowired
    private StoresService storesService;

    /**
     * Sepcific model return single store
     * 
     * @return
     */
    @RequestMapping(value = "/get-stores", method = RequestMethod.GET)
    public StoresDTO getAllStores() {
	return storesService.getAllData().get(0);
    }

    @RequestMapping(value = "/store-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> storeFunctions(@RequestParam("description") String description,
	    @RequestParam("name") String name, @RequestParam("id") int id, @RequestPart("file") MultipartFile fil)
	    throws SftpException, IOException {
	StoresDTO dto = new StoresDTO();
	dto.setId(id);
	dto.setDescription(description);
	dto.setStoreName(name);
	dto.setOperation("edit");
	boolean res = storesService.saveCreateUpdate(dto, fil);
	
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/store-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete(@PathVariable("id") int id) {

	boolean res = storesService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

}
