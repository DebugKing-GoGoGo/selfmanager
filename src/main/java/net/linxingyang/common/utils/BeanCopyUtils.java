package net.linxingyang.common.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;


public class BeanCopyUtils {
	
	
	/**
	 * 默认过滤名为"class"的属性
	 * 
	 * @param from
	 * @param to
	 * @throws Exception
	 */
	public static void copy(Object from, Object to) throws Exception{
		BeanInfo bi = Introspector.getBeanInfo(from.getClass());
		BeanInfo bi2 = Introspector.getBeanInfo(to.getClass());
		
		for (PropertyDescriptor pd : bi.getPropertyDescriptors()) {
			Method m1 = pd.getReadMethod();
			
			for (PropertyDescriptor pd2 : bi2.getPropertyDescriptors()) {
				if (pd.getName().equals(pd2.getName()) && !pd.getName().equals("class")) {
					Method method = pd2.getWriteMethod();
					method.invoke(to, m1.invoke(from));
				}
			}
		}
	}
//	
//	
//	
//	public static Object copy(Object from, Class to) throws Exception {
//		BeanInfo bi = Introspector.getBeanInfo(from.getClass());
//		BeanInfo bi2 = Introspector.getBeanInfo(to);
//
//		Object o = to.newInstance();
//		for (PropertyDescriptor pd : bi.getPropertyDescriptors()) {
//			Method m1 = pd.getReadMethod();
//			
//			for (PropertyDescriptor pd2 : bi2.getPropertyDescriptors()) {
//				if (pd.getName() == pd2.getName() && !pd.getName().equals("class")) {
//					Method method = pd2.getWriteMethod();
//					method.invoke(o, m1.invoke(from));
//				}
//			}
//		}
//		return o;
//	}
//	
//	public static void copy(Object from, Object to, List<String> ignoreProperties) throws IntrospectionException {
//		TbUser tbUser = new TbUser();
//		BeanInfo bi = Introspector.getBeanInfo(tbUser.getClass());
//		for (PropertyDescriptor pd : bi.getPropertyDescriptors()) {
//			System.out.println("属性名" + pd.getName());
//		}
//	}
}
