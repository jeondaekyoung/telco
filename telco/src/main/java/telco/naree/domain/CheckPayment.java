package telco.naree.domain;

public class CheckPayment {

	private String check_payment_no;
	private Long cash;
	private Long check_alternative;
	private Long bank_alternative;
	private String client_relation;
	private String client_realname_num;
	private String client_name;
	private String sub_num;
	private String sub_name;
	public String getCheck_payment_no() {
		return check_payment_no;
	}
	public void setCheck_payment_no(String check_payment_no) {
		this.check_payment_no = check_payment_no;
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
		return "CheckPayment [check_payment_no=" + check_payment_no + ", cash="
				+ cash + ", check_alternative=" + check_alternative
				+ ", bank_alternative=" + bank_alternative
				+ ", client_relation=" + client_relation
				+ ", client_realname_num=" + client_realname_num
				+ ", client_name=" + client_name + ", sub_num=" + sub_num
				+ ", sub_name=" + sub_name + "]";
	}
}
