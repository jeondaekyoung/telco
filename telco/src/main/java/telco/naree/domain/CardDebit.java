package telco.naree.domain;

import java.sql.Date;

public class CardDebit {

	private Long card_seq;
	private String dcard_num;
	private Date issue_date;
	private String dcard_state;
	private String dcard_code;
	private String dcard_issue_sepa;
	private String dcard_pw;
	private String dcard_use_sepa;
	private String dcard_issue_place;
	private String emp_name;
	private String scrcmpn_code;
	private String achlqr_bizrno;
	private String school_code;
	private String student_num;
	private String barcode_num;
	private String customer_no;
	private String account_num;
	public Long getCard_seq() {
		return card_seq;
	}
	public void setCard_seq(Long card_seq) {
		this.card_seq = card_seq;
	}
	public String getDcard_num() {
		return dcard_num;
	}
	public void setDcard_num(String dcard_num) {
		this.dcard_num = dcard_num;
	}
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}
	public String getDcard_state() {
		return dcard_state;
	}
	public void setDcard_state(String dcard_state) {
		this.dcard_state = dcard_state;
	}
	public String getDcard_code() {
		return dcard_code;
	}
	public void setDcard_code(String dcard_code) {
		this.dcard_code = dcard_code;
	}
	public String getDcard_issue_sepa() {
		return dcard_issue_sepa;
	}
	public void setDcard_issue_sepa(String dcard_issue_sepa) {
		this.dcard_issue_sepa = dcard_issue_sepa;
	}
	public String getDcard_pw() {
		return dcard_pw;
	}
	public void setDcard_pw(String dcard_pw) {
		this.dcard_pw = dcard_pw;
	}
	public String getDcard_use_sepa() {
		return dcard_use_sepa;
	}
	public void setDcard_use_sepa(String dcard_use_sepa) {
		this.dcard_use_sepa = dcard_use_sepa;
	}
	public String getDcard_issue_place() {
		return dcard_issue_place;
	}
	public void setDcard_issue_place(String dcard_issue_place) {
		this.dcard_issue_place = dcard_issue_place;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getScrcmpn_code() {
		return scrcmpn_code;
	}
	public void setScrcmpn_code(String scrcmpn_code) {
		this.scrcmpn_code = scrcmpn_code;
	}
	public String getAchlqr_bizrno() {
		return achlqr_bizrno;
	}
	public void setAchlqr_bizrno(String achlqr_bizrno) {
		this.achlqr_bizrno = achlqr_bizrno;
	}
	public String getSchool_code() {
		return school_code;
	}
	public void setSchool_code(String school_code) {
		this.school_code = school_code;
	}
	public String getStudent_num() {
		return student_num;
	}
	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}
	public String getBarcode_num() {
		return barcode_num;
	}
	public void setBarcode_num(String barcode_num) {
		this.barcode_num = barcode_num;
	}
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	@Override
	public String toString() {
		return "CardDebit [card_seq=" + card_seq + ", dcard_num=" + dcard_num
				+ ", issue_date=" + issue_date + ", dcard_state=" + dcard_state
				+ ", dcard_code=" + dcard_code + ", dcard_issue_sepa="
				+ dcard_issue_sepa + ", dcard_pw=" + dcard_pw
				+ ", dcard_use_sepa=" + dcard_use_sepa + ", dcard_issue_place="
				+ dcard_issue_place + ", emp_name=" + emp_name
				+ ", scrcmpn_code=" + scrcmpn_code + ", achlqr_bizrno="
				+ achlqr_bizrno + ", school_code=" + school_code
				+ ", student_num=" + student_num + ", barcode_num="
				+ barcode_num + ", customer_no=" + customer_no
				+ ", account_num=" + account_num + "]";
	}
	
}
