package net.linxingyang.common.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页工具类 ：在这个类中未对传入的参数进行验证，所以在使用这个类的 时候必须保证传入的参数是正确的
 * 
 * @author lxy
 * 
 * @param <T>
 */
public class PageBean<T> {
	private Integer pageIndex; // 当前页码
	private Integer totalPage; // 总页数
	private int totalRecord; // 总记录数
	private int pageSize; // 每页记录数
	public final Integer DEFAUL_PAGE_SIZE = 5;
	private List<T> beanList; // 当前页记录

	private String url; // 分页查询时，保存条件

	private final int totalShowIndex = 10; // 显示页数个数，暂时定死了显示10个，到时候需要改这里要改挺多的。。
	private List<Integer> showIndexList;

	// public void setShowIndexList(List<Integer> showIndexList) {
	// this.showIndexList = showIndexList;
	// }

	public Integer getPageIndex() {
		return pageIndex;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	// 总页数是通过计算得到的。
	public int getTotalPage() {
		// 总记录数除以每页记录数，然后判断总记录数模每页记录数是否为整数，不为整数+1
		totalPage = totalRecord / pageSize;
		totalPage = totalRecord % pageSize == 0 ? totalPage : totalPage + 1;
		return totalPage;
	}

	// public void setTotalPage(int totalPage) {
	// this.totalPage = totalPage;
	// }
	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

	public int getTotalShowIndex() {
		return totalShowIndex;
	}

	//
	// public void setTotalShowIndex(int totalShowIndex) {
	// this.totalShowIndex = totalShowIndex;
	// }

	/**
	 * 得到显示的下标。
	 * 
	 * @return
	 */
	// public List<Integer> getShowIndex() {
	//
	// }
	public List<Integer> getShowIndexList() {
		int begin = 0;
		int end = 0;
		getTotalPage(); // 要保证在比较之前，总页数要有值

		// 当总页数不足要显示的页数，那么把所有的页数都显示出来
		if (totalPage <= totalShowIndex) {
			begin = 1;
			end = totalPage;
		} else {
			begin = pageIndex - 5;
			end = pageIndex + 4;
			if (begin < 1) { // 头溢出
				begin = 1;
				end = 10;
			}
			if (end > totalPage) {
				begin = totalPage - 9;
				end = totalPage;
			}
		}
		showIndexList = new ArrayList<Integer>();
		for (int i = begin; i <= end; i++) {
			showIndexList.add(i);
		}
		return showIndexList;
	}

	public Integer getFromIndex() {
		// 对于mysql的limit分页，得到 limit fromIndex,size 中的fromIndex
		// 第一页， 5条一页， 0-4
		// 第二页， 5-9
		return (pageIndex - 1) * pageSize;
	}

	public Integer getToIndex() {
		if (totalRecord > (getFromIndex() + pageSize)) {
			return getFromIndex() + pageSize;
		} else {
			return totalRecord;
		}
	}

}
