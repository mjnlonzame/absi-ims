package com.absi.ims.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.service.IMSUserService;

@RunWith(MockitoJUnitRunner.class)
public class IMSUserControllerTest {

    @Mock
	private IMSUserService imsUserService;

	@InjectMocks
	private IMSUserController imsUserController = new IMSUserController();




	
	
	//@Test
//	public void shouldLoadIMSUserList() {
//		// given
//		ExtendedModelMap model = new ExtendedModelMap();
//
//		// when
//		when(imsUserService.getAllIMSUsers()).thenReturn(IMSUserMock.generateIMSUserList());
//		String page = imsUserController.loadIMSUserList(model);
//
//		// then
//		verify(imsUserService).getAllIMSUsers();
//		assertEquals("imsUserList", page);
//	}

	//@Test
//	public void shouldLoadIMSUserForm() {
//		// given
//		ExtendedModelMap model = new ExtendedModelMap();
//		Long id = IMSUserMock.generateIMSUser().getId();
//
//		// when
//		when(imsUserService.getIMSUserById(id)).thenReturn(IMSUserMock.generateIMSUser());
//		String page = imsUserController.loadIMSUserForm(model, id);
//		IMSUser imsUser = (IMSUser) model.get("imsUser");
//
//		// then
//		verify(imsUserService).getIMSUserById(id);
//		assertNotNull(imsUser);
//		assertEquals("imsUserForm", page);
//	}

//	@Test
//	public void shouldSaveIMSUser() {
//		// given
//		IMSUser imsUser = IMSUserMock.generateIMSUser();
//
//		// when
//		String page = imsUserController.saveIMSUser(imsUser);
//
//		// then
//		verify(imsUserService).addIMSUser(imsUser);
//		assertEquals("redirect:/ims-user", page);
//	}
	
	//@Test
//	public void shouldDeleteIMSUser() {
//		// given
//		IMSUser imsUser = IMSUserMock.generateIMSUser();
//		Long id = imsUser.getId();
//		
//		// when
//		when(imsUserService.getIMSUserById(id)).thenReturn(imsUser);
//		String page = imsUserController.deleteIMSUser(id);
//		
//		// then
//		verify(imsUserService).deleteIMSUser(imsUser);
//		assertEquals("redirect:/ims-user", page);
//	}
	
	@Test
	public void shouldUpdateImsUser() {
		// given
		List<IMSUser> users = imsUserService.getAllIMSUsers();
		
		System.out.println("THe size is " + users.size());
	
//		
//		Long id = new Long(2);
//		
//		// when
//		when(imsUserService.getIMSUserById(id)).thenReturn(imsUser);
//		String page = imsUserController.updateIMSUser(imsUser);
//		
//		// then
//		verify(imsUserService).getIMSUserById(id);
//		verify(imsUserService).updateIMSUser(imsUser);
//		assertEquals("redirect:/view/" + id, page);
	}

}
