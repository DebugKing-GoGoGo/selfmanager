package net.linxingyang.common.vo;

public class CommonVo {
	
	private int code;
	private String message;
	private Object resultObject;
	
	
	public CommonVo() {
		code = ResponseCode.UNDEAL;
		message = "程序还未进行处理!";
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getResultObject() {
		return resultObject;
	}
	public void setResultObject(Object resultObject) {
		this.resultObject = resultObject;
	}
}
