package com.library.service;

import java.util.List;

import com.library.model.Book;

public interface BookService {
	
	public void addBook(Book theBook);
	 
    public List<Book> getBooks();
 
    public Book getBookById(int id);
 
    public void removeBook(int id);
    
    public List<Book> getBooksForAuthor(int id);
    
    public List<Book> getBooksForPublisher(int id);
    
    public List<Book> getBooksForCategory(int id);
    
    public List<String> searchAutocomplete(String nameBook);
    
    public List<Book> searchBooksByName(String nameBook);
    
    public List<Book> getTopBook();

}
