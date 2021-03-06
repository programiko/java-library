package com.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.dao.MemberDAO;
import com.library.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

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
	public List<String> searchAutocomplete(String nameMember) {
	
		return memberDAO.searchAutocomplete(nameMember);
	}

	@Override
	@Transactional
	public List<Member> searchMemberByName(String nameMember) {

		return memberDAO.searchMemberByName(nameMember);
	}

}
