package com.websystique.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jcraft.jsch.SftpException;
import com.websystique.springmvc.App;
import com.websystique.springmvc.dtos.BrancheCategoryDTO;
import com.websystique.springmvc.dtos.MenusDTO;
import com.websystique.springmvc.model.MenuRequest;
import com.websystique.springmvc.pojos.Menu;
import com.websystique.springmvc.repositories.MenuRepository;
import com.websystique.springmvc.services.MenuService;

@RestController
public class MenuController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private MenuRepository menuRepository;

    @RequestMapping(value = "/get-menus", method = RequestMethod.GET)
    public List<MenusDTO> getAll() {
	return menuService.getAllData();
    }

    @RequestMapping(value = "/menu-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> offerFunctions(@RequestParam("menu") @Valid MenuRequest menu,
	    @RequestPart("file") MultipartFile fil) throws SftpException, IOException {
	MenusDTO dto = new MenusDTO();
	dto.setItemDescription(menu.getItemDescription());
	dto.setItemName(menu.getItemName());
	dto.setItemPrice(Float.parseFloat(menu.getItemPrice()));
	BrancheCategoryDTO category = new BrancheCategoryDTO();
	category.setId(Integer.parseInt(menu.getCategory()));
	dto.setCategory(category);
	dto.setType(menu.getType());
	dto.setOperation(menu.getOperation());
	if (menu.getOperation().equals("edit")) {
	    dto.setUuid(menu.getUuid());
	    dto.setId(menu.getId());
	}

	boolean res = menuService.saveCreateUpdate(dto, fil);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/edit-menu", method = RequestMethod.POST)
    public ResponseEntity<Void> offerFunctions(@RequestBody Object menu) throws SftpException, IOException {

	ObjectMapper mapper = new ObjectMapper();
	MenusDTO role = null;

	role = mapper.convertValue(menu, MenusDTO.class);

	boolean res = menuService.saveCreateUpdate(role, null);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/menu-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete(@PathVariable("id") int id) {

	boolean res = menuService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

    @RequestMapping(value = "/get-items_by_store", method = RequestMethod.POST)
    public List<MenusDTO> getMenuItemsByStore(@RequestBody String uuid) {
	return menuService.loadItemsByStore(uuid);
    }

    @RequestMapping(value = "/change-img", method = RequestMethod.POST)
    public ResponseEntity<Void> changeImg(@RequestParam("id") Object id, @RequestPart("file") MultipartFile fil)
	    throws SftpException, IOException {
	Menu saviour = menuRepository.findOne(Integer.parseInt((String) id));

	String fileName = "menu_" + fil.getOriginalFilename();

	File convFile = new File(fil.getOriginalFilename());
	fil.transferTo(convFile);

	boolean result = App.uploadToS3(convFile, fileName);

	if (result) {
	    saviour.setImg(App.url + fileName);
	    saviour.setUpdatedAt(new Date());
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

	if (menuRepository.save(saviour) != null) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    // ==================

    @RequestMapping(value = "/menu-del", method = RequestMethod.POST)
    public ResponseEntity<Void> deleteitem(@RequestBody int id) {
	System.out.println(" in delete ");
	boolean res = menuService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.ACCEPTED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

}
