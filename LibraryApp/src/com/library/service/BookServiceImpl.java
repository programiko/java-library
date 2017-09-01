package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.BookDAO;
import com.library.model.Book;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;

	@Override
	@Transactional
	public void addBook(Book theBook) {
		bookDAO.addBook(theBook);		
	}

	@Override
	@Transactional
	public List<Book> getBooks() {
		return bookDAO.getBooks();
	}

	@Override
	@Transactional
	public Book getBookById(int id) {
		return bookDAO.getBookById(id);
	}

	@Override
	@Transactional
	public void removeBook(int id) {
		bookDAO.removeBook(id);
	}

	@Override
	@Transactional
	public List<Book> getBooksForAuthor(int id) {
		return bookDAO.getBooksForAuthor(id);
	}

	@Override
	@Transactional
	public List<Book> getBooksForPublisher(int id) {
		// TODO Auto-generated method stub
		return bookDAO.getBooksForPublisher(id);
	}

	@Override
	@Transactional
	public List<Book> getBooksForCategory(int id) {
		// TODO Auto-generated method stub
		return bookDAO.getBooksForCategory(id);
	}

	@Override
	@Transactional
	public List<String> searchAutocomplete(String nameBook) {
		// TODO Auto-generated method stub
		return bookDAO.searchAutocomplete(nameBook);
	}

	@Override
	@Transactional
	public List<Book> searchBooksByName(String nameBook) {
		// TODO Auto-generated method stub
		return bookDAO.searchBooksByName(nameBook);
	}

	@Override
	@Transactional
	public List<Book> getTopBook() {
		return bookDAO.getTopBook();
	}


}
