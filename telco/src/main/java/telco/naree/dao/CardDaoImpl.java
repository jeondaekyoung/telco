package telco.naree.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.CardMapper;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CardDebit;

@Repository
public class CardDaoImpl implements CardDao {

	@Override
	public List<BankbookInfo> selectCustomerBankbooks(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<BankbookInfo> customerBankbooks = null;
		try{
			CardMapper cardMapper = sqlSession.getMapper(CardMapper.class);
			customerBankbooks = cardMapper.selectCustomerBankbooks(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return customerBankbooks;
	}

	@Override
	public int insertCardDebit(CardDebit cardDebit) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CardMapper cardMapper = sqlSession.getMapper(CardMapper.class);
			result = cardMapper.insertCardDebit(cardDebit);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public List<CardDebit> selectCardDebitsByCustomerNo(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<CardDebit> cardDebits = null;
		try{
			CardMapper cardMapper = sqlSession.getMapper(CardMapper.class);
			cardDebits = cardMapper.selectCardDebitsByCustomerNo(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return cardDebits;
	}

}
