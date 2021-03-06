package com.library.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.library.model.Book;
import com.library.model.Debits;
import com.library.model.Member;
import com.library.service.BookService;
import com.library.service.DebitsService;
import com.library.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController{
	
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
    	
    	System.out.println("\n\n" + book.getBookTitle() + book.getNumberOfCopies());
    	book.setNumberOfCopies(book.getNumberOfCopies() + 1);
    	System.out.println("\n\n" + book.getBookTitle() + book.getNumberOfCopies());
    	
    	System.out.println("\n\n" + book.getBookTitle() + book.getNumberOfRentedBook());
    	book.setNumberOfRentedBook(book.getNumberOfRentedBook() - 1);
    	System.out.println("\n\n" + book.getBookTitle() + book.getNumberOfRentedBook());
    	
    	debitService.removeDebit(debitsId);   	
    	
    	bookService.addBook(book);
    	
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
    public String rent(@RequestParam("memberId") int memberId, 
    					Model model, 
    					HttpServletRequest request) {
    	

    	Member theMember = memberService.getMemberById(memberId);

    	String[] ids = request.getParameterValues("bookForRent"); 
    	
    	if(ids != null) {
    		Book book;
        	List<Debits> debits = new ArrayList<Debits>();
        	
	    	for(int i = 0; i < ids.length; i++) {
	    		book = bookService.getBookById(Integer.parseInt(ids[i]));
	    		if(book.getNumberOfCopies() > 0) {
		    		Debits debit = new Debits(new Date(), "You have rented book: " + book.getBookTitle(), book);
		    		debits.add(debit);  
		    		debitService.addDebit(debit);
		    		debit.setMember(theMember);
		    		
		    		book.setNumberOfCopies(book.getNumberOfCopies() - 1);
		    		book.setNumberOfRentedBook(book.getNumberOfRentedBook() + 1);
		    		bookService.addBook(book);
	    		}else {	
	    			model.addAttribute("member", theMember);
	        		return "memberProfile";
	    		}
	    	}
	    	
	    	theMember.setDebits(debits);
	    	memberService.addMember(theMember);	    	
	    	
	    	model.addAttribute("member", theMember);
	    	
	    	return "memberProfile";
	    	
    	}else {
    		model.addAttribute("member", theMember);
    		return "memberProfile";
    	}
    	
    }
    
	@GetMapping("/search")
	void search(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		//new String(request.getParameter("term").getBytes("ISO-8859-1"),"UTF-8");
				
		String term = request.getParameter("term");
	
		String searchList = new Gson().toJson(memberService.searchAutocomplete(term));
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	response.getWriter().write(searchList);
	}
	
	@PostMapping("/searchByName")
	public String searchByName(@RequestParam("search") String str, Model model) {
		if(str != null && str.length()>0) {
		String[] parts = str.split(" ");
		String part1 = parts[0];
	
		model.addAttribute("listMembers", memberService.searchMemberByName(part1));
		return "members";
		}else {
	        model.addAttribute("listMembers", memberService.getMembers());
	        
	        return "members";
		}
		
	}
    
}

















