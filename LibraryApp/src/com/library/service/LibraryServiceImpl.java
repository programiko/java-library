package com.library.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.MemberDAO;
import com.library.model.Member;

@Service
public class LibraryServiceImpl implements LibraryService {

	private MemberDAO memberDAO;

	public MemberDAO getMemberDAO() {
		return memberDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void addMember(Member theMember) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(Member theMember) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public List<Member> getMembers() {
		return memberDAO.getMembers();
	}

	@Override
	public Member getMemberById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeMember(int id) {
		// TODO Auto-generated method stub
		
	}

}
