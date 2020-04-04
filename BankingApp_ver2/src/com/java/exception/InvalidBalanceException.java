package com.java.exception;

public class InvalidBalanceException extends RepositoryException{

	private static final long serialVersionUID = 1L;

	public InvalidBalanceException(String errorMessage) {
		super(errorMessage);
		System.out.print("You have an invalid balance for transfer.");
	}
}
