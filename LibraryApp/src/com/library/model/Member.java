package com.library.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="members")
public class Member {
	
	
	//table columns
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int memberId;
	
	@Column(name="name")
	private String memberName;
	
	@Column(name="surename")
	private String memberSurename;
	
	@Column(name="address")
	private String memberAddress;
	
	@Column(name="phone")
	private String memberPhone;
	
	@Column(name="active")
	private int memberActivity;
	
	@Column(name="class_squad")
	private String memberClass;
	
	@OneToMany(mappedBy="member", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Debits> debits;
		
	//constructors
	public Member() {
	}		
		
	public Member(String memberName, String memberSurename, String memberAddress, String memberPhone,
			int memberActivity, String memberClass) {
		this.memberName = memberName;
		this.memberSurename = memberSurename;
		this.memberAddress = memberAddress;
		this.memberPhone = memberPhone;
		this.memberActivity = memberActivity;
		this.memberClass = memberClass;
	}

	//getters/setters
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public int getMemberActivity() {
		return memberActivity;
	}

	public void setMemberActivity(int memberActivity) {
		this.memberActivity = memberActivity;
	}
	
	public String getMemberClass() {
		return memberClass;
	}

	public void setMemberClass(String memberClass) {
		this.memberClass = memberClass;
	}

	public String getMemberSurename() {
		return memberSurename;
	}

	public void setMemberSurename(String memberSurename) {
		this.memberSurename = memberSurename;
	}

	public List<Debits> getDebits() {
		return debits;
	}

	public void setDebits(List<Debits> debits) {
		this.debits = debits;
	}

	//toString()
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", memberSurename=" + memberSurename
				+ ", memberAddress=" + memberAddress + ", memberPhone=" + memberPhone + ", memberActivity="
				+ memberActivity + ", memberClass=" + memberClass + "]";
	}	
}
