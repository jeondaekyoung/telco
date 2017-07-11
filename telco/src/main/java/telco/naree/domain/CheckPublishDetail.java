package telco.naree.domain;

public class CheckPublishDetail {

	private String check_publish_no;
	private String check_no;
	private String check_sepa;
	private int number_of_sheet;
	private String start_num;
	public String getCheck_publish_no() {
		return check_publish_no;
	}
	public void setCheck_publish_no(String check_publish_no) {
		this.check_publish_no = check_publish_no;
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
	public String getStart_num() {
		return start_num;
	}
	public void setStart_num(String start_num) {
		this.start_num = start_num;
	}
	@Override
	public String toString() {
		return "CheckPublishDetail [check_publish_no=" + check_publish_no
				+ ", check_no=" + check_no + ", check_sepa=" + check_sepa
				+ ", number_of_sheet=" + number_of_sheet + ", start_num="
				+ start_num + "]";
	}
}
