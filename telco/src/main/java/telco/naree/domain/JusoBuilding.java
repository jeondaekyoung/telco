package telco.naree.domain;

public class JusoBuilding {
	
	private String juso;
	private String zip_code;
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	@Override
	public String toString() {
		return "JusoBuilding [juso=" + juso + ", zip_code=" + zip_code + "]";
	}
}
