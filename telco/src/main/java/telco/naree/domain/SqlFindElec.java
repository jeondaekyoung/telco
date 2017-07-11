package telco.naree.domain;

import java.sql.Date;

public class SqlFindElec {

	private String customer_no;
	private String elec_sepa;
	private String elec_info_no;
	private String security_media_sepa;
	private Date open_date;
	private String open_branch;
	private Date cancel_date;
	private String cancel_branch;
	private Long elec_transfer_day;
	private Long elec_transfer_once;
	private String sub_num;
	private String owner_sepa;
	private String user_id;
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getElec_sepa() {
		return elec_sepa;
	}
	public void setElec_sepa(String elec_sepa) {
		this.elec_sepa = elec_sepa;
	}
	public String getElec_info_no() {
		return elec_info_no;
	}
	public void setElec_info_no(String elec_info_no) {
		this.elec_info_no = elec_info_no;
	}
	public String getSecurity_media_sepa() {
		return security_media_sepa;
	}
	public void setSecurity_media_sepa(String security_media_sepa) {
		this.security_media_sepa = security_media_sepa;
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
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
	public String getOwner_sepa() {
		return owner_sepa;
	}
	public void setOwner_sepa(String owner_sepa) {
		this.owner_sepa = owner_sepa;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "SqlFindElec [customer_no=" + customer_no + ", elec_sepa="
				+ elec_sepa + ", elec_info_no=" + elec_info_no
				+ ", security_media_sepa=" + security_media_sepa
				+ ", open_date=" + open_date + ", open_branch=" + open_branch
				+ ", cancel_date=" + cancel_date + ", cancel_branch="
				+ cancel_branch + ", elec_transfer_day=" + elec_transfer_day
				+ ", elec_transfer_once=" + elec_transfer_once + ", sub_num="
				+ sub_num + ", owner_sepa=" + owner_sepa + ", user_id="
				+ user_id + "]";
	}
	
}
