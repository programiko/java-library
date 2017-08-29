package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.library.model.Publisher;


@Repository
public class PublisherDAOImpl implements PublisherDAO {
	
	// inject session factory
	
	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	public List<Publisher> getPublisher() {
		
		//get the current hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		// create a query for select * from Publisher
		Query<Publisher> theQuery = session.createQuery("from Publisher order by name", Publisher.class);
		
		// execute query and get result list
		List<Publisher> thePublisher = theQuery.getResultList();
		
		//return result (List of Publisher object)
		return thePublisher;
	}
	
	@Override
	public void addPublisher(Publisher p) {
		
		//get the current hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		// execute query
		session.saveOrUpdate(p);
	}

	
	@Override
	public Publisher getPublisherById(int id) {
		
		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// execute query and get result object
		Publisher thePublisher = currentSession.get(Publisher.class, id);
		
		//return result (Publisher object)
		return thePublisher;
	}

	

	@Override
	public void removePublisher(int id) {
		
		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Publisher publisher = currentSession.get(Publisher.class, id);
		
		currentSession.delete(publisher);

	}

	@Override
	public void addPublisherList(List<Publisher> publishers) {
		//get the current hibernate session
		Session session = sessionFactory.getCurrentSession();
				
		// execute query
		for(Publisher p: publishers) {
			session.saveOrUpdate(p);
		}
	}
	
	@Override
	public List<String> searchAutocomplete(String namePublisher) {
		Session session = sessionFactory.getCurrentSession();
		Query<String> theQuery = session.createQuery("select name from Publisher where name like :n",String.class);
		theQuery.setParameter("n", namePublisher + "%");
		List<String> str = theQuery.list();
		return str;
	}

	@Override
	public List<Publisher> searchPublisherByName(String namePublisher) {
		Session session = sessionFactory.getCurrentSession();
		Query<Publisher> theQuery = session.createQuery("from Publisher where name like :n",Publisher.class);
		theQuery.setParameter("n", namePublisher + "%");
		List<Publisher> publisherList = theQuery.list();
		return publisherList;
	}


}







