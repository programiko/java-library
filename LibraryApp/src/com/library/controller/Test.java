package com.library.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.library.controller.HibernateUtil;
import com.library.controller.Administrators;

public class Test {

	public static void main(String[] args) {
		
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		 
//	       Session session = factory.getCurrentSession();
//	 
//	       try {
//	    	   Administrators admin = new Administrators("ivan", "ivan");
//	    	   session.beginTransaction();
//	    	   System.out.println(admin);
//	    	   session.save(admin);
//	           // Commit data.
//	           session.getTransaction().commit();
//	           System.out.println("Done!");
//	           
//	       } catch (Exception e) {
//	           e.printStackTrace();
//	           // Rollback in case of an error occurred.
//	           session.getTransaction().rollback();
//	       }
		
		
		
	// ovo je prevazidjen nacin, probaj/te da uradite preko Registry... nacin za Hibernate 5
				SessionFactory factory = new Configuration()
										.configure("hibernate.cfg.xml")
										.addAnnotatedClass(Administrators.class)
										.buildSessionFactory();
	// ovo je prevazidjen nacin, probaj/te da uradite preko Registry... nacin za Hibernate 5
				Session session = factory.getCurrentSession();
				try {			
	
					Administrators admin = new Administrators("ivan", "ivan");
					
					session.beginTransaction();

					System.out.println(admin);
					session.save(admin);
	
					session.getTransaction().commit();
					
					System.out.println("Done!");
				}
				finally {
				}
		
		
		
		
		
		
		
		/*		
		SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        session.beginTransaction();
        Administrators admin = new Administrators("ivan", "ivan");
        System.out.println("Administrator : " + admin + " added successfully");
        session.persist(admin);
        session.getTransaction().commit();
        session.close();
        */
        
        
        
//		SessionFactory sf = HibernateUtil.getSessionFactory();
//        Session session = sf.openSession();
//        session.beginTransaction();
//
//
//
//		Administrators admin = new Administrators("ivan", "ivan");
//
//		
//		System.out.println("Administrator : " + admin + " added successfully");
//		session.persist(admin);
//
//
//		session.getTransaction().commit();
//        session.close();
        
        
        
        
        
        
		//		String jdbcUrl = "jdbc:mysql://localhost:3306/db_library?useSSL=false";
		//		  String user = "lbuser";
		//		  String pass = "lbuser";
		//		  
		//		  try {
		//		   System.out.println("Connecting to database: " + jdbcUrl);
		//		   
		//		   Connection myConn = DriverManager.getConnection(jdbcUrl, user, pass);
		//		   
		//		   System.out.println("Connection successful!!!");
		//		   
		//		  }
		//		  catch (Exception exc) {
		//		   exc.printStackTrace();
		//		  }



	}
}
