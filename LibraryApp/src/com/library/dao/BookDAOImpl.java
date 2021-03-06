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
		
	@Override
	public List<Book> getBooksForAuthor(int id) {

		Session session = sessionFactory.getCurrentSession();
		Query<Book> theQuery = session.createQuery("select b from Book b join b.authors a where a.authorsId = :idA",Book.class);
		theQuery.setParameter("idA", id);
		List<Book> books = theQuery.getResultList();

		return books;
	}
	
	@Override
	public List<Book> getBooksForPublisher(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		Query<Book> theQuery = session.createQuery("select b from Book b join b.publishers p where p.id = :idA",Book.class);
		theQuery.setParameter("idA", id);
		List<Book> books = theQuery.getResultList();

		return books;
	}

	@Override
	public List<Book> getBooksForCategory(int id) {

		Session session = sessionFactory.getCurrentSession();
		Query<Book> theQuery = session.createQuery("select b from Book b join b.category p where p.id = :idA",Book.class);
		theQuery.setParameter("idA", id);
		List<Book> books = theQuery.getResultList();

		return books;
	}

	@Override
	public List<String> searchAutocomplete(String nameBook) {

		Session session = sessionFactory.getCurrentSession();
		//Query<String> theQuery = session.createQuery("select concat(bookTitle,' ',category.name) from Book where bookTitle like :n or category.name like :n",String.class);
		//Query<String> theQuery = session.createQuery("select bookTitle from Book where bookTitle like :n",String.class);
		Query<String> theQuery = session.createQuery("select concat(b.bookTitle,' | ',p.name,' | ',a.authorsName,' ',a.authorsSurname,' | ',c.name) from Book b join b.publishers p join b.authors a join b.category c where b.bookTitle like :n or p.name like :n or a.authorsName like :n or a.authorsSurname like :n or c.name like :n",String.class);
		theQuery.setParameter("n", "%"+ nameBook + "%");
		List<String> str = theQuery.list();
		return str;
	}

	@Override
	public List<Book> searchBooksByName(String nameBook) {
		Session session = sessionFactory.getCurrentSession();
		Query<Book> theQuery = session.createQuery("select b from Book b join b.publishers p join b.authors a join b.category c where b.bookTitle like :n or p.name like :n or a.authorsName like :n or a.authorsSurname like :n or c.name like :n",Book.class);
		//Query<Book> theQuery = session.createQuery("select b from Book b join b.publishers p where p.name like :n",Book.class);
		
		
		theQuery.setParameter("n", "%"+nameBook + "%");
		List<Book> bookList = theQuery.list();
		return bookList;
	}

	@Override
	public List<Book> getTopBook() {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Book> theQuery = session.createQuery("from Book order by bookRating DESC", Book.class);
		
		List<Book> books = theQuery.getResultList();
				
		return books;
	}

}
