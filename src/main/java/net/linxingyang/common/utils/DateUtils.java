package net.linxingyang.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	public static final SimpleDateFormat FULL_SDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static final SimpleDateFormat STANDERED_SDF = new SimpleDateFormat("yyyy-MM-dd");
	public static final SimpleDateFormat TIME_STANDERED_SDF = new SimpleDateFormat("HH:mm:ss");
	
	public static String getDateStanderdStr(Date date) {
		if (null == date) {
			return "";
		} else {
			return STANDERED_SDF.format(date);
		}
	}
	public static String getDateFullStr(Date date) {
		if (null == date) {
			return "";
		} else {
			return FULL_SDF.format(date);
		}
	}
}
