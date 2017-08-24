package com.library.service;

import java.util.List;

import com.library.model.Debits;

public interface DebitsService {

	public void addDebit(Debits debits);
	 
    public List<Debits> getDebits();
 
    public Debits getDebitById(int id);
 
    public void removeDebit(int id);
}
