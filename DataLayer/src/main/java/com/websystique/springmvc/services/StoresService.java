package com.websystique.springmvc.services;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;

import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.SftpException;
import com.websystique.springmvc.App;
import com.websystique.springmvc.dtos.StoresDTO;
import com.websystique.springmvc.pojos.Store;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("storesService")
public class StoresService extends GenericService<StoresDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(StoresDTO role, MultipartFile fil) throws SftpException, IOException {
		Store saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new Store();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setStoreName(role.getStoreName());
			saviour.setDescription(role.getDescription());
			String newUUID = "";
			boolean checker = true;
			do {
				newUUID = Utilities.generateRandomUUID();
				Store exited = storesRepository.checkExistanceOfUUID(newUUID);
				if (exited != null)
					checker = false;
				else if (exited == null)
					checker = true;
			} while (!checker);
			System.out.println(newUUID);
			saviour.setUuid(newUUID);
		} else {
			saviour = storesRepository.findOne(role.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setStoreName(role.getStoreName());
			saviour.setDescription(role.getDescription());
			// ================================

			// ==================Using new SFTP server=====================
			System.out.println("1");
			String fileName = "itsagrind_" + fil.getOriginalFilename();

			File convFile = new File(fil.getOriginalFilename());
			System.out.println(fil);
			fil.transferTo(convFile);

			System.out.println("2");
//			FileOutputStream fos = new FileOutputStream(convFile);
//			fos.write(fil.getBytes());
//			fos.close();
			System.out.println("3");

			System.out.println("before");
			boolean result = App.uploadToS3(convFile, fileName);
			System.out.println(result);
			if (result) {
				System.out.println("saving");
				saviour.setLogoUrl(App.url + fileName);
				saviour.setUpdatedAt(new Date());
			}

		}

		Store result = storesRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

}
