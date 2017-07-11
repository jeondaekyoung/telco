package telco.naree.domain;

public class School {

	private int school_no;
	private String school_name;
	
	public int getSchool_no() {
		return school_no;
	}
	public void setSchool_no(int school_no) {
		this.school_no = school_no;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	
	@Override
	public String toString() {
		return "School [school_no=" + school_no + ", school_name="
				+ school_name + "]";
	}
	
}
