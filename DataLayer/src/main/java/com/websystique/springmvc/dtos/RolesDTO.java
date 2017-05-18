package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.Role;

public class RolesDTO extends CommonDTO {

	private String roleName;
	private String operation;

	public RolesDTO() {

	}

	public RolesDTO(String id) {
		super.setId(Integer.parseInt(id));
	}

	public RolesDTO(Role role) {
		super(role.getId(), role.getCreatedAt(), role.getUpdatedAt(), role.getUuid(), role.getIsDeleted());
		this.roleName = role.getRoleName();

	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}