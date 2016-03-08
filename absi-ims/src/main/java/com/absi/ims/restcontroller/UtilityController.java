package com.absi.ims.restcontroller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.absi.ims.domain.IMSClient;
import com.absi.ims.domain.IMSProduct;
import com.absi.ims.service.IMSClientService;
import com.absi.ims.service.IMSProductService;

@RestController(value="utility")
@Consumes( MediaType.APPLICATION_JSON )
@Produces( MediaType.APPLICATION_JSON )
public class UtilityController {

	@Autowired
	IMSClientService imsClientService;
	@Autowired
	IMSProductService imsProductService;
	
	@RequestMapping(value="/filterClient", method = RequestMethod.POST)
	public ResponseEntity<List<IMSClient>> filterClient(@RequestParam("id") String id){
		System.out.println("id is" + id);
  
    	
		List<IMSClient> clients = imsClientService.retrieveClientByOutletId(Long.valueOf(id));
//    	List<IMSClient> clients = imsClientService.getAllIMSClients();

	 return new ResponseEntity<List<IMSClient>>(clients,HttpStatus.OK);
	}
	
	@RequestMapping(value="/filterProduct", method = RequestMethod.POST)
	public ResponseEntity<List<IMSProduct>> filterProduct(@RequestParam("id") String id){
		List<IMSProduct> products = imsProductService.retrieveProductByClientId(Long.valueOf(id));
		
		return new ResponseEntity<List<IMSProduct>>(products, HttpStatus.OK);
	}
	
}
