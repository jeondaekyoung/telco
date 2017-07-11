package telco.naree.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.BankbookMapper;
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

@Repository
public class BankbookDaoImpl implements BankbookDao {

	@Override
	public CustomerBasics selectCustomer(String realname_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		CustomerBasics customerBasics = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			customerBasics = bankbookMapper.selectCustomer(realname_num);
		}
		finally {
			sqlSession.close();
		}
		return customerBasics;
	}

	@Override
	public String selectAccountNum() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String accountNum = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			accountNum = bankbookMapper.selectAccountNum();
		}
		finally {
			sqlSession.close();
		}
		return accountNum;
	}

	@Override
	public int insertBankbookInfo(BankbookInfo bankbookInfo) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertBankbookInfo(bankbookInfo);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
	
	@Override
	public String selectTradeNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String tradeNo = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			tradeNo = bankbookMapper.selectTradeNo();
		}
		finally {
			sqlSession.close();
		}
		return tradeNo;
	}


	@Override
	public int insertBankbookTrade(BankbookTrade bankbookTrade) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertBankbookTrade(bankbookTrade);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public String selectTradeDetailNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String tradeDetailNo = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			tradeDetailNo = bankbookMapper.selectTradeDetailNo();
		}
		finally {
			sqlSession.close();
		}
		return tradeDetailNo;
	}
	
	@Override
	public int insertBankbookTradeDetail(BankbookTradeDetail bankbookTradeDetail) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertBankbookTradeDetail(bankbookTradeDetail);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertEtcAntiMoney(EtcAntiMoneyLaundering etcAntiMoney) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertEtcAntiMoney(etcAntiMoney);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public BankbookInfo selectBankbookInfo(String account_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		BankbookInfo bankbookInfo = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			bankbookInfo = bankbookMapper.selectBankbookInfo(account_num);
		}
		finally {
			sqlSession.close();
		}
		return bankbookInfo;
	}

	@Override
	public CustomerBasics selectCustomerByCustomerNo(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		CustomerBasics CustomerBasics = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			CustomerBasics = bankbookMapper.selectCustomerByCustomerNo(customer_no);
		}
		finally {
			sqlSession.close();
		}
		return CustomerBasics;
	}

	@Override
	public int updateBankbookInfo(BankbookInfo bankbookInfo) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.updateBankbookInfo(bankbookInfo);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertRcpmnyDetail(RcpmnyDetail rcpmnyDetail) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertRcpmnyDetail(rcpmnyDetail);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertRcpmnyCheck(RcpmnyCheck rcpmnyCheck) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertRcpmnyCheck(rcpmnyCheck);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertPymntCheck(PymntCheck pymntCheck) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertPymntCheck(pymntCheck);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertPymntBankTrade(PymntBankTrade pymntBankTrade) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertPymntBankTrade(pymntBankTrade);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public List<BankbookTrade> selectBankbookTrades(String account_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<BankbookTrade> bankbookTrades = null;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			bankbookTrades = bankbookMapper.selectBankbookTrades(account_num);
		}
		finally {
			sqlSession.close();
		}
		return bankbookTrades;
	}

	@Override
	public int insertBankbookReissue(BankbookReissue bankbookReissue) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			BankbookMapper bankbookMapper = sqlSession.getMapper(BankbookMapper.class);
			result = bankbookMapper.insertBankbookReissue(bankbookReissue);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
}
