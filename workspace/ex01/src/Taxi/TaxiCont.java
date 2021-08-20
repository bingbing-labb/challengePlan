package Taxi;

public class TaxiCont {
	
	public static void main(String[] args) {
		int price = 10000;
		
		Customer cus= new Customer("Edward");
		cus.setBalance(cus.getBalance()-price);
		
		Taxi taxi = new Taxi("잘 나간다 운수택시", price);
		
		cus.showBalance();
		taxi.showTaxiInfo();
	}
	
	
}
