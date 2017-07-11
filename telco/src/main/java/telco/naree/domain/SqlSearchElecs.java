package telco.naree.domain;

public class SqlSearchElecs {

	private Long elec_no;
	private String elec_sepa;
	private String elec_id;
	private String state;
	private String change_date;
	private String security_media_sepa;
	private String security_media_no;
	public Long getElec_no() {
		return elec_no;
	}
	public void setElec_no(Long elec_no) {
		this.elec_no = elec_no;
	}
	public String getElec_sepa() {
		return elec_sepa;
	}
	public void setElec_sepa(String elec_sepa) {
		this.elec_sepa = elec_sepa;
	}
	public String getElec_id() {
		return elec_id;
	}
	public void setElec_id(String elec_id) {
		this.elec_id = elec_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getChange_date() {
		return change_date;
	}
	public void setChange_date(String change_date) {
		this.change_date = change_date;
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
		return "SqlSearchElecs [elec_no=" + elec_no + ", elec_sepa="
				+ elec_sepa + ", elec_id=" + elec_id + ", state=" + state
				+ ", change_date=" + change_date + ", security_media_sepa="
				+ security_media_sepa + ", security_media_no="
				+ security_media_no + "]";
	}
}
