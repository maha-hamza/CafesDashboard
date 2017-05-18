package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.app.BranchesDTO;
import com.websystique.springmvc.pojos.Branch;
import com.websystique.springmvc.pojos.StoreRelatedPhoto;
import com.websystique.springmvc.repositories.BrancheRelatedRepository;
import com.websystique.springmvc.services.GenericService;

@Service
@Named("BranchesAppService")
public class BranchesAppService extends GenericService<BranchesDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private BrancheRelatedRepository brancheRelatedRepository;

	public List<BranchesDTO> getAllBranches() {
		List<BranchesDTO> b = new ArrayList<BranchesDTO>();
		Iterator<Branch> branches = branchRepository.findAll().iterator();
		while (branches.hasNext()) {
			Branch branch = (Branch) branches.next();
			if (branch.getIsDeleted() == Byte.parseByte("0")) {

				BranchesDTO br = new BranchesDTO(branch);

				List<StoreRelatedPhoto> im = brancheRelatedRepository.checkExistanceOfUUID(br.getUuid());
				List<String> images = new ArrayList<String>();
				if (im != null) {
					for (StoreRelatedPhoto img : im) {
						images.add(img.getPhotoUrl());
					}
				}
				br.setImages(images);
				b.add(br);
			}
		}
		return b;
	}

}
