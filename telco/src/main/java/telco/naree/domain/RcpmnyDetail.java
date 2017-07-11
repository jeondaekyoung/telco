package telco.naree.domain;

public class RcpmnyDetail {

	private String trade_detail_no;
	private String client_name;
	private String client_num;
	private String client_relation;
	private String sub_name;
	private String sub_num;
	public String getTrade_detail_no() {
		return trade_detail_no;
	}
	public void setTrade_detail_no(String trade_detail_no) {
		this.trade_detail_no = trade_detail_no;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getClient_num() {
		return client_num;
	}
	public void setClient_num(String client_num) {
		this.client_num = client_num;
	}
	public String getClient_relation() {
		return client_relation;
	}
	public void setClient_relation(String client_relation) {
		this.client_relation = client_relation;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getSub_num() {
		return sub_num;
	}
	public void setSub_num(String sub_num) {
		this.sub_num = sub_num;
	}
	@Override
	public String toString() {
		return "RcpmnyDetail [trade_detail_no=" + trade_detail_no
				+ ", client_name=" + client_name + ", client_num=" + client_num
				+ ", client_relation=" + client_relation + ", sub_name="
				+ sub_name + ", sub_num=" + sub_num + "]";
	}
}
