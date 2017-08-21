package com.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.Affiliation;

import com.library.service.AffiliationService;

@Controller  
@RequestMapping("/affiliation")
public class AffiliationController {
	
	//inject a affiliation service
	@Autowired
	private AffiliationService affiliationService;

	@GetMapping("/affiliations")
	public String showPageAffiliation(Model model) {
				
		// get list of publisher from the dao		
		List<Affiliation> theAffiliation = affiliationService.getAffiliation();
				
		// add the publisher to the model				
		model.addAttribute("affiliation", theAffiliation); 

		// return page
		return "affiliations";
	}
}
