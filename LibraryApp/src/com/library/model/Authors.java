package com.library.model;

import java.util.HashSet;
import java.util.Set;

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
	
	public Authors(int authorsId, String authorsName, String authorsSurname) {
		super();
		this.authorsId = authorsId;
		this.authorsName = authorsName;
		this.authorsSurname = authorsSurname;
	}

	@ManyToMany(mappedBy = "authors", cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH},fetch=FetchType.EAGER)
	private Set<Book> books = new HashSet<Book>(0);
	
	
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

	
	
	
	public Authors() {
		
	}


	@Override
	public String toString() {
		return "Authors [authorsId=" + authorsId + ", authorsName=" + authorsName + ", authorsSurname=" + authorsSurname
				+ "]";
	}
	
	
	
	
	
	
	
}




