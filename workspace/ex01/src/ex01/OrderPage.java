package ex01;

import java.io.ObjectInputStream.GetField;
import java.util.Date;
import java.util.Scanner;

public class OrderPage {

	public static void main(String[] args) {
		String menuNum = "";
		String mobile = "";
		String address = "";
		String line = "---------------------------------";
		Date date = new Date();
		Scanner scanner = new Scanner(System.in);
		
		System.out.println(line);
		
		System.out.print("메뉴 선택? :");
		menuNum = scanner.next();
		
		System.out.println(line + "\n 전화번호? : ");
		mobile = scanner.next();
		
		System.out.println(line + "\n 주소? : ");
		address = scanner.next();
		
		String orderDate = getDate(date);
		String orderNum = orderDate+menuNum;
		String orderTime = getTime(date);
		
		String price = "35000";
		
		Order order = new Order(orderNum, mobile, address, orderDate, orderTime, price, menuNum);
		
		order.printOrder();
	}
	
	public static String getTime(Date date) {
		String hour = String.valueOf(date.getHours());
		String min = String.valueOf(date.getMinutes());
		String sec = String.valueOf(date.getSeconds());
		return hour+min+sec;
	}
	
	public static String getDate(Date date) {
		String year = String.valueOf(date.getYear());
		String month ="";
		String day = "";
		if(date.getMonth() < 10) {
			month = "0"; 
		}
		month += String.valueOf(date.getMonth()+1);
		if(date.getDay() < 10) {
			day ="0";
		}
		day += String.valueOf(date.getDate());
		
		if(year.length() > 2) {
			year = year.substring(1);
		}
		
		return year+month+day;
	}

}
