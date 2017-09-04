package com.library.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    	public String showFormForAdd(Model model, HttpServletRequest req, HttpServletResponse res) {
		
		Book theBook = new Book();	
		
		model.addAttribute("book", theBook);
    	  	
    	return "addBook";
    }
	
		@PostMapping("/saveBook")
    	public String saveBook(@ModelAttribute("book") Book theBook, 
    							@ModelAttribute("update") String update,
				    			HttpServletRequest req) {
			
			if(update.equals("update")) {
				updateBook(theBook, req);
			}else {		
				addBook(theBook, req);
			}
    	
    	return "redirect:/book/books";
    }
	
	 	@RequestMapping("/showFormForUpdate")
	    public String showFormForUpdate(@RequestParam("bookId") int bookId, 
										@RequestParam("categoryId") int categoryId, 
										@RequestParam("publishersId") int publisherId,
										@RequestParam("authorsId") int authorsId,
										@RequestParam("numOfAuthors") int numOfAuthors,
										Model model, 
						    			HttpServletRequest req) {
	 				
//	    	Book theBook = bookService.getBookById(bookId);
	    	
//	 		List<Authors> a = new ArrayList<Authors>();	 
//	    	for(int i = 0; i < (numOfAuthors); i ++) {	 		
//	 			Authors theAuthor = authorsService.getAuthorsById(authorsId);
//	 			a.add(theAuthor);
//	 			System.out.println("\n\n" + theAuthor);
//	    	}
    	
	 			Book theBook = bookService.getBookById(bookId);
		    	Category theCategory = categoryService.getCategoryById(categoryId);
		    	Publisher thePublisher = publisherService.getPublisherById(publisherId);
		    	Authors theAuthor = authorsService.getAuthorsById(authorsId);
		    	
		    	List<Authors> a = new ArrayList<Authors>();
		    	a.add(theAuthor);
		    	
		    	List<Publisher> p = new ArrayList<Publisher>();
		    	p.add(thePublisher);
		    	
				theBook.setAuthors(a);
				theBook.setPublishers(p);
				theBook.setCategory(theCategory);
				
				String update = req.getParameter("update");
				
		    	model.addAttribute("book", theBook);
		    	model.addAttribute("update", update);
		    	
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

		
		
		//add book metoda
		public void addBook(Book theBook, HttpServletRequest req) {
			
			
			int numOfAuthors = Integer.parseInt(req.getParameter("numOfAuthors"));
			System.out.println("\n\n" + numOfAuthors + "\n\n");
			
			List<Publisher> p = new ArrayList<Publisher>();		
			List<Authors> a = new ArrayList<Authors>();
			
			Publisher thePublisher = publisherService.findPublisherByName(req.getParameter("publishers[0].name"));
			Category theCategory = categoryService.findCategoryByName(req.getParameter("category.name"));
			
			
			
			if(thePublisher == null) {
				thePublisher = new Publisher(req.getParameter("publishers[0].name"), req.getParameter("publishers[0].address"), req.getParameter("publishers[0].phone"));
				publisherService.addPublisher(thePublisher);
				p.add(thePublisher);
				theBook.setPublishers(p);
			}else {	
				publisherService.addPublisher(thePublisher);
				p.add(thePublisher);
				theBook.setPublishers(p);	
			}	
						
			if(theCategory == null) {
				theCategory = new Category(req.getParameter("category.name"), req.getParameter("category.description"));
				categoryService.addCategory(theCategory);
				theBook.setCategory(theCategory);
			}else {	
				categoryService.addCategory(theCategory);
				System.out.println("\n\nfrom else: " + theCategory + "\n\n");
				theBook.setCategory(theCategory);
			}
			
			boolean authorExists = false;
			for(int i = 0; i < (numOfAuthors + 1); i++) {
				Authors theAuthors = new Authors();
				List<Authors> authorListWithName = authorsService.findAuthorByNames(req.getParameter("authors[" + i + "].authorsName"));
				if(!authorListWithName.equals(null)) {
					for(int j = 0; j < authorListWithName.size(); j++) {
						if(req.getParameter("authors[" + i + "].authorsSurname").equals(authorListWithName.get(j).getAuthorsSurname())) {
							theAuthors = authorListWithName.get(j);
							authorsService.addAuthors(theAuthors);
							authorExists = true;
							System.out.println("\n\n" + theAuthors);
						}
					}
				}
				if(authorExists == false){
					theAuthors = new Authors(req.getParameter("authors[" + i + "].authorsName"), req.getParameter("authors[" + i + "].authorsSurname"));
					authorsService.addAuthors(theAuthors);
				}
					a.add(theAuthors);
			}
			theBook.setAuthors(a);
			bookService.addBook(theBook);
			
		}		
		//update book metoda
		public void updateBook(Book theBook, HttpServletRequest req) {
			
			
			bookService.addBook(theBook);
			categoryService.addCategory(theBook.getCategory());
			authorsService.addAuthorsList(theBook.getAuthors());
			publisherService.addPublisherList(theBook.getPublishers());		
			
		}
}
























