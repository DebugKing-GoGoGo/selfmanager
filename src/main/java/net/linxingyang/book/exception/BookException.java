package net.linxingyang.book.exception;

import net.linxingyang.common.exception.ApplicationException;

public class BookException extends ApplicationException {

	public BookException() {
		super();
	}

	public BookException(String message, Throwable cause) {
		super(message, cause);
	}

	public BookException(String message) {
		super(message);
	}

	public BookException(Throwable cause) {
		super(cause);
	}

	
}
