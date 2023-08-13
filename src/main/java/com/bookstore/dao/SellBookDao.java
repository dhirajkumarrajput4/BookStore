package com.bookstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.model.SellBook;

public interface SellBookDao extends JpaRepository<SellBook, Integer>{

}
