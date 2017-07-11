package telco.naree.domain;

public class CheckPaymentPublish {

	private String check_payment_no;
	private String check_no;
	private String check_sepa;
	private int number_of_sheet;
	public String getCheck_payment_no() {
		return check_payment_no;
	}
	public void setCheck_payment_no(String check_payment_no) {
		this.check_payment_no = check_payment_no;
	}
	public String getCheck_no() {
		return check_no;
	}
	public void setCheck_no(String check_no) {
		this.check_no = check_no;
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
	@Override
	public String toString() {
		return "CheckPaymentPublish [check_payment_no=" + check_payment_no
				+ ", check_no=" + check_no + ", check_sepa=" + check_sepa
				+ ", number_of_sheet=" + number_of_sheet + "]";
	}
	
}
