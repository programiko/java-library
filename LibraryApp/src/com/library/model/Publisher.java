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
@Table(name="publishers")
public class Publisher{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int publisherId;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phone")
	private String phone;

	@ManyToMany(fetch = FetchType.LAZY, mappedBy="publishers", cascade = CascadeType.REMOVE)
	private List<Book> books;
	
	public Publisher() {}
	
	public Publisher(String name, String address, String phone) {
		super();
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	
	public int getId() {
		return publisherId;
	}

	public void setId(int id) {
		this.publisherId = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {

		this.books = books;
	}
	
	@Override
	public String toString() {
		return "Publishers [id=" + publisherId + ", name=" + name + ", address=" + address + ", phone=" + phone + "]";
	}
	
	
}
