package telco.naree.domain;

import java.sql.Date;

public class BankbookInfo {

	private String account_num;		//계좌번호
	private String certificate_num;		//주요증서번호
	private String depositor_relation;		//예금주와의 관계
	private String finance_sepa;		//과목명
	private String item_name;		//상품명
	private String sub_name;		//대리인성명
	private String sub_num;		//대리인실명번호
	private String bankbook_publish_sepa;		//통장발행구분
	private String bankbook_pw;		//비밀번호
	private String bankbook_trade_pw;		//통장거래비밀번호
	private Long balance;		//잔액
	private String management_point;		//관리점
	private String bankbook_publish_num;		//통장발행번호
	private String signet_sepa;		//인감및 서명구분
	private String using_or;	//사용여부
	private Date open_date;	//개설일
	private Date cancel_date;		//해지일
	private String cancel_message;		//해지구분
	private String cancel_why_sepa;		//해지사유
	private String cancel_summary;		//해지적요
	private String customer_no;		//고객번호
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getCertificate_num() {
		return certificate_num;
	}
	public void setCertificate_num(String certificate_num) {
		this.certificate_num = certificate_num;
	}
	public String getDepositor_relation() {
		return depositor_relation;
	}
	public void setDepositor_relation(String depositor_relation) {
		this.depositor_relation = depositor_relation;
	}
	public String getFinance_sepa() {
		return finance_sepa;
	}
	public void setFinance_sepa(String finance_sepa) {
		this.finance_sepa = finance_sepa;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
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
	public String getBankbook_publish_sepa() {
		return bankbook_publish_sepa;
	}
	public void setBankbook_publish_sepa(String bankbook_publish_sepa) {
		this.bankbook_publish_sepa = bankbook_publish_sepa;
	}
	public String getBankbook_pw() {
		return bankbook_pw;
	}
	public void setBankbook_pw(String bankbook_pw) {
		this.bankbook_pw = bankbook_pw;
	}
	public String getBankbook_trade_pw() {
		return bankbook_trade_pw;
	}
	public void setBankbook_trade_pw(String bankbook_trade_pw) {
		this.bankbook_trade_pw = bankbook_trade_pw;
	}
	public Long getBalance() {
		return balance;
	}
	public void setBalance(Long balance) {
		this.balance = balance;
	}
	public String getManagement_point() {
		return management_point;
	}
	public void setManagement_point(String management_point) {
		this.management_point = management_point;
	}
	public String getBankbook_publish_num() {
		return bankbook_publish_num;
	}
	public void setBankbook_publish_num(String bankbook_publish_num) {
		this.bankbook_publish_num = bankbook_publish_num;
	}
	public String getSignet_sepa() {
		return signet_sepa;
	}
	public void setSignet_sepa(String signet_sepa) {
		this.signet_sepa = signet_sepa;
	}
	public String getUsing_or() {
		return using_or;
	}
	public void setUsing_or(String using_or) {
		this.using_or = using_or;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public Date getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}
	public String getCancel_message() {
		return cancel_message;
	}
	public void setCancel_message(String cancel_message) {
		this.cancel_message = cancel_message;
	}
	public String getCancel_why_sepa() {
		return cancel_why_sepa;
	}
	public void setCancel_why_sepa(String cancel_why_sepa) {
		this.cancel_why_sepa = cancel_why_sepa;
	}
	public String getCancel_summary() {
		return cancel_summary;
	}
	public void setCancel_summary(String cancel_summary) {
		this.cancel_summary = cancel_summary;
	}
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	@Override
	public String toString() {
		return "BankbookInfo [account_num=" + account_num
				+ ", certificate_num=" + certificate_num
				+ ", depositor_relation=" + depositor_relation
				+ ", finance_sepa=" + finance_sepa + ", item_name=" + item_name
				+ ", sub_name=" + sub_name + ", sub_num=" + sub_num
				+ ", bankbook_publish_sepa=" + bankbook_publish_sepa
				+ ", bankbook_pw=" + bankbook_pw + ", bankbook_trade_pw="
				+ bankbook_trade_pw + ", balance=" + balance
				+ ", management_point=" + management_point
				+ ", bankbook_publish_num=" + bankbook_publish_num
				+ ", signet_sepa=" + signet_sepa + ", using_or=" + using_or
				+ ", open_date=" + open_date + ", cancel_date=" + cancel_date
				+ ", cancel_message=" + cancel_message + ", cancel_why_sepa="
				+ cancel_why_sepa + ", cancel_summary=" + cancel_summary
				+ ", customer_no=" + customer_no + "]";
	}
	
}
