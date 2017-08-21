package com.library.service;

import java.util.List;

import com.library.model.Administrator;


public interface AdministratorService {

	public void addMember(Administrator admin);
 
    public List<Administrator> getAdministrators();
 
    public List<Administrator> getAdministratorById(int id);
 
    public void removeAdministrator(int id);
    
    public Administrator updateAdministrator(int id);
    
    public Administrator getById(int id);
    
    
}
