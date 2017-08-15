package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.library.model.Authors;
import com.library.service.AuthorsService;

@Controller  
@RequestMapping("/admin")
public class AuthorsController {  
	
	//need to inject the authors dao
	@Autowired
	private AuthorsService authorsService;

    @RequestMapping(value = "/authors", method = RequestMethod.GET)
    public String listAuthors(Model model) {
    	
        model.addAttribute("authors", new Authors());
        model.addAttribute("listAuthors", authorsService.getAuthors());
        
        return "authors";
    }

}  