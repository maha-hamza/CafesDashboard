package com.websystique.springmvc.controller.app.apis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.websystique.springmvc.dtos.app.BranchesDTO;
import com.websystique.springmvc.services.app.BranchesAppService;

@RestController
public class BranchesAppController {

    @Autowired
    private BranchesAppService branchesService;

    @RequestMapping(value = "/get-all-branches", method = RequestMethod.GET)
    public Map<String, List<BranchesDTO>> getAllBranches() {
	Map<String, List<BranchesDTO>> branches = new HashMap<>();
	branches.put("branches",
		branchesService.getAllBranches().size() != 0 ? branchesService.getAllBranches() : new ArrayList<>());
	return branches;
    }

}
