package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.app.ReservationDTO;
import com.websystique.springmvc.pojos.GuestReservation;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.services.GenericService;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("ReservationAppService")
public class ReservationAppService extends GenericService<ReservationDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public String placeReservation(ReservationDTO reservation) {
		GuestReservation saviour = new GuestReservation();
		// ====================================
		saviour.setCreatedAt(new Date());
		saviour.setUpdatedAt(new Date());
		saviour.setIsDeleted(Byte.valueOf("0"));
		// ===========================================
		saviour.setDescription(reservation.getDescription());
		// ===================================================
		saviour.setReservationDate(reservation.getReservationDate());
		saviour.setReservationTime(reservation.getReservationTime());
		// ==================================================
		saviour.setNumberOfMembers(reservation.getNumberOfMembers());
		// =========================================
		User u = new User();
		u.setId(usersRepository.checkExistanceOfUUID(reservation.getUserUUID()).getId());
		saviour.setUser(u);
		// ===========================================
		saviour.setBranch(branchRepository.getBranchByUUID(reservation.getBranchUUID()));
		// =============================================
		String newUUID = "";
		boolean checker = true;
		if (getAllData() == null) {
			newUUID = Utilities.generateRandomUUID();
		} else {
			do {
				newUUID = Utilities.generateRandomUUID();
				GuestReservation exited = reservationRepository.checkExistanceOfUUID(newUUID);
				if (exited != null)
					checker = false;
				else if (exited == null)
					checker = true;
			} while (!checker);
		}
		saviour.setUuid(newUUID);
		// =================================
		GuestReservation result = reservationRepository.save(saviour);
		if (result != null) {
			return newUUID;
		} else {
			return "";
		}
	}
}
