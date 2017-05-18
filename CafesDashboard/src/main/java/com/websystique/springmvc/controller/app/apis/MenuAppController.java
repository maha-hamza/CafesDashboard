package com.websystique.springmvc.controller.app.apis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springmvc.dtos.app.MenuCategoryDTO;
import com.websystique.springmvc.services.app.MenuAppService;

@RestController
public class MenuAppController {

    @Autowired
    private MenuAppService menuAppService;

    @RequestMapping(value = "/get-categories_with_menu", method = RequestMethod.GET)
    public Map<String, List<MenuCategoryDTO>> getAll() {
	List<MenuCategoryDTO> cats = menuAppService.getAllCategories();
	Map<String, List<MenuCategoryDTO>> resu = new HashMap<>();
	resu.put("categories", cats);
	return resu;
    }

}
