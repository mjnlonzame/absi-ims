package com.absi.ims.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Version;
import javax.validation.constraints.Size;


@Entity
@Table(name="outlet")
@TableGenerator(name="outlet", initialValue=1, allocationSize=1)
public class IMSOutlet extends Auditable implements Serializable{

	private static final long serialVersionUID = 6874845063070243430L;
	
	@Id
	@Column(name = "outlet_id")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="outlet")
	private Long id;
	
	@Size(min=1, max=500)
	@Column(name = "outlet_name")
	private String name;
	
	@Size(min=1, max=35)
	@Column(name = "contact_number")
	private String contactNumber;
	
	@Size(min=1, max=1000)
	@Column(name = "outlet_address")
	private String address;
	
	@Size(min=1, max=100)
	@Column(name = "city")
	private String city;
	
	@Size(min=1, max=35)
	@Column(name = "postal_code")
	private String postalCode;
	
//	@OneToMany(mappedBy = "outlet", fetch = FetchType.LAZY)
//	private Set<IMSProduct> products = new HashSet<>();;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "outlet_client",  joinColumns = { 
			@JoinColumn(name = "outlet_id") }, 
			inverseJoinColumns = { @JoinColumn(name = "client_id" , updatable=true
					) })
	private List<IMSClient> clients;
	
	
	
	@Version
	private Long version;
	
	
//	public Set<IMSProduct> getProducts() {
//		return products;
//	}
//
//	public void setProducts(Set<IMSProduct> products) {
//		this.products = products;
//	}

	public Long getVersion() {
		return version;
	}
	
	public void setVersion(Long version) { 	
		this.version = version;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContactNumber() {
		return contactNumber;
	}
	
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getPostalCode() {
		return postalCode;
	}
	
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public List<IMSClient> getClients() {
		return clients;
	}

	public void setClients(List<IMSClient> clients) {
		this.clients = clients;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
	
	
}
