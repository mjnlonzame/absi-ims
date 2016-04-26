package com.absi.ims.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.service.IMSUserService;

@Component
public class CustomerUserDetailsService implements UserDetailsService{

	@Autowired
	private IMSUserService imsUserService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
//		IMSUser loggedUser = imsUserService.getIMSUserByUsername(username);
//		return new User(loggedUser.getUsername(), loggedUser.getPassword(), AuthorityUtils.createAuthorityList(loggedUser.getUserType()));
		return imsUserService.getIMSUserByUsername(username);
	}

}
