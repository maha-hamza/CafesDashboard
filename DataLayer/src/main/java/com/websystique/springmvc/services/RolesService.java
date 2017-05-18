package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.RolesDTO;
import com.websystique.springmvc.pojos.Role;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("rolesService")
public class RolesService extends GenericService<RolesDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(RolesDTO role) {
		Role saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new Role();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setRoleName(role.getRoleName());
			String newUUID = "";
			boolean checker = true;
			do {
				newUUID = Utilities.generateRandomUUID();
				Role exited = rolesRepository.checkExistanceOfUUID(newUUID);
				if (exited != null)
					checker = false;
				else if (exited == null)
					checker = true;
			} while (!checker);
			System.out.println(newUUID);
			saviour.setUuid(newUUID);
		} else {
			saviour = rolesRepository.findOne(role.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setRoleName(role.getRoleName());

		}
		System.out.println("saving");
		Role result = rolesRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
