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

import com.library.dao.AdministratorDAO;
import com.library.model.Administrator;
import com.library.model.Member;
import com.library.service.AdministratorService;
import com.sun.tracing.dtrace.ModuleAttributes;

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
    /*
    @PostMapping("/search")
    public String SearchAdminById(@RequestParam("adminId") int id ,Model model) {
    	
    	List<Administrator> admins = adminService.getAdministratorById(id);
    	if(admins != null) {
    		model.addAttribute("getbyid", admins);
    	}else {
    		
    		return "administrators";
    	}
    	
    	return "AdminData";
    }
    */
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
}  

