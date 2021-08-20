package report;

public class Report {
	StringBuffer buffer = new StringBuffer();
	
	private String line ="=========================";
	private String title = "	이름 \t	주소 \t\t		전화번호	\t";
	
	private void makeHeader() {
		buffer.append(line);
		buffer.append(title);
		buffer.append(line);
	}
	
	private void makeBody() {
		buffer.append("James \t");
		buffer.append("Seoul Korea\t");
		buffer.append("010-2345-0001");
		
		buffer.append("Corlin \t");
		buffer.append("Seoul Korea\t");
		buffer.append("010-2335-0321");
		
	}
	
	private void makeFooter() {
		buffer.append(line);
	}
	
	public String getReport() {
		makeHeader();
		makeBody();
		makeFooter();
		
		return buffer.toString();
		
	}
}
