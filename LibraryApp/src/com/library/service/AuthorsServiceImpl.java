package com.library.service;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dao.AuthorsDAO;

import com.library.model.Authors;

@Service
public class AuthorsServiceImpl implements AuthorsService{
	
	@Autowired
	private AuthorsDAO authorsDAO;
	
	
	@Override
	@Transactional
	public void addAuthors(Authors theAuthors){
		authorsDAO.addAuthors(theAuthors);
		
	}
	
	@Override
	@Transactional
	public Authors getAuthorsById(int id) {
		return authorsDAO.getAuthorsById(id);
		
	}
		
	@Override
	@Transactional
	public void removeAuthors(int id) {
		authorsDAO.removeAuthors(id);
	}

	@Override
	@Transactional
	public List<Authors> getAuthors() {
		return authorsDAO.getAuthors();
	}

	@Override
	@Transactional
	public void addAuthorsList(List<Authors> authors) {
		authorsDAO.addAuthorsList(authors);
	}

	@Override
	@Transactional
	public Authors findAuthorByName(String str) {
		return authorsDAO.findAuthorByName(str);
	}
	
}