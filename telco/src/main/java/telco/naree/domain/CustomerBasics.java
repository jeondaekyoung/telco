package telco.naree.domain;

public class CustomerBasics {

	private String customer_no;
	private String realname_num;
	private String realname_num_sepa;
	private String customer_qualf_sepa;
	private String customer_qualf_name;
	private String customer_name;
	private String customer_name_eng;
	private String passport_num;
	private String nationality_sepa;
	private String postal_sepa;
	private String contact_sepa;
	private String bizrno;
	private String enterprise_name;
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getRealname_num() {
		return realname_num;
	}
	public void setRealname_num(String realname_num) {
		this.realname_num = realname_num;
	}
	public String getRealname_num_sepa() {
		return realname_num_sepa;
	}
	public void setRealname_num_sepa(String realname_num_sepa) {
		this.realname_num_sepa = realname_num_sepa;
	}
	public String getCustomer_qualf_sepa() {
		return customer_qualf_sepa;
	}
	public void setCustomer_qualf_sepa(String customer_qualf_sepa) {
		this.customer_qualf_sepa = customer_qualf_sepa;
	}
	public String getCustomer_qualf_name() {
		return customer_qualf_name;
	}
	public void setCustomer_qualf_name(String customer_qualf_name) {
		this.customer_qualf_name = customer_qualf_name;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_name_eng() {
		return customer_name_eng;
	}
	public void setCustomer_name_eng(String customer_name_eng) {
		this.customer_name_eng = customer_name_eng;
	}
	public String getPassport_num() {
		return passport_num;
	}
	public void setPassport_num(String passport_num) {
		this.passport_num = passport_num;
	}
	public String getNationality_sepa() {
		return nationality_sepa;
	}
	public void setNationality_sepa(String nationality_sepa) {
		this.nationality_sepa = nationality_sepa;
	}
	public String getPostal_sepa() {
		return postal_sepa;
	}
	public void setPostal_sepa(String postal_sepa) {
		this.postal_sepa = postal_sepa;
	}
	public String getContact_sepa() {
		return contact_sepa;
	}
	public void setContact_sepa(String contact_sepa) {
		this.contact_sepa = contact_sepa;
	}
	public String getBizrno() {
		return bizrno;
	}
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	public String getEnterprise_name() {
		return enterprise_name;
	}
	public void setEnterprise_name(String enterprise_name) {
		this.enterprise_name = enterprise_name;
	}
	@Override
	public String toString() {
		return "CustomerBasics [customer_no=" + customer_no + ", realname_num="
				+ realname_num + ", realname_num_sepa=" + realname_num_sepa
				+ ", customer_qualf_sepa=" + customer_qualf_sepa
				+ ", customer_qualf_name=" + customer_qualf_name
				+ ", customer_name=" + customer_name + ", customer_name_eng="
				+ customer_name_eng + ", passport_num=" + passport_num
				+ ", nationality_sepa=" + nationality_sepa + ", postal_sepa="
				+ postal_sepa + ", contact_sepa=" + contact_sepa + ", bizrno="
				+ bizrno + ", enterprise_name=" + enterprise_name + "]";
	}

}
