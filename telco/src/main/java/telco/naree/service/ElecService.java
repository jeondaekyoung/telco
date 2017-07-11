package telco.naree.service;

import java.util.List;

import telco.naree.domain.ElecInfo;
import telco.naree.domain.ElecInternet;
import telco.naree.domain.ElecPhone;
import telco.naree.domain.SqlFindElec;
import telco.naree.domain.SqlSearchElecs;

public interface ElecService {

	/**
	 * 공통전자금융 테이블에서 다음 전자금융번호 생성
	 * @return
	 */
	public String nextElecInfoNo();

	/**
	 * 공통전자금융 등록하기
	 * @param elecInfo
	 * @return
	 */
	public int registerElecInfo(ElecInfo elecInfo);

	/**
	 * 인터넷뱅킹 등록하기
	 * @param elecInternet
	 * @return
	 */
	public int registerElecInternet(ElecInternet elecInternet);

	/**
	 * 폰뱅킹 등록하기
	 * @param elecPhone
	 * @return
	 */
	public int registerElecPhone(ElecPhone elecPhone);

	/**
	 * 고객의 전자금융 정보 조회
	 * @param customer_no
	 * @return
	 */
	public List<SqlSearchElecs> searchElecsByCustomerNo(String customer_no);

	/**
	 * 공통전자금융 정보 찾기
	 * @param customer_no
	 * @return
	 */
	public ElecInfo findElecInfo(String customer_no);

	/**
	 * 공통전자금융이 있을 때, 수정하기
	 * @param modifyInfo
	 * @return
	 */
	public int modifyElecInfo(ElecInfo elecInfo);

	/**
	 * 인터넷뱅킹 찾기
	 * @param substring
	 * @return
	 */
	public ElecInternet findElecInternet(String elec_internet_no);

	/**
	 * 인터넷뱅킹 해지하기
	 * @param elecInternet
	 * @return
	 */
	public int cancelElecInternet(ElecInternet elecInternet);

	/**
	 * 폰뱅킹 찾기
	 * @param substring
	 * @return
	 */
	public ElecPhone findElecPhone(String elec_phone_no);

	/**
	 * 폰뱅킹 해지하기
	 * @param elecPhone
	 * @return
	 */
	public int cancelElecPhone(ElecPhone elecPhone);

	/**
	 * 인터넷뱅킹 테이블에서 이용자아이디가 사용중인지 확인하기
	 * @param elec_id
	 * @return
	 */
	public boolean searchElecId(String elec_id);

	/**
	 * 인터넷뱅킹 테이블에서 전자금융번호로 찾기
	 * @param elec_info_no
	 * @return
	 */
	public ElecInternet findElecInternetByElecInfoNo(String elec_info_no);

	/**
	 * 인터넷뱅킹 변경하기
	 * @param elecInternet
	 * @return
	 */
	public int modifyElecInternet(ElecInternet elecInternet);

	/**
	 * 폰뱅킹 테이블에서 전자금융번로호 찾기
	 * @param elec_info_no
	 * @return
	 */
	public ElecPhone findElecPhoneByElecInfoNo(String elec_info_no);

	/**
	 * 폰뱅킹 변경하기
	 * @param elecPhone
	 * @return
	 */
	public int modifyElecPhone(ElecPhone elecPhone);

	/**
	 * 전자금융 조회에서 서비스조회하기
	 * @param sqlFindElec
	 * @return
	 */
	public SqlFindElec findElec(SqlFindElec sqlFindElec);

}
