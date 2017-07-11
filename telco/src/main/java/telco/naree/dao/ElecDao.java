package telco.naree.dao;

import java.util.List;

import telco.naree.domain.ElecInfo;
import telco.naree.domain.ElecInternet;
import telco.naree.domain.ElecPhone;
import telco.naree.domain.SqlFindElec;
import telco.naree.domain.SqlSearchElecs;

public interface ElecDao {

	/**
	 * 공통전자금융 테이블에서 전자금융번호 찾기
	 * @return
	 */
	public String selectElecInfoNo();

	/**
	 * 공통전가금융 테이블에 삽입하기
	 * @param elecInfo
	 * @return
	 */
	public int insertElecInfo(ElecInfo elecInfo);

	/**
	 * 인터넷뱅킹 테이블에 삽입하기
	 * @param elecInternet
	 * @return
	 */
	public int insertElecInternet(ElecInternet elecInternet);

	/**
	 * 폰뱅킹 테이블에 삽입하기
	 * @param elecPhone
	 * @return
	 */
	public int insertElecPhone(ElecPhone elecPhone);

	/**
	 * 고객번호로 전자금융 조회하기
	 * @param customer_no
	 * @return
	 */
	public List<SqlSearchElecs> selectElecsByCustomerNo(String customer_no);

	/**
	 * 공통전자금융 찾기
	 * @param customer_no
	 * @return
	 */
	public ElecInfo findElecInfo(String customer_no);

	/**
	 * 공통전자금융 업데이트하기
	 * @param modifyInfo
	 * @return
	 */
	public int updateElecInfo(ElecInfo elecInfo);

	/**
	 * 인터넷뱅킹번호로 인터넷뱅킹 조회하기
	 * @param substring
	 * @return
	 */
	public ElecInternet selectElecInternet(String elec_internet_no);

	/**
	 * 인터넷뱅킹 해지하기
	 * @param elecInternet
	 * @return
	 */
	public int cancelElecInternet(ElecInternet elecInternet);

	/**
	 * 폰뱅킹번호로 폰뱅킹 조회하기
	 * @param substring
	 * @return
	 */
	public ElecPhone selectElecPhone(String elec_phone_no);

	/**
	 * 폰뱅킹 해지하기
	 * @param elecPhone
	 * @return
	 */
	public int cancelElecPhone(ElecPhone elecPhone);

	/**
	 * 인터넷뱅킹 테이블에서 이용자아이디 있는지 찾기
	 * @param elec_id
	 * @return
	 */
	public int selectElecId(String elec_id);

	/**
	 * 인터넷뱅킹 테이블에서 전자금융번호로 찾기
	 * @param elec_info_no
	 * @return
	 */
	public ElecInternet selectElecInternetByElecInfoNo(String elec_info_no);

	/**
	 * 인터넷뱅킹 업데이트하기(변경)
	 * @param elecInternet
	 * @return
	 */
	public int updateElecInternet(ElecInternet elecInternet);

	/**
	 * 폰뱅킹 테이블에서 전자금융번로호 찾기
	 * @param elec_info_no
	 * @return
	 */
	public ElecPhone selectElecPhoneByElecInfoNo(String elec_info_no);

	/**
	 * 폰뱅킹 업데이트하기(변경)
	 * @param elecPhone
	 * @return
	 */
	public int updateElecPhone(ElecPhone elecPhone);

	/**
	 * 전자금융 서비스 조회하기
	 * @param sqlFindElec
	 * @return
	 */
	public SqlFindElec selectElec(SqlFindElec sqlFindElec);
}
