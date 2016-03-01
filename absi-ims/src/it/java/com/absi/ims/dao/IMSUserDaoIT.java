package com.absi.ims.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.infrastructure.BaseIT;

public class IMSUserDaoIT extends BaseIT {

	@Autowired
	private IMSUserDao imsUserDao;

	private IMSUser imsUser1;
	private IMSUser imsUser2;

	@Before
	public void setUp() {
		// given
		imsUser1 = new IMSUser();
		imsUser2 = new IMSUser();

		imsUser1.setFirstname("IMSUser1");
		imsUser2.setFirstname("IMSUser1");

		// when
		imsUserDao.deleteAll();
		imsUserDao.save(Arrays.asList(imsUser1, imsUser2));
	}

	@Test
	public void fetchUser1() {
		Long user1Id = imsUser1.getId();

		IMSUser imsUser = imsUserDao.findOne(user1Id);

		assertEquals(imsUser1.getFirstname(), imsUser.getFirstname());
		assertNotNull(imsUser);
	}

}
