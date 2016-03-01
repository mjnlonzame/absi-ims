package com.absi.ims.mock;

import java.util.ArrayList;
import java.util.List;

import com.absi.ims.domain.IMSUser;

public final class IMSUserMock {

	private IMSUserMock() {
		// final classes should not be instantiated
	}

	public static IMSUser generateIMSUser() {
		IMSUser imsUser = new IMSUser();
		imsUser.setFirstname("Firstname");
		imsUser.setMiddlename("Middlename");
		imsUser.setLastname("Lastname");

		return imsUser;
	}

	public static List<IMSUser> generateIMSUserList() {
		List<IMSUser> imsUserList = new ArrayList<IMSUser>();
		imsUserList.add(generateIMSUser());
		return imsUserList;
	}

}
