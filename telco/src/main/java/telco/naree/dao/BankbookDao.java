package telco.naree.dao;

import java.util.List;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookReissue;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.BankbookTradeDetail;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.EtcAntiMoneyLaundering;
import telco.naree.domain.PymntBankTrade;
import telco.naree.domain.PymntCheck;
import telco.naree.domain.RcpmnyCheck;
import telco.naree.domain.RcpmnyDetail;

public interface BankbookDao {
	
	/**
	 * 실명번호로 고객정보 조회
	 * @param realname_num
	 * @return
	 */
	public CustomerBasics selectCustomer(String realname_num);
	
	/**
	 * 통장정보 테이블에서 최근 계좌번호 찾기
	 * @return
	 */
	public String selectAccountNum();
	
	/**
	 * 수신신규 삽입하기
	 * @param bankbookInfo
	 * @return
	 */
	public int insertBankbookInfo(BankbookInfo bankbookInfo);
	
	/**
	 * 통장거래내역 테이블에서 최근 거래번호 찾기
	 * @return
	 */
	public String selectTradeNo();
	
	/**
	 * 통장 거래내역 삽입하기
	 * @param bankbookTrade
	 * @return
	 */
	public int insertBankbookTrade(BankbookTrade bankbookTrade);
	
	/**
	 * 통장거래상세내역 테이블에서 최근 거래번호 찾기
	 * @return
	 */
	public String selectTradeDetailNo();
	
	/**
	 * 통장 거래상세내역 삽입하기
	 * @param bankbookTradeDetail
	 * @return
	 */
	public int insertBankbookTradeDetail(BankbookTradeDetail bankbookTradeDetail);
	
	/**
	 * 기타및자금세탁방지정보 삽입하기
	 * @param etcAntiMoney
	 * @return
	 */
	public int insertEtcAntiMoney(EtcAntiMoneyLaundering etcAntiMoney);
	
	/**
	 * 계좌번호로 계좌정보 조회
	 * @param account_num
	 * @return
	 */
	public BankbookInfo selectBankbookInfo(String account_num);
	
	/**
	 * 고객번호로 고객정보 조회
	 * @param customer_no
	 * @return
	 */
	public CustomerBasics selectCustomerByCustomerNo(String customer_no);

	/**
	 * 통장정보 업데이트
	 * @param bankbookInfo
	 * @return
	 */
	public int updateBankbookInfo(BankbookInfo bankbookInfo);
	
	/**
	 * 입금 상세정보테이블에 삽입하기
	 * @param rcpmnyDetail
	 * @return
	 */
	public int insertRcpmnyDetail(RcpmnyDetail rcpmnyDetail);
	
	/**
	 * 입금 수표정보테이블에 삽입하기
	 * @param rcpmnyCheck
	 * @return
	 */
	public int insertRcpmnyCheck(RcpmnyCheck rcpmnyCheck);
	
	/**
	 * 지급 수죠정보테이블에 삽입하기
	 * @param pymntCheck
	 * @return
	 */
	public int insertPymntCheck(PymntCheck pymntCheck);
	
	/**
	 * 지급 은행정보테이블에 삽입하기
	 * @param pymntBankTrade
	 * @return
	 */
	public int insertPymntBankTrade(PymntBankTrade pymntBankTrade);

	/**
	 * 통장거래내역 조회하기
	 * @param account_num
	 * @return
	 */
	public List<BankbookTrade> selectBankbookTrades(String account_num);

	/**
	 * 통장재발행정리재기장 테이블에 삽입하기
	 * @param bankbookReissue
	 * @return
	 */
	public int insertBankbookReissue(BankbookReissue bankbookReissue);
	
}
