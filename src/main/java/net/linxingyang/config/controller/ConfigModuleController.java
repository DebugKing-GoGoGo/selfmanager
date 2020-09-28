package net.linxingyang.config.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="configModule")
public class ConfigModuleController {
	
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
	
	/**
	 * 配置管理
	 * 
	 * @return
	 */
	@RequestMapping(value="/listConfig")
	public String listConfig(HttpServletRequest request) {
		return "config/config/listConfig";
	}
	
	/**
	 * 添加配置
	 * 
	 * @return
	 */
	@RequestMapping(value="/addConfig")
	public String addConfig(HttpServletRequest request) {
		return "config/config/addConfig";
	}
	
	/**
	 * 修改配置
	 * 
	 * @return
	 */
	@RequestMapping(value="/modifyConfig")
	public String modifyConfig(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "config/config/modifyConfig";
	}
	
	/**
	 * 查看配置
	 * 
	 * @return
	 */
	@RequestMapping(value="/viewConfig")
	public String viewConfig(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "config/config/viewConfig";
	}
}
