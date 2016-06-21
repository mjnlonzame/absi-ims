package com.absi.ims.domain;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="product")
@TableGenerator(name="product", initialValue=1, allocationSize=1)
public class IMSProduct extends Auditable implements Serializable {

	private static final long serialVersionUID = -2764583969088648099L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="product")
	private Long id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "category")
	private String category;
	

	@Column(name = "price", precision = 13, scale = 2)
	private BigDecimal price;
	
	@Column(name="sku")
	private String sku;
	
	@Column(name = "stock_quantity")
	private Long stockQuantity;

	@Column(name = "required_quantity")
	private Long requiredQuantity;

	@Column(name = "weight", precision = 13, scale = 2)
	private BigDecimal weight;
	
//	@JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "client_id", nullable = false, updatable = true, insertable = true)
	private IMSClient client;
	

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public IMSClient getClient() {
		return client;
	}

	public void setClient(IMSClient client) {
		this.client = client;
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



//	public Long getClientId() {
//		return clientId;
//	}
//
//	public void setClientId(Long clientId) {
//		this.clientId = clientId;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
}
