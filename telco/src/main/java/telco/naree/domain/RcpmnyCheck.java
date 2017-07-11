package telco.naree.domain;

public class RcpmnyCheck {

	private String trade_detail_no;
	private String check_amount;
	private Long start_num;
	private int number_of_sheet;
	private Long end_num;
	private String giro_code;
	public String getTrade_detail_no() {
		return trade_detail_no;
	}
	public void setTrade_detail_no(String trade_detail_no) {
		this.trade_detail_no = trade_detail_no;
	}
	public String getCheck_amount() {
		return check_amount;
	}
	public void setCheck_amount(String check_amount) {
		this.check_amount = check_amount;
	}
	public Long getStart_num() {
		return start_num;
	}
	public void setStart_num(Long start_num) {
		this.start_num = start_num;
	}
	public int getNumber_of_sheet() {
		return number_of_sheet;
	}
	public void setNumber_of_sheet(int number_of_sheet) {
		this.number_of_sheet = number_of_sheet;
	}
	public Long getEnd_num() {
		return end_num;
	}
	public void setEnd_num(Long end_num) {
		this.end_num = end_num;
	}
	public String getGiro_code() {
		return giro_code;
	}
	public void setGiro_code(String giro_code) {
		this.giro_code = giro_code;
	}
	@Override
	public String toString() {
		return "RcpmnyCheck [trade_detail_no=" + trade_detail_no
				+ ", check_amount=" + check_amount + ", start_num=" + start_num
				+ ", number_of_sheet=" + number_of_sheet + ", end_num="
				+ end_num + ", giro_code=" + giro_code + "]";
	}
}
