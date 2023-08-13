package com.bookstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.dao.BookDao;
import com.bookstore.model.Book;
@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookDao bookDao;

	@Override
	public void save(Book book) {
		this.bookDao.save(book);
	}

	@Override
	public List<Book> getBooks() {

		return this.bookDao.findAll();
	}

	/*
	 * @Override public Optional<Book> getBookById(int id) {
	 * 
	 * return this.bookDao.findById(id); }
	 */

	@Override
	public void deleteBook(int id) {
		this.bookDao.deleteById(id);
		
	}



}
