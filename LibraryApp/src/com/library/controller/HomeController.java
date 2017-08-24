package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.Administrator;
import com.library.service.AdministratorService;

@Controller
public class HomeController {
/*
	@RequestMapping("/")
	public String showPage() {
		return "main-page";
	}*/
	
	
	@Autowired AdministratorService adminService;
	
	@GetMapping("/")
	public String listAdministrators(Model model) {
        model.addAttribute("administrator", new Administrator());
        model.addAttribute("listAdministrators",adminService.getAdministrators());
        return "startPage";
    }
	
	@RequestMapping("/main-page")
    public String mainPage(Model model) {   	
				
        return "main-page";
    }

}
