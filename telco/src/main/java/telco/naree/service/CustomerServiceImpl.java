package telco.naree.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.CustomerDao;
import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public String nextCustomerNo() {
		String nowCustomerNo = customerDao.selectCustomerNo();
		String nextCustomerNo = null;
		//현재 날짜 계산
		Calendar cal = java.util.Calendar.getInstance();
		int nYear = cal.get(Calendar.YEAR);
				
		//고객번호 만들기
		if(nowCustomerNo == null){
			nextCustomerNo = "".concat(String.valueOf(nYear)).concat(String.format("%09d", 1));
		} else {
			String year = nowCustomerNo.substring(0, 4);
			
			if(year.equals(String.valueOf(nYear))){
				String customerNo = nowCustomerNo.substring(4);
				//System.out.println(year + " / " + customerNo);
				int number = Integer.parseInt(customerNo);
				nextCustomerNo = year.concat(String.format("%09d", number+1));
			} else {		//년도 변경(1월1일)
				nextCustomerNo = "".concat(String.valueOf(nYear)).concat(String.format("%09d", 1));
			}
		}
		return nextCustomerNo;
	}

	@Override
	public CustomerBasics findCustomerBasics(String realname_num) {
		
		return customerDao.selectCustomerBasics(realname_num);
	}
	
	@Override
	public HouseCompany findHouseCompany(String customer_no) {
		
		return customerDao.selectHouseCompany(customer_no);
	}

	@Override
	public OfficeWorkspace findOfficeWorkspace(String customer_no) {
		
		return customerDao.selectOfficeWorkspace(customer_no);
	}

	@Override
	public ThirdContact findThirdContact(String customer_no) {
		
		return customerDao.selectThirdContact(customer_no);
	}

	@Override
	public CustomerAdd findCustomerAdd(String customer_no) {
		
		return customerDao.selectCustomerAdd(customer_no);
	}

	@Override
	public AntiMoneyLaundering findAntiMoneyLaundering(String customer_no) {
		
		return customerDao.selectAntiMoneyLaundering(customer_no);
	}
	
	@Override
	public int registerCustomerBasics(CustomerBasics customerBasics) {
		
		return customerDao.insertCustomerBasics(customerBasics);
	}

	@Override
	public int registerHouseCompany(HouseCompany houseCompany) {
		
		return customerDao.insertHouseCompany(houseCompany);
	}

	@Override
	public int registerOfficeWorkspace(OfficeWorkspace officeWorkspace) {
		
		return customerDao.insertOfficeWorkspace(officeWorkspace);
	}

	@Override
	public int registerThirdContact(ThirdContact thirdContact) {
		
		return customerDao.insertThirdContact(thirdContact);
	}

	@Override
	public int registerCustomerAdd(CustomerAdd customerAdd) {
		 
		return customerDao.insertCustomerAdd(customerAdd);
	}

	@Override
	public int registerAntiMoney(AntiMoneyLaundering antiMoneyLaundering) {
		
		return customerDao.insertAntiMoney(antiMoneyLaundering);
	}

	@Override
	public int modifyCustomerBasics(CustomerBasics customerBasics) {
		
		return customerDao.updateCustomerBasics(customerBasics);
	}

	@Override
	public int modifyHouseCompany(HouseCompany houseCompany) {
		
		return customerDao.updateHouseCompany(houseCompany);
	}

	@Override
	public int modifyOfficeWorkspace(OfficeWorkspace officeWorkspace) {
		
		return customerDao.updateOfficeWorkspace(officeWorkspace);
	}

	@Override
	public int modifyThirdContact(ThirdContact thirdContact) {
		
		return customerDao.updateThirdContact(thirdContact);
	}

	@Override
	public int modifyCustomerAdd(CustomerAdd customerAdd) {
		
		return customerDao.updateCustomerAdd(customerAdd);
	}

	@Override
	public int modifyAntiMoneyLaundering(AntiMoneyLaundering antiMoneyLaundering) {
		
		return customerDao.updateAntiMoney(antiMoneyLaundering);
	}

	@Override
	public BankbookInfo findBankbook(String account_num) {
		
		return customerDao.selectBankbookInfoByAccountNum(account_num);
	}

	@Override
	public CustomerBasics findCustomerBasicsByNo(String customer_no) {
		
		return customerDao.selectCustomerBasicsByNo(customer_no);
	}

	@Override
	public List<BankbookTrade> findBankbookTradeByAccountNum(String account_num) {
		
		return customerDao.selectBankbookTradeByAccountNum(account_num);
	}

	@Override
	public boolean seeRealnameNum(CustomerBasics customerBasics) {
		
		int result = customerDao.seeRealnameNum(customerBasics);
		//System.out.println("진우: " + result);
		if(result == 1){
			return true;
		}
		
		return false;
	}

	@Override
	public List<BankbookInfo> findBankbookInfoByCustomerNo(String customer_no) {
		
		return customerDao.selectBankbookInfoByCustomerNo(customer_no);
	}


}
