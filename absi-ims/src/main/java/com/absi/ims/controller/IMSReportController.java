package com.absi.ims.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.absi.ims.domain.IMSClient;
import com.absi.ims.domain.IMSInventory;
import com.absi.ims.domain.IMSOutlet;
import com.absi.ims.domain.IMSProduct;
import com.absi.ims.service.IMSClientService;
import com.absi.ims.service.IMSInventoryService;
import com.absi.ims.service.IMSOutletService;
import com.absi.ims.service.IMSProductService;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping(value = "/ims-report")
public class IMSReportController {
	@Autowired
	private IMSInventoryService imsInventoryService;
	
	@Autowired 
	private IMSClientService imsClientService;
	
	@Autowired 
	private IMSProductService imsProductService;
	
	@Autowired 
	private IMSOutletService imsOutletService;

	private static final String GENERATE_ACTION = "/ims-reports/generatexls";
	

	
	@RequestMapping(value = "/generate", method = RequestMethod.GET)
	public String loadReportForm(Model model) {


		List<IMSClient> clients = imsClientService.getAllIMSClients();
		List<IMSProduct> products =imsProductService.getAllIMSProducts();
		List<IMSOutlet> outlets = imsOutletService.getAllIMSOutlets();
		model.addAttribute("clients", clients);
		model.addAttribute("products", products);
		model.addAttribute("outlets", outlets);
		model.addAttribute("action", GENERATE_ACTION);
		
		
		return "imsReportForm";
	}
	
    @RequestMapping(method = RequestMethod.GET , value = "/weeklyxls/{clientId}/{startPeriod}/{endPeriod}")
    public ModelAndView generateWeeklyXlsReport(ModelAndView modelAndView, @PathVariable("clientId") String clientId, @PathVariable("startPeriod") String startPeriod, @PathVariable("endPeriod") String endPeriod){
        Map<String,Object> parameterMap = new HashMap<String,Object>();

		DateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		Date start = new Date();
		Date end = new Date();
		try {
			start = formatter.parse(startPeriod);
			end = formatter.parse(endPeriod);
	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<IMSInventory> inventories =  imsInventoryService.retrieveInventories(Long.valueOf(clientId), start, end);
        JRDataSource JRdataSource = new JRBeanCollectionDataSource(inventories);

        parameterMap.put("datasource", JRdataSource);

        //xlsReport bean has ben declared in the jasper-views.xml file
        modelAndView = new ModelAndView("xlsReport", parameterMap);

        return modelAndView;

    }
    
    @RequestMapping(method = RequestMethod.GET , value = "/dailyxls/{clientId}/{period}")
    public ModelAndView generateDailyXlsReport(ModelAndView modelAndView, @PathVariable("clientId") String clientId, @PathVariable("period") String period){

        Map<String,Object> parameterMap = new HashMap<String,Object>();

		DateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		Date date = new Date();
		try {
			date = formatter.parse(period);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IMSInventory inventory =  imsInventoryService.retrieveInventory(Long.valueOf(clientId), date);
		System.out.println("inventory id is " +  inventory.getId() +   "And inventory stock is " + inventory.getPreviousStock() + "      " + inventory.getPeriod());
        List<IMSInventory> inventories = new ArrayList<>();
        inventories.add(inventory);
		
        JRDataSource JRdataSource = new JRBeanCollectionDataSource(inventories);

        parameterMap.put("datasource", JRdataSource);

        //xlsReport bean has ben declared in the jasper-views.xml file
        modelAndView = new ModelAndView("xlsReport", parameterMap);

        return modelAndView;

    }
	
	
	

}
