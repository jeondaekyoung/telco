package telco.naree.dao;

import java.util.Calendar;

import org.junit.Test;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.EtcAntiMoneyLaundering;

public class BankbookDaoImplTest {

	@Test
	public void testSelectCustomer(){
		String realname_num = "11111";
		
		BankbookDao bd = new BankbookDaoImpl();
		CustomerBasics cb = bd.selectCustomer(realname_num);
		
		System.out.println("결과 - " + cb.toString());
	}
	
	@Test
	public void testSelectAccountNum(){
		BankbookDao bd = new BankbookDaoImpl();
		
		String result = bd.selectAccountNum();
		System.out.println(result);
		
		String a = "2015";
		int b = 2015;
		if(a.equals(String.valueOf(b))){
			System.out.println("같다");
		} else {
			System.out.println("다르다");
		}
	}
	
	@Test
	public void testSelectTradeNo(){
		BankbookDao bd = new BankbookDaoImpl();
		String result = bd.selectTradeNo();
		System.out.println("*" + result + "*");
		
		if(result == null){
			System.out.println("널이다.");
		} else {
			System.out.println(result.toString());
		}
	}
	
	@Test
	public void testCalendar(){
		Calendar cal = java.util.Calendar.getInstance();
		int nYear = cal.get(Calendar.YEAR);
		int nMonth = cal.get(Calendar.MONTH)+1;
		int nDay = cal.get(Calendar.DAY_OF_MONTH);
		
		System.out.println(nYear + "/" + nMonth + "/" + nDay);
		String year = String.valueOf(nYear);
		String month = String.valueOf(nMonth);
		String day = String.valueOf(nDay);
		
		if(month.length() == 1){
			month = "0".concat(month);
		}
		if(day.length() == 1){
			day = "0".concat(day);
		}
		System.out.println(year + "/" + month + "/" + day);
		
		String datetime = year.concat(month).concat(day);
		System.out.println(datetime);
		System.out.println(datetime.substring(4, 6));
	}
	
	@Test
	public void testInsertEtcAntiMoney(){
		BankbookDao bd = new BankbookDaoImpl();
		EtcAntiMoneyLaundering etcAntiMoney = new EtcAntiMoneyLaundering();
		
	}
	
	@Test
	public void testSelectBankbookInfo(){
		BankbookDao bd = new BankbookDaoImpl();
		BankbookInfo bbi = bd.selectBankbookInfo("20150000005");
		
		System.out.println(bbi);
	}
}
