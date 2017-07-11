package telco.naree.domain;

public class PymntBankTrade {

	private String trade_detail_no;
	private Long amount;
	private String account_num;
	private String bank_name;
	private String customer_name;
	public String getTrade_detail_no() {
		return trade_detail_no;
	}
	public void setTrade_detail_no(String trade_detail_no) {
		this.trade_detail_no = trade_detail_no;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	@Override
	public String toString() {
		return "PymntBankTrade [trade_detail_no=" + trade_detail_no
				+ ", amount=" + amount + ", account_num=" + account_num
				+ ", bank_name=" + bank_name + ", customer_name="
				+ customer_name + "]";
	}
}
