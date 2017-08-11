package com.library.dao;

import java.util.List;

import com.library.model.Administrator;

public interface AdministratorDAO {
 
    public void addAdministrator(Administrator a);
 
    public void updateAdministrator(Administrator a);
 
    public List<Administrator> getAdministrators();
 
    public Administrator getAdministratorById(int id);
 
    public void removeAdministrator(int id);
}