package telco.naree.service;

import java.util.List;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CardDebit;

public interface CardService {

	/**
	 * 고객번호로 고객의 계좌조회
	 * @param customer_no
	 * @return
	 */
	public List<BankbookInfo> findCustomerBankbooks(String customer_no);

	/**
	 * 직불카드 등록하기
	 * @param cardDebit
	 * @return
	 */
	public int registerCardDebit(CardDebit cardDebit);

	/**
	 * 고객번호로 직불카드 조회하기
	 * @param customer_no
	 * @return
	 */
	public List<CardDebit> findCardDebitsByCustomerNo(String customer_no);

}
