package Taxi;

public class Taxi {
	String companyName;
	int fee;
	public Taxi(String companyName, int fee) {
		super();
		this.companyName = companyName;
		this.fee = fee;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public void showTaxiInfo() {
		System.out.println(companyName + " 수입은 " + String.valueOf(fee) +"입니다.");
	
	}
}
