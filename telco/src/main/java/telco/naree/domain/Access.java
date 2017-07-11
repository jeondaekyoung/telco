package telco.naree.domain;

import java.sql.Date;

public class Access {
	
	private String sequence_no;
	private Date access_date;
	private String ip;
	private String device;
	private String user_id;
	
	
	public String getSequence_no() {
		return sequence_no;
	}
	public void setSequence_no(String sequence_no) {
		this.sequence_no = sequence_no;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "Access [sequence_no=" + sequence_no + ", access_date="
				+ access_date + ", ip=" + ip + ", device=" + device
				+ ", user_id=" + user_id + "]";
	}
}
