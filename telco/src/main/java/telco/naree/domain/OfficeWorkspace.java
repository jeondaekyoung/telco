package telco.naree.domain;

import java.sql.Date;

public class OfficeWorkspace {

	private String customer_no;
	private String zip_code;
	private String address_before;
	private String address_after;
	private String moving_in_sepa;
	private String town_name;
	private String apart_name;
	private String dong;
	private String ho;
	private String phone1;
	private String phone2;
	private String phone3;
	private String extension;
	private String fax1;
	private String fax2;
	private String fax3;
	private String address_eng;
	private String job;
	private String company_name;
	private String department_name;
	private String position_name;
	private Date join_date;
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddress_before() {
		return address_before;
	}
	public void setAddress_before(String address_before) {
		this.address_before = address_before;
	}
	public String getAddress_after() {
		return address_after;
	}
	public void setAddress_after(String address_after) {
		this.address_after = address_after;
	}
	public String getMoving_in_sepa() {
		return moving_in_sepa;
	}
	public void setMoving_in_sepa(String moving_in_sepa) {
		this.moving_in_sepa = moving_in_sepa;
	}
	public String getTown_name() {
		return town_name;
	}
	public void setTown_name(String town_name) {
		this.town_name = town_name;
	}
	public String getApart_name() {
		return apart_name;
	}
	public void setApart_name(String apart_name) {
		this.apart_name = apart_name;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getFax1() {
		return fax1;
	}
	public void setFax1(String fax1) {
		this.fax1 = fax1;
	}
	public String getFax2() {
		return fax2;
	}
	public void setFax2(String fax2) {
		this.fax2 = fax2;
	}
	public String getFax3() {
		return fax3;
	}
	public void setFax3(String fax3) {
		this.fax3 = fax3;
	}
	public String getAddress_eng() {
		return address_eng;
	}
	public void setAddress_eng(String address_eng) {
		this.address_eng = address_eng;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "OfficeWorkspace [customer_no=" + customer_no + ", zip_code="
				+ zip_code + ", address_before=" + address_before
				+ ", address_after=" + address_after + ", moving_in_sepa="
				+ moving_in_sepa + ", town_name=" + town_name + ", apart_name="
				+ apart_name + ", dong=" + dong + ", ho=" + ho + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3
				+ ", extension=" + extension + ", fax1=" + fax1 + ", fax2="
				+ fax2 + ", fax3=" + fax3 + ", address_eng=" + address_eng
				+ ", job=" + job + ", company_name=" + company_name
				+ ", department_name=" + department_name + ", position_name="
				+ position_name + ", join_date=" + join_date + "]";
	}
	
}
