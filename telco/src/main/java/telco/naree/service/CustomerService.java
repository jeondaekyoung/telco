package telco.naree.service;

import java.util.List;

import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;

public interface CustomerService {

	/**
	 * 고객 번호 생성
	 * @return
	 */
	public String nextCustomerNo();
	
	/**
	 * 2-1.고객기본정보에서 실명번호로 조회하기
	 * @param realname_num
	 * @return
	 */
	public CustomerBasics findCustomerBasics(String realname_num);
	
	/**
	 * 2-2.자택(본사)에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public HouseCompany findHouseCompany(String customer_no);
	
	/**
	 * 2-3.직장(사업장)에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public OfficeWorkspace findOfficeWorkspace(String customer_no);
	
	/**
	 * 2-4.제3연락처에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public ThirdContact findThirdContact(String customer_no);
	
	/**
	 * 2-5.고객추가정보에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public CustomerAdd findCustomerAdd(String customer_no);
	
	/**
	 * 2-6.자금세탁방지에서 고객번호로 조회하기
	 * @param customer_no
	 * @return
	 */
	public AntiMoneyLaundering findAntiMoneyLaundering(String customer_no);
	
	
	
	
	/**
	 * 1-1.고객기본정보 등록하기
	 * @param customerBasics
	 * @return
	 */
	public int registerCustomerBasics(CustomerBasics customerBasics);
	
	/**
	 * 1-2.자택(본사) 등록하기
	 * @param houseCompany
	 * @return
	 */
	public int registerHouseCompany(HouseCompany houseCompany);
	
	/**
	 * 1-3.직장(사업장) 등록하기
	 * @param officeWorkspace
	 * @return
	 */
	public int registerOfficeWorkspace(OfficeWorkspace officeWorkspace);
	
	/**
	 * 1-4.제3연락처 등록하기
	 * @param thirdContact
	 * @return
	 */
	public int registerThirdContact(ThirdContact thirdContact);

	/**
	 * 1-5.고객추가정보 등록하기
	 * @param customerAdd
	 * @return
	 */
	public int registerCustomerAdd(CustomerAdd customerAdd);
	
	/**
	 * 1-6.자금세탁방지 등록하기
	 * @param antiMoneyLaundering
	 * @return
	 */
	public int registerAntiMoney(AntiMoneyLaundering antiMoneyLaundering);
	
	
	
	/**
	 * 3-1.고객기본정보 수정하기
	 * @param customerBasics
	 * @return
	 */
	public int modifyCustomerBasics(CustomerBasics customerBasics);
	
	/**
	 * 3-2.자택(본사) 수정하기
	 * @param houseCompany
	 * @return
	 */
	public int modifyHouseCompany(HouseCompany houseCompany);
	
	/**
	 * 3-3.직장(사업장) 수정하기
	 * @param officeWorkspace
	 * @return
	 */
	public int modifyOfficeWorkspace(OfficeWorkspace officeWorkspace);
	
	/**
	 * 3-4.제3연락처 수정하기
	 * @param thirdContact
	 * @return
	 */
	public int modifyThirdContact(ThirdContact thirdContact);
	
	/**
	 * 3-5.고객추가정보 수정하기
	 * @param customerAdd
	 * @return
	 */
	public int modifyCustomerAdd(CustomerAdd customerAdd);
	
	/**
	 * 3-6.자금세탁방지 수정하기
	 * @param antiMoneyLaundering
	 * @return
	 */
	public int modifyAntiMoneyLaundering(AntiMoneyLaundering antiMoneyLaundering);
	
	
	/**
	 * 계좌번호로 계좌조회하기
	 * @param account_num
	 * @return
	 */
	public BankbookInfo findBankbook(String account_num);
	
	/**
	 * 고객번호로 고객기본정보 조회하기
	 * @param customer_no
	 * @return
	 */
	public CustomerBasics findCustomerBasicsByNo(String customer_no);

	/**
	 * 계좌번호의 거래내역조회하기
	 * @param account_num
	 * @return
	 */
	public List<BankbookTrade> findBankbookTradeByAccountNum(String account_num);

	/**
	 * 존재하는 실명번호인지 확인한다. 
	 */
	public boolean seeRealnameNum(CustomerBasics customerBasics);

	
	/**
	 * 고객기본정보에서 고객의 보유계좌를 정보를 조회한다.
	 * @param customer_no
	 * @return
	 */
	public List<BankbookInfo> findBankbookInfoByCustomerNo(String customer_no);
}
