package telco.naree.domain;

import java.sql.Date;

public class CustomerAdd {

	private String customer_no;
	private String birthday_sepa;
	private Date birthday;
	private String marriage_sepa;
	private Date marriage_date;
	private String gender_sepa;
	private String household_sepa;
	private String spouse_brthdy_year;
	private String children_sepa;
	private String children1_brthdy_year;
	private String children2_brthdy_year;
	private String children3_brthdy_year;
	private String car_sepa;
	private String annual_income;
	private String dual_income_or;
	private String pay_day;
	private String house_have_sepa;
	private String householder_sepa;
	private String living_sepa;
	private String living_pyeong;
	public String getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(String customer_no) {
		this.customer_no = customer_no;
	}
	public String getBirthday_sepa() {
		return birthday_sepa;
	}
	public void setBirthday_sepa(String birthday_sepa) {
		this.birthday_sepa = birthday_sepa;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getMarriage_sepa() {
		return marriage_sepa;
	}
	public void setMarriage_sepa(String marriage_sepa) {
		this.marriage_sepa = marriage_sepa;
	}
	public Date getMarriage_date() {
		return marriage_date;
	}
	public void setMarriage_date(Date marriage_date) {
		this.marriage_date = marriage_date;
	}
	public String getGender_sepa() {
		return gender_sepa;
	}
	public void setGender_sepa(String gender_sepa) {
		this.gender_sepa = gender_sepa;
	}
	public String getHousehold_sepa() {
		return household_sepa;
	}
	public void setHousehold_sepa(String household_sepa) {
		this.household_sepa = household_sepa;
	}
	public String getSpouse_brthdy_year() {
		return spouse_brthdy_year;
	}
	public void setSpouse_brthdy_year(String spouse_brthdy_year) {
		this.spouse_brthdy_year = spouse_brthdy_year;
	}
	public String getChildren_sepa() {
		return children_sepa;
	}
	public void setChildren_sepa(String children_sepa) {
		this.children_sepa = children_sepa;
	}
	public String getChildren1_brthdy_year() {
		return children1_brthdy_year;
	}
	public void setChildren1_brthdy_year(String children1_brthdy_year) {
		this.children1_brthdy_year = children1_brthdy_year;
	}
	public String getChildren2_brthdy_year() {
		return children2_brthdy_year;
	}
	public void setChildren2_brthdy_year(String children2_brthdy_year) {
		this.children2_brthdy_year = children2_brthdy_year;
	}
	public String getChildren3_brthdy_year() {
		return children3_brthdy_year;
	}
	public void setChildren3_brthdy_year(String children3_brthdy_year) {
		this.children3_brthdy_year = children3_brthdy_year;
	}
	public String getCar_sepa() {
		return car_sepa;
	}
	public void setCar_sepa(String car_sepa) {
		this.car_sepa = car_sepa;
	}
	public String getAnnual_income() {
		return annual_income;
	}
	public void setAnnual_income(String annual_income) {
		this.annual_income = annual_income;
	}
	public String getDual_income_or() {
		return dual_income_or;
	}
	public void setDual_income_or(String dual_income_or) {
		this.dual_income_or = dual_income_or;
	}
	public String getPay_day() {
		return pay_day;
	}
	public void setPay_day(String pay_day) {
		this.pay_day = pay_day;
	}
	public String getHouse_have_sepa() {
		return house_have_sepa;
	}
	public void setHouse_have_sepa(String house_have_sepa) {
		this.house_have_sepa = house_have_sepa;
	}
	public String getHouseholder_sepa() {
		return householder_sepa;
	}
	public void setHouseholder_sepa(String householder_sepa) {
		this.householder_sepa = householder_sepa;
	}
	public String getLiving_sepa() {
		return living_sepa;
	}
	public void setLiving_sepa(String living_sepa) {
		this.living_sepa = living_sepa;
	}
	public String getLiving_pyeong() {
		return living_pyeong;
	}
	public void setLiving_pyeong(String living_pyeong) {
		this.living_pyeong = living_pyeong;
	}
	@Override
	public String toString() {
		return "CustomerAdd [customer_no=" + customer_no + ", birthday_sepa="
				+ birthday_sepa + ", birthday=" + birthday + ", marriage_sepa="
				+ marriage_sepa + ", marrige_date=" + marriage_date
				+ ", gender_sepa=" + gender_sepa + ", household_sepa="
				+ household_sepa + ", spouse_brthdy_year=" + spouse_brthdy_year
				+ ", children_sepa=" + children_sepa
				+ ", children1_brthdy_year=" + children1_brthdy_year
				+ ", children2_brthdy_year=" + children2_brthdy_year
				+ ", children3_brthdy_year=" + children3_brthdy_year
				+ ", car_sepa=" + car_sepa + ", annual_income=" + annual_income
				+ ", dual_income_or=" + dual_income_or + ", pay_day=" + pay_day
				+ ", house_have_sepa=" + house_have_sepa
				+ ", householder_sepa=" + householder_sepa + ", living_sepa="
				+ living_sepa + ", living_pyeong=" + living_pyeong + "]";
	}
}
