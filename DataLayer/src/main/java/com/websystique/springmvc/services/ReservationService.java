package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.ReservationDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.GuestReservation;
import com.websystique.springmvc.pojos.User;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("ReservationService")
public class ReservationService extends GenericService<ReservationDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(ReservationDTO role) {
		GuestReservation saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new GuestReservation();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setDescription(role.getDescription());
			saviour.setReservationDate(role.getReservationDate());
			saviour.setNumberOfMembers(role.getNumberOfMembers());
			saviour.setReservationTime(role.getReservationTime());
			User u = new User();
			u.setId(role.getUserId());
			Branch branch = new Branch();
			branch.setId(role.getBranchId());
			saviour.setUser(u);
			saviour.setBranch(branch);
			String newUUID = "";
			boolean checker = true;
			if (getAllData() == null) {
				newUUID = Utilities.generateRandomUUIDForRes();
			} else {
				do {
					newUUID = Utilities.generateRandomUUIDForRes();
					GuestReservation exited = reservationRepository.checkExistanceOfUUID(newUUID);
					if (exited != null)
						checker = false;
					else if (exited == null)
						checker = true;
				} while (!checker);
			}
			saviour.setUuid(newUUID);
		} else {
			saviour = reservationRepository.findOne(role.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setDescription(role.getDescription());
			saviour.setReservationDate(role.getReservationDate());
			saviour.setReservationTime(role.getReservationTime());
			saviour.setNumberOfMembers(role.getNumberOfMembers());
			User u = new User();
			u.setId(role.getUserId());
			Branch branch = new Branch();
			branch.setId(role.getBranchId());
			saviour.setUser(u);
			saviour.setBranch(branch);

		}
		System.out.println("saving");
		GuestReservation result = reservationRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}


}
