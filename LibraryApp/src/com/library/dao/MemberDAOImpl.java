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
	public MemberDAOImpl() {
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

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

}
