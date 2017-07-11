package telco.naree.domain;

public class ElecBankbook {

	private String account_num;
	private String elec_internet_no;
	private String elec_phone_no;
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getElec_internet_no() {
		return elec_internet_no;
	}
	public void setElec_internet_no(String elec_internet_no) {
		this.elec_internet_no = elec_internet_no;
	}
	public String getElec_phone_no() {
		return elec_phone_no;
	}
	public void setElec_phone_no(String elec_phone_no) {
		this.elec_phone_no = elec_phone_no;
	}
	@Override
	public String toString() {
		return "ElecBankbook [account_num=" + account_num
				+ ", elec_internet_no=" + elec_internet_no + ", elec_phone_no="
				+ elec_phone_no + "]";
	}
	
}
