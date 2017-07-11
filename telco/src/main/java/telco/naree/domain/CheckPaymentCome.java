package telco.naree.domain;

public class CheckPaymentCome {

	private String check_payment_no;
	private String check_sepa;
	private int number_of_sheet;
	private String start_num;
	private String giro_code;
	public String getCheck_payment_no() {
		return check_payment_no;
	}
	public void setCheck_payment_no(String check_payment_no) {
		this.check_payment_no = check_payment_no;
	}
	public String getCheck_sepa() {
		return check_sepa;
	}
	public void setCheck_sepa(String check_sepa) {
		this.check_sepa = check_sepa;
	}
	public int getNumber_of_sheet() {
		return number_of_sheet;
	}
	public void setNumber_of_sheet(int number_of_sheet) {
		this.number_of_sheet = number_of_sheet;
	}
	public String getStart_num() {
		return start_num;
	}
	public void setStart_num(String start_num) {
		this.start_num = start_num;
	}
	public String getGiro_code() {
		return giro_code;
	}
	public void setGiro_code(String giro_code) {
		this.giro_code = giro_code;
	}
	@Override
	public String toString() {
		return "CheckPaymentCome [check_payment_no=" + check_payment_no
				+ ", check_sepa=" + check_sepa + ", number_of_sheet="
				+ number_of_sheet + ", start_num=" + start_num + ", giro_code="
				+ giro_code + "]";
	}
	
}
