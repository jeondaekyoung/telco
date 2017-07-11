package telco.naree.domain;

import java.sql.Date;

public class BankbookReissue {

	private String account_num;
	private String kind_sepa;
	private Date reissue_date;
	private String bank_application_or;
	private String loss_sepa;
	private String summary;
	private String fee_sepa;
	private String receipt_or;
	private String bankbook_sepa;
	private String management_point;
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getKind_sepa() {
		return kind_sepa;
	}
	public void setKind_sepa(String kind_sepa) {
		this.kind_sepa = kind_sepa;
	}
	public Date getReissue_date() {
		return reissue_date;
	}
	public void setReissue_date(Date reissue_date) {
		this.reissue_date = reissue_date;
	}
	public String getBank_application_or() {
		return bank_application_or;
	}
	public void setBank_application_or(String bank_application_or) {
		this.bank_application_or = bank_application_or;
	}
	public String getLoss_sepa() {
		return loss_sepa;
	}
	public void setLoss_sepa(String loss_sepa) {
		this.loss_sepa = loss_sepa;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getFee_sepa() {
		return fee_sepa;
	}
	public void setFee_sepa(String fee_sepa) {
		this.fee_sepa = fee_sepa;
	}
	public String getReceipt_or() {
		return receipt_or;
	}
	public void setReceipt_or(String receipt_or) {
		this.receipt_or = receipt_or;
	}
	public String getBankbook_sepa() {
		return bankbook_sepa;
	}
	public void setBankbook_sepa(String bankbook_sepa) {
		this.bankbook_sepa = bankbook_sepa;
	}
	public String getManagement_point() {
		return management_point;
	}
	public void setManagement_point(String management_point) {
		this.management_point = management_point;
	}
	@Override
	public String toString() {
		return "BankbookReissue [account_num=" + account_num + ", kind_sepa="
				+ kind_sepa + ", reissue_date=" + reissue_date
				+ ", bank_application_or=" + bank_application_or
				+ ", loss_sepa=" + loss_sepa + ", summary=" + summary
				+ ", fee_sepa=" + fee_sepa + ", receipt_or=" + receipt_or
				+ ", bankbook_sepa=" + bankbook_sepa + ", management_point="
				+ management_point + "]";
	}
	
}
