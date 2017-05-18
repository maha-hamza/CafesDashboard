package com.websystique.springmvc.services;

import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.OfferTypeDTO;
import com.websystique.springmvc.pojos.OffersAndEventsType;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("OfferTypeService")
public class OfferTypeService extends GenericService<OfferTypeDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(OfferTypeDTO role) {
		OffersAndEventsType saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new OffersAndEventsType();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setDescription(role.getDescription());
			saviour.setType(role.getType());

			String newUUID = "";
			boolean checker = true;
			if (getAllData() == null) {
				newUUID = Utilities.generateRandomUUID();
			} else {
				do {
					newUUID = Utilities.generateRandomUUID();
					OffersAndEventsType exited = offerTypeRepository.checkExistanceOfUUID(newUUID);
					if (exited != null)
						checker = false;
					else if (exited == null)
						checker = true;
				} while (!checker);
			}
			System.out.println(newUUID);
			saviour.setUuid(newUUID);
		} else {
			saviour = offerTypeRepository.findOne(role.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setDescription(role.getDescription());
			saviour.setType(role.getType());

		}
		System.out.println("saving");
		OffersAndEventsType result = offerTypeRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
