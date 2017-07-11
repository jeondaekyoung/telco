package telco.naree.dao;

import org.junit.Test;

import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;

public class CustomerDaoImplTest {

	@Test
	public void testSelectCustomerNo(){
		CustomerDao customerDao = new CustomerDaoImpl();
		String nextCustomerNo = 	customerDao.selectCustomerNo();
		System.out.println(nextCustomerNo);
	}
	
	@Test
	public void testInsertCustomerBasics(){
		CustomerDao customerDao = new CustomerDaoImpl();
		
		CustomerBasics cb = new CustomerBasics();
		cb.setCustomer_no("2015000000003");
		cb.setRealname_num("1234567890123");
		cb.setRealname_num_sepa("01");
		cb.setCustomer_qualf_sepa("001");
		cb.setCustomer_qualf_name("내국인");
		cb.setCustomer_name("졸힘들어");
		cb.setCustomer_name_eng("hard");
		cb.setNationality_sepa("01");
		cb.setPostal_sepa("01");
		cb.setContact_sepa("01");
		
		cb.setPassport_num("01");
		cb.setBizrno("9999999999");
		cb.setEnterprise_name("몰라요");
		
		System.out.println("돌아라");
		int result = customerDao.insertCustomerBasics(cb);
		System.out.println("결과 - " + result);
	}
	
	@Test
	public void testSelectCustomerBasics(){
		CustomerDao customerDao = new CustomerDaoImpl();
		CustomerBasics cb = null;
		cb = customerDao.selectCustomerBasics("11");
		if(cb == null){
			System.out.println("널이다");
		} else {
			System.out.println(cb.toString());
		}
	}
	@Test
	public void testSelectHouseCompany(){
		CustomerDao customerDao = new CustomerDaoImpl();
		HouseCompany hc = null;
		hc = customerDao.selectHouseCompany("201500000001");
		if(hc == null){
			System.out.println("널이다");
		} else {
			System.out.println(hc.toString());
		}
	}
	@Test
	public void testSelecteOfficeWorkspace(){
		CustomerDao customerDao = new CustomerDaoImpl();
		OfficeWorkspace ow = null;
		ow = customerDao.selectOfficeWorkspace("2015000000001");
		if(ow == null){
			System.out.println("널이다");
		} else {
			System.out.println(ow.toString());
		}
	}
	@Test
	public void testSelecteThirdContact(){
		CustomerDao customerDao = new CustomerDaoImpl();
		ThirdContact tc = null;
		tc = customerDao.selectThirdContact("2015000000003");
		if(tc == null){
			System.out.println("널이다");
		} else {
			System.out.println(tc.toString());
		}
	}
	@Test
	public void testSelecteCustomerAdd(){
		CustomerDao customerDao = new CustomerDaoImpl();
		CustomerAdd ca = null;
		ca = customerDao.selectCustomerAdd("2015000000001");
		if(ca == null){
			System.out.println("널이다");
		} else {
			System.out.println(ca.toString());
		}
	}
	@Test
	public void testSelecteAntiMoneyLaundering(){
		CustomerDao customerDao = new CustomerDaoImpl();
		AntiMoneyLaundering aml = null;
		aml = customerDao.selectAntiMoneyLaundering("2015000000005");
		if(aml == null){
			System.out.println("널이다");
		} else {
			System.out.println(aml.toString());
		}
	}
	
	@Test
	public void testUpdateCustomerBasics(){
		CustomerDao customerDao = new CustomerDaoImpl();
		
		CustomerBasics cb = new CustomerBasics();
		cb.setCustomer_no("2015000000001");
		cb.setRealname_num("1234567890123");
		cb.setRealname_num_sepa("01");
		cb.setCustomer_qualf_sepa("001");
		cb.setCustomer_qualf_name("내국인");
		cb.setCustomer_name("졸힘들어");
		cb.setCustomer_name_eng("hard");
		cb.setNationality_sepa("01");
		cb.setPostal_sepa("01");
		cb.setContact_sepa("01");
		
		cb.setPassport_num("01");
		cb.setBizrno("9999999999");
		cb.setEnterprise_name("몰라요");
		
		System.out.println("돌아라");
		int result = customerDao.updateCustomerBasics(cb);
		System.out.println("결과 - " + result);
	}
}
