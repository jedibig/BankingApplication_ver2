package com.java.exception;

public class UsernameNotFound extends RepositoryException{

	private static final long serialVersionUID = 1L;

	public UsernameNotFound (String errorMessage) {
		super(errorMessage);
		System.out.println("The specified username was not found in the system.");
	}
}
