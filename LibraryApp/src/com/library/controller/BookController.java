package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.Book;
import com.library.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	
	@GetMapping("/books")
    public String listBooks(Model model) {
    	
		Book book = new Book();
    	model.addAttribute("books", book);
    	model.addAttribute("listBooks", bookService.getBooks());
        return "books";
    }
	
	@GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
    			
    	model.addAttribute("book", new Book());
    	
    	
    	return "addBook";
    }
	
	@PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book theBook) {
    	
		bookService.addBook(theBook);
    	
    	return "redirect:/book/books";
    }
	
	 @GetMapping("/showFormForUpdate")
	    public String showFormForUpdate(@RequestParam("bookId") int bookId, Model model) {
	    	
	    	Book theBook = bookService.getBookById(bookId);
	    	
	    	model.addAttribute("book", theBook);
	    	
	    	return "addBook";
	    }
	    
	    @GetMapping("/deleteBook")
	    public String deleteBook(@RequestParam("bookId") int bookId, Model model) {
	    	
	    	bookService.removeBook(bookId);
	    	
	    	return "redirect:/book/books";
	    }

		@GetMapping("/booksOfAutor")
	    public String listBooksforAuthor(@RequestParam("authorId") int authorId, Model model) {
	    	
			Book book = new Book();
	    	model.addAttribute("books", book);
	    	model.addAttribute("listBooks", bookService.getBooksForAuthor(authorId));
	        return "books";
	    }
		
		@GetMapping("/booksOfPublisher")
	    public String listBooksforPublisher(@RequestParam("publisherId") int publisherId, Model model) {
	    	
			Book book = new Book();
	    	model.addAttribute("books", book);
	    	model.addAttribute("listBooks", bookService.getBooksForPublisher(publisherId));
	        return "books";
	    }
		
		@GetMapping("/booksOfCategory")
	    public String listBooksforCategory(@RequestParam("categoryId") int categoryId, Model model) {
	    	
			Book book = new Book();
	    	model.addAttribute("books", book);
	    	model.addAttribute("listBooks", bookService.getBooksForCategory(categoryId));
	        return "books";
	    }
}
























