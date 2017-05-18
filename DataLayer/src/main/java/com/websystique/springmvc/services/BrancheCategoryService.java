package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.BrancheCategoryDTO;
import com.websystique.springmvc.pojos.MenuCategory;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("BrancheCategoryService")
public class BrancheCategoryService extends GenericService<BrancheCategoryDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(BrancheCategoryDTO role) {
		MenuCategory saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new MenuCategory();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setCategoryName(role.getCategoryName());

			String newUUID = "";
			boolean checker = true;
			do {
				newUUID = Utilities.generateRandomUUID();
				MenuCategory exited = brancheCategoryRepository.checkExistanceOfUUID(newUUID);
				if (exited != null)
					checker = false;
				else if (exited == null)
					checker = true;
			} while (!checker);
			System.out.println(newUUID);
			saviour.setUuid(newUUID);
		} else {
			saviour = brancheCategoryRepository.findOne(role.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setCategoryName(role.getCategoryName());

		}
		System.out.println("saving");
		MenuCategory result = brancheCategoryRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
