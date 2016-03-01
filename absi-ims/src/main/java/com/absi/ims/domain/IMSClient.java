package com.absi.ims.domain;

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
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="client")
@TableGenerator(name="client", initialValue=1, allocationSize=1)
public class IMSClient {
	@Id
	@Column(name = "client_id")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="client")
	private Long id;
	
	@Size(min=1, max=500)
	@Column(name = "client_name")
	private String name;
	
	@Size(min=1, max=30)
	@Column(name = "client_phonenumber")
	private String phoneNumber;
	
	@Size(min=1, max=50)
	@Column(name = "client_email")
	private String email;
	
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "outlet_client",  joinColumns = { 
			@JoinColumn(name = "client_id") }, 
			inverseJoinColumns = { @JoinColumn(name = "outlet_id" , updatable=true
					) })
	private List<IMSOutlet> outlets;
	
	
	
	
	
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<IMSOutlet> getOutlets() {
		return outlets;
	}
	public void setOutlets(List<IMSOutlet> outlets) {
		this.outlets = outlets;
	}

	
	
	

	
	
	
}
