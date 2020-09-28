package net.linxingyang.common.vo;

public class ResponseCode {
	// 0 请求处理成功，为了迎合layui的table
	public final static int SUCCESS = 0;
	// 200 请求处理成功
	// public final static int SUCCESS = 200;
	// 400 未处理？
	public final static int UNDEAL = 400; 
	// 401 因为提交了错误的数据导致的错误，用户的错误
	public final static int ERROR_INPUT = 401;
	// 402 因为内部错误，类似空指针等。
	public final static int INTERNAL_ERROR = 402;
}
