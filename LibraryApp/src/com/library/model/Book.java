package com.library.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="books")
public class Book{
	
	//table columns
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int bookId;
	
	@Column(name="title")
	private String bookTitle;
	
	@Column(name="number_of_pages")
	private int numberOfPages;
	
	@Column(name="number_of_copies")
	private int numberOfCopies;
	
	@Column(name="number_of_renting")
	private int numberOfRenting;
	
	@Column(name="number_of_rented_books")
	private int numberOfRentedBook;
	
	@Column(name="rating")
	private float bookRating;
	
	@Column(name="location")
	private String bookLocation;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(name="affiliations", 
				joinColumns=@JoinColumn(name="book_id"), 
				inverseJoinColumns=@JoinColumn(name="author_id"))
	private List<Authors> authors = new ArrayList<Authors>();

	@ManyToMany(fetch = FetchType.LAZY, cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(name="book_publisher", 
				joinColumns=@JoinColumn(name="book_id"), 
				inverseJoinColumns=@JoinColumn(name="publisher_id"))   
	private List<Publisher> publishers;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="category_id")
	private Category category;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="book_id")
	private List<Debits> debit;	
		 
	//constructors
 	public Book() {
	}
		
    public Book(String bookTitle, int numberOfPages, int numberOfCopies, int numberOfRenting, int numberOfRentedBook,
			float bookRating, String bookLocation) {
		super();
		this.bookTitle = bookTitle;
		this.numberOfPages = numberOfPages;
		this.numberOfCopies = numberOfCopies;
		this.numberOfRenting = numberOfRenting;
		this.numberOfRentedBook = numberOfRentedBook;
		this.bookRating = bookRating;
		this.bookLocation = bookLocation;
	}
    
	//getters and setters    

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	
	public List<Debits> getDebit() {
		return debit;
	}

	public void setDebit(List<Debits> debit) {
		this.debit = debit;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public int getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(int numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	public int getNumberOfCopies() {
		return numberOfCopies;
	}

	public void setNumberOfCopies(int numberOfCopies) {
		this.numberOfCopies = numberOfCopies;
	}

	public int getNumberOfRenting() {
		return numberOfRenting;
	}

	public void setNumberOfRenting(int numberOfRenting) {
		this.numberOfRenting = numberOfRenting;
	}

	public int getNumberOfRentedBook() {
		return numberOfRentedBook;
	}

	public void setNumberOfRentedBook(int numberOfRentedBook) {
		this.numberOfRentedBook = numberOfRentedBook;
	}

	public float getBookRating() {
		return bookRating;
	}

	public void setBookRating(float bookRating) {
		this.bookRating = bookRating;
	}

	public String getBookLocation() {
		return bookLocation;
	}

	public void setBookLocation(String bookLocation) {
		this.bookLocation = bookLocation;
	}
	
	public List<Authors> getAuthors() {
		return authors;
	}
	
	public void setAuthors(List<Authors> authors) {
		this.authors = authors;
	}

	public List<Publisher> getPublishers() {
		return publishers;
	}
	
	public void setPublishers(List<Publisher> publishers) {
		this.publishers = publishers;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}


	//toString() method
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookTitle=" + bookTitle + ", numberOfPages=" + numberOfPages
				+ ", numberOfCopies=" + numberOfCopies + ", numberOfRenting=" + numberOfRenting
				+ ", numberOfRentedBook=" + numberOfRentedBook + ", bookRaiting=" + bookRating + ", bookLocation="
				+ bookLocation + ", publishers=" + publishers.toString() + "author=" + authors.toString()
				+ ", category" + category +"]";
	}
	
	
}
