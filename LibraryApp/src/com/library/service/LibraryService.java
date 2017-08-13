package com.library.service;

import java.util.List;

import com.library.model.Member;

public interface LibraryService {

	public void addMember(Member theMember);
	 
    public void updateMember(Member theMember);
 
    public List<Member> getMembers();
 
    public Member getMemberById(int id);
 
    public void removeMember(int id);
}
