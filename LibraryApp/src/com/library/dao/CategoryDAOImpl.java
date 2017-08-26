package com.library.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.Category;
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired 
	
	private SessionFactory sessionFactory;

	@Override
	public void addCategory(Category category) {
		
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(category);
	}

	@Override
	public Category updateCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Category category = session.get(Category.class, id);
		
		return category;
	}

	@Override
	@SuppressWarnings("unchecked")
	
	public List<Category> getCategory() {
		Session session = sessionFactory.getCurrentSession();
		
		List<Category> categoryList = session.createQuery("from Category order by id").list();
		
		for(Category  c: categoryList) {
			
			System.out.println("Categories : " + c);
		}
		return categoryList;
	}

	@Override
	public Category getCategoryById(int id) {

		Session session = sessionFactory.getCurrentSession();
		
		Category category = session.get(Category.class, id);
			
		return category;
	}

	@Override
	public void removeCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Category category = session.get(Category.class, id);
		
		session.delete(category);
		
		

	}

}
