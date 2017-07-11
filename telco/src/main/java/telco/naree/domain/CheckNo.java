package telco.naree.domain;

import java.sql.Timestamp;

public class CheckNo {

	private String check_seq;
	private String check_no;
	private String check_sepa;
	private int number_of_sheet;
	private String check_num;
	private String print_or;
	private Timestamp check_date;
	private String circulation_or;
	private String user_id;
	public String getCheck_seq() {
		return check_seq;
	}
	public void setCheck_seq(String check_seq) {
		this.check_seq = check_seq;
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
	public String getCheck_num() {
		return check_num;
	}
	public void setCheck_num(String check_num) {
		this.check_num = check_num;
	}
	public String getPrint_or() {
		return print_or;
	}
	public void setPrint_or(String print_or) {
		this.print_or = print_or;
	}
	public Timestamp getCheck_date() {
		return check_date;
	}
	public void setCheck_date(Timestamp check_date) {
		this.check_date = check_date;
	}
	public String getCirculation_or() {
		return circulation_or;
	}
	public void setCirculation_or(String circulation_or) {
		this.circulation_or = circulation_or;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "CheckNo [check_seq=" + check_seq + ", check_no=" + check_no
				+ ", check_sepa=" + check_sepa + ", number_of_sheet="
				+ number_of_sheet + ", check_num=" + check_num + ", print_or="
				+ print_or + ", check_date=" + check_date + ", circulation_or="
				+ circulation_or + ", user_id=" + user_id + "]";
	}
}
