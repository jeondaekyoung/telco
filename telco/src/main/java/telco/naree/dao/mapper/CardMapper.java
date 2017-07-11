package telco.naree.dao.mapper;

import java.util.List;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CardDebit;


public interface CardMapper {

	public List<BankbookInfo> selectCustomerBankbooks(String customer_no);

	public int insertCardDebit(CardDebit cardDebit);

	public List<CardDebit> selectCardDebitsByCustomerNo(String customer_no);
	
}
