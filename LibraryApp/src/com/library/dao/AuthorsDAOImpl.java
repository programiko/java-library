package com.library.dao;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.Authors;
import com.library.model.Book;

@Repository
public class AuthorsDAOImpl implements AuthorsDAO{

		@Autowired
		private SessionFactory sessionFactory;
		
		@Override
		public void addAuthors(Authors theAuthors) {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(theAuthors);
		}

		@Override
		public List<Authors> getAuthors() {
			Session session = sessionFactory.getCurrentSession();
			Query<Authors> theQuery = session.createQuery("from Authors", Authors.class);
			List<Authors> theAuthors = theQuery.getResultList();
			
			return theAuthors;
		}

		@Override
		public Authors getAuthorsById(int id) {
			//get the current hibernate session
			Session session = sessionFactory.getCurrentSession();		
			//now retrive from database using the primary key
			Authors authors = session.get(Authors.class, id);
					return authors;
		}

		@Override
		public void removeAuthors(int id) {
			Session session = sessionFactory.getCurrentSession();			
			Authors authors = session.get(Authors.class, id);			
			 
			for (Book b: authors.getBooks()) {
				
				b.getAuthors().remove(authors);
			}
			authors.getBooks().clear();
			
			session.delete(authors);
		}

		@Override
		public void addAuthorsList(List<Authors> authors) {
			Session session = sessionFactory.getCurrentSession();
			for(Authors a: authors) {
				session.saveOrUpdate(a);
			}
		}
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@Override
		public List<Authors> findAuthorByNames(String str) {
			Session session = sessionFactory.getCurrentSession();
			List<Authors> a = new ArrayList<>();
			
			Query theQuery = session.createQuery("from Authors where authorsName like :str", Authors.class);
			theQuery.setParameter("str", str);
			
			a = theQuery.getResultList();
			
			return a;
		}

		@Override
		public List<String> searchAutocomplete(String nameAuthors) {

			Session session = sessionFactory.getCurrentSession();
			Query<String> theQuery = session.createQuery("select concat(authorsName, ' ',authorsSurname) from Authors where authorsName like :n or authorsSurname like :n",String.class);
			theQuery.setParameter("n", "%"+ nameAuthors + "%");
			List<String> str = theQuery.list();
			return str;
		}
		
		@Override
		public List<Authors> searchAuthorsByName(String nameAuthors) {
			Session session = sessionFactory.getCurrentSession();
			Query<Authors> theQuery = session.createQuery("from Authors where authorsName like :n",Authors.class);
			theQuery.setParameter("n","%"+ nameAuthors + "%");
			List<Authors> authorsList = theQuery.list();
			return authorsList;
		}
	
}