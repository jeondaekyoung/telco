package telco.naree.service;

import telco.naree.domain.CheckNo;
import telco.naree.domain.CheckPayment;
import telco.naree.domain.CheckPaymentBankTrade;
import telco.naree.domain.CheckPaymentCome;
import telco.naree.domain.CheckPaymentPublish;
import telco.naree.domain.CheckPublish;
import telco.naree.domain.CheckPublishDetail;

public interface CheckService {

	/**
	 * 수표채번시 다음 수표시퀀스 생성하기
	 * @return
	 */
	public String nextCheckSeq();
	
	/**
	 * 수표채번 등록하기
	 * @param checkNo
	 * @return
	 */
	public int registerCheckNo(CheckNo checkNo);
	
	/**
	 * 수표발행번호 생성하기
	 * @return
	 */
	public String nextCheckPublishNo();

	/**
	 * 자기앞수표 발행내역 등록하기
	 * @param checkPublish
	 * @return
	 */
	public int registerCheckPublish(CheckPublish checkPublish);

	/**
	 * 자기앞수표 발행상세내역 등록하기
	 * @param checkPublishDetail
	 * @return
	 */
	public int registerCheckPublishDetail(CheckPublishDetail checkPublishDetail);

	/**
	 * 계좌번호로 예금주 조회하기
	 * @param account_num
	 * @return
	 */
	public String findCustomerName(String account_num);

	/**
	 * 수표지급번호 생성하기
	 * @return
	 */
	public String nextCheckPaymentNo();

	/**
	 * 수표지급내역 등록하기
	 * @param checkPayment
	 * @return
	 */
	public int registerCheckPayment(CheckPayment checkPayment);

	/**
	 * 수표지급정보 등록하기
	 * @param checkPaymentCome
	 * @return
	 */
	public int registerCheckPaymentCome(CheckPaymentCome checkPaymentCome);

	/**
	 * 수표지급 수표발행 등록하기
	 * @param checkPaymentPublish
	 * @return
	 */
	public int registerCheckPaymentPublish(CheckPaymentPublish checkPaymentPublish);

	/**
	 * 수표지급 은행거래정보 등록하기
	 * @param checkPaymentBankTrade
	 */
	public int registerCheckPaymentBankTrade(CheckPaymentBankTrade checkPaymentBankTrade);
}
