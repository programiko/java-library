package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.Book;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addBook(Book theBook) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(theBook);
	}


	@Override
	public List<Book> getBooks() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Book> theQuery = session.createQuery("from Book", Book.class);
		
		List<Book> books = theQuery.getResultList();
		
				
		return books;
	}

	@Override
	public Book getBookById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Book book = session.get(Book.class, id);
		
		return book;
	}

	@Override
	public void removeBook(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Book book = session.get(Book.class, id);
		
		session.delete(book);
	}

}
