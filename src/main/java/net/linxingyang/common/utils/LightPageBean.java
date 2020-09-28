package net.linxingyang.common.utils;

import java.util.List;

/**
 * 为了迎合UI使用的layui，所以其中包含了一些layui需要的参数
 * 
 * PageBean需要把分页的一些信息，比如当前是哪一样，总共几页等信息传到界面
 * 因为界面根本不知道这些信息（HTTP无状态？）。
 * 
 * 而现在运用了Ajax，界面局部刷新，我只需要查询出页面指定的某页的数据，以及符合该
 * 条件下总数据量的多少即可。
 * 
 * 
 * 
 * @author linxingyang(linxingyang@foxmail.com)
 * @date 2018-5-15
 */
public class LightPageBean<T> {

	// layui需要的响应
	private Integer code;
	private String msg;	
	
	// 客户端请求时给予的数据
	// 第几页
	public Integer page;
	// 一页几条
	public Integer limit;
	
	// 服务器响应时给予的数据
	// 总数据量
	public Integer count;
	// 当前页的数据
	public List<T> data;
	
	
	// 查询时获得起始的下标
	public Integer getFromIndex() {
		// 对于mysql的limit分页，得到 limit fromIndex,size 中的fromIndex
		// 第一页， 5条一页， 0-4
		// 第二页， 5-9
		Integer totalPage = getTotalPage();
		if (page > totalPage) {
			page = totalPage;
		}
		return (page - 1) * limit;
	}
	
	/**
	 * 总页数是通过计算得到的。
	 * 
	 * @return
	 */
	public int getTotalPage() {
		// 总记录数除以每页记录数，然后判断总记录数模每页记录数是否为整数，不为整数+1
		Integer totalPage = count / limit;
		totalPage = count % limit == 0 ? totalPage : totalPage + 1;
		return totalPage;
	}
	
	
	/**
	 * 在mysql中，选择数据的终止位置
	 * 
	 * @return
	 */
	public Integer getToIndex() {
		if (count > (getFromIndex() + limit)) {
			return getFromIndex() + limit;
		} else {
			return count;
		}
	}
	
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

}
