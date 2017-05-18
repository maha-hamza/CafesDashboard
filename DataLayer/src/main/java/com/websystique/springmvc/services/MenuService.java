package com.websystique.springmvc.services;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.SftpException;
import com.websystique.springmvc.App;
import com.websystique.springmvc.dtos.MenusDTO;
import com.websystique.springmvc.pojos.Menu;
import com.websystique.springmvc.pojos.MenuCategory;
import com.websystique.springmvc.statics.Utilities;

@Service
@Named("MenuService")
public class MenuService extends GenericService<MenusDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public boolean saveCreateUpdate(MenusDTO role, MultipartFile fil) throws SftpException, IOException {
		Menu saviour = null;
		if (role.getOperation().equalsIgnoreCase("add")) {
			saviour = new Menu();
			saviour.setCreatedAt(new Date());
			saviour.setUpdatedAt(new Date());
			saviour.setIsDeleted(Byte.valueOf("0"));
			saviour.setItemDescription(role.getItemDescription());
			saviour.setItemName(role.getItemName());
			saviour.setItemPrice(role.getItemPrice());
			MenuCategory category = new MenuCategory();
			category.setId(role.getCategory().getId());
			saviour.setMenuCategory(category);

			String newUUID = "";
			boolean checker = true;
			if (getAllData() == null) {
				newUUID = Utilities.generateRandomUUID();
			} else {
				do {
					newUUID = Utilities.generateRandomUUID();
					Menu exited = menuRepository.checkExistanceOfUUID(newUUID);
					if (exited != null)
						checker = false;
					else if (exited == null)
						checker = true;
				} while (!checker);
			}
			System.out.println(newUUID);
			saviour.setUuid(newUUID);
		} else {
			saviour = menuRepository.findOne(role.getId());
			saviour.setUpdatedAt(new Date());
			saviour.setItemDescription(role.getItemDescription());
			saviour.setItemName(role.getItemName());
			saviour.setItemPrice(role.getItemPrice());
			MenuCategory category = new MenuCategory();
			category.setId(role.getCategory().getId());
			saviour.setMenuCategory(category);

		}
		if (fil != null) {

			String fileName = "menu_" + fil.getOriginalFilename();

			File convFile = new File(fil.getOriginalFilename());
			fil.transferTo(convFile);

			boolean result = App.uploadToS3(convFile, fileName);

			if (result)
				saviour.setImg(App.url + fileName);

		}
		saviour.setItemType(role.getType());
		System.out.println("saving");
		Menu result = menuRepository.save(saviour);
		if (result != null) {
			return true;
		} else {
			return false;
		}
	}

	public List<MenusDTO> loadItemsByStore(String uuid) {
		// List<Item> items = branchItemRepository.getItemsByStore(uuid);
		// List<MenusDTO> menus = new ArrayList<MenusDTO>();
		// for (BranchItem b : items) {
		// menus.add(new MenusDTO(b.getBranchMenu()));
		// }
		// return menus;
		return null;
	}

}
