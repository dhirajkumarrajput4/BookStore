package com.bookstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookstore.model.SellBook;
import org.springframework.stereotype.Repository;

@Repository
public interface SellBookDao extends JpaRepository<SellBook, Integer>{

}
