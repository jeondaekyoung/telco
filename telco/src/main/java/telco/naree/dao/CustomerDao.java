package telco.naree.dao;

import java.util.List;

import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;

public interface CustomerDao {
	
	/**
	 * 고객기본정보 테이블에서 최근 고객번호 찾기
	 * @return
	 */
	public String selectCustomerNo();
	
	/**
	 * 2-1.고객기본정보에서 실명번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public CustomerBasics selectCustomerBasics(String realname_num);
	
	/**
	 * 2-2.자택(본사)에서 고객번호로 조회하기
	 * @param realname_num
	 * @return
	 */
	public HouseCompany selectHouseCompany(String customer_no);
	
	/**
	 * 2-3.직장(사업장)에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public OfficeWorkspace selectOfficeWorkspace(String customer_no);
	
	/**
	 * 2-4.제3연락처에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public ThirdContact selectThirdContact(String customer_no);
	
	/**
	 * 2-5.고객추가정보에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public CustomerAdd selectCustomerAdd(String customer_no);
	
	/**
	 * 2-6.자금세탁방지에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public AntiMoneyLaundering selectAntiMoneyLaundering(String customer_no);
	
	
	/**
	 * 1-1.고객기본정보 삽입하기
	 * @param customerBasics
	 * @return
	 */
	public int insertCustomerBasics(CustomerBasics customerBasics);

	/**
	 * 1-2.자택(본사) 삽입하기
	 * @param houseCompany
	 * @return
	 */
	public int insertHouseCompany(HouseCompany houseCompany);
	
	/**
	 * 1-3.직장(사업장) 삽입하기
	 * @param officeWorkspace
	 * @return
	 */
	public int insertOfficeWorkspace(OfficeWorkspace officeWorkspace);
	
	/**
	 * 1-4.제3연락처 삽입하기
	 * @param thirdContact
	 * @return
	 */
	public int insertThirdContact(ThirdContact thirdContact);
	
	/**
	 * 1-5.고객추가정보 삽입하기
	 * @param customerAdd
	 * @return
	 */
	public int insertCustomerAdd(CustomerAdd customerAdd);
	
	/**
	 * 1-6.자금세탁방지 삽입하기
	 * @param antiMoneyLaundering
	 * @return
	 */
	public int insertAntiMoney(AntiMoneyLaundering antiMoneyLaundering);
	
	/**
	 * 3-1.고객기본정보 수정하기
	 * @param customerBasics
	 * @return
	 */
	public int updateCustomerBasics(CustomerBasics customerBasics);
	
	/**
	 * 3-2.자택(본사) 수정하기
	 * @param houseCompany
	 * @return
	 */
	public int updateHouseCompany(HouseCompany houseCompany);
	
	/**
	 * 3-3.직장(사업장) 수정하기
	 * @param officeWorkspace
	 * @return
	 */
	public int updateOfficeWorkspace(OfficeWorkspace officeWorkspace);
	
	/**
	 * 3-4.제3연락처 수정하기
	 * @param thirdContact
	 * @return
	 */
	public int updateThirdContact(ThirdContact thirdContact);
	
	/**
	 * 3-5.고객추가정보 수정하기
	 * @param customerAdd
	 * @return
	 */
	public int updateCustomerAdd(CustomerAdd customerAdd);
	
	/**
	 * 3-6.자금세탁방지 수정하기
	 * @param antiMoneyLaundering
	 * @return
	 */
	public int updateAntiMoney(AntiMoneyLaundering antiMoneyLaundering);
	
	/**
	 * 계좌번호로 계좌정보 조회하기
	 * @param account_num
	 * @return
	 */
	public BankbookInfo selectBankbookInfoByAccountNum(String account_num);
	
	/**
	 * 고객번호로 고객기본정보 조회하기
	 * @param customer_no
	 * @return
	 */
	public CustomerBasics selectCustomerBasicsByNo(String customer_no);

	/**
	 * 계좌번호로 거래내역 조회하기
	 * @param account_num
	 * @return
	 */
	public List<BankbookTrade> selectBankbookTradeByAccountNum(String account_num);

	/**
	 *  존재하는 실명번호 찾기
	 * @param realname_num
	 * @param realname_num_sepa
	 * @return
	 */
	public int seeRealnameNum(CustomerBasics customerBasics);

	/**
	 * 고객번호로 보유계좌정보 조회하기
	 * @param customer_no
	 * @return
	 */
	public List<BankbookInfo> selectBankbookInfoByCustomerNo(String customer_no);
	
}
