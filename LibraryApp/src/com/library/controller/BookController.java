package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.Book;
import com.library.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("/books")
    public String listBooks(Model model) {
    	
    	model.addAttribute("books", new Book());
    	model.addAttribute("listBooks", bookService.getBooks());
        return "books";
    }
}
