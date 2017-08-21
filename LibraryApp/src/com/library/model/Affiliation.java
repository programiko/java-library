package com.library.model;

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
@Table(name="affiliations")
public class Affiliation {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="author_id ")
	private int autorId;
	
	@Column(name="book_id ")
	private int bookId;
	
	public Affiliation() {}
	
/*	@ManyToOne(cascade=
		{CascadeType.PERSIST,CascadeType.MERGE,
				CascadeType.DETACH,CascadeType.REFRESH})
	@JoinColumn(name="autorId")
	private Autor autor;
	
	@ManyToOne(cascade=
		{CascadeType.PERSIST,CascadeType.MERGE,
				CascadeType.DETACH,CascadeType.REFRESH})
	@JoinColumn(name="bookId")
	private Book book;*/

	public int getAutorId() {
		return autorId;
	}

	public void setAutorId(int autorId) {
		this.autorId = autorId;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

/*	public Autor getAutor() {
		return autor;
	}

	public void setAutor(Autor autor) {
		this.autor = autor;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	} */

	@Override
	public String toString() {
		return "Affiliation [autorId=" + autorId + ", bookId=" + bookId + "]";
	}
	
	
}
