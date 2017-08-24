package com.library.dao;

import java.util.List;

import com.library.model.Publisher;



public interface PublisherDAO {

    public void addPublisher(Publisher p);
 
    public List<Publisher> getPublisher();
 
    public Publisher getPublisherById(int id);
 
    public void removePublisher(int id);
    
}
