package com.library.service;

import java.util.List;

import com.library.model.Book;

public interface BookService {
	
	public void addBook(Book theBook);
	 
    public List<Book> getBooks();
 
    public Book getBookById(int id);
 
    public void removeBook(int id);

}
