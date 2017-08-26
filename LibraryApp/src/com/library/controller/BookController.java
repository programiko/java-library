package com.library.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.Authors;
import com.library.model.Book;
import com.library.model.Category;
import com.library.model.Publisher;
import com.library.service.AuthorsService;
import com.library.service.BookService;
import com.library.service.CategoryService;
import com.library.service.PublisherService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PublisherService publisherService;
	@Autowired
	AuthorsService authorsService;
	
	
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
		
		
		System.out.println(theBook);
		
		bookService.addBook(theBook);
		categoryService.addCategory(theBook.getCategory());
		authorsService.addAuthorsList(theBook.getAuthors());
		publisherService.addPublisherList(theBook.getPublishers());
		
    	
    	return "redirect:/book/books";
    }
	
	 @GetMapping("/showFormForUpdate")
	    public String showFormForUpdate(@RequestParam("bookId") int bookId, 
										@RequestParam("id") int categoryId, 
										@RequestParam("id") int publisherId,
										@RequestParam("authorsId") int authorsId,
										Model model) {

	    	Book theBook = bookService.getBookById(bookId);
	    	Category theCategory = categoryService.getCategoryById(categoryId);
	    	Publisher thePublisher = publisherService.getPublisherById(publisherId);
	    	Authors theAuthor = authorsService.getAuthorsById(authorsId);
	    	
	    	List<Authors> a = new ArrayList<Authors>();
	    	a.add(theAuthor);
	    	
	    	List<Publisher> p = new ArrayList<Publisher>();
	    	p.add(thePublisher);
	    	
	    	
	    	
	    	System.out.println("\n\nbegin book by id\n");
	    	System.out.println(theBook);
			System.out.println(theCategory);
			System.out.println(thePublisher);
			System.out.println(theAuthor);
			
			System.out.println("\n\nend book by id\n");
	    	
			theBook.setAuthors(a);
			theBook.setPublishers(p);
			theBook.setCategory(theCategory);
			
	    	model.addAttribute("book", theBook);
	    	model.addAttribute("category", theCategory);
	    	model.addAttribute("publisher", p);
	    	model.addAttribute("author", a);
	    	
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
























