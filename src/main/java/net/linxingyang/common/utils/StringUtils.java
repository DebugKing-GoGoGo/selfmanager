package net.linxingyang.common.utils;

public class StringUtils {

	public static boolean isNotEmpty(String str) {
		if (isNotNull(str)) {
			if (!"".equals(str.trim())) {
				return true;
			}
		} 
		return false;
	}
	public static boolean isNotNull(String str) {
		if (null == str) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 需要保证传进来的字符串不能为空
	 * 
	 * @param str
	 * @param length
	 * @return
	 */
	public static boolean isStringLengthGreatEqualThan(String str, int length) {
		if (str.length() >= length) {
			return true;
		} else {
			return false;
		}
	}
	public static boolean isStringLengthGreatThan(String str, int length) {
		if (str.length() > length) {
			return true;
		} else {
			return false;
		}
	}
	public static boolean isStringLengthLessEqualThan(String str, int length) {
		if (str.length() <= length) {
			return true;
		} else {
			return false;
		}
	}
	public static boolean isStringLengthLessThan(String str, int length) {
		if (str.length() < length) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
}
