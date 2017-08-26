package com.library.dao;

import java.util.List;

import com.library.model.Authors;

public interface AuthorsDAO {
	
		public void addAuthors(Authors theAuthors);
	 
	    public List<Authors> getAuthors();
	 
	    public Authors getAuthorsById(int id);
	 
	    public void removeAuthors(int id);

		public void addAuthorsList(List<Authors> authors);

	

}
