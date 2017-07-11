package telco.naree.dao;

import java.util.List;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CardDebit;

public interface CardDao {

	/**
	 * 고객번호로 고객의 계좌조회
	 * @param customer_no
	 * @return
	 */
	public List<BankbookInfo> selectCustomerBankbooks(String customer_no);

	/**
	 * 직불카드 삽입하기
	 * @param cardDebit
	 * @return
	 */
	public int insertCardDebit(CardDebit cardDebit);

	/**
	 * 고객번호로 직불카드 조회하기
	 * @param customer_no
	 * @return
	 */
	public List<CardDebit> selectCardDebitsByCustomerNo(String customer_no);

}
