package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.dao.AdministratorDAO;
import com.library.service.BookService;

@Controller
public class HomeController {

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
    }

}














