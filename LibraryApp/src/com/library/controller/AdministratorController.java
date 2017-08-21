package com.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.Administrator;
import com.library.service.AdministratorService;

@Controller  
@RequestMapping("/admin")
public class AdministratorController {  
	
	@Autowired
	private AdministratorService adminService;

    @RequestMapping(value = "/administrators", method = RequestMethod.GET)
    public String listAdministrators(Model model) {
        model.addAttribute("administrator", new Administrator());
        model.addAttribute("listAdministrators",adminService.getAdministrators());
        return "administrators";
    }
    
    
    @PostMapping("/search")
    public String SearchAdminById( @RequestParam("adminId") int id ,Model model) {
    	
    	List<Administrator> admins = adminService.getAdministratorById(id);
    		
    		model.addAttribute("admins", admins);
    	
    	return "AdminData";
    }
    
    @GetMapping("/showFormForUpdate")
    public  String updatingAdmin (@RequestParam ("adminId") int id,Model model) {
    	Administrator admin = adminService.updateAdministrator(id);
    	model.addAttribute("administrator", admin);
    	return "ShowForm";
    }
    @GetMapping("/showFormForDelete")
    public String deletingAdmin(@RequestParam("adminId") int id, Model model) {
    	
    	Administrator admin = new Administrator();
    	
    	adminService.removeAdministrator(id);
    	model.addAttribute("administrator", admin); 
    	return "redirect:/admin/administrators";
    }
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
    	
    	model.addAttribute("administrator", new Administrator());
    	
    	return "ShowForm";
    }
    
    @PostMapping("/saveAdministrator")
    public String saveMember(@ModelAttribute("administrator") Administrator admin) {
    	
    	adminService.addMember(admin);
    	
    	return "redirect:/admin/administrators";
    }
/*
@PostMapping("/search")
public String searchID(@RequestParam("adminId") int id ,Model model) {
	
	Administrator admin = adminService.getById(id);
	model.addAttribute("admin", admin);
	
	return "AdminData";
}

*/
}