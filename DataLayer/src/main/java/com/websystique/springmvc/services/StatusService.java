package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.StatusDTO;
import com.websystique.springmvc.pojos.Status;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("statusService")
public class StatusService extends GenericService<StatusDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(StatusDTO status) {
		System.out.println("inside " + status.getOperation());
		Status saviour = null;
		if (status.getOperation().equalsIgnoreCase("add")) {
			saviour = new Status();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setStatus(status.getStatus());
			String newUUID = "";
			boolean checker = true;
			do {
				newUUID = Utilities.generateRandomUUID();
				Status exited = statusRepository.checkExistanceOfUUID(newUUID);
				if (exited != null)
					checker = false;
				else if (exited == null)
					checker = true;
			} while (!checker);
			System.out.println(newUUID);
			saviour.setUuid(newUUID);
		} else {
			saviour = statusRepository.findOne(status.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setStatus(status.getStatus());
		}
		System.out.println("saving");
		Status result = statusRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}



}
