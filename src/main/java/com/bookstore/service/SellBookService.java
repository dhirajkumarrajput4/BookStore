package com.bookstore.service;

import java.util.List;

import com.bookstore.model.SellBook;

public interface SellBookService {

	public void sellBookSave(SellBook sbook);
	public List<SellBook> getAllSellBook();
	
}
