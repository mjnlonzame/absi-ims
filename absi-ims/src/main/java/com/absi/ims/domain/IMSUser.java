package com.absi.ims.domain;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Version;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Entity
@Table(name="user")
@TableGenerator(name="user", initialValue=0, allocationSize=0)
public class IMSUser extends Auditable implements Serializable, UserDetails {

	private static final long serialVersionUID = -1206154523801426928L;

	@Id
	@Column(name = "id")
/*	@SequenceGenerator(name = "IMSUserSequence", sequenceName = "IMS_USER_SEQUENCE", initialValue = 1)
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "IMSUserSequence")*/
	@GeneratedValue(strategy=GenerationType.TABLE, generator="user")
	private Long id;

	@Size(min=1, max=35)
	@Column(name = "username")
	private String username;
	
	@Size(min=1, max=35)
	@Column(name = "password")
	private String password;
	
	@Size(min=1, max=35)
	@Column(name = "first_name")
	private String firstname;

	@Size(min=1, max=35)
	@Column(name = "middle_name")
	private String middlename;

	@Size(min=1, max=35)
	@Column(name = "last_name")
	private String lastname;

	@Enumerated(EnumType.STRING)
	@Column(name = "gender")
	private Gender gender;
	
	@Size(min=1, max=35)
	@Column(name = "contact_number")
	private String contactNumber;
	
	@Size(min=1, max=200)
	@Column(name = "email_address")
	private String emailAddress;
	
	@Size(min=1, max=1000)
	@Column(name = "address")
	private String address;
	
	@Size(min=1, max=100)
	@Column(name = "city")
	private String city;
	
	@Size(min=1, max=35)
	@Column(name = "postal_code")
	private String postalCode;
	
	@Size(min=1, max=35)
	@Column(name = "user_type")
	private String userType;
	
	@Version
	private Long version;
	
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
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
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

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return AuthorityUtils.createAuthorityList(this.userType);
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
//Check if this is for New of Update
//	public boolean isNew() {
//		return (this.id == null);
//	}
	

}
