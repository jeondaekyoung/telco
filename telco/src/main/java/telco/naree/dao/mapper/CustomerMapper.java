package telco.naree.dao.mapper;

import java.util.List;

import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;

public interface CustomerMapper {

	public String selectCustomerNo();
	
	public CustomerBasics selectCustomerBasics(String realname_num);
	
	public HouseCompany selectHouseCompany(String customer_no);
	
	public OfficeWorkspace selectOfficeWorkspace(String customer_no);
	
	public ThirdContact selectThirdContact(String customer_no);
	
	public CustomerAdd selectCustomerAdd(String customer_no);
	
	public AntiMoneyLaundering selectAntiMoneyLaundering(String customer_no);
	
	
	public int insertCustomerBasics(CustomerBasics customerBasics);
	
	public int insertHouseCompany(HouseCompany houseCompany);
	
	public int insertOfficeWorkspace(OfficeWorkspace officeWorkspace);
	
	public int insertThirdContact(ThirdContact thirdContact);
	
	public int insertCustomerAdd(CustomerAdd customerAdd);
	
	public int insertAntiMoney(AntiMoneyLaundering antiMoneyLaundering);
	
	
	public int updateCustomerBasics(CustomerBasics customerBasics);
	
	public int updateHouseCompany(HouseCompany houseCompany);
	
	public int updateOfficeWorkspace(OfficeWorkspace officeWorkspace);
	
	public int updateThirdContact(ThirdContact thirdContact);
	
	public int updateCustomerAdd(CustomerAdd customerAdd);
	
	public int updateAntiMoney(AntiMoneyLaundering antiMoneyLaundering);
	
	
	public BankbookInfo selectBankbookInfoByAccountNum(String account_num);
	
	public CustomerBasics selectCustomerBasicsByNo(String customer_no);
	
	public List<BankbookTrade> selectBankbookTradeByAccountNum(String account_num);

	public int seeRealnameNum(CustomerBasics customerBasics);

	public List<BankbookInfo> selectBankbookInfoByCustomerNo(String customer_no);
	
}
