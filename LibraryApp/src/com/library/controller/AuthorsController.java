package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.Authors;
import com.library.model.Book;
import com.library.service.AuthorsService;

@Controller  
@RequestMapping("/author")
public class AuthorsController {  
	
	//need to inject the authors dao
	@Autowired
	private AuthorsService authorsService;
	
    @GetMapping("/authors")
    public String listAuthors(Model model) {
    	
        model.addAttribute("authors", new Authors());
        model.addAttribute("listAuthors", authorsService.getAuthors());
        
        return "authors";
    }
    
    @GetMapping("/showFormAddAuthors")
    public String showFormForAdd(Model model) {
    	
    	model.addAttribute("authors", new Authors());
    	return "addAuthors";
    }
    
    @PostMapping("/saveAuthors")
    public String saveAuthors(@ModelAttribute("authors") Authors theAuthors) {
    	
    	authorsService.addAuthors(theAuthors);
    	
    	return "redirect:/author/authors";
    }
    
    @GetMapping("/showFormForUpdateAuthors")
    public String showFormForUpdateAuthors(@RequestParam("authorsId") int authorsId, Model model)
    {
    	//get the authors from the service
    	Authors theAuthors = authorsService.getAuthorsById(authorsId);
    	
    	//set authors as a model attribute to pre-populate the form
    	model.addAttribute("authors", theAuthors);
    	
    	//send over to our form
		return "addAuthors";
    	
    }
    
    @GetMapping("/delete")
    public String deleteAuthors(@RequestParam("authorsId") int authorsId) {

    	
    	authorsService.removeAuthors(authorsId);
    	
    	return "redirect:/author/authors";
    	
    }
    

}  