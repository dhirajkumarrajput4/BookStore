package com.bookstore.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookid;
	@Size(min = 5, message = "Minimum 5 charectors are required")
	private String booktitle;
	@Size(min = 3, message = "Minimum 3 charectors are required")
	private String bookauthor;
	private int bookquantity;
	@Size(min = 20, message = "Minimum 20 charectors are required")
	private String bookdescription;
	
	
	private double price;
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	private double discount;
	
	
	

	public int getBookquantity() {
		return bookquantity;
	}

	public void setBookquantity(int bookquantity) {
		this.bookquantity = bookquantity;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getBooktitle() {
		return booktitle;
	}

	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}

	public String getBookauthor() {
		return bookauthor;
	}

	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}

	public String getBookdescription() {
		return bookdescription;
	}

	public void setBookdescription(String bookdescription) {
		this.bookdescription = bookdescription;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	


	public void setDiscount(long discount) {
		this.discount = discount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}



	

	

	
	
	

}
