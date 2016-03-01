package com.absi.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.absi.ims.domain.IMSClient;
import com.absi.ims.service.IMSClientService;

@Controller
@RequestMapping(value = "/ims-client")
public class IMSClientController {
	@Autowired
	private IMSClientService imsClientService;
	
	@RequestMapping(method = RequestMethod.POST, value = "/update")
	public String updateIMSClient(IMSClient imsClient) {
		
		IMSClient imsClient1 = new IMSClient();
		imsClient1.setEmail("sm");
		imsClient1.setEmail("sm@yahoo.com");
		imsClient1.setPhoneNumber("1234567");
		
		
		imsClientService.addIMSClient(imsClient1);
		
		return null;
	}
	

	
	
	
}
