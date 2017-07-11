package telco.naree.domain;

import java.sql.Date;

public class Atcng {

	private Long seq_no;
	private String account_num;
	private String withdrawal_pw;
	private Long atcng_amount;
	private Date app_day;
	private Date transfer_start;
	private String transfer_day;
	private Date transfer_end;
	private String busi_kind;
	private String using_or;
	private String transfer_bank;
	private String transfer_account_num;
	private String transfer_customer_name;
	private String transfer_interval;
	private String summary;
	private String to_summary;
	private String from_summary;
	public Long getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Long seq_no) {
		this.seq_no = seq_no;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getWithdrawal_pw() {
		return withdrawal_pw;
	}
	public void setWithdrawal_pw(String withdrawal_pw) {
		this.withdrawal_pw = withdrawal_pw;
	}
	public Long getAtcng_amount() {
		return atcng_amount;
	}
	public void setAtcng_amount(Long atcng_amount) {
		this.atcng_amount = atcng_amount;
	}
	public Date getApp_day() {
		return app_day;
	}
	public void setApp_day(Date app_day) {
		this.app_day = app_day;
	}
	public Date getTransfer_start() {
		return transfer_start;
	}
	public void setTransfer_start(Date transfer_start) {
		this.transfer_start = transfer_start;
	}
	public String getTransfer_day() {
		return transfer_day;
	}
	public void setTransfer_day(String transfer_day) {
		this.transfer_day = transfer_day;
	}
	public Date getTransfer_end() {
		return transfer_end;
	}
	public void setTransfer_end(Date transfer_end) {
		this.transfer_end = transfer_end;
	}
	public String getBusi_kind() {
		return busi_kind;
	}
	public void setBusi_kind(String busi_kind) {
		this.busi_kind = busi_kind;
	}
	public String getUsing_or() {
		return using_or;
	}
	public void setUsing_or(String using_or) {
		this.using_or = using_or;
	}
	public String getTransfer_bank() {
		return transfer_bank;
	}
	public void setTransfer_bank(String transfer_bank) {
		this.transfer_bank = transfer_bank;
	}
	public String getTransfer_account_num() {
		return transfer_account_num;
	}
	public void setTransfer_account_num(String transfer_account_num) {
		this.transfer_account_num = transfer_account_num;
	}
	public String getTransfer_customer_name() {
		return transfer_customer_name;
	}
	public void setTransfer_customer_name(String transfer_customer_name) {
		this.transfer_customer_name = transfer_customer_name;
	}
	public String getTransfer_interval() {
		return transfer_interval;
	}
	public void setTransfer_interval(String transfer_interval) {
		this.transfer_interval = transfer_interval;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getTo_summary() {
		return to_summary;
	}
	public void setTo_summary(String to_summary) {
		this.to_summary = to_summary;
	}
	public String getFrom_summary() {
		return from_summary;
	}
	public void setFrom_summary(String from_summary) {
		this.from_summary = from_summary;
	}
	@Override
	public String toString() {
		return "Atcng [seq_no=" + seq_no + ", account_num=" + account_num
				+ ", withdrawal_pw=" + withdrawal_pw + ", atcng_amount="
				+ atcng_amount + ", app_day=" + app_day + ", transfer_start="
				+ transfer_start + ", transfer_day=" + transfer_day
				+ ", transfer_end=" + transfer_end + ", busi_kind=" + busi_kind
				+ ", using_or=" + using_or + ", transfer_bank=" + transfer_bank
				+ ", transfer_account_num=" + transfer_account_num
				+ ", transfer_customer_name=" + transfer_customer_name
				+ ", transfer_interval=" + transfer_interval + ", summary="
				+ summary + ", to_summary=" + to_summary + ", from_summary="
				+ from_summary + "]";
	}
		
}
