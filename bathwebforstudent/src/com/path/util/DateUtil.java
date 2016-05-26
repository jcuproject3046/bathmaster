package com.path.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public  class DateUtil {

	/**
	 * 时间转换为字符串
	 * 
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String transferDateToString(Date date, String pattern) {
		if(date==null){
			return "";
		}
		java.text.SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}

	/**
	 * 字符串转换为时间
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static Date transferStringToDate(String date, String pattern) {
		try {
			java.text.SimpleDateFormat format = new SimpleDateFormat(pattern);
			return format.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
