package telco.naree.domain;

import java.sql.Date;

public class SqlSearchUsers {
	
	private String user_id;
	private String user_name;
	private String user_sepa;
	private Date access_date;
	private String ip;
	private String device;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_sepa() {
		return user_sepa;
	}
	public void setUser_sepa(String user_sepa) {
		this.user_sepa = user_sepa;
	}
	public Date getAccess_date() {
		return access_date;
	}
	public void setAccess_date(Date access_date) {
		this.access_date = access_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	@Override
	public String toString() {
		return "SqlSearchUsers [user_id=" + user_id + ", user_name="
				+ user_name + ", user_sepa=" + user_sepa + ", access_date="
				+ access_date + ", ip=" + ip + ", device=" + device + "]";
	}
}
