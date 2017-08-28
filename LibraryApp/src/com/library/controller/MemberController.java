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

import com.library.model.Book;
import com.library.model.Debits;
import com.library.model.Member;
import com.library.service.BookService;
import com.library.service.DebitsService;
import com.library.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BookService bookService;
	@Autowired
	private DebitsService debitService;
	
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
    
    @GetMapping("/returnBook")
    public String returnBook(@RequestParam("memberId") int memberId, Model model) {
    	
    	Member theMember = memberService.getMemberById(memberId); 	
    	
    	model.addAttribute("member", theMember);
    	
    	return "memberProfile";
    }
    
    @GetMapping("/returnLink")
    public String returnLink(@RequestParam("memberId") int memberId,
								@RequestParam("debitsId") int debitsId,	 
								Model model) {
    	
    	Member theMember = memberService.getMemberById(memberId);
    	Debits debit = debitService.getDebitById(debitsId);
    	Book book = debit.getBook();
    	System.out.println(book);
    	book.setNumberOfCopies(book.getNumberOfCopies() + 1);
    	debitService.removeDebit(debitsId);   	
    	
    	model.addAttribute("member", theMember);
    	
    	return "memberProfile";
    }
    
    @GetMapping("/rentBook")
    public String rentBook(@RequestParam("memberId") int memberId,
    						Model model) {
    	
    	Member theMember = memberService.getMemberById(memberId);
    	List<Book> listBooks = bookService.getBooks();
    	
    	model.addAttribute("member", theMember);
    	model.addAttribute("listBooks", listBooks);
    	
    	
    	return "rentBooks";
    }
    
    @GetMapping("/rent")
    public String rent(@RequestParam("memberId") int memberId, Model model) {
    	
    	Member theMember = memberService.getMemberById(memberId);
    	
    	model.addAttribute("member", theMember);
    	
    	return "memberProfile";
    }
    
    
}

















