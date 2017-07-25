package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
@RequestMapping("/hello")
public class HelloController {  
	
	@RequestMapping("/")
	public String showPage() {
		return "hello";
	}	

	@RequestMapping("/test")
	public String showPage2() {
		return "hello2";
	}	

}  