package com.websystique.springmvc.controller;

import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.websystique.springmvc.dtos.UserLogin;
import com.websystique.springmvc.dtos.UsersDTO;
import com.websystique.springmvc.pojos.Status;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.pojos.UserLoginHistory;
import com.websystique.springmvc.repositories.BranchesRepository;
import com.websystique.springmvc.repositories.UsersRepository;
import com.websystique.springmvc.services.UsersService;

@RestController
public class UsersController {

    @Autowired
    private UsersService usersService;
    @Autowired
    private BranchesRepository branchesRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private EntityManager em;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<UsersDTO> login(@RequestBody String offer, HttpServletRequest request)
	    throws NoSuchAlgorithmException {
	ObjectMapper mapper = new ObjectMapper();
	UserLogin role = null;

	role = mapper.convertValue(offer, UserLogin.class);
	UsersDTO res = usersService.login(role, request);
	if (res != null) {

	    return new ResponseEntity<UsersDTO>(res, HttpStatus.ACCEPTED);

	} else {
	    return new ResponseEntity<UsersDTO>(new UsersDTO(), HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/check-logged-user", method = RequestMethod.GET)
    public Boolean checkLoggedUser(HttpServletRequest request) throws NoSuchAlgorithmException {
	User user = null;
	if (null != request.getSession(false))
	    user = (User) request.getSession(false).getAttribute("ACTIVE_LOGGED_USER");
	if (user != null) {
	    return true;
	} else {
	    return false;
	}
    }

    @RequestMapping(value = "/check-user-status", method = RequestMethod.POST)
    public Boolean checkUserStatus(@RequestBody String email) throws NoSuchAlgorithmException {
	User user = usersRepository.getUserByEmailAndStatus(email);
	if (user != null) {
	    return true;
	} else {
	    return false;
	}
    }

    @Transactional
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ResponseEntity<Void> logout(HttpServletRequest request) throws NoSuchAlgorithmException {
	HttpSession session = request.getSession();
	System.out.println(new Date());
	UserLoginHistory newly = usersService.getUserLoginRecord(session.getId());
	System.out.println(new Date());
	newly.setLogoutTime(new Date());
	// ========
	boolean res = false;
	try {
	    em.merge(newly);
	    res = true;
	} catch (Exception e) {
	    e.printStackTrace();
	}
	// =========
	// UserLoginHistory saving = usersService.saveUserLoginRecord(newly);
	System.out.println(new Date());
	System.out.println("res="+res);
	if (res) {

	    session.invalidate();
	    return new ResponseEntity<Void>(HttpStatus.ACCEPTED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_ACCEPTABLE);
	}
    }

    @RequestMapping(value = "/get-users", method = RequestMethod.GET)
    public List<UsersDTO> getAllUsers() {
	return usersService.loadAllNonDeletedUsers();
    }

    @RequestMapping(value = "/get-deleted-users", method = RequestMethod.GET)
    public List<UsersDTO> getAllDeletedUsers() {
	return usersService.loadAllDeletedUsers();
    }

    @RequestMapping(value = "/get-users_by_branch", method = RequestMethod.POST)
    public List<UsersDTO> getUsersByBranch(@RequestBody String uuid) {
	return usersService.loadUsersByBranch(uuid);
    }

    @RequestMapping(value = "/get-users_by_branchId", method = RequestMethod.POST)
    public List<UsersDTO> getUsersByBranchId(@RequestBody String id) {

	return usersService.loadUsersByBranch(branchesRepository.findOne(Integer.parseInt(id)).getUuid());
    }

    @RequestMapping(value = "/user-functions", method = RequestMethod.POST)
    public ResponseEntity<Void> userFunctions(@RequestBody Object user) {
	System.out.println(user);
	ObjectMapper mapper = new ObjectMapper();
	UsersDTO role = null;

	role = mapper.convertValue(user, UsersDTO.class);
	boolean res = usersService.saveCreateUpdate(role);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }

    @RequestMapping(value = "/user-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete(@PathVariable("id") int id) {

	boolean res = usersService.delete(id);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

    @Transactional
    @RequestMapping(value = "/guest-delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> guestDelete(@PathVariable("id") int id) {

	User user = usersRepository.findOne(id);
	boolean res = false;
	if (null != user) {
	    user.setIsDeleted(Byte.parseByte("1"));
	    Status status = new Status();
	    status.setId(1);
	    user.setStatus(status);
	    user.setUpdatedAt(new Date());
	    res = true;
	    try {
		em.merge(user);
	    } catch (Exception e) {
		res = false;
	    }

	}

	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	}

    }

    /// =============
    @RequestMapping(value = "/user-details", method = RequestMethod.POST)
    public UsersDTO getUserDetails(@RequestBody String uuid) {
	return usersService.getUserDetails(uuid);
    }

    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public ResponseEntity<Void> changePw(@RequestBody Object user) throws NoSuchAlgorithmException {
	ObjectMapper mapper = new ObjectMapper();
	UsersDTO role = null;

	role = mapper.convertValue(user, UsersDTO.class);
	boolean res = usersService.changepw(role);
	if (res) {
	    return new ResponseEntity<Void>(HttpStatus.CREATED);
	} else {
	    return new ResponseEntity<Void>(HttpStatus.CONFLICT);
	}

    }
    // ==========================

    // user checks=====
    @RequestMapping(value = "/check-email-exists", method = RequestMethod.POST)
    public ResponseEntity<Boolean> checkEmail(@RequestBody String email) throws NoSuchAlgorithmException {

	boolean res = usersService.checkEmail(email);

	return new ResponseEntity<Boolean>(res, res == true ? HttpStatus.ACCEPTED : HttpStatus.CONFLICT);

    }

    @RequestMapping(value = "/check-telephone-exists", method = RequestMethod.POST)
    public ResponseEntity<Boolean> checkTelephone(@RequestBody String tel) throws NoSuchAlgorithmException {

	boolean res = usersService.checkUserPhoneExistance(tel);

	return new ResponseEntity<Boolean>(res, res == true ? HttpStatus.ACCEPTED : HttpStatus.CONFLICT);

    }
}
