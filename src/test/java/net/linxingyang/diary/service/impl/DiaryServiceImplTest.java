package net.linxingyang.diary.service.impl;

import net.linxingyang.diary.service.DiaryService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DiaryServiceImplTest {
	ApplicationContext applicationContext;
	
	DiaryService diaryService;
	@Before
	public void before() {
		String[] arr = new String[] { "classpath:config/spring/applicationContext-dao.xml", //
				"classpath:config/spring/applicationContext.xml", //
				"classpath:config/spring/applicationContext-springmvc.xml"};
		applicationContext = new ClassPathXmlApplicationContext(arr);
		// tbUserService = (TbUserService)applicationContext.getBean("tbUserService");
		diaryService = (DiaryService)applicationContext.getBean("diaryService");
		
	}
	@Test
	public void test() {
		/*
		System.out.println("hi");
		Diary diary = new Diary();
		diary.setCreateDate(new Date());
		diary.setContent("aaabb");
		diary.setMood("好好好xx");
		diary.setWeather("下雨");
		
		try {
			diaryService.insert(diary);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
}
