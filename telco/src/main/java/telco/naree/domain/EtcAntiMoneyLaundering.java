package telco.naree.domain;

public class EtcAntiMoneyLaundering {

	private String account_num;
	private String capital_origin_sepa;
	private String trade_goal_sepa;
	private String pay_day;
	private String tax_pvltrt_sepa;
	private String summary;
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getCapital_origin_sepa() {
		return capital_origin_sepa;
	}
	public void setCapital_origin_sepa(String capital_origin_sepa) {
		this.capital_origin_sepa = capital_origin_sepa;
	}
	public String getTrade_goal_sepa() {
		return trade_goal_sepa;
	}
	public void setTrade_goal_sepa(String trade_goal_sepa) {
		this.trade_goal_sepa = trade_goal_sepa;
	}
	public String getPay_day() {
		return pay_day;
	}
	public void setPay_day(String pay_day) {
		this.pay_day = pay_day;
	}
	public String getTax_pvltrt_sepa() {
		return tax_pvltrt_sepa;
	}
	public void setTax_pvltrt_sepa(String tax_pvltrt_sepa) {
		this.tax_pvltrt_sepa = tax_pvltrt_sepa;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	@Override
	public String toString() {
		return "EtcAntiMoneyLaundering [account_num=" + account_num
				+ ", capital_origin_sepa=" + capital_origin_sepa
				+ ", trade_goal_sepa=" + trade_goal_sepa + ", pay_day="
				+ pay_day + ", tax_pvltrt_sepa=" + tax_pvltrt_sepa
				+ ", summary=" + summary + "]";
	}
	
}
