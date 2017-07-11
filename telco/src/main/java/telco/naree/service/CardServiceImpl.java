package telco.naree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.CardDao;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CardDebit;

@Service
public class CardServiceImpl implements CardService {
	
	@Autowired
	private CardDao cardDao;

	@Override
	public List<BankbookInfo> findCustomerBankbooks(String customer_no) {
		
		return cardDao.selectCustomerBankbooks(customer_no);
	}

	@Override
	public int registerCardDebit(CardDebit cardDebit) {
		
		return cardDao.insertCardDebit(cardDebit);
	}

	@Override
	public List<CardDebit> findCardDebitsByCustomerNo(String customer_no) {
		
		return cardDao.selectCardDebitsByCustomerNo(customer_no);
	}

}
