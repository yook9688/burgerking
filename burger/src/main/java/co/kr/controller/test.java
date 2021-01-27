package co.kr.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

public class test {

	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ymd = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1) +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		System.out.println(ymd);
		 
		String subNum = "";
			
		for(int i=1; i<=8; i++) {
			subNum += (int)(Math.random() * 10);
		}
		System.out.println("subNum :" + subNum);
	}

}
