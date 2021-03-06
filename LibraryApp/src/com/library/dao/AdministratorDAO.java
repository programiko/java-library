package com.library.dao;

import java.util.List;

import com.library.model.Administrator;

public interface AdministratorDAO {
 
    public void addAdministrator(Administrator admin);
 
    public Administrator updateAdministrator(int id);
 
    public List<Administrator> getAdministrators();
 
    public List<Administrator>  getAdministratorById(int id);
 
    public void removeAdministrator(int id);
    
    public Administrator getById(int id);
    
	public boolean checkAdmin( String username, String password);
	
	public Administrator getSuper(String username);
    
}