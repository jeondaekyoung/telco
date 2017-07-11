package telco.naree.domain;

import java.sql.Date;

public class ElecPhone {

	private String elec_phone_no;
	private String elec_info_no;
	private Date open_date;
	private String open_branch;
	private Date cancel_date;
	private String cancel_branch;
	private Date final_change_date;
	private String elec_pw;
	private Long elec_transfer_day;
	private Long elec_transfer_once;
	private String application_sepa;
	private String user_id;
	private String owner_sepa;
	private String sub_name;
	private String sub_num;
	private String using_or;
	public String getElec_phone_no() {
		return elec_phone_no;
	}
	public void setElec_phone_no(String elec_phone_no) {
		this.elec_phone_no = elec_phone_no;
	}
	public String getElec_info_no() {
		return elec_info_no;
	}
	public void setElec_info_no(String elec_info_no) {
		this.elec_info_no = elec_info_no;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public String getOpen_branch() {
		return open_branch;
	}
	public void setOpen_branch(String open_branch) {
		this.open_branch = open_branch;
	}
	public Date getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}
	public String getCancel_branch() {
		return cancel_branch;
	}
	public void setCancel_branch(String cancel_branch) {
		this.cancel_branch = cancel_branch;
	}
	public Date getFinal_change_date() {
		return final_change_date;
	}
	public void setFinal_change_date(Date final_change_date) {
		this.final_change_date = final_change_date;
	}
	public String getElec_pw() {
		return elec_pw;
	}
	public void setElec_pw(String elec_pw) {
		this.elec_pw = elec_pw;
	}
	public Long getElec_transfer_day() {
		return elec_transfer_day;
	}
	public void setElec_transfer_day(Long elec_transfer_day) {
		this.elec_transfer_day = elec_transfer_day;
	}
	public Long getElec_transfer_once() {
		return elec_transfer_once;
	}
	public void setElec_transfer_once(Long elec_transfer_once) {
		this.elec_transfer_once = elec_transfer_once;
	}
	public String getApplication_sepa() {
		return application_sepa;
	}
	public void setApplication_sepa(String application_sepa) {
		this.application_sepa = application_sepa;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOwner_sepa() {
		return owner_sepa;
	}
	public void setOwner_sepa(String owner_sepa) {
		this.owner_sepa = owner_sepa;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
	public String getUsing_or() {
		return using_or;
	}
	public void setUsing_or(String using_or) {
		this.using_or = using_or;
	}
	@Override
	public String toString() {
		return "ElecPhone [elec_phone_no=" + elec_phone_no + ", elec_info_no="
				+ elec_info_no + ", open_date=" + open_date + ", open_branch="
				+ open_branch + ", cancel_date=" + cancel_date
				+ ", cancel_branch=" + cancel_branch + ", final_change_date="
				+ final_change_date + ", elec_pw=" + elec_pw
				+ ", elec_transfer_day=" + elec_transfer_day
				+ ", elec_transfer_once=" + elec_transfer_once
				+ ", application_sepa=" + application_sepa + ", user_id="
				+ user_id + ", owner_sepa=" + owner_sepa + ", sub_name="
				+ sub_name + ", sub_num=" + sub_num + ", using_or=" + using_or
				+ "]";
	}
}
