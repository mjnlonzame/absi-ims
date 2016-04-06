package com.absi.ims.controller;

import java.util.List;

import javax.validation.Valid;	import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.absi.ims.domain.IMSClient;
import com.absi.ims.domain.IMSProduct;
import com.absi.ims.service.IMSClientService;
import com.absi.ims.service.IMSInventoryService;
import com.absi.ims.service.IMSProductService;

@Controller
@RequestMapping(value = "/ims-product")
public class IMSProductController {

	private static final Logger logger = LoggerFactory.getLogger(IMSProductController.class);
	private static final String SAVE_ACTION = "/ims-product/save";
	private static final String UPDATE_ACTION = "/ims-product/update";

	@Autowired
	private IMSProductService imsProductService;

	@Autowired
	private IMSClientService imsClientService;

	@Autowired
	IMSInventoryService imsInventoryService;

	@RequestMapping(method = RequestMethod.GET)
	public String loadIMSProductList(Model model) {
		logger.info("Getting list of Products");
		model.addAttribute("imsProductList", imsProductService.getAllIMSProducts());
		return "imsProductList";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String loadIMSProductForm(Model model) {
		logger.info("Creating new IMS Product");
		IMSProduct imsProduct = new IMSProduct();

		model.addAttribute("imsProduct", imsProduct);
		model.addAttribute("action", SAVE_ACTION);
		// model.addAttribute("clients", clients);
		buildModel(model, imsProduct, SAVE_ACTION);
		return "imsNewProductForm";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/view/{id}")
	public String loadIMSProductForm(Model model, @PathVariable Long id) {
		logger.info("Viewing Product Details");
		IMSProduct imsProduct = imsProductService.getIMSProductById(id);
		model.addAttribute("imsProduct", imsProduct);
		return "imsViewProduct";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveIMSProduct(@Valid @ModelAttribute("imsProduct") IMSProduct imsProduct, BindingResult result,
			Model model, RedirectAttributes redirectAttributes) {
		IMSClient client = imsClientService.getIMSClientById(imsProduct.getClient().getId());
		imsProduct.setClient(client);
		imsProductService.addIMSProduct(imsProduct);
		return "redirect:/ims-product";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/delete")
	public String deleteIMSProduct(@RequestParam(value = "productId", required = true) Long id) {

		logger.info("Deleting Product");

		IMSProduct imsProduct = imsProductService.getIMSProductById(id);
		imsProductService.deleteIMSProduct(imsProduct);
		return "redirect:/ims-product";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editIMSProduct(@RequestParam(value = "productId", required = true) long productId, Model model,
			RedirectAttributes redirectAttributes) {

		IMSProduct imsProduct = imsProductService.getIMSProductById(productId);
		if (imsProduct == null) {
			return "redirect:/ims-product";
		}
		logger.info("Loading edit for of IMSOutlet with the following details : " + imsProduct);
		List<IMSClient> clients = imsClientService.getAllIMSClients();
		model.addAttribute("clients", clients);
		model.addAttribute("selectedClient", imsProduct.getClient().getId());
		buildModel(model, imsProduct, UPDATE_ACTION);

		return "imsEditProduct";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/update")
	public String updateIMSProduct(IMSProduct imsProduct) {
		/*
		 * IMSProduct imsProductToUpdate =
		 * imsProductService.getIMSProductById(imsProduct.getId());
		 * 
		 * imsProduct.setCreatedBy(imsProductToUpdate.getCreatedBy());
		 * imsProduct.setCreatedDate(imsProductToUpdate.getCreatedDate());
		 */

		IMSClient client = imsClientService.getIMSClientById(imsProduct.getClient().getId());
		imsProduct.setClient(client);
		imsProductService.updateIMSProduct(imsProduct);

		return "redirect:/ims-product/view/" + imsProduct.getId();
	}

	@RequestMapping(value = "/retrieveProduct", method = RequestMethod.POST)
	public ResponseEntity<IMSProduct> retrieveInventory(@RequestParam("id") String id) {
		IMSProduct product = imsProductService.getIMSProductById(Long.valueOf(id));
		return new ResponseEntity<IMSProduct>(product, HttpStatus.OK);
	}

	private void buildModel(Model model, IMSProduct imsproduct, String action) {
		model.addAttribute("action", action);
		model.addAttribute("imsProduct", imsproduct);
	}

	@ModelAttribute("clients")
	public List<IMSClient> populateClients() {
		return imsClientService.getAllIMSClients();
	}

}