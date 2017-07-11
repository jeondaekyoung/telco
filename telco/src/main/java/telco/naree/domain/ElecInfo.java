package telco.naree.domain;

public class ElecInfo {

	private String elec_info_no;
	private String customer_no;
	private String security_media_sepa;
	private String security_media_no;
	public String getElec_info_no() {
		return elec_info_no;
	}
	public void setElec_info_no(String elec_info_no) {
		this.elec_info_no = elec_info_no;
	}
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getSecurity_media_sepa() {
		return security_media_sepa;
	}
	public void setSecurity_media_sepa(String security_media_sepa) {
		this.security_media_sepa = security_media_sepa;
	}
	public String getSecurity_media_no() {
		return security_media_no;
	}
	public void setSecurity_media_no(String security_media_no) {
		this.security_media_no = security_media_no;
	}
	@Override
	public String toString() {
		return "ElecInfo [elec_info_no=" + elec_info_no + ", customer_no="
				+ customer_no + ", security_media_sepa=" + security_media_sepa
				+ ", security_media_no=" + security_media_no + "]";
	}
}
