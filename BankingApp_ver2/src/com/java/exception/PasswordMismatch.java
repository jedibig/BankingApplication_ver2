package com.java.exception;

public class PasswordMismatch extends RepositoryException{

	private static final long serialVersionUID = 1L;

	public PasswordMismatch(String errorMessage) {
		super(errorMessage);
		System.out.println("The entered password is incorrect.");
	}
}
