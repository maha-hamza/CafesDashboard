package com.websystique.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.websystique.springmvc.dtos.BrancheCategoryDTO;
import com.websystique.springmvc.services.BrancheCategoryService;

@RestController
public class BrancheCategoryController {

	@Autowired
	private BrancheCategoryService brancheCategoryService;

	@RequestMapping(value = "/get-categories", method = RequestMethod.GET)
	public List<BrancheCategoryDTO> getAll() {
		return brancheCategoryService.getAllData();
	}

	@RequestMapping(value = "/category-functions", method = RequestMethod.POST)
	public ResponseEntity<Void> statusFunctions(@RequestBody Object user) {
		ObjectMapper mapper = new ObjectMapper();
		BrancheCategoryDTO role = null;

		role = mapper.convertValue(user, BrancheCategoryDTO.class);
		boolean res = brancheCategoryService.saveCreateUpdate(role);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

	}

	@RequestMapping(value = "/category-delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("id") int id) {

		boolean res = brancheCategoryService.delete(id);
		if (res) {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}

	}
}
