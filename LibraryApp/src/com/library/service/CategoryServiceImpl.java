package com.library.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.CategoryDAO;
import com.library.model.Category;
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	
	private CategoryDAO cateogoryDAO;
	
	@Override
	@Transactional
	public void addCategory(Category category) {
		
		cateogoryDAO.addCategory(category);

	}

	@Override
	@Transactional
	public List<Category> getCategory() {
		
		
		return cateogoryDAO.getCategory();
	}

	@Override
	@Transactional
	public Category  getCategoryById(int id) {
		// TODO Auto-generated method stub
		return cateogoryDAO.getCategoryById(id);
	}

	@Override
	@Transactional
	public void removeCategory(int id) {
		
		cateogoryDAO.removeCategory(id);

	}

	@Override
	@Transactional
	public Category updateCategory(int id) {

		return 	cateogoryDAO.updateCategory(id);
	}

	@Override
	@Transactional
	public Category findCategoryByName(String str) {
		return cateogoryDAO.findCategoryByName(str);
	}

}
