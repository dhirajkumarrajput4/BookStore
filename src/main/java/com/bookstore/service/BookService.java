package com.bookstore.service;

import java.util.List;
import java.util.Optional;

import com.bookstore.model.Book;



public interface BookService {

	public void save(Book book);
	public List<Book> getBooks();
	//public Optional<Book> getBookById(int id);
	public void deleteBook(int id);
	
	
	
}
