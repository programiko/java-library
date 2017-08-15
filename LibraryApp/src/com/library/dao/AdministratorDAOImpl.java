package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.library.model.Administrator;

@Repository
public class AdministratorDAOImpl implements AdministratorDAO {
	
	@Autowired
    private SessionFactory sessionFactory;
    
    
	@Override
	public void addAdministrator(Administrator p) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAdministrator(Administrator p) {
		// TODO Auto-generated method stub
		
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<Administrator> getAdministrators() {
        Session session = sessionFactory.getCurrentSession();
        List<Administrator> administratorList = session.createQuery("from Administrator").list();
        for (Administrator a : administratorList) {
        	System.out.println("Administrator List::" + a);
        }
        return administratorList;
	}

	@Override
	public Administrator getAdministratorById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeAdministrator(int id) {
		// TODO Auto-generated method stub
		
	}
 

 
}