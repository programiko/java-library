package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.library.model.Administrator;

@Repository
public class AdministratorDAOImpl implements AdministratorDAO {
	
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sf) {
        sessionFactory = sf;
    }
    
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Administrator> getAdministrators() {
        Session session = sessionFactory.getCurrentSession();
        List<Administrator> administratorList = session.createQuery("from Administrator order by username").list();
        for (Administrator a : administratorList) {
        	System.out.println("Administrator List :" + a);
        }
        return administratorList;
	}

	@Override
	public List<Administrator> getAdministratorById(int id) {
	
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		if (id != 0) {
		query = session.createQuery("from Administrator a where a.id = :id", Administrator.class);
		query.setParameter("id", id);
		
		}else {
			
			query = session.createQuery("from Administrator ", Administrator.class);
		}
			List <Administrator> admins = query.getResultList();	
		
		return admins;
	}

	@Override
	public void removeAdministrator(int id) {
		Session session = sessionFactory.getCurrentSession();
		Administrator admin = session.get(Administrator.class, id );
		
		session.remove(admin);
		
		
	}

	@Override
	public Administrator updateAdministrator(int id) {
	
		Session session = sessionFactory.getCurrentSession();
		
		Administrator admin = session.get(Administrator.class, id);
		
		return admin;
		
	}


	@Override
	public void addAdministrator(Administrator admin) {
		
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(admin);
		
	
		
	}
 

 
}