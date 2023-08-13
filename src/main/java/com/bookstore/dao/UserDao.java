package com.bookstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.bookstore.model.User;

public interface UserDao extends JpaRepository<User, Integer> {

	@Query(value = "select *from user where email=?1 And password=?2", nativeQuery = true)
	public User checkUser(String email,String password);
	
	public User getById(int id);
	
	
}
