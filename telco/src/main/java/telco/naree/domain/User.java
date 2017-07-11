package telco.naree.domain;

import java.sql.Date;

public class User {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String email_address;
	private String grade;
	private String affiliation;
	private String ban;
	private String num;
	private String user_sepa;
	private Date join_date;		//가입일, mysql에서 저장한다.
	private Date expiration_date;
	private String charge_or; 
	private String school_name;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAffiliation() {
		return affiliation;
	}
	public void setAffiliation(String affiliation) {
		this.affiliation = affiliation;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getUser_sepa() {
		return user_sepa;
	}
	public void setUser_sepa(String user_sepa) {
		this.user_sepa = user_sepa;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}
	public String getCharge_or() {
		return charge_or;
	}
	public void setCharge_or(String charge_or) {
		this.charge_or = charge_or;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pw=" + user_pw
				+ ", user_name=" + user_name + ", email_address="
				+ email_address + ", grade=" + grade + ", affiliation="
				+ affiliation + ", ban=" + ban + ", num=" + num
				+ ", user_sepa=" + user_sepa + ", join_date=" + join_date
				+ ", expiration_date=" + expiration_date + ", charge_or="
				+ charge_or + ", school_name=" + school_name + "]";
	}
	
}
