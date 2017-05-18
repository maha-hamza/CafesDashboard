package com.websystique.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import com.websystique.springmvc.dtos.BranchesDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.StoreRelatedPhoto;
import com.websystique.springmvc.repositories.BranchRelatedPhotosRepository;
import com.websystique.springmvc.repositories.BranchesRepository;
import com.websystique.springmvc.services.BranchesService;
import com.websystique.springmvc.statics.Utilities;

@RestController
public class BranchesController {

    @Autowired
    private BranchesService branchesService;
    @Autowired
    private BranchRelatedPhotosRepository branchRelatedPhotosRepository;
    @Autowired
    private BranchesRepository branchesRepository;

    @RequestMapping(value = "/get-branches", method = RequestMethod.GET)
    public List<BranchesDTO> getAll() {
	System.out.println(new Date());
	List<BranchesDTO> d = branchesService.getAllData();
	System.out.println(new Date());
	return d;
    }

    @RequestMapping(value = "/get-deleted-branches", method = RequestMethod.GET)
    public List<BranchesDTO> getDeletedAll() {
	return branchesService.getAllDeletedData();
    }

    @RequestMapping(value = "/branch-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> statusFunctions(@RequestBody Object user) {
	ObjectMapper mapper = new ObjectMapper();
	BranchesDTO role = null;

	role = mapper.convertValue(user, BranchesDTO.class);
	System.out.println("-----------------------" + new Date());
	boolean res = branchesService.saveCreateUpdate(role);
	System.out.println("-----------------------" + new Date());
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/check-branch", method = RequestMethod.POST)
    public boolean checkBranchCode(@RequestBody String branchCode) {

	Branch branch = branchesRepository.getBranchByBCode(branchCode);

	return branch == null ? false : true;

    }

    @RequestMapping(value = "/branch-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete(@PathVariable("id") int id) {

	boolean res = branchesService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

    @RequestMapping(value = "/get-branch-by-uuid", method = RequestMethod.POST)
    public BranchesDTO getBranchByUUID(@RequestBody String uuid) {
	BranchesDTO branch = branchesService.getBranchByUUID(uuid);
	if (null != branch) {
	    return branch;
	} else {
	    return null;
	}

    }
    // ===========================

    @RequestMapping(value = "/upload-branch-img", method = RequestMethod.POST)
    public ResponseEntity<Void> uploadBranchImg(@RequestParam("id") Object id,
	    @RequestParam("description") String description, @RequestPart("file") MultipartFile fil)
	    throws SftpException, IOException {
	System.out.println("upload branch image");
	System.out.println("date "+new Date());
	Branch branch = branchesRepository.findOne(Integer.parseInt((String) id));
	System.out.println("date "+new Date());
	
	String userUUID = Utilities.generateRandomUUID();
	boolean userUUIDChecker = true;
	StoreRelatedPhoto saviour = branchRelatedPhotosRepository.checkExistanceOfUUID(userUUID);
	if (saviour != null) {
	    do {
		userUUID = Utilities.generateRandomUUID();
		saviour = branchRelatedPhotosRepository.checkExistanceOfUUID(userUUID);
		if (saviour != null)
		    userUUIDChecker = false;
		else if (saviour == null)
		    userUUIDChecker = true;
	    } while (!userUUIDChecker);
	}

	StoreRelatedPhoto newP = new StoreRelatedPhoto();
	newP.setCreatedAt(new Date());
	newP.setUpdatedAt(new Date());
	newP.setDescription(description);
	newP.setType("branch");
	newP.setIsDeleted(Byte.parseByte("0"));
	newP.setUuid(userUUID);
	newP.setBranch(branch);

	String fileName = "branch_" + userUUID + "_" + fil.getOriginalFilename();

	File convFile = new File(fil.getOriginalFilename());
	fil.transferTo(convFile);

	System.out.println("before");
	boolean result = App.uploadToS3(convFile, fileName);
	System.out.println(result);
	if (result) {
	    System.out.println("saving");
	    newP.setPhotoUrl(App.url + fileName);
	    newP.setUpdatedAt(new Date());
	}

	if (branchRelatedPhotosRepository.save(newP) != null) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

}
