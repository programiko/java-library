package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.Affiliation;


@Repository
public class AffiliationDAOImpl implements AffiliationDAO {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Affiliation> getAffiliation() {

		//get the current hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		// create a query for select * from Publisher
		Query<Affiliation> theQuery = session.createQuery("from Affiliation order by bookId", Affiliation.class);
		
		// execute query and get result list
		List<Affiliation> theAffiliation = theQuery.getResultList();
		
		//return result (List of Publisher object)
		return theAffiliation;
	}

}
