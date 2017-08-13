package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.Member;
import com.library.service.LibraryService;

@Controller
@RequestMapping("/admin")
public class MemberController {
	
	private LibraryService memberService;	
	
	public LibraryService getMemberService() {
		return memberService;
	}

	public void setMemberService(LibraryService memberService) {
		this.memberService = memberService;
	}

	@GetMapping("/members")
    public String listMembers(Model model) {
    	
    	model.addAttribute("member", new Member());
    	model.addAttribute("listMembers", memberService.getMembers());
    	
        return "members";
    }
    
    @GetMapping("/addMember")
    public String addMember(Model model) {
    	
    	model.addAttribute("member", new Member());
    	
    	return "members";
    }

}






