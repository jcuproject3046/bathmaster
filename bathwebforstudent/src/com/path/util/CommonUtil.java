package com.path.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class CommonUtil {

	public static long getAssigned() {
		java.text.SimpleDateFormat format = new SimpleDateFormat(
				"yyMMddHHmmssSSS");
		// System.out.println(format.format(new Date()));
		return Long.parseLong(format.format(new Date()));
	}

	public static Date convertStringToDate(String source,String pattern)throws Exception {
		java.text.SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.parse(source);

	}
	
	public static String getCurrentTime(Date d, String pattern){
		java.text.SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(new Date());
	}
	
	/**
	 * 生成卡密
	 * @param len
	 * @return
	 */
	public static String createCardPwd (int len){   
	        // 35是因为数组是�?�?��的，26个字�?10个数�?  
	        final int maxNum = 10;   
	        int i; // 生成的随机数   
	        int count = 0; // 生成的密码的长度   
	        /*char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',  
	                'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',  
	                'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };*/
	        char[] str = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };   
	  
	        StringBuffer pwd = new StringBuffer("");   
	        Random r = new Random();   
	        while (count < len) {   
	            // 生成随机数，取绝对�?，防止生成负数，   
	  
	            i = Math.abs(r.nextInt(maxNum)); // 生成的数�?���?6-1   
	  
	            if (i >= 0 && i < str.length) {   
	                pwd.append(str[i]);   
	                count++;   
	            }   
	        }   
	  
	        return pwd.toString();   
	    }   
	
	

	public static void main(String[] args) {

		/*String loadfileFileName = "a.doc";

		String fileType = loadfileFileName.substring(
				loadfileFileName.lastIndexOf(".") + 1,
				loadfileFileName.length());

		System.out.println(fileType);*/
		
		System.out.println(createCardPwd(16));;

	}

}
