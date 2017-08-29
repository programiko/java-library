package com.library.service;

import java.util.List;


import com.library.model.Category;


public interface CategoryService {

	public void addCategory(Category category);
 
    public List<Category> getCategory();
 
    public Category  getCategoryById(int id);
 
    public void removeCategory(int id);
    
    public Category updateCategory(int id);
    
    public List<String> searchAutocomplete(String nameCategory);
    
    public List<Category> searchCategoryByName(String nameCategory);
    
}
