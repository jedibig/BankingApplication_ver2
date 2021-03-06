package com.java.dao;

import com.java.dto.User;
import com.java.exception.PasswordMismatch;
import com.java.exception.UsernameExistsException;
import com.java.exception.UsernameNotFound;

public interface UserRepository {
	public User insertUser(User user) throws UsernameExistsException;
	public User retrieveUser(User user) throws PasswordMismatch, UsernameNotFound;
}