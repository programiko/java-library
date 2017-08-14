package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.library.model.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addMember(Member theMember) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(theMember);
	}
	
	@Override
	public List<Member> getMembers() {

		Session session = sessionFactory.getCurrentSession();
		
		Query<Member> theQuery = session.createQuery("from Member order by memberId", Member.class);
		
		List<Member> theMembers = theQuery.getResultList();
		
		for(Member m: theMembers) {
			System.out.println("Members list: " + m + "\n");
		}
		
		return theMembers;
	}

	@Override
	public Member getMemberById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Member member = session.get(Member.class, id);
		
		return member;
	}

	@Override
	public void removeMember(int id) {

		Session session = sessionFactory.getCurrentSession();
		
		Member member = session.get(Member.class, id);
		
		session.delete(member);
	}

	
	@Override
	public List<Member> searchMember(String theSearchName) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		Query<Member> theQuery = null;
				
		//
		// only search by name if theSearchName is not empty
		//
		if (theSearchName != null && theSearchName.trim().length() > 0) {

		// search for firstName or lastName ... case insensitive		
		theQuery =currentSession.createQuery("from Member where lower(memberName) like "
				+ ":theName or lower(memberSurename) like :theName", Member.class);
		theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
		}else{
			// theSearchName is empty ... so just get all customers
			theQuery =currentSession.createQuery("from Member", Member.class);			
		}
				
		// execute query and get result list
		List<Member> members = theQuery.getResultList();
	
		return members;
	}

}
