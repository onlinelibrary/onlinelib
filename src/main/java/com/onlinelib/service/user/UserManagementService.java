package com.onlinelib.service.user;

import com.onlinelib.model.User;


public interface UserManagementService {

	User findUserByUsername(String userName);
	User updateUser(User user);
}
