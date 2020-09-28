package net.linxingyang.book.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="bookModule")
public class BookModuleController {
	
	/**
	 * 书单管理
	 * 
	 * @return
	 */
	@RequestMapping(value="/listBooklist")
	public String listBooklist(HttpServletRequest request) {
		return "book/booklist/listBooklist";
	}
	
	/**
	 * 添加书单
	 * 
	 * @return
	 */
	@RequestMapping(value="/addBooklist")
	public String addBooklist() {
		return "book/booklist/addBooklist";
	}
	
	/**
	 * 修改书单
	 * 
	 * @return
	 */
	@RequestMapping(value="/modifyBooklist")
	public String modifyBooklist(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "book/booklist/modifyBooklist";
	}
	
	/**
	 * 查看书单
	 * 
	 * @return
	 */
	@RequestMapping(value="/viewBooklist")
	public String viewBooklist(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "book/booklist/viewBooklist";
	}
	
    public void setIds(HttpServletRequest request) {
    	String ids = request.getParameter("ids");
    	// 281,278,279,280,277,275,276,273,274,271,272,269,270,267,268,266,264,265,262,263,261,260,259,257,258,255,256,254,252,253
    	if (null != ids) {
    		StringBuilder jsonData = new StringBuilder();
    		jsonData.append("[");
    		jsonData.append(ids);
    		jsonData.append("]");
    		request.setAttribute("ids", jsonData.toString());
    	} else {
    		request.setAttribute("ids", "[]");
    	}
    }
}
