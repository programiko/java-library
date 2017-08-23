package com.library.model;

<<<<<<< HEAD
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
=======

import java.util.ArrayList;
import java.util.List;



import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

>>>>>>> 8f49d91b3bed8624f4f2613cb3ee718b70145e76
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
	
<<<<<<< HEAD
=======
	@ManyToMany(mappedBy="authors") 
	private List<Book> books= new ArrayList<>();
	
>>>>>>> 8f49d91b3bed8624f4f2613cb3ee718b70145e76
	public Authors(int authorsId, String authorsName, String authorsSurname) {
		super();
		this.authorsId = authorsId;
		this.authorsName = authorsName;
		this.authorsSurname = authorsSurname;
	}

<<<<<<< HEAD
	@ManyToMany(mappedBy = "authors", cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH},fetch=FetchType.EAGER)
	private Set<Book> books = new HashSet<Book>(0);
	
	
=======

>>>>>>> 8f49d91b3bed8624f4f2613cb3ee718b70145e76
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

	
<<<<<<< HEAD
	
	
=======
>>>>>>> 8f49d91b3bed8624f4f2613cb3ee718b70145e76
	public Authors() {
		
	}


	@Override
	public String toString() {
		return "Authors [authorsId=" + authorsId + ", authorsName=" + authorsName + ", authorsSurname=" + authorsSurname
				+ "]";
	}
<<<<<<< HEAD
	
	
	
	
	
	
	
=======


	public List<Book> getBooks() {
		return books;
	}


	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	
		
>>>>>>> 8f49d91b3bed8624f4f2613cb3ee718b70145e76
}




