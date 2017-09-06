package com.library.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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

	@Override
	public Category findCategoryByName(String str) {
		
		Session session = sessionFactory.getCurrentSession();
		
		@SuppressWarnings("rawtypes")
		Query theQuery = session.createQuery("from Category where name like :str", Category.class);
		theQuery.setParameter("str", str);
		Category c = (Category) theQuery.uniqueResult();
		System.out.println("\n\n from dao:" + c + "\n\n");
		System.out.println("\n\n from dao:" + str + "\n\n");
		return c;
	}
	
	@Override
	public List<String> searchAutocomplete(String nameCategory) {
		
		Session session = sessionFactory.getCurrentSession();
		Query<String> theQuery = session.createQuery("select name from Category where name like '%"+nameCategory+"%'",String.class);
		List<String> str = theQuery.getResultList();
		return str;
	}

	@Override
	public List<Category> searchCategoryByName(String nameCategory) {
		
		Session session = sessionFactory.getCurrentSession();
		Query<Category> theQuery = session.createQuery("from Category where name like :n",Category.class);
		theQuery.setParameter("n","%"+ nameCategory + "%");
		List<Category> categoryList = theQuery.list();
		return categoryList;
	}

}
