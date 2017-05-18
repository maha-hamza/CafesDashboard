package com.websystique.springmvc.dtos.app;

import java.util.ArrayList;
import java.util.List;

import com.websystique.springmvc.pojos.Menu;
import com.websystique.springmvc.pojos.MenuCategory;

public class MenuCategoryDTO extends CommonDTO {

	private String category;

	private List<MenuDTO> menus;

	public MenuCategoryDTO() {

	}

	public MenuCategoryDTO(MenuCategory category) {
		super(category.getId(), category.getUuid());
		this.category = category.getCategoryName();
		this.menus = new ArrayList<MenuDTO>();
		for (Menu m : category.getMenus()) {
			if (m.getIsDeleted() == Byte.parseByte("0"))
				menus.add(new MenuDTO(m));
		}
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategory() {
		return category;
	}

	public void setMenus(List<MenuDTO> menus) {
		this.menus = menus;
	}

	public List<MenuDTO> getMenus() {
		return menus;
	}

}
