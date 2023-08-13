package com.bookstore.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.bookstore.dao.UserDao;
import com.bookstore.model.User;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userdao;

	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(User user) {
		this.userdao.save(user);

	}

	
	
	
	@Override
	@Transactional
	public List<User> getAllUsers() {

		return this.userdao.findAll();

	}

	/*
	 * @Override
	 * 
	 * @Transactional public Optional<User> getUserById(int id) {
	 * 
	 * return this.userdao.findById(id);
	 * 
	 * }
	 */
	@Override
	@Transactional
	public void deleteuser(int id) {

		this.userdao.deleteById(id);

	}




	

}
