package net.linxingyang.diary.exception;

import net.linxingyang.common.exception.ApplicationException;

public class DiaryException extends ApplicationException {

	public DiaryException() {
		super();
	}

	public DiaryException(String message, Throwable cause) {
		super(message, cause);
	}

	public DiaryException(String message) {
		super(message);
	}

	public DiaryException(Throwable cause) {
		super(cause);
	}

	
}
