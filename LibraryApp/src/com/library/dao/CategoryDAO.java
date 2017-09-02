package com.library.dao;

import java.util.List;


import com.library.model.Category;

public interface CategoryDAO {
 
    public void addCategory(Category category);
 
    public Category updateCategory(int id);
 
    public List<Category> getCategory();
 
    public Category  getCategoryById(int id);
 
    public void removeCategory(int id);
    
	public Category findCategoryByName(String str);
    
    public List<String> searchAutocomplete(String nameCategory);
    
    public List<Category> searchCategoryByName(String nameCategory);
    
}