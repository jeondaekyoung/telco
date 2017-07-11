package telco.naree.service;

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

public interface BankbookService {
	
	/**
	 * 실명번호로 고객정보 조회
	 * @param realname_num
	 * @return
	 */
	public CustomerBasics findCustomer(String realname_num);
	
	/**
	 * 다음 계좌번호 생성하기
	 * @return
	 */
	public String nextAccountNum();
	
	/**
	 * 수신신규 등록하기
	 * @param bankbookInfo
	 * @return
	 */
	public int registerBankbook(BankbookInfo bankbookInfo);
	
	/**
	 * 다음 거래번호 생성하기
	 * @return
	 */
	public String nextTradeNo();
	
	/**
	 * 통장거래내역 등록하기
	 * @param bankbookTrade
	 * @return
	 */
	public int registerBankbookTrade(BankbookTrade bankbookTrade);
	
	/**
	 * 다음 상세거래번호 생성하기
	 * @return
	 */
	public String nextTradeDetailNo();
	
	/**
	 * 통장거래상세내역 등록하기
	 * @param bankbookTradeDetail
	 * @return
	 */
	public int registerBankbookTradeDetail(BankbookTradeDetail bankbookTradeDetail);
	
	/**
	 * 기타및자금세탁방지정보 등록하기
	 * @param etcAntiMoney
	 * @return
	 */
	public int registerEtcAntiMoney(EtcAntiMoneyLaundering etcAntiMoney);
	
	/**
	 * 계좌번호로 예금주조회하기
	 * @param account_num
	 * @return
	 */
	public String findCustomerName(String account_num);
	
	/**
	 * 계좌번호로 계좌정보 조회하기
	 * @param account_num
	 * @return
	 */
	public BankbookInfo findBankbookInfoByAccountNum(String account_num);
	
	/**
	 * 통장정보 업데이트
	 * @param bankbookInfo
	 * @return
	 */
	public int updateBankbookInfo(BankbookInfo bankbookInfo);
	
	/**
	 * 입금 상세정보 등록하기
	 * @param rcpmnyDetail
	 * @return
	 */
	public int registerRcpmnyDetail(RcpmnyDetail rcpmnyDetail);
	
	/**
	 * 입금 수표정보 등록하기
	 * @param rcpmnyCheck
	 * @return
	 */
	public int registerRcpmnyCheck(RcpmnyCheck rcpmnyCheck);
	
	/**
	 * 지급 수표정보테이블에 등록하기
	 * @param pymntCheck
	 * @return
	 */
	public int registerPymntCheck(PymntCheck pymntCheck);
	
	/**
	 * 지급 은행거래정보테이블에 등록하기
	 * @param pymntBankTrade
	 * @return
	 */
	public int registerPymntBankTrade(PymntBankTrade pymntBankTrade);

	/**
	 * 통장거래내역 조회하기
	 * @param account_num
	 * @return
	 */
	public List<BankbookTrade> findBankbookTrades(String account_num);

	/**
	 * 통장재발행정리재기장 테이블에 등록하기
	 * @param bankbookReissue
	 * @return
	 */
	public int registerBankbookReissue(BankbookReissue bankbookReissue);

}
