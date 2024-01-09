package com.bookstore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstore.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {

	@Query(value = "select *from app_user where emailId=?1 And password=?2", nativeQuery = true)
	public User checkUser(String email, String password);
	
	public User getById(int id);
	
	
}
