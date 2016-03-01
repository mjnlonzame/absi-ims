package com.absi.ims.service;

import java.util.List;

import com.absi.ims.domain.IMSUser;

public interface IMSUserService {

	void addIMSUser(IMSUser imsUser);

	List<IMSUser> getAllIMSUsers();

	IMSUser getIMSUserById(Long id);

	void updateIMSUser(IMSUser imsUser);

	void deleteIMSUser(IMSUser imsUser);

}
