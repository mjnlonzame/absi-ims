package com.absi.ims.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="inventory")
@TableGenerator(name="inventory", initialValue=1, allocationSize=1)
public class IMSInventory {
	@Id
	@Column(name = "inventory_id")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="inventory")
	private Long id;
	
	@Column(name = "out_of_stock_days")
	private Long outOfStockDay;
	@Column(name = "previous_stock")
	private Long previousStock;
	@Column(name = "delivered_item")
	private Long deliveredItem;
	@Column(name = "shelves_item")
	private Long shelvesItem;
	@Column(name = "warehouse_item")
	private Long warehouseItem;
	@Column(name = "gondola_item")
	private Long gondolaItem;
	
	@Column(name = "amount_offtake")
	private BigDecimal amountOfftake;
	@Column(name = "stock_offtake")
	private Long stockOfftake;
	@Column(name = "inventory_type")
	private String type;
	
	
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date period;
	
	
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date startPeriod;
	
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date endPeriod;
	
	
	@OneToOne(cascade = CascadeType.ALL )
	private IMSOutlet outlet;
	@OneToOne(cascade = CascadeType.ALL)
	private IMSClient client;
	@OneToOne(cascade = CascadeType.ALL)
	private IMSProduct product;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getOutOfStockDay() {
		return outOfStockDay;
	}
	public void setOutOfStockDay(Long outOfStockDay) {
		this.outOfStockDay = outOfStockDay;
	}
	public Long getPreviousStock() {
		return previousStock;
	}
	public void setPreviousStock(Long previousStock) {
		this.previousStock = previousStock;
	}
	public Long getDeliveredItem() {
		return deliveredItem;
	}
	public void setDeliveredItem(Long deliveredItem) {
		this.deliveredItem = deliveredItem;
	}
	public Long getShelvesItem() {
		return shelvesItem;
	}
	public void setShelvesItem(Long shelvesItem) {
		this.shelvesItem = shelvesItem;
	}
	public Long getWarehouseItem() {
		return warehouseItem;
	}
	public void setWarehouseItem(Long warehouseItem) {
		this.warehouseItem = warehouseItem;
	}
	public Long getGondolaItem() {
		return gondolaItem;
	}
	public void setGondolaItem(Long gondolaItem) {
		this.gondolaItem = gondolaItem;
	}
	public BigDecimal getAmountOfftake() {
		return amountOfftake;
	}
	public void setAmountOfftake(BigDecimal amountOfftake) {
		this.amountOfftake = amountOfftake;
	}
	public Long getStockOfftake() {
		return stockOfftake;
	}
	public void setStockOfftake(Long stockOfftake) {
		this.stockOfftake = stockOfftake;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public IMSOutlet getOutlet() {
		return outlet;
	}
	public void setOutlet(IMSOutlet outlet) {
		this.outlet = outlet;
	}
	public IMSClient getClient() {
		return client;
	}
	public void setClient(IMSClient client) {
		this.client = client;
	}
	public IMSProduct getProduct() {
		return product;
	}
	public void setProduct(IMSProduct product) {
		this.product = product;
	}
	public Date getPeriod() {
		return period;
	}
	
	@Column(name = "inventory_period")
	public void setPeriod(Date period) {
		this.period = new Date(period.getTime());
	}
	public Date getStartPeriod() {
		return startPeriod;
	}
	
	@Column(name = "start_period")
	public void setStartPeriod(Date startPeriod) {
		this.startPeriod = new Date(startPeriod.getTime());
	}
	public Date getEndPeriod() {
		return endPeriod;
	}
	
	@Column(name = "end_period")
	public void setEndPeriod(Date endPeriod) {
		this.endPeriod = new Date(endPeriod.getTime());
	}
	
	
	
	
}
