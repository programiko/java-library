package com.library.service;

import java.util.List;

import com.library.model.Authors;

public interface AuthorsService {

	public void addAuthors(Authors theAuthors);
	 
    public void updateAuthors(Authors theAuthors);
 
    public List<Authors> getAuthors();
 
    public Authors getAuthorsById(int id);
 
    public void removeAuthors(int id);
	
}
