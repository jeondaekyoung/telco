package telco.naree.dao.mapper;

import java.util.List;

import telco.naree.domain.ElecInfo;
import telco.naree.domain.ElecInternet;
import telco.naree.domain.ElecPhone;
import telco.naree.domain.SqlFindElec;
import telco.naree.domain.SqlSearchElecs;


public interface ElecMapper {
	
	public String selectElecInfoNo();

	public int insertElecInfo(ElecInfo elecInfo);

	public int insertElecInternet(ElecInternet elecInternet);

	public int insertElecPhone(ElecPhone elecPhone);

	public List<SqlSearchElecs> selectElecsByCustomerNo(String customer_no);

	public ElecInfo selectElecInfo(String customer_no);

	public int updateElecInfo(ElecInfo modifyInfo);

	public ElecInternet selectElecInternet(String substring);

	public int cancelElecInternet(ElecInternet elecInternet);

	public ElecPhone selectElecPhone(String substring);

	public int cancelElecPhone(ElecPhone elecPhone);

	public int selectElecId(String elec_id);

	public ElecInternet selectElecInternetByElecInfoNo(String elec_info_no);

	public int updateElecInternet(ElecInternet elecInternet);

	public ElecPhone selectElecPhoneByElecInfoNo(String elec_info_no);

	public int updateElecPhone(ElecPhone elecPhone);

	public SqlFindElec selectFindElec(SqlFindElec sqlFindElec);
}
