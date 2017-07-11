package telco.naree.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
import telco.naree.service.BankbookService;
import telco.naree.service.CustomerService;

@Controller
@RequestMapping("bankbook")
public class BankbookController {

	@Autowired
	private BankbookService bankbookService;
	@Autowired
	private CustomerService customerService;
	
	/**
	 * 수신신규에서 실명번호 조회
	 * @param realname_num
	 * @return
	 */
	@RequestMapping("findCustomer.do")
	@ResponseBody
	public Map<String, String> findCustomer(String realname_num){
		//System.out.println("드루와드루와 - " + realname_num);
		Map<String, String> result = new HashMap<String, String>();
		
		CustomerBasics customerBasics = bankbookService.findCustomer(realname_num);
		
		if(customerBasics == null){
			//System.out.println("널이다");
			result.put("customer_name", "");
			result.put("customer_no", "");
			return result;
		} else {
			//System.out.println(customerBasics.toString());
			result.put("customer_name", customerBasics.getCustomer_name());
			result.put("customer_no", customerBasics.getCustomer_no());
			return result;
		}
	}
	
	/**
	 * 수신신규 등록하기
	 * 1-1.계좌, 거래내역, 상세거래내역 등록하기
	 * @param bankbookInfo
	 * @return
	 */
	@RequestMapping(value = "registerBankbook.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerBankbook(BankbookInfo bankbookInfo, String summary, String customer_name,
			Long cash, Long check_alternative, Long bank_alternative){
		
		//1.계좌 생성
		String accountNum = bankbookService.nextAccountNum();
		//System.out.println("계좌번호 : " + accountNum);
		bankbookInfo.setAccount_num(accountNum);
		System.out.println(bankbookInfo.toString());
		int result1 = bankbookService.registerBankbook(bankbookInfo);
		//int result1 = 1;
		//2.통장 거래내역 저장
		//거래번호 만들기
		String tradeNo = bankbookService.nextTradeNo();
		System.out.println("거래번호 : " + tradeNo);
		BankbookTrade bankbookTrade = new BankbookTrade();
		bankbookTrade.setTrade_no(tradeNo);
		bankbookTrade.setAccount_num(accountNum);
		bankbookTrade.setTrade_sepa("신규");
		bankbookTrade.setTrade_amount(bankbookInfo.getBalance());
		bankbookTrade.setTrade_balance(bankbookInfo.getBalance());
		bankbookTrade.setSummary(summary);
		bankbookTrade.setClient_name(customer_name);
		bankbookTrade.setManagement_point(bankbookInfo.getManagement_point());
		bankbookTrade.setPrint_or("Y");
		System.out.println(bankbookTrade.toString());
		int result2 = bankbookService.registerBankbookTrade(bankbookTrade);
		
		//3.거래상세내역 저장
		//상세거래번호 만들기
		String tradeDetailNo = bankbookService.nextTradeDetailNo();
		System.out.println("거래상세번호 : " + tradeDetailNo);
		BankbookTradeDetail bankbookTradeDetail = new BankbookTradeDetail();
		bankbookTradeDetail.setTrade_detail_no(tradeDetailNo);
		bankbookTradeDetail.setTrade_no(tradeNo);
		bankbookTradeDetail.setCash(cash);
		bankbookTradeDetail.setCheck_alternative(check_alternative);
		bankbookTradeDetail.setBank_alternative(bank_alternative);
		System.out.println(bankbookTradeDetail.toString());
		int result3 = bankbookService.registerBankbookTradeDetail(bankbookTradeDetail);
		
		
		if((result1 == 1) && (result2 == 1) && (result3 == 1)){
			return accountNum;
		} else {
			return "false";
		}
	}
	
	/**
	 * 1-2.기타및자금세탁방지정보 등록하기
	 * @param etcAntiMoney
	 * @return
	 */
	@RequestMapping(value = "registerEtcAntiMoney.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerEtcAntiMoney(EtcAntiMoneyLaundering etcAntiMoney){
		System.out.println(etcAntiMoney.toString());
		Map<String, Object> result = new HashMap<String, Object>();
		
		String customer_name = bankbookService.findCustomerName(etcAntiMoney.getAccount_num());
		result.put("customer_name", customer_name);
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(etcAntiMoney.getAccount_num());
		result.put("bankbookInfo", bankbookInfo);
		
		int result1 = bankbookService.registerEtcAntiMoney(etcAntiMoney);
		
		return result;
	}
	

	/**
	 * 입금에서 계좌번호 조회
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findBankbook.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String findBankbook(String account_num){
		System.out.println("계좌번호 : " + account_num);
		
		//계좌번호로 예금주 조회하기
		String customer_name = bankbookService.findCustomerName(account_num);
		System.out.println("예금주 : " + customer_name);
		if(customer_name == null){
			//System.out.println("1");
			return customer_name;
		} else {
			//System.out.println("2");
			return customer_name;
		}
	}
	
	
	/**
	 * 입금 실행하기
	 */
	@RequestMapping(value = "deposit.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deposit(String bankname, String account_num, String customer_name, Long cash, Long check_alternative, Long bank_alternative, String summary,
			String management_point, String client_name, String client_num, String client_relation, String sub_name, String sub_num,
			String check_amount1, String start_num1, String number_of_sheet1, String end_num1, String giro_code1,
			String check_amount2, String start_num2, String number_of_sheet2, String end_num2, String giro_code2,
			String check_amount3, String start_num3, String number_of_sheet3, String end_num3, String giro_code3){
		Map<String, Object> result = new HashMap<String, Object>();
		
		//System.out.println(account_num + " / " +  cash + " / " +  check_alternative + " / " + bank_alternative);
		//System.out.println(summary + " / " + management_point + " / "  + client_name + " / " + client_num);
		//System.out.println(client_relation + " / " + sub_name + " / " + sub_num);
		
		//System.out.println(check_amount1 + " / " + start_num1 + " / " + number_of_sheet1 + " / " + end_num1 + " / " + giro_code1);
		//System.out.println(check_amount2 + " / " + start_num2 + " / " + number_of_sheet2 + " / " + end_num2 + " / " + giro_code2);
		//System.out.println(check_amount3 + " / " + start_num3 + " / " + number_of_sheet3 + " / " + end_num3 + " / " + giro_code3);

		if(!bankname.equals("01")){		//타행 입금시 실행
			result.put("customer_name", customer_name);
			switch(bankname){
			case "02": result.put("bankname", "국민은행"); break; 
			case "03": result.put("bankname", "우리은행"); break; 
			case "04": result.put("bankname", "신한은행"); break; 
			case "05": result.put("bankname", "기업은행"); break; 
			case "06": result.put("bankname", "하나은행"); break; 
			case "07": result.put("bankname", "농협중앙회"); break; 
			}
			BankbookInfo bankbookInfo = new BankbookInfo();
			bankbookInfo.setAccount_num(account_num);
			result.put("bankbookInfo", bankbookInfo);
			BankbookTrade bankbookTrade = new BankbookTrade();
			bankbookTrade.setTrade_amount(cash+check_alternative+bank_alternative);
			result.put("bankbookTrade", bankbookTrade);
			return result;
		}
		
		//고객명
		result.put("customer_name", customer_name);		//고객명 응답에 저장
		//은행명
		result.put("bankname", "텔코은행");				//은행명 응답에 저장
		
		//1.계좌조회
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		result.put("bankbookInfo", bankbookInfo);			//입금계좌 정보 응답에 저장
		Long nowBalance = bankbookInfo.getBalance();
		//2.통장거래내역 등록 - 잔액을 계산해야함
		Long afterBalance = nowBalance + cash + check_alternative + bank_alternative;
		BankbookTrade bankbookTrade = new BankbookTrade();
		String tradeNo = bankbookService.nextTradeNo();		//거래번호
		bankbookTrade.setTrade_no(tradeNo);
		bankbookTrade.setAccount_num(account_num);
		bankbookTrade.setTrade_sepa("입금");
		bankbookTrade.setTrade_amount(cash+check_alternative+bank_alternative);
		bankbookTrade.setTrade_balance(afterBalance);
		bankbookTrade.setSummary(summary);
		bankbookTrade.setManagement_point(management_point);
		int result1 = bankbookService.registerBankbookTrade(bankbookTrade);
		result.put("bankbookTrade", bankbookTrade);		//통장거래내역 응답에 저장
		//3.계좌잔액 업데이트
		System.out.println("=================");
		System.out.println(bankbookInfo.toString());
		bankbookInfo.setBalance(afterBalance);
		int result2 = bankbookService.updateBankbookInfo(bankbookInfo);
		System.out.println(bankbookInfo.toString());
		//4.통장상세거래내역 등록
		BankbookTradeDetail bankbookTradeDetail = new BankbookTradeDetail();
		String tradeDetailNo = bankbookService.nextTradeDetailNo();		//거래상세번호
		bankbookTradeDetail.setTrade_detail_no(tradeDetailNo);
		bankbookTradeDetail.setTrade_no(tradeNo);
		bankbookTradeDetail.setCash(cash);
		bankbookTradeDetail.setCheck_alternative(check_alternative);
		bankbookTradeDetail.setBank_alternative(bank_alternative);
		int result3 = bankbookService.registerBankbookTradeDetail(bankbookTradeDetail);
		//5.의뢰인정보 등록(상세입금정보테이블)
		RcpmnyDetail rcpmnyDetail = new RcpmnyDetail();
		rcpmnyDetail.setTrade_detail_no(tradeDetailNo);
		rcpmnyDetail.setClient_name(client_name);
		rcpmnyDetail.setClient_num(client_num);
		rcpmnyDetail.setClient_relation(client_relation);
		rcpmnyDetail.setSub_name(sub_name);
		rcpmnyDetail.setSub_num(sub_num);
		int result4 = bankbookService.registerRcpmnyDetail(rcpmnyDetail);
		
		//6.연동대체등록
		//List<RcpmnyCheck> rcpmnyChecks = new ArrayList<>();
		if(giro_code1 != null){
			RcpmnyCheck rc = new RcpmnyCheck();
			rc.setTrade_detail_no(tradeDetailNo);
			rc.setCheck_amount(check_amount1);
			rc.setStart_num(Long.valueOf(start_num1));
			rc.setNumber_of_sheet(Integer.valueOf(number_of_sheet1));
			rc.setEnd_num(Long.valueOf(end_num1));
			rc.setGiro_code(giro_code1);
			//rcpmnyChecks.add(rc);
			int result5 = bankbookService.registerRcpmnyCheck(rc);
		}
		if(giro_code2 != null){
			RcpmnyCheck rc = new RcpmnyCheck();
			rc.setTrade_detail_no(tradeDetailNo);
			rc.setCheck_amount(check_amount2);
			rc.setStart_num(Long.valueOf(start_num2));
			rc.setNumber_of_sheet(Integer.valueOf(number_of_sheet2));
			rc.setEnd_num(Long.valueOf(end_num2));
			rc.setGiro_code(giro_code2);
			//rcpmnyChecks.add(rc);
			int result6 = bankbookService.registerRcpmnyCheck(rc);
		}
		if(giro_code3 != null){
			RcpmnyCheck rc = new RcpmnyCheck();
			rc.setTrade_detail_no(tradeDetailNo);
			rc.setCheck_amount(check_amount3);
			rc.setStart_num(Long.valueOf(start_num3));
			rc.setNumber_of_sheet(Integer.valueOf(number_of_sheet3));
			rc.setEnd_num(Long.valueOf(end_num3));
			rc.setGiro_code(giro_code3);
			//rcpmnyChecks.add(rc);
			int result7 = bankbookService.registerRcpmnyCheck(rc);
		}
		
		/*for(Map.Entry<String, Object> entry : result.entrySet()){
			System.out.println("key : " + entry.getKey() + " - " + entry.getValue());
		}*/
		
		return result;
	}
	
	/**
	 * 지급에서 계좌정보 조회하기
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findBankbookPay.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> findBankbookPay(String account_num){
		Map<String, String> result = new HashMap<String, String>();
		
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(bankbookInfo == null){
			result.put("customer_name", "");
		} else {
			//result.put("account_num", bankbookInfo.getAccount_num());
			result.put("customer_name", bankbookService.findCustomerName(bankbookInfo.getAccount_num()));
			result.put("nowBalance", String.valueOf(bankbookInfo.getBalance()));
		}
		return result;
	}
	
	/**
	 * 지급 실행하기
	 */
	@RequestMapping(value = "bankbookPay.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bankbookPay(String account_num, String bankbook_pw, Long cash, Long check_alternative, Long bank_alternative, String management_point,
			Long balance, String summary, String check_no1, String check_amount1, String number_of_sheet1,
			String check_no2, String check_amount2, String number_of_sheet2, String check_no3, String check_amount3, String number_of_sheet3,
			String check_no4, String check_amount4, String number_of_sheet4, String check_no5, String check_amount5, String number_of_sheet5,
			String telco_account_num, String telco_summary, Long telco_trade_amount,
			String anot_bankname, String anot_account_num, String anot_customer_name, String anot_summary, Long anot_trade_amount){
		
		System.out.println(account_num + " / " + bankbook_pw + " / " + cash + " / " + check_alternative + " / " + bank_alternative + " / " + management_point);
		System.out.println(balance + " / " + summary + " / " + check_no1 + " / " + check_amount1 + " / " + number_of_sheet1);
		System.out.println(check_no2 + " / " + check_amount2 + " / " + number_of_sheet2 + " / " + check_no3 + " / " + check_amount3 + " / " + number_of_sheet3);
		System.out.println(check_no4 + " / " + check_amount4 + " / " + number_of_sheet4 + " / " + check_no5 + " / " + check_amount5 + " / " + number_of_sheet5);
		System.out.println(telco_account_num + " /" + telco_summary + " / " + telco_trade_amount);
		System.out.println(anot_bankname + " / " + anot_account_num + " / " + anot_customer_name + " / " + anot_summary + " / " + anot_trade_amount);
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println("============== 지급계좌 =================");
		//지급계좌
		//1.계좌조회(비빌번호 확인)
		BankbookInfo payBank = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(!bankbook_pw.equals(payBank.getBankbook_pw())){
			result.put("account_num", "pwInvalid");
			return result;
		}
		//System.out.println(payBank.toString());
		Long payBalance = payBank.getBalance();
		result.put("account_num", payBank.getAccount_num());		//계좌번호 응답에 저장
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(payBank.getCustomer_no());
		result.put("customer_name", customerBasics.getCustomer_name());		//고객명 응답에 저장
		
		//2.거래정보등록
		BankbookTrade payTrade = new BankbookTrade();
		payTrade.setTrade_no(bankbookService.nextTradeNo());
		payTrade.setAccount_num(account_num);
		payTrade.setTrade_sepa("지급");
		payTrade.setTrade_amount(cash + check_alternative + bank_alternative);
		payTrade.setTrade_balance(payBalance - cash - check_alternative - bank_alternative);
		payTrade.setSummary(summary);
		payTrade.setManagement_point(management_point);
		//System.out.println(payTrade.toString());
		int result1 = bankbookService.registerBankbookTrade(payTrade);
		//3.계좌정보업데이트
		payBank.setBalance(payBalance - cash - check_alternative - bank_alternative);
		//System.out.println(paybank.toString());
		int result2 = bankbookService.updateBankbookInfo(payBank);
		payBank = bankbookService.findBankbookInfoByAccountNum(account_num);
		System.out.println(payBank.toString());
		//4.거래상세정보등록
		BankbookTradeDetail payTradeDetail = new BankbookTradeDetail();
		payTradeDetail.setTrade_detail_no(bankbookService.nextTradeDetailNo());
		payTradeDetail.setTrade_no(payTrade.getTrade_no());
		payTradeDetail.setCash(cash);
		payTradeDetail.setCheck_alternative(check_alternative);
		payTradeDetail.setBank_alternative(bank_alternative);
		int result3 = bankbookService.registerBankbookTradeDetail(payTradeDetail);
		result.put("resultBalance", cash + check_alternative + bank_alternative);
		
		//5.지급수표정보등록
		publishCheck(payTradeDetail.getTrade_detail_no(), check_no1, check_amount1, number_of_sheet1); 
		publishCheck(payTradeDetail.getTrade_detail_no(), check_no2, check_amount2, number_of_sheet2); 
		publishCheck(payTradeDetail.getTrade_detail_no(), check_no3, check_amount3, number_of_sheet3); 
		publishCheck(payTradeDetail.getTrade_detail_no(), check_no4, check_amount4, number_of_sheet4); 
		publishCheck(payTradeDetail.getTrade_detail_no(), check_no5, check_amount5, number_of_sheet5); 
		//6.지급은행거래등록
		if(telco_account_num != null){
			PymntBankTrade pymntBankTradeTelco = new PymntBankTrade();
			pymntBankTradeTelco.setTrade_detail_no(payTradeDetail.getTrade_detail_no());
			pymntBankTradeTelco.setAmount(telco_trade_amount);
			pymntBankTradeTelco.setAccount_num(telco_account_num);
			pymntBankTradeTelco.setBank_name("텔코");
			pymntBankTradeTelco.setCustomer_name(bankbookService.findCustomerName(telco_account_num));
			bankbookService.registerPymntBankTrade(pymntBankTradeTelco);
		}
		if(anot_account_num != null){
			PymntBankTrade pymntBankTradeAnot = new PymntBankTrade();
			pymntBankTradeAnot.setTrade_detail_no(payTradeDetail.getTrade_detail_no());
			pymntBankTradeAnot.setAmount(anot_trade_amount);
			pymntBankTradeAnot.setAccount_num(anot_account_num);
			pymntBankTradeAnot.setBank_name(anot_bankname);
			pymntBankTradeAnot.setCustomer_name(anot_customer_name);
			bankbookService.registerPymntBankTrade(pymntBankTradeAnot);
		}
		
		System.out.println("============== 입금계좌 =============");
		if(telco_account_num == null){
			if((result1 != 1) && (result2 != 1) && (result3 != 1)){
				result.put("account_num", "false");
				return result;
			}
			return result;
		}
		//입금계좌
		//1.계좌조회
		BankbookInfo depositBank = new BankbookInfo();
		depositBank = bankbookService.findBankbookInfoByAccountNum(telco_account_num);
		Long depositBalance = depositBank.getBalance();
		System.out.println(depositBank.toString());
		//2.거래정보등록
		BankbookTrade depositBankTrade = new BankbookTrade();
		depositBankTrade.setTrade_no(bankbookService.nextTradeNo());
		depositBankTrade.setAccount_num(telco_account_num);
		depositBankTrade.setTrade_sepa("입금");
		depositBankTrade.setTrade_amount(telco_trade_amount);
		depositBankTrade.setTrade_balance(depositBalance + telco_trade_amount);
		depositBankTrade.setSummary(telco_summary);
		depositBankTrade.setManagement_point(management_point);
		depositBankTrade.setConnect_trade_no(payTrade.getTrade_no());
		int result4 = bankbookService.registerBankbookTrade(depositBankTrade);
		//3.계좌정보업데이트
		depositBank.setBalance(depositBalance + telco_trade_amount);
		int result5 = bankbookService.updateBankbookInfo(depositBank);
		//depositBank = bankbookService.findBankbookInfoByAccountNum(telco_account_num);
		//System.out.println(depositBank.toString());
		if(telco_account_num != null){
			if((result4 != 1) && (result5 != 1)){
				result.put("account_num", "false");
				return result;
			}
			return result;
		}
		return result;
		
	}
	
	
	private void publishCheck(String trade_detail_no, String check_no, String check_amount, String number_of_sheet){
		if((check_no != null) && (number_of_sheet != null)){
			PymntCheck pc = new PymntCheck();
			pc.setTrade_detail_no(trade_detail_no);
			pc.setCheck_no(check_no);
			pc.setCheck_amount(check_amount);
			pc.setNumber_of_sheet(Integer.valueOf(number_of_sheet));
			bankbookService.registerPymntCheck(pc);
		}
	}
	
	/**
	 * 해지 실행
	 */
	@RequestMapping(value = "cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public String bankbookCancel(String account_num, String cancel_message, Long cash, Long check_alternative, Long bank_alternative, String management_point,
			String bankbook_pw, String cancel_why_sepa, String summary, String check_no1, String check_amount1, String number_of_sheet1,
			String check_no2, String check_amount2, String number_of_sheet2, String check_no3, String check_amount3, String number_of_sheet3,
			String check_no4, String check_amount4, String number_of_sheet4, String check_no5, String check_amount5, String number_of_sheet5,
			String telco_account_num, String telco_summary, Long telco_trade_amount,
			String anot_bankname, String anot_account_num, String anot_customer_name, String anot_summary, Long anot_trade_amount){
		
		System.out.println(account_num + " / " + cancel_message + " / " + cash + " / " + check_alternative + " / " + bank_alternative + " / " + management_point);
		System.out.println(bankbook_pw + " / " + cancel_why_sepa + " / " + summary + " / " + check_no1 + " / " + check_amount1 + " / " + number_of_sheet1);
		System.out.println(check_no2 + " / " + check_amount2 + " / " + number_of_sheet2 + " / " + check_no3 + " / " + check_amount3 + " / " + number_of_sheet3);
		System.out.println(check_no4 + " / " + check_amount4 + " / " + number_of_sheet4 + " / " + check_no5 + " / " + check_amount5 + " / " + number_of_sheet5);
		System.out.println(telco_account_num + " /" + telco_summary + " / " + telco_trade_amount);
		System.out.println(anot_bankname + " / " + anot_account_num + " / " + anot_customer_name + " / " + anot_summary + " / " + anot_trade_amount);
	
		System.out.println("============== 해지계좌 =================");
		//해지계좌
		//1.계좌조회(비밀번호 확인)
		BankbookInfo cancelBank = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(!bankbook_pw.equals(cancelBank.getBankbook_pw())){
			return "pwInvalid";
		}
		System.out.println(cancelBank.toString());
		Long cancelBalance = cancelBank.getBalance();
		//2.거래정보등록
		BankbookTrade cancelTrade = new BankbookTrade();
		cancelTrade.setTrade_no(bankbookService.nextTradeNo());
		cancelTrade.setAccount_num(account_num);
		cancelTrade.setTrade_sepa("해지");
		cancelTrade.setTrade_amount(cash + check_alternative + bank_alternative);
		cancelTrade.setTrade_balance(cancelBalance - cash - check_alternative - bank_alternative);
		cancelTrade.setSummary(summary);
		cancelTrade.setManagement_point(management_point);
		int result1 = bankbookService.registerBankbookTrade(cancelTrade);
		//3.계좌정보업데이트
		cancelBank.setBalance(cancelBalance - cash - check_alternative - bank_alternative);
		cancelBank.setUsing_or("N");
		cancelBank.setCancel_message(cancel_message);
		cancelBank.setCancel_why_sepa(cancel_why_sepa);
		cancelBank.setCancel_summary(summary);
		System.out.println(cancelBank.toString());
		int result2 = bankbookService.updateBankbookInfo(cancelBank);
		//cancelBank = bankbookService.findBankbookInfoByAccountNum(account_num);
		//System.out.println(cancelBank.toString());
		//4.거래상세정보등록
		BankbookTradeDetail cancelTradeDetail = new BankbookTradeDetail();
		cancelTradeDetail.setTrade_detail_no(bankbookService.nextTradeDetailNo());
		cancelTradeDetail.setTrade_no(cancelTrade.getTrade_no());
		cancelTradeDetail.setCash(cash);
		cancelTradeDetail.setCheck_alternative(check_alternative);
		cancelTradeDetail.setBank_alternative(bank_alternative);
		int result3 = bankbookService.registerBankbookTradeDetail(cancelTradeDetail);
		//5.지급수표정보등록
		publishCheck(cancelTradeDetail.getTrade_detail_no(), check_no1, check_amount1, number_of_sheet1);
		publishCheck(cancelTradeDetail.getTrade_detail_no(), check_no2, check_amount2, number_of_sheet2);
		publishCheck(cancelTradeDetail.getTrade_detail_no(), check_no3, check_amount3, number_of_sheet3);
		publishCheck(cancelTradeDetail.getTrade_detail_no(), check_no4, check_amount4, number_of_sheet4);
		publishCheck(cancelTradeDetail.getTrade_detail_no(), check_no5, check_amount5, number_of_sheet5);
		//6.지급은행거래등록
		if(telco_account_num != null){
			PymntBankTrade pymntBankTradeTelco = new PymntBankTrade();
			pymntBankTradeTelco.setTrade_detail_no(cancelTradeDetail.getTrade_detail_no());
			pymntBankTradeTelco.setAmount(telco_trade_amount);
			pymntBankTradeTelco.setAccount_num(telco_account_num);
			pymntBankTradeTelco.setBank_name("텔코");
			pymntBankTradeTelco.setCustomer_name(bankbookService.findCustomerName(telco_account_num));
			bankbookService.registerPymntBankTrade(pymntBankTradeTelco);
		}
		if(anot_account_num != null){
			PymntBankTrade pymntBankTradeAnot = new PymntBankTrade();
			pymntBankTradeAnot.setTrade_detail_no(cancelTradeDetail.getTrade_detail_no());
			pymntBankTradeAnot.setAmount(anot_trade_amount);
			pymntBankTradeAnot.setAccount_num(anot_account_num);
			pymntBankTradeAnot.setBank_name(anot_bankname);
			pymntBankTradeAnot.setCustomer_name(anot_customer_name);
			bankbookService.registerPymntBankTrade(pymntBankTradeAnot);
		}
		
		System.out.println("============== 입금계좌 =============");
		if(telco_account_num == null){
			if((result1 != 1) && (result2 != 1) && (result3 != 1)){
				return "false";
			}
			return cancelTrade.getTrade_no();	
		}
		//입금계좌
		//1.계좌조회
		BankbookInfo depositBank = new BankbookInfo();
		depositBank = bankbookService.findBankbookInfoByAccountNum(telco_account_num);
		Long depositBalance = depositBank.getBalance();
		System.out.println(depositBank.toString());
		//2.거래정보등록
		BankbookTrade depositBankTrade = new BankbookTrade();
		depositBankTrade.setTrade_no(bankbookService.nextTradeNo());
		depositBankTrade.setAccount_num(telco_account_num);
		depositBankTrade.setTrade_sepa("입금");
		depositBankTrade.setTrade_amount(telco_trade_amount);
		depositBankTrade.setTrade_balance(depositBalance + telco_trade_amount);
		depositBankTrade.setSummary(telco_summary);
		depositBankTrade.setManagement_point(management_point);
		depositBankTrade.setConnect_trade_no(cancelTrade.getTrade_no());
		int result4 = bankbookService.registerBankbookTrade(depositBankTrade);
		//3.계좌정보업데이트
		depositBank.setBalance(depositBalance + telco_trade_amount);
		int result5 = bankbookService.updateBankbookInfo(depositBank);
		depositBank = bankbookService.findBankbookInfoByAccountNum(telco_account_num);
		System.out.println(depositBank.toString());
		
		if((result1 != 1) && (result2 != 1) && (result3 != 1) && (result4 != 1) && (result5 != 1)){
			return "false";
		}
		return cancelTrade.getTrade_no();		
	}
	
	/**
	 * 통장재발행시, 통장정보와 거래내역 전체 출력
	 * @param kind_sepa
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findBankbookTrade.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findBankbookTrade(String account_num){
		System.out.println(account_num);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//1.통장정보 - 통장종류(상품명)
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(bankbookInfo == null){
			result.put("item_name", "");
		} else {
			result.put("item_name", bankbookInfo.getItem_name());
			//2.거래내역 출력
			List<BankbookTrade> bankbookTrades = bankbookService.findBankbookTrades(account_num);
			/*for(BankbookTrade bt : bankbookTrades){
				System.out.println(bt.toString());
			}*/
			result.put("bankbookTrades", bankbookTrades);
		}
		return result;
	}
	
	/**
	 * 통장재발행
	 * @param kind_sepa
	 * @param account_num
	 * @param certificate_num
	 * @param signet_sepa
	 * @return
	 */
	@RequestMapping(value = "reissue.do", method=RequestMethod.POST)
	@ResponseBody
	public String reissue(String kind_sepa, String account_num, String certificate_num, String signet_sepa, String management_point){
		System.out.println(kind_sepa + " / " + account_num + " / " + certificate_num + " / " + signet_sepa + " / " + management_point);
		
		//1.통장정보 업데이트
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		//System.out.println(bankbookInfo.toString());
		bankbookInfo.setCertificate_num(certificate_num);
		bankbookInfo.setBankbook_publish_sepa("01");
		bankbookInfo.setSignet_sepa(signet_sepa);
		int result1 = bankbookService.updateBankbookInfo(bankbookInfo);
		bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		//System.out.println(bankbookInfo.toString());
		
		//2.통장재발행정리재기장 삽입하기
		BankbookReissue bankbookReissue = new BankbookReissue();
		bankbookReissue.setAccount_num(bankbookInfo.getAccount_num());
		bankbookReissue.setKind_sepa(kind_sepa);
		bankbookReissue.setManagement_point(management_point);
		System.out.println(bankbookReissue.toString());
		int result2 = bankbookService.registerBankbookReissue(bankbookReissue);
		
		if(result1 != 1 || result2 != 1){
			return "false";
		}
		
		return "success";
	}
	
}
