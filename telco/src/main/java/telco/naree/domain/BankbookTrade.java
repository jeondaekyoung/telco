package telco.naree.domain;

import java.sql.Timestamp;

public class BankbookTrade {

	private String trade_no;
	private String account_num;
	private Timestamp trade_datetime;
	private String trade_sepa;
	private String currency_code;
	private Long trade_amount;
	private Long trade_balance;
	private String summary;
	private String client_name;
	private String management_point;
	private String print_or;
	private String connect_trade_no;
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public Timestamp getTrade_datetime() {
		return trade_datetime;
	}
	public void setTrade_datetime(Timestamp trade_datetime) {
		this.trade_datetime = trade_datetime;
	}
	public String getTrade_sepa() {
		return trade_sepa;
	}
	public void setTrade_sepa(String trade_sepa) {
		this.trade_sepa = trade_sepa;
	}
	public String getCurrency_code() {
		return currency_code;
	}
	public void setCurrency_code(String currency_code) {
		this.currency_code = currency_code;
	}
	public Long getTrade_amount() {
		return trade_amount;
	}
	public void setTrade_amount(Long trade_amount) {
		this.trade_amount = trade_amount;
	}
	public Long getTrade_balance() {
		return trade_balance;
	}
	public void setTrade_balance(Long trade_balance) {
		this.trade_balance = trade_balance;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getManagement_point() {
		return management_point;
	}
	public void setManagement_point(String management_point) {
		this.management_point = management_point;
	}
	public String getPrint_or() {
		return print_or;
	}
	public void setPrint_or(String print_or) {
		this.print_or = print_or;
	}
	public String getConnect_trade_no() {
		return connect_trade_no;
	}
	public void setConnect_trade_no(String connect_trade_no) {
		this.connect_trade_no = connect_trade_no;
	}
	@Override
	public String toString() {
		return "BankbookTrade [trade_no=" + trade_no + ", account_num="
				+ account_num + ", trade_datetime=" + trade_datetime
				+ ", trade_sepa=" + trade_sepa + ", currency_code="
				+ currency_code + ", trade_amount=" + trade_amount
				+ ", trade_balance=" + trade_balance + ", summary=" + summary
				+ ", client_name=" + client_name + ", management_point="
				+ management_point + ", print_or=" + print_or
				+ ", connect_trade_no=" + connect_trade_no + "]";
	}
	
}
