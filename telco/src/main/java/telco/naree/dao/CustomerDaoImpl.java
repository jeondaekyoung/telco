package telco.naree.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.CustomerMapper;
import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Override
	public String selectCustomerNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String nextCustomerNo;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			nextCustomerNo = customerMapper.selectCustomerNo();
		}
		finally{
			sqlSession.close();
		}
		return nextCustomerNo;
	}
	
	@Override
	public CustomerBasics selectCustomerBasics(String realname_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		CustomerBasics customerBasics = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			customerBasics = customerMapper.selectCustomerBasics(realname_num);
		}
		finally{
			sqlSession.close();
		}
		return customerBasics;
	}

	@Override
	public HouseCompany selectHouseCompany(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		HouseCompany houseCompany = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			houseCompany = customerMapper.selectHouseCompany(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return houseCompany;
	}
	
	@Override
	public OfficeWorkspace selectOfficeWorkspace(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		OfficeWorkspace officeWorkspace = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			officeWorkspace = customerMapper.selectOfficeWorkspace(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return officeWorkspace;
	}
	
	@Override
	public ThirdContact selectThirdContact(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		ThirdContact thirdContact = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			thirdContact = customerMapper.selectThirdContact(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return thirdContact;
	}
	
	@Override
	public CustomerAdd selectCustomerAdd(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		CustomerAdd customerAdd = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			customerAdd = customerMapper.selectCustomerAdd(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return customerAdd;
	}
	
	@Override
	public AntiMoneyLaundering selectAntiMoneyLaundering(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		AntiMoneyLaundering antiMoneyLaundering = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			antiMoneyLaundering = customerMapper.selectAntiMoneyLaundering(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return antiMoneyLaundering;
	}

	
	@Override
	public int insertCustomerBasics(CustomerBasics customerBasics) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.insertCustomerBasics(customerBasics);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertHouseCompany(HouseCompany houseCompany) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.insertHouseCompany(houseCompany);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertOfficeWorkspace(OfficeWorkspace officeWorkspace) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.insertOfficeWorkspace(officeWorkspace);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertThirdContact(ThirdContact thirdContact) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.insertThirdContact(thirdContact);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertCustomerAdd(CustomerAdd customerAdd) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.insertCustomerAdd(customerAdd);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertAntiMoney(AntiMoneyLaundering antiMoneyLaundering) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.insertAntiMoney(antiMoneyLaundering);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int updateCustomerBasics(CustomerBasics customerBasics) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.updateCustomerBasics(customerBasics);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		System.out.println("dao - " + result);
		return result;
	}

	@Override
	public int updateHouseCompany(HouseCompany houseCompany) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.updateHouseCompany(houseCompany);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int updateOfficeWorkspace(OfficeWorkspace officeWorkspace) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.updateOfficeWorkspace(officeWorkspace);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int updateThirdContact(ThirdContact thirdContact) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.updateThirdContact(thirdContact);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int updateCustomerAdd(CustomerAdd customerAdd) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.updateCustomerAdd(customerAdd);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int updateAntiMoney(AntiMoneyLaundering antiMoneyLaundering) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.updateAntiMoney(antiMoneyLaundering);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public BankbookInfo selectBankbookInfoByAccountNum(String account_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		BankbookInfo bankbookInfo = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			bankbookInfo = customerMapper.selectBankbookInfoByAccountNum(account_num);
		}
		finally{
			sqlSession.close();
		}
		return bankbookInfo;
	}

	@Override
	public CustomerBasics selectCustomerBasicsByNo(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		CustomerBasics customerBasics = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			customerBasics = customerMapper.selectCustomerBasicsByNo(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return customerBasics;
	}

	@Override
	public List<BankbookTrade> selectBankbookTradeByAccountNum(String account_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<BankbookTrade> results = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			results = customerMapper.selectBankbookTradeByAccountNum(account_num);
		}
		finally{
			sqlSession.close();
		}
		return results;
	}

	@Override
	public int seeRealnameNum(CustomerBasics customerBasics) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			result = customerMapper.seeRealnameNum(customerBasics);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public List<BankbookInfo> selectBankbookInfoByCustomerNo(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<BankbookInfo> results = null;
		try{
			CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
			results = customerMapper.selectBankbookInfoByCustomerNo(customer_no);
		}
		finally{
			sqlSession.close();
		}
		return results;
	}
}
