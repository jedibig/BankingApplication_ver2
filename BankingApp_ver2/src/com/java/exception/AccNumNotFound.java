package com.java.exception;

public class AccNumNotFound extends RepositoryException{

	private static final long serialVersionUID = 1L;

	public AccNumNotFound(String errorMessage) {
		super(errorMessage);
		System.out.println("The entered Account Number was not found in our system.");
	}
}
