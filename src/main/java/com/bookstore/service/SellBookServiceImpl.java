package com.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.dao.SellBookDao;
import com.bookstore.model.SellBook;

@Service
public class SellBookServiceImpl implements SellBookService{

	@Autowired
	SellBookDao sellBookDao;
	
	@Override
	public void sellBookSave(SellBook sbook) {

		this.sellBookDao.saveAndFlush(sbook);
		
	}

	@Override
	public List<SellBook> getAllSellBook() {

		return this.sellBookDao.findAll();
	}

}
