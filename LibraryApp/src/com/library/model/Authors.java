package com.library.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="authors")

public class Authors{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int authorsId;
	
	@Column(name="name")
	private String authorsName;
	
	@Column(name="surename")
	private String authorsSurname;
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy="authors", cascade = CascadeType.REMOVE) 
	private List<Book> books;
	
	public Authors(String authorsName, String authorsSurname) {
		super();
		this.authorsName = authorsName;
		this.authorsSurname = authorsSurname;
	}

	public Authors() {
		
	}

	public int getAuthorsId() {
		return authorsId;
	}


	public void setAuthorsId(int authorsId) {
		this.authorsId = authorsId;
	}


	public String getAuthorsName() {
		return authorsName;
	}


	public void setAuthorsName(String authorsName) {
		this.authorsName = authorsName;
	}


	public String getAuthorsSurname() {
		return authorsSurname;
	}


	public void setAuthorsSurname(String authorsSurname) {
		this.authorsSurname = authorsSurname;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	@Override
	public String toString() {
		return "Authors [authorsId=" + authorsId + ", authorsName=" + authorsName + ", authorsSurname=" + authorsSurname
				+ "]";
	}
		
		
}




