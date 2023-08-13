package com.bookstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;

import com.bookstore.model.User;



public interface UserService  {

	public void save(User user);
	
	public List<User> getAllUsers();
	//public Optional<User> getUserById(int id);
	public void deleteuser(int id);
	
}
