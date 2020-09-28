package net.linxingyang.config.exception;

import net.linxingyang.common.exception.ApplicationException;

public class ConfigException extends ApplicationException {

	public ConfigException() {
		super();
	}

	public ConfigException(String message, Throwable cause) {
		super(message, cause);
	}

	public ConfigException(String message) {
		super(message);
	}

	public ConfigException(Throwable cause) {
		super(cause);
	}

}
