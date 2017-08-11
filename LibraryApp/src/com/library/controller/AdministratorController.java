package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.library.dao.AdministratorDAO;
import com.library.model.Administrator;

@Controller  
@RequestMapping("/admin")
public class AdministratorController {  
	
	@Autowired
	private AdministratorDAO administratorDAO;

    @RequestMapping(value = "/administrators", method = RequestMethod.GET)
    public String listAdministrators(Model model) {
        model.addAttribute("administrator", new Administrator());
        model.addAttribute("listAdministrators", administratorDAO.getAdministrators());
        return "administrators";
    }

}  