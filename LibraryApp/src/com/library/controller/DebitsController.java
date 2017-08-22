package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.Debits;
import com.library.service.DebitsService;


@Controller
@RequestMapping("/debit")
public class DebitsController {

	@Autowired
	private DebitsService debitsService;
	
	@GetMapping("/debits")
    public String listDebits(Model model) {
    	
		model.addAttribute("debits", new Debits());
    	model.addAttribute("listDebits", debitsService.getDebits());
		
        return "debits";
    }
	
	
}
