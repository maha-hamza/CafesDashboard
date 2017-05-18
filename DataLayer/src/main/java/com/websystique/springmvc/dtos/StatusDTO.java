package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.Status;

public class StatusDTO extends CommonDTO {

	private String status;
	private String operation;

	public StatusDTO(Status status) {
		super(status.getId(), status.getCreatedAt(), status.getUpdatedAt(), status.getUuid(), status.getIsDeleted());
		this.status = status.getStatus();
	}

	public StatusDTO() {

	}

	public StatusDTO(String id) {
		super.setId(Integer.parseInt(id));
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getOperation() {
		return operation;
	}

	@Override
	public String toString() {
		return "StatusDTO [status=" + status + ", operation=" + operation + "]";
	}

}