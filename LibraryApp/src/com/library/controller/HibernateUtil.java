package com.library.controller;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
	 private static SessionFactory sessionFactory = buildSessionFactory();
	private static ServiceRegistry serviceRegistry;

	 private static SessionFactory buildSessionFactory() {
		try {
		StandardServiceRegistry standardRegistry = 
		new StandardServiceRegistryBuilder().configure("config/hibernate.cfg.xml").build();
		 Metadata metadata = new MetadataSources(serviceRegistry).getMetadataBuilder().build();
		 
         return metadata.getSessionFactoryBuilder().build();
		} catch (Throwable th) {

			System.err.println("Enitial SessionFactory creation failed" + th);
			throw new ExceptionInInitializerError(th);

		}
	}
	public static SessionFactory getSessionFactory() {

		return sessionFactory;

	}
	public static void shutdown() {
        // Close caches and connection pools
        getSessionFactory().close();
    }
  
        
   
}

	 

	
	
	
	
