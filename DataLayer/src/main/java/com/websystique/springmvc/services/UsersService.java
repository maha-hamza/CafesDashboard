package com.websystique.springmvc.services;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.TelephoneDTO;
import com.websystique.springmvc.dtos.UserLogin;
import com.websystique.springmvc.dtos.UsersDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.City;
import com.websystique.springmvc.pojos.Country;
import com.websystique.springmvc.pojos.Role;
import com.websystique.springmvc.pojos.Status;
import com.websystique.springmvc.pojos.Telephone;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.pojos.UserLoginHistory;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("usersService")
public class UsersService extends GenericService<UsersDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	private void fillBasicData(User saviour, UsersDTO role) throws NoSuchAlgorithmException {
		saviour.setUpdatedAt(new Date());
		saviour.setIsDeleted(Byte.valueOf("0"));
		// fill extra new data
		saviour.setAddress(role.getAddress());
		saviour.setBirthdate(role.getBirthDate());
		City c = new City();
		c.setId(role.getCity().getId());
		saviour.setCity(c);
		Country co = new Country();
		co.setId(role.getCountry().getId());
		saviour.setCountry(co);
		saviour.setEmail(role.getEmail());
		saviour.setFName(role.getfName());
		saviour.setLName(role.getlName());
		saviour.setGender(role.getGender());
		// ======assign role to user====
		Role roleN = null;
		if (null != role.getRole()) {
			roleN = new Role();
			roleN.setId(role.getRole().getId());
			saviour.setRole(roleN);
		} else {
			// guest
			roleN = new Role();
			roleN.setId(3);
			saviour.setRole(roleN);
		}
		// ====== assign status to user===
		Status status = new Status();
		status.setId(role.getStatus().getId());
		saviour.setStatus(status);
		// ========password=============
		if (null != role.getPassword() && role.getOperation().equals("add")) {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(role.getPassword().getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			saviour.setPassword(sb.toString());
		}
		// ===================================
		// law 3andy branch wa howa mesh general admin

		if (null != role.getBranch() && (roleN.getId() != 1)) {
			Branch branch = new Branch();
			branch.setId(role.getBranch().getId());
			saviour.setBranch(branch);
		} else if (role.getBranch() == null && role.getOperation().equals("edit")) {
			saviour.setBranch(null);
		}

	}

	private void fillAdd(User saviour, UsersDTO role) {

		// fill basic related Data
		saviour.setCreatedAt(new Date());
		try {
			fillBasicData(saviour, role);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// ====== assign uuid to user=========
		String userUUID = "";
		boolean userUUIDChecker = true;
		if (getAllData() == null) {
			userUUID = Utilities.generateRandomUUID();
		} else {
			do {
				userUUID = Utilities.generateRandomUUID();
				User exited = usersRepository.checkExistanceOfUUID(userUUID);
				if (exited != null)
					userUUIDChecker = false;
				else if (exited == null)
					userUUIDChecker = true;
			} while (!userUUIDChecker);
		}
		saviour.setUuid(userUUID);
		// ======= add phone numbers to user========
		List<Telephone> telList = new ArrayList<Telephone>();
		for (TelephoneDTO dto : role.getTelephone()) {
			Telephone t = new Telephone();
			t.setCreatedAt(new Date());
			t.setUpdatedAt(new Date());
			t.setNumber(dto.getNumber());
			t.setType(dto.getType());
			t.setUser(saviour);
			telList.add(t);
		}
		saviour.setTelephones(telList);
	}

	private void fillEdit(User saviour, UsersDTO role) {

		try {
			fillBasicData(saviour, role);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// ========add/edit telephones====
		List<Telephone> telList = new ArrayList<Telephone>();
		// -----------------
		// small edit, before adding new,
		// 1- get all phones related to this branch
		List<Telephone> telephones = saviour.getTelephones();
		boolean indicator = false;
		for (Telephone telephone : telephones) {
			for (TelephoneDTO tel : role.getTelephone()) {
				if (telephone.getNumber().equals(tel.getNumber())) {
					indicator = true;
				}
			}
			System.out.println(indicator + "  indicator");
			if (!indicator) {
				System.out.println("inside");
				Telephone tel = telephoneRepository.checkExistanceOfPhoneOfUser(telephone.getNumber());
				System.out.println("to delete" + tel);
				telephoneRepository.deleteT(tel.getId());
			}
			indicator = false;
		}
		System.out.println("proc 2 = " + new Date());
		// -------------------
		for (TelephoneDTO dto : role.getTelephone()) {
			Telephone existed = telephoneRepository.checkExistanceOfPhone(dto.getId());
			// add new to list
			if (null == existed) {
				existed = new Telephone();
				existed.setCreatedAt(new Date());
				existed.setNumber(dto.getNumber());
				existed.setType(dto.getType());
				existed.setUpdatedAt(new Date());
				existed.setUser(saviour);
				telList.add(existed);
			} else {

				existed.setNumber(dto.getNumber());
				existed.setType(dto.getType());
				existed.setUpdatedAt(new Date());
				existed.setUser(saviour);
				telList.add(existed);
			}
		}
		saviour.setTelephones(telList);
	}

	public boolean saveCreateUpdate(UsersDTO role) {
		User saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new User();
			fillAdd(saviour, role);
		} else {
			saviour = usersRepository.findOne(role.getId());
			fillEdit(saviour, role);
		}

		System.out.println("saving");
		User result = usersRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

	public UsersDTO login(UserLogin role, HttpServletRequest request) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(role.getPassword().getBytes());
		byte byteData[] = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		User _userDetails = (User) usersRepository.login(role.getEmail(), sb.toString());
		if (_userDetails != null) {

			handleUserLogin(_userDetails, request);
			return new UsersDTO(_userDetails);

		}

		return null;
	}

	private void handleUserLogin(User user, HttpServletRequest request) {
		System.out.println("handleuserlogin");
		String activeUserUniqueID = createUserSession(user, request);
		storeUserLoginStatus(user, activeUserUniqueID);

	}

	private String createUserSession(User user, HttpServletRequest request) {
		System.out.println("createusersession");
		Map<String, User> activeUserSession = new HashMap<String, User>();
		activeUserSession.put(request.getSession().getId(), user);
		request.getSession(true).setAttribute("ACTIVE_USER", activeUserSession);
		request.getSession(false).setAttribute("ACTIVE_LOGGED_USER", user);
		request.getSession(false).setAttribute("USER_DETAILS", user.toString());
		return request.getSession().getId();

	}

	private void storeUserLoginStatus(User user, String activeUserUniqueID) {
		System.out.println("storeuserloginstatus");
		UserLoginHistory loginAudit = new UserLoginHistory();
		loginAudit.setUser(user);
		loginAudit.setLoginTime(new Date());
		loginAudit.setUserSessionId(activeUserUniqueID);

		userLoginHistoryRepository.save(loginAudit);
	}

	public UserLoginHistory getUserLoginRecord(String sid) {
		return userLoginHistoryRepository.getUserLoginHistory(sid);
	}

	public UserLoginHistory saveUserLoginRecord(UserLoginHistory sid) {
		return userLoginHistoryRepository.save(sid);
	}

	public UsersDTO getUserDetails(String uuid) {
		return new UsersDTO(usersRepository.getUserDetails(uuid));
	}

	public Boolean checkUserPhoneExistance(String tel) {
		return telephoneRepository.checkExistanceOfPhoneOfUser(tel) == null ? false : true;
	}

	public List<UsersDTO> loadUsersByBranch(String uuid) {
		List<User> users = usersRepository.getUserListByBranchID(uuid, "GUEST");
		List<UsersDTO> dtos = new ArrayList<UsersDTO>();
		for (User user : users) {
			dtos.add(new UsersDTO(user));
		}
		
		Collections.sort(dtos, new Comparator<UsersDTO>() {

			public int compare(UsersDTO o1, UsersDTO o2) {
				return o2.getId() < o1.getId() ? -1 : 0;
			}
		});
		
		return dtos;
	}

	public List<UsersDTO> loadAllNonDeletedUsers() {
		List<User> users = usersRepository.loadAllNonDeletedUsers();
		List<UsersDTO> dtos = new ArrayList<UsersDTO>();
		for (User user : users) {
			dtos.add(new UsersDTO(user));
		}

		Collections.sort(dtos, new Comparator<UsersDTO>() {

			public int compare(UsersDTO o1, UsersDTO o2) {
				return o2.getId() < o1.getId() ? -1 : 0;
			}
		});

		return dtos;
	}

	public List<UsersDTO> loadAllDeletedUsers() {
		List<User> users = usersRepository.loadAllDeletedUsers();
		List<UsersDTO> dtos = new ArrayList<UsersDTO>();
		for (User user : users) {
			dtos.add(new UsersDTO(user));
		}

		Collections.sort(dtos, new Comparator<UsersDTO>() {

			public int compare(UsersDTO o1, UsersDTO o2) {
				return o2.getId() < o1.getId() ? -1 : 0;
			}
		});

		return dtos;
	}

	public boolean changepw(UsersDTO role) throws NoSuchAlgorithmException {
		User user = usersRepository.findOne(role.getId());
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(role.getPassword().getBytes());
		byte byteData[] = md.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		user.setPassword(sb.toString());
		return usersRepository.save(user) != null ? true : false;
	}

	public boolean checkEmail(String email) {

		return usersRepository.checkEmailExisted(email) != null ? true : false;
	}

	public void updateLogout(String sid) {
		UserLoginHistory history = userLoginHistoryRepository.getUserLoginHistory(sid);
		if (history != null) {
			history.setLogoutTime(new Date());
			userLoginHistoryRepository.save(history);
		}
	}

}
