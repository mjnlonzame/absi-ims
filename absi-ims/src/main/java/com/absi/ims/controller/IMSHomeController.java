package com.absi.ims.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/")
public class IMSHomeController {
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loadLoginForm(Model model) {


		
		return "imsLoginForm";
	}
	
/*	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loadHomeForm(Model model) {


		model.addAttribute("imsUserList", imsUserService.getAllIMSUsers());
		return "imsUserList";
	}
	*/
	
}
