package telco.naree.domain;

public class CompanyInfo {

	private String customer_no;
	private String delegate_num;
	private String delegate_name;
	private String corporation_num;
	private String corporation_name;
	private String com_scale_sepa;
	private String com_sepa;
	private String handle_item;
	private String com_public_sepa;
	private String com_goal_sepa;
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getDelegate_num() {
		return delegate_num;
	}
	public void setDelegate_num(String delegate_num) {
		this.delegate_num = delegate_num;
	}
	public String getDelegate_name() {
		return delegate_name;
	}
	public void setDelegate_name(String delegate_name) {
		this.delegate_name = delegate_name;
	}
	public String getCorporation_num() {
		return corporation_num;
	}
	public void setCorporation_num(String corporation_num) {
		this.corporation_num = corporation_num;
	}
	public String getCorporation_name() {
		return corporation_name;
	}
	public void setCorporation_name(String corporation_name) {
		this.corporation_name = corporation_name;
	}
	public String getCom_scale_sepa() {
		return com_scale_sepa;
	}
	public void setCom_scale_sepa(String com_scale_sepa) {
		this.com_scale_sepa = com_scale_sepa;
	}
	public String getCom_sepa() {
		return com_sepa;
	}
	public void setCom_sepa(String com_sepa) {
		this.com_sepa = com_sepa;
	}
	public String getHandle_item() {
		return handle_item;
	}
	public void setHandle_item(String handle_item) {
		this.handle_item = handle_item;
	}
	public String getCom_public_sepa() {
		return com_public_sepa;
	}
	public void setCom_public_sepa(String com_public_sepa) {
		this.com_public_sepa = com_public_sepa;
	}
	public String getCom_goal_sepa() {
		return com_goal_sepa;
	}
	public void setCom_goal_sepa(String com_goal_sepa) {
		this.com_goal_sepa = com_goal_sepa;
	}
	@Override
	public String toString() {
		return "CompanyInfo [customer_no=" + customer_no + ", delegate_num="
				+ delegate_num + ", delegate_name=" + delegate_name
				+ ", corporation_num=" + corporation_num
				+ ", corporation_name=" + corporation_name
				+ ", com_scale_sepa=" + com_scale_sepa + ", com_sepa="
				+ com_sepa + ", handle_item=" + handle_item
				+ ", com_public_sepa=" + com_public_sepa + ", com_goal_sepa="
				+ com_goal_sepa + "]";
	}
}
