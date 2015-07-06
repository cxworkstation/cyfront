package com.chunyu.front.utils;

import java.text.SimpleDateFormat;
import java.util.Date;




public class TypeConversion {
		
	//Date to String
	public static String DateToString(Date date){
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    return sdf.format(date);
	}
	
	
}
