package net.linxingyang.personal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="personalModule")
public class PersonalModule {
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
     * 大事件管理
     * 
     * @return
     */
    @RequestMapping(value="/listBigThing")
    public String listBigThing(HttpServletRequest request) {
    	request.setAttribute("leftMenu", "bigThing");
    	return "personal/bigThing/listBigThing";
    }
    
    /**
     * 添加大事件
     * 
     * @return
     */
    @RequestMapping(value="/addBigThing")
    public String addBigThing(HttpServletRequest request) {
    	return "personal/bigThing/addBigThing";
    }
    
    /**
     * 修改大事件
     * 
     * @return
     */
    @RequestMapping(value="/modifyBigThing")
    public String modifyBigThing(Integer id, HttpServletRequest request) {
    	request.setAttribute("id", id);
    	return "personal/bigThing/modifyBigThing";
    }
    
    /**
     * 查看大事件
     * 
     * @return
     */
    @RequestMapping(value="/viewBigThing")
    public String viewBigThing(Integer id, HttpServletRequest request) {
    	request.setAttribute("id", id);
    	return "personal/bigThing/viewBigThing";
    }
    
    
	/**
	 * 一些话管理
	 * 
	 * @return
	 */
	@RequestMapping(value="/listWord")
	public String listWord(HttpServletRequest request) {
		request.setAttribute("leftMenu", "word");
		return "personal/word/listWord";
	}
	
	/**
	 * 添加一些话
	 * 
	 * @return
	 */
	@RequestMapping(value="/addWord")
	public String addWord() {
		return "personal/word/addWord";
	}
	
	/**
	 * 修改一些话
	 * 
	 * @return
	 */
	@RequestMapping(value="/modifyWord")
	public String modifyWord(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "personal/word/modifyWord";
	}
	
	/**
	 * 查看一些话
	 * 
	 * @return
	 */
	@RequestMapping(value="/viewWord")
	public String viewWord(Integer id, HttpServletRequest request) {
		setIds(request);
		request.setAttribute("id", id);
		return "personal/word/viewWord";
	}
	
	
    /**
     * 认识的人管理
     * 
     * @return
     */
    @RequestMapping(value="/listPerson")
    public String listPerson(HttpServletRequest request) {
        return "personal/person/listPerson";
    }
    
    /**
     * 添加认识的人
     * 
     * @return
     */
    @RequestMapping(value="/addPerson")
    public String addPerson() {
        return "personal/person/addPerson";
    }
    
    /**
     * 修改认识的人
     * 
     * @return
     */
    @RequestMapping(value="/modifyPerson")
    public String modifyPerson(Integer id, HttpServletRequest request) {
    	setIds(request);
        request.setAttribute("id", id);
        return "personal/person/modifyPerson";
    }
    
    /**
     * 查看认识的人
     * 
     * @return
     */
    @RequestMapping(value="/viewPerson")
    public String viewPerson(Integer id, HttpServletRequest request) {
    	setIds(request);
        request.setAttribute("id", id);
        return "personal/person/viewPerson";
    }
    
    /**
     * 密语管理
     * 
     * @return
     */
    @RequestMapping(value="/listPersonWord")
    public String listPersonWord(Integer personId, HttpServletRequest request) {
    	request.setAttribute("personId", personId);
    	return "personal/personWord/listPersonWord";
    }
    
    /**
     * 添加密语
     * 
     * @return
     */
    @RequestMapping(value="/addPersonWord")
    public String addPersonWord(Integer personId, HttpServletRequest request) {
    	request.setAttribute("personId", personId);
    	return "personal/personWord/addPersonWord";
    }
    
    /**
     * 修改密语
     * 
     * @return
     */
    @RequestMapping(value="/modifyPersonWord")
    public String modifyPersonWord(Integer id, HttpServletRequest request) {
    	request.setAttribute("id", id);
    	return "personal/personWord/modifyPersonWord";
    }
    
    /**
     * 查看密语
     * 
     * @return
     */
    @RequestMapping(value="/viewPersonWord")
    public String viewPersonWord(Integer id, HttpServletRequest request) {
    	request.setAttribute("id", id);
    	return "personal/personWord/viewPersonWord";
    }
    
    
    /**
     * 添加人物小传
     * 
     * @return
     */
    @RequestMapping(value="/addPeopleHistory")
    public String addPeopleHistory(Integer personId, HttpServletRequest request) {
    	request.setAttribute("personId", personId);
    	return "personal/peopleHistory/addPeopleHistory";
    }
    
    /**
     * 修改人物小传
     * 
     * @return
     */
    @RequestMapping(value="/modifyPeopleHistory")
    public String modifyPeopleHistory(Integer personId, HttpServletRequest request) {
    	request.setAttribute("personId", personId);
    	return "personal/peopleHistory/modifyPeopleHistory";
    }
    
    /**
     * 未来一封信管理
     * 
     * @return
     */
    @RequestMapping(value="/listFutureLetter")
    public String listFutureLetter(HttpServletRequest request) {
    	request.setAttribute("leftMenu", "futerLetter");
    	return "personal/futureLetter/listFutureLetter";
    }
    
    /**
     * 添加未来一封信
     * 
     * @return
     */
    @RequestMapping(value="/addFutureLetter")
    public String addFutureLetter(HttpServletRequest request) {
    	return "personal/futureLetter/addFutureLetter";
    }
    
    /**
     * 修改未来一封信
     * 
     * @return
     */
    @RequestMapping(value="/modifyFutureLetter")
    public String modifyFutureLetter(Integer id, HttpServletRequest request) {
    	request.setAttribute("id", id);
    	return "personal/futureLetter/modifyFutureLetter";
    }
    
    /**
     * 查看未来一封信
     * 
     * @return
     */
    @RequestMapping(value="/viewFutureLetter")
    public String viewFutureLetter(Integer id, HttpServletRequest request) {
    	request.setAttribute("id", id);
    	return "personal/futureLetter/viewFutureLetter";
    }
    
    /**
     * 长期任务管理
     * 
     * @return
     */
    @RequestMapping(value="/listLongTermTask")
    public String listLongTermTask(HttpServletRequest request) {
    	request.setAttribute("leftMenu", "longTermTask");
    	return "personal/longTermTask/listLongTermTask";
    }
}
