package com.absi.ims.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.service.IMSUserService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private IMSUserService imsUserService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) authentication;
		IMSUser loggedUser = imsUserService.getIMSUserByUsername(token.getName());
		
		if(!loggedUser.getPassword().equals(token.getCredentials().toString())){
			throw new BadCredentialsException("The credentials are invalid!");
		}
		
		return new UsernamePasswordAuthenticationToken(loggedUser, loggedUser.getPassword(), loggedUser.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.equals(authentication);
	}

}
