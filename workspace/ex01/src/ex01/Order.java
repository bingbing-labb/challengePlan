package ex01;

public class Order {
	String orderNum;
	String mobile;
	String address;
	String orderDate;
	String orderTime;
	String price;
	String menuNum;
	
	
	public Order(String orderNum, String mobile, String address, String orderDate, String orderTime, String price,
			String menuNum) {
		super();
		this.orderNum = orderNum;
		this.mobile = mobile;
		this.address = address;
		this.orderDate = orderDate;
		this.orderTime = orderTime;
		this.price = price;
		this.menuNum = menuNum;
		
	}

	public void printOrder() {
		
		System.out.println("주문 접수 번호 : " + orderNum );
		System.out.println("주문 핸드폰 번호 : " + mobile);
		System.out.println("주문 집 주소 : " + address);
		System.out.println("주문 날짜 : " + orderDate);
		System.out.println("주문 시간 : " + orderTime);
		System.out.println("주문 가격 : " + price);
		System.out.println("메뉴 번호 : " + menuNum);
	}

	
}
