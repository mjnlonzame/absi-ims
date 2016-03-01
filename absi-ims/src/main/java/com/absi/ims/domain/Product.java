package com.absi.ims.domain;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product extends Auditable implements Serializable {

	private static final long serialVersionUID = -2764583969088648099L;

	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "ProductSequence", sequenceName = "PRODUCT_SEQUENCE", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "ProductSequence")
	private Long id;

	@Column(name = "description")
	private String description;

	@Column(name = "price", precision = 13, scale = 2)
	private BigDecimal price;

	@Column(name = "stock_quantity")
	private Long stockQuantity;

	@Column(name = "required_quantity")
	private Long requiredQuantity;

	@Column(name = "weight", precision = 13, scale = 2)
	private BigDecimal weight;
	
	@Column(name = "assigned_client_id")
	private IMSUser assignedClient;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Long getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(Long stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public Long getRequiredQuantity() {
		return requiredQuantity;
	}

	public void setRequiredQuantity(Long requiredQuantity) {
		this.requiredQuantity = requiredQuantity;
	}

	public BigDecimal getWeight() {
		return weight;
	}

	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}

	public IMSUser getAssignedClient() {
		return assignedClient;
	}

	public void setAssignedClient(IMSUser assignedClient) {
		this.assignedClient = assignedClient;
	}

}
