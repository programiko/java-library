package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.PublisherDAO;
import com.library.model.Publisher;

@Service
public class PublisherServiceImpl implements PublisherService {
	
	@Autowired
	private PublisherDAO publisherDAO;

	@Override
	@Transactional
	public void addPublisher(Publisher p) {
		publisherDAO.addPublisher(p);

	}

	@Override
	@Transactional
	public List<Publisher> getPublisher() {
		
		return publisherDAO.getPublisher();
	}

	@Override
	@Transactional
	public Publisher getPublisherById(int id) {
		// TODO Auto-generated method stub
		return publisherDAO.getPublisherById(id);
	}

	@Override
	@Transactional
	public void removePublisher(int id) {
		publisherDAO.removePublisher(id);

	}

	@Override
	@Transactional
	public void addPublisherList(List<Publisher> publishers) {
		publisherDAO.addPublisherList(publishers);
	}

	@Override
	@Transactional
	public Publisher findPublisherByName(String str) {
		return publisherDAO.findPublisherByName(str);
	}

}
