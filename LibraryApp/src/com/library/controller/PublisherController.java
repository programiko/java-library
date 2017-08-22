package com.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.Publisher;
import com.library.service.PublisherService;




@Controller  
@RequestMapping("/publisher")
public class PublisherController {
	
	//inject a publisher service
	@Autowired
	private PublisherService publisherService;

	
	@GetMapping("/publishers")
	public String showPagePublishers(Model model) {
				
		// get list of publisher from the dao		
		List<Publisher> thePublisher = publisherService.getPublisher();
				
		// add the publisher to the model				
		model.addAttribute("publisher", thePublisher);

		// return page
		return "publishers";
	}
	
	@GetMapping("/showFormForAddPublisher")
	public String showFormForAddPublisher(Model model)	{
		
		// Create new instance
		Publisher thePublisher = new Publisher();
		
		// Add instance to model
		model.addAttribute("publisher", thePublisher);
		
		//return page
		return "add-publisher";
}
	
	@PostMapping("/addPublisher")
	public String addPublisher(@ModelAttribute("publisher") Publisher thePublisher) {
		
		//Add object to service
		publisherService.addPublisher(thePublisher);
		
		// redirect on publishers.jsp
		return "redirect:/publisher/publishers";
	}
	
	@GetMapping("/showFormForUpdatePublisher")
	public String showFormForUpdatePublisher(@RequestParam("id") int id, Model theModel) {

		// Create new instance of class with id
		Publisher thePublisher = publisherService.getPublisherById(id);
	
		// Add instance to model
		theModel.addAttribute("publisher", thePublisher);

		// return page
		return "add-publisher";
	}
	
	@GetMapping("/deletePublisher")
	public String deleteCustomer(@RequestParam("id") int id) {
		
		// execute service method
		publisherService.removePublisher(id);
		
		//stay on same page
		return "redirect:/publisher/publishers";
	}
}
