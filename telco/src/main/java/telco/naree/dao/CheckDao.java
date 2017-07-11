package telco.naree.dao;

import telco.naree.domain.CheckNo;
import telco.naree.domain.CheckPayment;
import telco.naree.domain.CheckPaymentBankTrade;
import telco.naree.domain.CheckPaymentCome;
import telco.naree.domain.CheckPaymentPublish;
import telco.naree.domain.CheckPublish;
import telco.naree.domain.CheckPublishDetail;

public interface CheckDao {

	/**
	 * 수표채번 테이블에서 최근 수표시퀀스 찾기
	 * @return
	 */
	public String selectCheckSeq();
	
	/**
	 * 수표채번 삽입하기
	 * @param checkNo
	 * @return
	 */
	public int insertCheckNo(CheckNo checkNo);
	
	/**
	 * 자기앞수표 발행내역 테이블에서 최근 수표발행번호 찾기
	 * @return
	 */
	public String selectCheckPublishNo();
	
	/**
	 * 자기앞수표발행 테이블에 삽입하기 
	 * @param checkPublish
	 * @return
	 */
	public int insertCheckPublish(CheckPublish checkPublish);

	/**
	 * 자기앞수표발행상세내역 테이블에 삽입하기
	 * @param checkPublishDetail
	 * @return
	 */
	public int insertCheckPublishDetail(CheckPublishDetail checkPublishDetail);

	/**
	 * 수표지급내역 테이블에서 최근 수표지급번호 찾기
	 * @return
	 */
	public String selectCheckPaymentNo();

	/**
	 * 수표지급내역 테이블에 삽입하기
	 * @param checkPayment
	 * @return
	 */
	public int insertCheckPayment(CheckPayment checkPayment);

	/**
	 * 수표지급정보 테이블에 삽입하기
	 * @param checkPaymentCome
	 * @return
	 */
	public int insertCheckPaymentCome(CheckPaymentCome checkPaymentCome);

	/**
	 * 수표지급시 수표발행 테이블에 삽입하기
	 * @param checkPaymentPublish
	 * @return
	 */
	public int insertCheckPaymentPublish(CheckPaymentPublish checkPaymentPublish);

	/**
	 * 수표지급시 은행거래정보 테이블에 삽입하기
	 * @param checkPaymentBankTrade
	 * @return
	 */
	public int insertCheckPaymentBankTrade(CheckPaymentBankTrade checkPaymentBankTrade);
	
}
