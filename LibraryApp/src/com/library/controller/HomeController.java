package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.service.BookService;

@Controller
public class HomeController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("/")
    public String startPageBooks(Model model) {
    	
    	model.addAttribute("listBooks", bookService.getBooks());
		model.addAttribute("topBooks", bookService.getTopBook());
    	
        return "startPage";
    }
	
	@GetMapping("/main-page")
    public String mainPage(Model model) {   	
				
        return "main-page";
    }
	
	@PostMapping("/searchByNameStartPage")
	public String searchByNameStartPage(@RequestParam("search") String str, Model model) {
		if(str != null && str.length()>0) {
		String[] parts = str.split(" ");
		String part1 = parts[0];
	
		model.addAttribute("listBooks", bookService.searchBooksByName(part1));
		model.addAttribute("topBooks", bookService.getTopBook());
		return "startPage";
		}else {
	        model.addAttribute("listBooks", bookService.getBooks());
			model.addAttribute("topBooks", bookService.getTopBook());
	        return "startPage";
		}	
	}

}














