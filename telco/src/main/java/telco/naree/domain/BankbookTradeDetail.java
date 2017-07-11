package telco.naree.domain;

public class BankbookTradeDetail {

	private String trade_detail_no;
	private String trade_no;
	private Long cash;
	private Long check_alternative;
	private Long bank_alternative;
	public String getTrade_detail_no() {
		return trade_detail_no;
	}
	public void setTrade_detail_no(String trade_detail_no) {
		this.trade_detail_no = trade_detail_no;
	}
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String trade_no) {
		this.trade_no = trade_no;
	}
	public Long getCash() {
		return cash;
	}
	public void setCash(Long cash) {
		this.cash = cash;
	}
	public Long getCheck_alternative() {
		return check_alternative;
	}
	public void setCheck_alternative(Long check_alternative) {
		this.check_alternative = check_alternative;
	}
	public Long getBank_alternative() {
		return bank_alternative;
	}
	public void setBank_alternative(Long bank_alternative) {
		this.bank_alternative = bank_alternative;
	}
	@Override
	public String toString() {
		return "BankbookTradeDetail [trade_detail_no=" + trade_detail_no
				+ ", trade_no=" + trade_no + ", cash=" + cash
				+ ", check_alternative=" + check_alternative
				+ ", bank_alternative=" + bank_alternative + "]";
	}
}
