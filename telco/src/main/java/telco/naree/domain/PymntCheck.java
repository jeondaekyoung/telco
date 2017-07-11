package telco.naree.domain;

public class PymntCheck {

	private String trade_detail_no;
	private String check_no;
	private String check_amount;
	private int number_of_sheet;
	public String getTrade_detail_no() {
		return trade_detail_no;
	}
	public void setTrade_detail_no(String trade_detail_no) {
		this.trade_detail_no = trade_detail_no;
	}
	public String getCheck_no() {
		return check_no;
	}
	public void setCheck_no(String check_no) {
		this.check_no = check_no;
	}
	public String getCheck_amount() {
		return check_amount;
	}
	public void setCheck_amount(String check_amount) {
		this.check_amount = check_amount;
	}
	public int getNumber_of_sheet() {
		return number_of_sheet;
	}
	public void setNumber_of_sheet(int number_of_sheet) {
		this.number_of_sheet = number_of_sheet;
	}
	@Override
	public String toString() {
		return "PymntCheck [trade_detail_no=" + trade_detail_no + ", check_no="
				+ check_no + ", check_amount=" + check_amount
				+ ", number_of_sheet=" + number_of_sheet + "]";
	}
}
