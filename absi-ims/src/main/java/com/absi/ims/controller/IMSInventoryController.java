package com.absi.ims.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.absi.ims.domain.IMSClient;
import com.absi.ims.domain.IMSInventory;
import com.absi.ims.domain.IMSOutlet;
import com.absi.ims.domain.IMSProduct;
import com.absi.ims.service.IMSClientService;
import com.absi.ims.service.IMSInventoryService;
import com.absi.ims.service.IMSOutletService;
import com.absi.ims.service.IMSProductService;



@Controller
@RequestMapping(value = "/ims-inventory")
public class IMSInventoryController {
	private static final Logger logger = LoggerFactory.getLogger(IMSInventoryController.class);
	private static final String SAVE_ACTION = "/ims-inventory/save";
	private static final String UPDATE_ACTION = "/ims-inventory/update";
	
	@Autowired
	private IMSInventoryService imsInventoryService;
	
	@Autowired 
	private IMSClientService imsClientService;
	
	@Autowired 
	private IMSProductService imsProductService;
	
	@Autowired 
	private IMSOutletService imsOutletService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String loadIMSInventories(Model model) {
		logger.info("Getting all IMS Users");
		List<IMSClient> clients = imsClientService.getAllIMSClients();
		model.addAttribute("clients", clients);
		model.addAttribute("imsInventoryList", imsInventoryService.getAllIMSInventories());
		return "imsInventoryList";
	}
	
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String loadIMSInventoryForm(Model model) {
		logger.info("Creating new IMS Inventory");

		IMSInventory imsInventory = new IMSInventory();
		List<IMSClient> clients = imsClientService.getAllIMSClients();
		List<IMSProduct> products =imsProductService.getAllIMSProducts();
		List<IMSOutlet> outlets = imsOutletService.getAllIMSOutlets();
		model.addAttribute("clients", clients);
		model.addAttribute("products", products);
		model.addAttribute("outlets", outlets);
		model.addAttribute("imsInventory", imsInventory);
		model.addAttribute("action", SAVE_ACTION);

		buildModel(model, imsInventory, SAVE_ACTION);
		return "imsNewInventoryForm";
	}



	
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveIMSInventory(@Valid @ModelAttribute("imsInventory") IMSInventory imsInventory, BindingResult result, Model model,
			RedirectAttributes redirectAttributes) {
		IMSClient client = imsClientService.getIMSClientById(imsInventory.getClient().getId());
		IMSOutlet outlet = imsOutletService.getIMSOutletById(imsInventory.getOutlet().getId());
		IMSProduct product = imsProductService.getIMSProductById(imsInventory.getProduct().getId());
		imsInventory.setClient(client);
		imsInventory.setOutlet(outlet);
		imsInventory.setProduct(product);
		imsInventoryService.addIMSInventory(imsInventory);
		
		
		return "redirect:/ims-inventory/new";
	}
	
	
	@RequestMapping(value="/retrievePrevious", method = RequestMethod.POST)
	public ResponseEntity<IMSInventory> retrievePreviousInventoryByProductId(@RequestParam("productId") String productId, @RequestParam("period") String period){
		System.out.println("period is " + period);
		DateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		Date date = new Date();
		try {
			date = formatter.parse(period);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		IMSInventory inventory =  imsInventoryService.retrieveInventoryByProductId(Long.valueOf(productId), date);
		if(inventory == null){
			inventory = new IMSInventory();
			inventory.setOutOfStockDay(new Long(0));
			inventory.setStockOfftake(new Long(0));
			return new ResponseEntity<IMSInventory>(inventory, HttpStatus.OK);
		}
		return new ResponseEntity<IMSInventory>(inventory, HttpStatus.OK);
	}
	
	@RequestMapping(value="/retrieveInventories", method = RequestMethod.POST)
	public ResponseEntity<List<IMSInventory>> retrieveInventoriesByProductId(@RequestParam("productId") String productId, @RequestParam("periods[]") String[] periods){
		System.out.println("period is " + periods);	
		DateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		Date date = new Date();
		List<Date> dates = new ArrayList<Date>();
		try {
			for(String period : periods){
				dates.add(formatter.parse(period));
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		List<IMSInventory> inventories =  imsInventoryService.retrieveInventoriesByProductId(Long.valueOf(productId), dates);
		
		return new ResponseEntity<List<IMSInventory>>(inventories, HttpStatus.OK);
	}
	
	

	private void buildModel(Model model, IMSInventory imsInventory, String action) {
		model.addAttribute("action", action);
		model.addAttribute("imsInventory", imsInventory);
	}
	
	
//	@ModelAttribute("clients")
//	public List<IMSClient> populateClients(){
//		return imsClientService.getAllIMSClients();
//	}
//	
//	@ModelAttribute("outlets")
//	public List<IMSOutlet> populateOutlets(){
//		return imsOutletService.getAllIMSOutlets();
//	}
//	
//	@ModelAttribute("products")
//	public List<IMSProduct> populateProducts(){
//		return imsProductService.getAllIMSProducts();
//	}
//	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		CustomDateEditor formmated = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, formmated );
	}
}


