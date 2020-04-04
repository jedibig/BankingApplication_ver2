package com.java.dao;

import com.java.dto.Transaction;
import com.java.dto.User;
import com.java.exception.RepositoryException;

public interface AccountRepository {
	void transferMoney(Transaction transaction) throws RepositoryException;
	double getBalance(User user) throws RepositoryException;
}
