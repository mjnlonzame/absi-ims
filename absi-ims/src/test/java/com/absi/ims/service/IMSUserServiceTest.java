package com.absi.ims.service;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.util.Assert.notEmpty;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import com.absi.ims.dao.IMSUserDao;
import com.absi.ims.domain.IMSUser;
import com.absi.ims.mock.IMSUserMock;

@RunWith(MockitoJUnitRunner.class)
public class IMSUserServiceTest {
	
	@Mock
	private IMSUserDao imsUserDao;

	@InjectMocks
	private IMSUserService imsUserService = new IMSUserServiceImpl();
	
	//@Test
	public void shouldGetAllIMSUsers() {
		// given

		// when
		when(imsUserDao.findAll()).thenReturn(IMSUserMock.generateIMSUserList());
		List<IMSUser> imsUserList = imsUserService.getAllIMSUsers();

		// then
		notEmpty(imsUserList);
		verify(imsUserDao).findAll();
	}

	@Test
	public void shouldAddImsUser() {
		// given
		IMSUser imsUserMock = IMSUserMock.generateIMSUser();

		// when
		imsUserService.addIMSUser(imsUserMock);

		// then
		verify(imsUserDao).save(imsUserMock);
	}

	//@Test
	public void shouldLoadIMSUser() {
		// given
		Long id = 1L;

		// when
		when(imsUserDao.findOne(id)).thenReturn(IMSUserMock.generateIMSUser());
		IMSUser imsUser = imsUserService.getIMSUserById(id);

		// then
		assertNotNull(imsUser);
		verify(imsUserDao).findOne(id);
	}

	//@Test
	public void shouldUpdateIMSUser() {
		// given
		IMSUser imsUser = IMSUserMock.generateIMSUser();

		// when
		imsUserService.updateIMSUser(imsUser);

		// then
		verify(imsUserDao).save(imsUser);
	}

	//@Test
	public void shouldDeleteIMSUser() {
		// given
		IMSUser imsUser = IMSUserMock.generateIMSUser();

		// when
		imsUserService.deleteIMSUser(imsUser);

		// then
		verify(imsUserDao).delete(imsUser);
	}
}
