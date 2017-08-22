package com.library.dao;

import java.util.List;

import com.library.model.Authors;

public interface AuthorsDAO {
	
		public void addAuthors(Authors theAuthors);
	 
	    public void updateAuthors(Authors theAuthors);
	 
	    public List<Authors> getAuthors();
	 
	    public Authors getAuthorsById(int id);
	    
	    
	    public Authors getAuthorByName(String name);
	 
	    public void removeAuthors(int id);

	

}
