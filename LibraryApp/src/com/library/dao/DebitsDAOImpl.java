package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.Debits;

@Repository
public class DebitsDAOImpl implements DebitsDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addDebit(Debits debits) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(debits);
	}
	
	@Override
	public List<Debits> getDebits(){

		Session session = sessionFactory.getCurrentSession();
		
		Query<Debits> theQuery = session.createQuery("from Debits", Debits.class);
		
		List<Debits> debits = theQuery.getResultList();
		
		for(Debits m: debits) {
			System.out.println("Members list: " + m + "\n");
		}
		
		return debits;
	}

	@Override
	public Debits getDebitById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Debits debits = session.get(Debits.class, id);
		
		return debits;
	}

	@Override
	public void removeDebit(int id){

		Session session = sessionFactory.getCurrentSession();
		
		Debits debits = session.get(Debits.class, id);
		
		session.delete(debits);
	}

}
