package com.library.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.library.model.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	
	private SessionFactory sessionFactory;
			
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addMember(Member theMember) {
	}

	@Override
	public void updateMember(Member theMember) {
	}

	
	@Override
	public List<Member> getMembers() {

		Session session = sessionFactory.getCurrentSession();
		
		Query<Member> theQuery = session.createQuery("from Member", Member.class);
		
		List<Member> theMembers = theQuery.getResultList();
		
		for(Member m: theMembers) {
			System.out.println("Members list: " + m + "\n");
		}
		
		return theMembers;
	}

	@Override
	public Member getMemberById(int id) {
		return null;
	}

	@Override
	public void removeMember(int id) {
	}

}
