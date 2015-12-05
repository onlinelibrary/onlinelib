package com.onlinelib.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.onlinelib.model.User;

@Repository
@Transactional(readOnly = true)
public class UserRepository {

	@Autowired
	private IUserRepository userRepository;

	public void flush() {
		userRepository.flush();
	}

	public User findById(Integer id) {
		if (userRepository.exists(id)) {
			return userRepository.findOne(id);
		}
		return null;
	}

	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Transactional
	public User save(User user) {
		return userRepository.save(user);
	}

	public User findByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}

	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public void delete(User user) {
		userRepository.delete(user);
	}
}