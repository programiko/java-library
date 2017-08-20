package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.DebitsDAO;
import com.library.model.Debits;

@Service
public class DebitsServiceImpl implements DebitsService {

	@Autowired
	private DebitsDAO debitsDAO;

	@Override
	@Transactional
	public void addDebit(Debits debits){
		debitsDAO.addDebit(debits);	
	}
	
	@Override
	@Transactional
	public List<Debits> getDebits(){
		return debitsDAO.getDebits();
	}

	@Override
	@Transactional
	public Debits getDebitById(int id){
		return debitsDAO.getDebitById(id);
	}

	@Override
	@Transactional
	public void removeDebit(int id){
		debitsDAO.removeDebit(id);
	}

}
