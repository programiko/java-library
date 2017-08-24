package com.library.dao;

import java.util.List;

import com.library.model.Debits;

public interface DebitsDAO {
	
	public void addDebit(Debits debits);
 
    public List<Debits> getDebits();
 
    public Debits getDebitById(int id);
 
    public void removeDebit(int id);
}
