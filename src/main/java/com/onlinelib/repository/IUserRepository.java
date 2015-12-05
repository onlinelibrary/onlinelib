package com.onlinelib.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.onlinelib.model.User;

public interface IUserRepository extends JpaRepository<User, Integer> {

	User findByUserName(String userName);

	User findByEmail(String email);

}
