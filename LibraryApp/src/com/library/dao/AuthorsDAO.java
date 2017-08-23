package com.library.dao;

import java.util.List;

import com.library.model.Authors;

public interface AuthorsDAO {
	
		public void addAuthors(Authors theAuthors);
	 
	    public void updateAuthors(Authors theAuthors);
	 
	    public List<Authors> getAuthors();
	 
	    public Authors getAuthorsById(int id);
<<<<<<< HEAD
	    
	    
	    public Authors getAuthorByName(String name);
=======
>>>>>>> 8f49d91b3bed8624f4f2613cb3ee718b70145e76
	 
	    public void removeAuthors(int id);

	

}
