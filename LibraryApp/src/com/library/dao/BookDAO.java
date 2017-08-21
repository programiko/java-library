package com.library.dao;

import java.util.List;

import com.library.model.Book;

public interface BookDAO {
	
	public void addBook(Book theBook);
	 
    public List<Book> getBooks();
 
    public Book getBookById(int id);
 
    public void removeBook(int id);

}
