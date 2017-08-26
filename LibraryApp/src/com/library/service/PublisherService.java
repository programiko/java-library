package com.library.service;

import java.util.List;

import com.library.model.Publisher;

public interface PublisherService {

    public void addPublisher(Publisher p);
 
    public List<Publisher> getPublisher();
 
    public Publisher getPublisherById(int id);
 
    public void removePublisher(int id);

	public void addPublisherList(List<Publisher> publishers);    
    
}
