package com.websystique.springmvc.services;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.SftpException;
import com.websystique.springmvc.App;
import com.websystique.springmvc.dtos.OfferRequestForm;
import com.websystique.springmvc.dtos.OffersDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.BranchOffer;
import com.websystique.springmvc.pojos.OffersAndEvent;
import com.websystique.springmvc.pojos.OffersAndEventsType;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("offersService")
public class OffersService extends GenericService<OffersDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	public boolean saveCreateUpdate(OfferRequestForm role, MultipartFile fil) throws SftpException, IOException {
		System.out.println("22");
		OffersAndEvent saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new OffersAndEvent();
			// =================================
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			// ==================================
			System.out.println(role.getOfferType() + "  --");
			if (role.getOfferType() != 0) {
				OffersAndEventsType type = new OffersAndEventsType();
				type.setId(role.getOfferType());
				saviour.setOffersAndEventsType(type);
			}
			// ====================================
			saviour.setDescription(role.getDescription());
			saviour.setTitle(role.getTitle());
			// =======================================
			saviour.setStartAt(new Date(role.getFrom()));
			saviour.setEndAt(new Date(role.getTo()));
			// ========================================
			String newUUID = "";
			boolean checker = true;
			if (getAllData() == null) {
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
			// =================
			if (null != role.getBranches()) {
				List<Integer> branches = role.getBranchz();

				List<BranchOffer> li = new ArrayList<BranchOffer>();
				for (int branchesDTO : branches) {
					System.out.println(branchesDTO);
					BranchOffer off = new BranchOffer();
					Branch b = new Branch();
					b.setId(branchesDTO);
					off.setBranch(b);
					off.setOffersAndEvent(saviour);
					li.add(off);
				}
				saviour.setBranchOffers(li);
			}
			if (fil != null) {

				OffersAndEventsType type = new OffersAndEventsType();
				type.setId(role.getOfferType());
				String fileName = type.getType() + "_" + fil.getOriginalFilename();

				File convFile = new File(fil.getOriginalFilename());
				fil.transferTo(convFile);
				// convFile.createNewFile();
				// FileOutputStream fos = new FileOutputStream(convFile);
				// fos.write(fil.getBytes());
				// fos.close();

				boolean result = App.uploadToS3(convFile, fileName);

				if (result) {
					saviour.setOfferImg(App.url + fileName);
				}

			}
			// =================
		} else {
			// saviour = offersRepository.findOne(role.getId());
			// TODO implement update

		}
		System.out.println("saving");
		OffersAndEvent result = offersRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
