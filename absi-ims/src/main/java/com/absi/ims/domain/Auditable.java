package com.absi.ims.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class Auditable {

	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "updated_date")
	private Date updatedDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "created_by_id")
	private IMSUser createdBy;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "updated_by_id")
	private IMSUser updatedBy;

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public IMSUser getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(IMSUser createdBy) {
		this.createdBy = createdBy;
	}

	public IMSUser getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(IMSUser updatedBy) {
		this.updatedBy = updatedBy;
	}

	
}
