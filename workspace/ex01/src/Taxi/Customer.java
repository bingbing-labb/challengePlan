package Taxi;

public class Customer {
	private String name;
	private int balance;
	
	public Customer(String name) {
		super();
		this.name = name;
		this.balance = 20000;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	public void showBalance() {
		System.out.println(name + "님의 잔액은 " + String.valueOf(balance) + "입니다");
	}
	
}
