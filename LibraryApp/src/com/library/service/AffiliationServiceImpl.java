package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.AffiliationDAO;
import com.library.model.Affiliation;

@Service
public class AffiliationServiceImpl implements AffiliationService {

	@Autowired
	private AffiliationDAO affiliationDAO;
	
	@Override
	@Transactional
	public List<Affiliation> getAffiliation() {
		
		return affiliationDAO.getAffiliation();
	}

}
