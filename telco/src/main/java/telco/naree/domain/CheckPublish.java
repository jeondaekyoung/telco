package telco.naree.domain;

public class CheckPublish {

	private String check_publish_no;
	private Long cash;
	private Long alternative;
	private Long cashier_check;
	private int cashier_nos;
	private String client_relation;
	private String client_realname_num;
	private String client_name;
	private String sub_num;
	private String sub_name;
	public String getCheck_publish_no() {
		return check_publish_no;
	}
	public void setCheck_publish_no(String check_publish_no) {
		this.check_publish_no = check_publish_no;
	}
	public Long getCash() {
		return cash;
	}
	public void setCash(Long cash) {
		this.cash = cash;
	}
	public Long getAlternative() {
		return alternative;
	}
	public void setAlternative(Long alternative) {
		this.alternative = alternative;
	}
	public Long getCashier_check() {
		return cashier_check;
	}
	public void setCashier_check(Long cashier_check) {
		this.cashier_check = cashier_check;
	}
	public int getCashier_nos() {
		return cashier_nos;
	}
	public void setCashier_nos(int cashier_nos) {
		this.cashier_nos = cashier_nos;
	}
	public String getClient_relation() {
		return client_relation;
	}
	public void setClient_relation(String client_relation) {
		this.client_relation = client_relation;
	}
	public String getClient_realname_num() {
		return client_realname_num;
	}
	public void setClient_realname_num(String client_realname_num) {
		this.client_realname_num = client_realname_num;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	@Override
	public String toString() {
		return "CheckPublish [check_publish_no=" + check_publish_no + ", cash="
				+ cash + ", alternative=" + alternative + ", cashier_check="
				+ cashier_check + ", cashier_nos=" + cashier_nos
				+ ", client_relation=" + client_relation
				+ ", client_realname_num=" + client_realname_num
				+ ", client_name=" + client_name + ", sub_num=" + sub_num
				+ ", sub_name=" + sub_name + "]";
	}
}
