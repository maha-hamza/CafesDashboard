package com.websystique.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

import com.jcraft.jsch.SftpException;
import com.websystique.springmvc.App;
import com.websystique.springmvc.dtos.OfferAdminRequest;
import com.websystique.springmvc.dtos.OfferRequest;
import com.websystique.springmvc.dtos.OfferRequestForm;
import com.websystique.springmvc.dtos.OffersDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.BranchOffer;
import com.websystique.springmvc.pojos.OffersAndEvent;
import com.websystique.springmvc.pojos.OffersAndEventsType;
import com.websystique.springmvc.repositories.BrancheOfferRepository;
import com.websystique.springmvc.repositories.BranchesRepository;
import com.websystique.springmvc.repositories.OffersRepository;
import com.websystique.springmvc.services.OffersService;
import com.websystique.springmvc.statics.Utilities;

@RestController
public class OffersController {

    @Autowired
    private OffersService offersService;
    @Autowired
    private OffersRepository offersRepository;
    @Autowired
    private BranchesRepository branchesRepository;

    @Autowired
    private BrancheOfferRepository brancheOfferRepository;

    @RequestMapping(value = "/get-offers", method = RequestMethod.GET)
    public List<OffersDTO> getAllOffers() {
	return offersService.getAllData();
    }

    @RequestMapping(value = "/offer-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> offerFunctions(@RequestParam("offer") @Valid OfferRequestForm offer,
	    @RequestPart("file") MultipartFile fil) throws SftpException, IOException {

	boolean res = offersService.saveCreateUpdate(offer, fil);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/edit-offer-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> offerFunctions(@RequestBody OfferRequest offer) throws SftpException, IOException {
	System.out.println("gaded");
	System.out.println(offer);

	OffersAndEvent offe = offersRepository.findOne(offer.getId());
	offe.setDescription(offer.getDescription());
	offe.setTitle(offer.getTitle());
	offe.setUpdatedAt(new Date());
	offe.setStartAt(offer.getFrom());
	offe.setEndAt(offer.getTo());
	OffersAndEventsType type = new OffersAndEventsType();
	type.setId(offer.getOfferType().getId());
	offe.setOffersAndEventsType(type);
	return offersRepository.save(offe) != null ? new ResponseEntity<Void>(HttpStatus.CREATED)
		: new ResponseEntity<Void>(HttpStatus.CONFLICT);

    }

    @RequestMapping(value = "/add-offer-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> addOfferFunctions(@RequestParam("offer") @Valid OfferAdminRequest offer,
	    @RequestPart("file") MultipartFile fil) throws SftpException, IOException {
	System.out.println("add offer");
	OffersAndEvent saviour = new OffersAndEvent();

	saviour.setCreatedAt(new Date());
	saviour.setUpdatedAt(new Date());
	saviour.setIsDeleted(Byte.parseByte("0"));
	saviour.setDescription(offer.getDescription());
	saviour.setEndAt(new Date(offer.getTo()));
	saviour.setStartAt(new Date(offer.getFrom()));
	saviour.setTitle(offer.getTitle());
	// =====================uuid================
	String newUUID = "";
	boolean checker = true;
	if (offersService.getAllData() == null) {
	    newUUID = Utilities.generateRandomUUID();
	} else {
	    do {
		newUUID = Utilities.generateRandomUUID();
		OffersAndEvent exited = offersRepository.checkExistanceOfUUID(newUUID);
		if (exited != null)
		    checker = false;
		else if (exited == null)
		    checker = true;
	    } while (!checker);
	}
	System.out.println(newUUID);
	saviour.setUuid(newUUID);
	// =========================================

	OffersAndEventsType type = new OffersAndEventsType();
	type.setId(offer.getOfferType());
	saviour.setOffersAndEventsType(type);
	// ==========================================
	List<BranchOffer> li = new ArrayList<BranchOffer>();
	BranchOffer off = new BranchOffer();
	Branch b = new Branch();
	b.setId(offer.getBranch());
	off.setBranch(b);
	off.setOffersAndEvent(saviour);
	li.add(off);

	saviour.setBranchOffers(li);
	// ==============================

	String fileName = "branch_" + offersRepository.findOne(type.getId()).getOffersAndEventsType().getType() + "_"
		+ fil.getOriginalFilename();

	File convFile = new File(fil.getOriginalFilename());
	fil.transferTo(convFile);
	// convFile.createNewFile();
	// FileOutputStream fos = new FileOutputStream(convFile);
	// fos.write(fil.getBytes());
	// fos.close();

	boolean result = App.uploadToS3(convFile, fileName);

	if (result)
	    saviour.setOfferImg(App.url + fileName);

	return offersRepository.save(saviour) != null ? new ResponseEntity<Void>(HttpStatus.CREATED)
		: new ResponseEntity<Void>(HttpStatus.CONFLICT);

    }

    @RequestMapping(value = "/offer-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete(@PathVariable("id") int id) {

	boolean res = offersService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

    @RequestMapping(value = "/get-offers_by_branch", method = RequestMethod.POST)
    public List<OffersDTO> getOffersByBranch(@RequestBody String uuid) {
	System.out.println("get offer by branch");
	List<OffersDTO> off = new ArrayList<>();
	List<BranchOffer> offers = branchesRepository.getBranchByUUID(uuid).getBranchOffers();
	for (BranchOffer offer : offers) {
	    off.add(new OffersDTO(offer.getOffersAndEvent()));
	}

	Collections.sort(off, new Comparator<OffersDTO>() {

	    public int compare(OffersDTO o1, OffersDTO o2) {
		return o2.getId() < o1.getId() ? -1 : 0;
	    }
	});

	for (OffersDTO o : off) {
	    System.out.println(o.getId());
	}

	return off;
    }

    @RequestMapping(value = "/change-offer-or-event-img", method = RequestMethod.POST)
    public ResponseEntity<Void> changeImg(@RequestParam("id") Object id, @RequestPart("file") MultipartFile fil)
	    throws SftpException, IOException {
	OffersAndEvent saviour = offersRepository.findOne(Integer.parseInt((String) id));

	String fileName = saviour.getOffersAndEventsType().getType() + "_" + fil.getOriginalFilename();
	File convFile = new File(fil.getOriginalFilename());
	fil.transferTo(convFile);
	// //convFile.createNewFile();
	// FileOutputStream fos = new FileOutputStream(convFile);
	// fos.write(fil.getBytes());
	// fos.close();
	boolean result = App.uploadToS3(convFile, fileName);

	if (result) {
	    saviour.setOfferImg(App.url + fileName);
	    saviour.setUpdatedAt(new Date());
	}
	// ChannelSftp channelSftp = SFTPUtils.establishSFTPConnection();

	// channelSftp.put(fil.getInputStream(), fileName);

	if (offersRepository.save(saviour) != null) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    // =======================
    @RequestMapping(value = "/assign-branch-to-offer", method = RequestMethod.POST)
    public ResponseEntity<Void> offerFunctions(@RequestParam("offerId") @Valid String offer,
	    @RequestParam("branchId") String branch) throws SftpException, IOException {
	System.out.println(offer + "   " + branch);

	Branch branchObj = branchesRepository.findOne(Integer.parseInt(branch));
	OffersAndEvent offerObj = offersRepository.findOne(Integer.parseInt(offer));

	BranchOffer bro = brancheOfferRepository.check(Integer.parseInt(branch), Integer.parseInt(offer));
	if (null != bro) {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	} else {
	    BranchOffer bo = new BranchOffer();
	    bo.setBranch(branchObj);
	    bo.setOffersAndEvent(offerObj);
	    branchObj.addBranchOffer(bo);

	    boolean res = branchesRepository.save(branchObj) != null ? true : false;
	    if (res) {
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	    } else {
		return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	    }
	}
    }

    // ===========================================
    @RequestMapping(value = "/remove-branch-from-offer", method = RequestMethod.POST)
    public ResponseEntity<Void> removeBranchFromOffer(@RequestParam("offer") @Valid String offer,
	    @RequestParam("branch") String branch) throws SftpException, IOException {
	System.out.println(offer + " -  " + branch);

	BranchOffer bro = brancheOfferRepository.check(Integer.parseInt(branch), Integer.parseInt(offer));
	System.out.println(bro);
	if (null != bro) {
	    brancheOfferRepository.delete(bro.getId());
	    System.out.println("deleted");
	    return new ResponseEntity<Void>(HttpStatus.ACCEPTED);
	} else {
	    System.out.println("locked");
	    return new ResponseEntity<Void>(HttpStatus.LOCKED);
	}

    }
}
