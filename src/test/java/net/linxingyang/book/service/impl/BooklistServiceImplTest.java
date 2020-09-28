package net.linxingyang.book.service.impl;

import java.util.UUID;

import net.linxingyang.book.service.BooklistService;
import net.linxingyang.diary.service.DiaryService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BooklistServiceImplTest {
	ApplicationContext applicationContext;
	DiaryService diaryService;
	BooklistService booklistService;
	@Before
	public void before() {
		String[] arr = new String[] { "classpath:config/spring/applicationContext-dao.xml", //
				"classpath:config/spring/applicationContext.xml", //
				"classpath:config/spring/applicationContext-springmvc.xml"};
		applicationContext = new ClassPathXmlApplicationContext(arr);
		// tbUserService = (TbUserService)applicationContext.getBean("tbUserService");
		booklistService = (BooklistService)applicationContext.getBean("booklistService");
		
	}
	@Test
	public void testGenerateIds() {
		System.out.println(UUID.randomUUID().toString().replace("-", ""));
	}
	@Test
	public void testSelectIds() {
		/*
		BooklistQo qo = new BooklistQo();
		
		Set<Integer> configIds = new HashSet<Integer>();
		configIds.add(24);
		configIds.add(30);
		qo.setConfigIds(configIds);
		qo.setConfigIdsLength(configIds.size());
		System.out.println("开始打印");
		for (Integer booklist_id : booklistService.selectIds(qo)) {
			System.out.println("id为：" + booklist_id);
		}
		*/
	}

}
