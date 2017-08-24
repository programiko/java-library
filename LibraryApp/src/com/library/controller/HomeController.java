package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.dao.AdministratorDAO;
import com.library.service.BookService;

import com.library.model.Administrator;
import com.library.service.AdministratorService;

@Controller
public class HomeController {
/*
	@Autowired
	private BookService bookService;
	
	
	@Autowired
	AdministratorDAO administratorDAO;

	@GetMapping("/")
    public String startPageBooks(Model model) {
    	
    	model.addAttribute("listBooks", bookService.getBooks());
		model.addAttribute("listAdministrators", administratorDAO.getAdministrators());
    	
        return "startPage";
    }
	
	@GetMapping("/main-page")
    public String mainPage(Model model) {   	
				
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














