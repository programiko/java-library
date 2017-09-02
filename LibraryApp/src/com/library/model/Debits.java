package com.library.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="debits")
public class Debits {

	//table columns
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int debitsId;
	
	@Column(name="date_of_debit")
	private Date dateOfDebit;
	
	@Column(name="return_date")
	private Date returnDate;
	
	@Column(name="note")
	private String note;
	
	@ManyToOne(cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="member_id")
	private Member member;
	
	@ManyToOne(cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="book_id")
	private Book book;
	
	//constructors
	public Debits() {
	}
		
	public Debits(Date dateOfDebit, Date returnDate, String note) {
		super();
		this.dateOfDebit = dateOfDebit;
		this.returnDate = returnDate;
		this.note = note;
	}
	
	public Debits(Date dateOfDebit, String note, Book book) {
		super();
		this.dateOfDebit = dateOfDebit;
		this.note = note;
		this.book = book;
	}

	//getters/setters
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getDebitsId() {
		return debitsId;
	}

	public void setDebitsId(int debitsId) {
		this.debitsId = debitsId;
	}

	public Date getDateOfDebit() {
		return dateOfDebit;
	}

	public void setDateOfDebit(Date dateOfDebit) {
		this.dateOfDebit = dateOfDebit;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	//toString()
	@Override
	public String toString() {
		return "Debits [debitsId=" + debitsId + ", dateOfDebit=" + dateOfDebit + ", returnDate=" + returnDate
				+ ", note=" + note + "]";
	}
}




















