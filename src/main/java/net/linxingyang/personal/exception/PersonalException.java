package net.linxingyang.personal.exception;

import net.linxingyang.common.exception.ApplicationException;

public class PersonalException extends ApplicationException {

	public PersonalException() {
		super();
	}

	public PersonalException(String message, Throwable cause) {
		super(message, cause);
	}

	public PersonalException(String message) {
		super(message);
	}

	public PersonalException(Throwable cause) {
		super(cause);
	}

}
