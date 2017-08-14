package com.library.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.library.dao.MemberDAO;
import com.library.model.Member;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	
	public MemberServiceImpl() {
	}
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	@Transactional
	public void addMember(Member theMember) {
		memberDAO.addMember(theMember);	
	}
	
	@Override
	@Transactional
	public List<Member> getMembers() {
		return memberDAO.getMembers();
	}

	@Override
	@Transactional
	public Member getMemberById(int id) {
		return memberDAO.getMemberById(id);
	}

	@Override
	@Transactional
	public void removeMember(int id) {
		memberDAO.removeMember(id);
	}

	@Override
	@Transactional
	public List<Member> searchMember(String theSearchName) {
		return memberDAO.searchMember(theSearchName);
	}

}
