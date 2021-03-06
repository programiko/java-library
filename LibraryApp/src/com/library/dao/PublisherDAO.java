package com.library.dao;

import java.util.List;


import com.library.model.Publisher;



public interface PublisherDAO {

    public void addPublisher(Publisher p);
 
    public List<Publisher> getPublisher();
 
    public Publisher getPublisherById(int id);
 
    public void removePublisher(int id);

	public void addPublisherList(List<Publisher> publishers);
	
	public List<String> searchAutocomplete(String namePublisher);
	
	public List<Publisher> searchPublisherByName(String namePublisher);
	
	public Publisher findPublisherByName(String str);
    
}
