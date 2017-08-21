package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.AdministratorDAO;
import com.library.model.Administrator;
@Service
public class AdministratorServiceImpl implements AdministratorService {

	@Autowired
	public AdministratorDAO administratorDAO;
	
	@Override
	@Transactional
	public void addMember(Administrator admin) {
		
		administratorDAO.addAdministrator(admin);

	}

	@Override
	@Transactional
	public List<Administrator> getAdministrators() {

		return administratorDAO.getAdministrators();
	}

	@Override
	@Transactional
	public List<Administrator> getAdministratorById(int id) {
		// TODO Auto-generated method stub
		return administratorDAO.getAdministratorById(id);
	}

	@Override
	@Transactional
	public void removeAdministrator(int id) {
		
		administratorDAO.removeAdministrator(id);

	}

	@Override
	@Transactional
	public Administrator updateAdministrator(int id) {
		
		return administratorDAO.updateAdministrator(id);
	}



	@Override
	@Transactional
	public Administrator getById(int id) {
		
		return administratorDAO.getById(id);
	}

}
