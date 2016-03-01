package com.absi.ims.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.absi.ims.domain.IMSClient;
import com.absi.ims.domain.IMSOutlet;
import com.absi.ims.service.IMSClientService;
import com.absi.ims.service.IMSOutletService;

@Controller
@RequestMapping(value = "/ims-outlet")
public class IMSOutletController {

	private static final Logger logger = LoggerFactory.getLogger(IMSOutletController.class);
	private static final String SAVE_ACTION = "/ims-outlet/save";
	private static final String UPDATE_ACTION = "/ims-outlet/update";

	@Autowired
	private IMSOutletService imsOutletService;
	
	@Autowired
	private IMSClientService imsClientService;

	@RequestMapping(method = RequestMethod.GET)
	public String loadIMSOutletList(Model model) {
		logger.info("Getting list of Outlets");

		model.addAttribute("imsOutletList", imsOutletService.getAllIMSOutlets());

		return "imsOutletList";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String loadIMSOutletForm(Model model) {
		logger.info("Creating new IMS Outlet");
		IMSOutlet imsOutlet = new IMSOutlet();
		
		List<IMSClient> clients = imsClientService.getAllIMSClients();
		
		model.addAttribute("imsOutlet", imsOutlet);
		model.addAttribute("action", SAVE_ACTION);
		model.addAttribute("clients", clients);
		buildModel(model, imsOutlet, SAVE_ACTION);
		return "imsNewOutletForm";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/view/{id}")
	public String loadIMSUserForm(Model model, @PathVariable Long id) {
		logger.info("Viewing Outlet");
		IMSOutlet imsOutlet = imsOutletService.getIMSOutletById(id);
		model.addAttribute("imsOutlet", imsOutlet);
		return "imsViewOutlet";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveIMSOutlet(@Valid @ModelAttribute("imsOutlet") IMSOutlet imsOutlet, BindingResult result, Model model,
			RedirectAttributes redirectAttributes) {
			
		imsOutletService.addIMSOutlet(imsOutlet);
		return "redirect:/ims-outlet";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/delete")
	public String deleteIMSOutlet(@PathVariable Long id) {
		
		logger.info("Deleting Outlet");
		
		IMSOutlet imsOutlet = imsOutletService.getIMSOutletById(id);		
		imsOutletService.deleteIMSOutlet(imsOutlet);
		return "redirect:/ims-outlet";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editBankSwiftCode(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {

		IMSOutlet imsOutlet = imsOutletService.getIMSOutletById(id);

		logger.info("Loading edit for of IMSOutlet with the following details : " + imsOutlet);

		if (imsOutlet == null) {
			return "redirect:/ims-outlet";
		}
		buildModel(model, imsOutlet, UPDATE_ACTION);

		return "imsEditOutlet";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/update")
	public String updateIMSOutlet(IMSOutlet imsOutlet) {
		IMSOutlet imsOutletToUpdate = imsOutletService.getIMSOutletById(imsOutlet.getId());

		imsOutlet.setCreatedBy(imsOutletToUpdate.getCreatedBy());
		imsOutlet.setCreatedDate(imsOutletToUpdate.getCreatedDate());

		imsOutletService.updateIMSOutlet(imsOutlet);

		return "redirect:/view/" + imsOutletToUpdate.getId();
	}

	private void buildModel(Model model, IMSOutlet imsoutlet, String action) {
		model.addAttribute("action", action);
		model.addAttribute("imsOutlet", imsoutlet);
	}

}