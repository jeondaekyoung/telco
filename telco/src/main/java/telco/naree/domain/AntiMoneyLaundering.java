package telco.naree.domain;

public class AntiMoneyLaundering {

	private String customer_no;
	private String identification_type;
	private String verify_sepa;
	private String job_sepa;
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getIdentification_type() {
		return identification_type;
	}
	public void setIdentification_type(String identification_type) {
		this.identification_type = identification_type;
	}
	public String getVerify_sepa() {
		return verify_sepa;
	}
	public void setVerify_sepa(String verify_sepa) {
		this.verify_sepa = verify_sepa;
	}
	public String getJob_sepa() {
		return job_sepa;
	}
	public void setJob_sepa(String job_sepa) {
		this.job_sepa = job_sepa;
	}
	@Override
	public String toString() {
		return "AntiMoneyLaundering [customer_no=" + customer_no
				+ ", identification_type=" + identification_type
				+ ", verify_sepa=" + verify_sepa + ", job_sepa=" + job_sepa
				+ "]";
	}
}
