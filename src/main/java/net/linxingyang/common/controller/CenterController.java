package net.linxingyang.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="center")
public class CenterController {
	/**
	 * 首页 
	 * @return
	 */
	@RequestMapping(value="/index")
	public String center() {
		return "layout/index";
	}
	
}
