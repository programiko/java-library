package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.Member;
import com.library.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;	
	
	@GetMapping("/members")
    public String listMembers(Model model) {
    	
    	model.addAttribute("member", new Member());
    	model.addAttribute("listMembers", memberService.getMembers());
    	
        return "members";
    }
    
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
    	
    	model.addAttribute("member", new Member());
    	
    	return "addMember";
    }
    
    @PostMapping("/saveMember")
    public String saveMember(@ModelAttribute("member") Member theMember) {
    	
    	memberService.addMember(theMember);
    	
    	return "redirect:/member/members";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("memberId") int memberId, Model model) {
    	
    	Member theMember = memberService.getMemberById(memberId);
    	
    	model.addAttribute("member", theMember);
    	
    	return "addMember";
    }
    
    @GetMapping("/deleteMember")
    public String deleteMember(@RequestParam("memberId") int memberId, Model model) {
    	
    	memberService.removeMember(memberId);
    	
    	return "redirect:/member/members";
    }
    
    @GetMapping("/viewProfile")
    public String viewProfile(@RequestParam("memberId") int memberId, Model model) {
    	
    	Member theMember = memberService.getMemberById(memberId);
    	
    	model.addAttribute("member", theMember);
    	
    	return "memberProfile";
    }
    
}

















