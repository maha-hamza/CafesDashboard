package com.websystique.springmvc.services.app;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.websystique.springmvc.dtos.app.MenuCategoryDTO;
import com.websystique.springmvc.pojos.MenuCategory;
import com.websystique.springmvc.services.GenericService;

@Service
@Named("MenuAppService")
public class MenuAppService extends GenericService<MenuCategoryDTO> implements Serializable {

	private static final long serialVersionUID = 1L;

	public List<MenuCategoryDTO> getAllCategories() {
		Iterator<MenuCategory> it = brancheCategoryRepository.findAll().iterator();
		List<MenuCategoryDTO> d = new ArrayList<MenuCategoryDTO>();
		while (it.hasNext()) {
			MenuCategory menuCategory = (MenuCategory) it.next();
			if (menuCategory.getIsDeleted() == Byte.parseByte("0"))
				d.add(new MenuCategoryDTO(menuCategory));
		}
		return d;
	}

}
