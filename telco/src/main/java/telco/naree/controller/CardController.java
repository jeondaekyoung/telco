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
import telco.naree.domain.CardDebit;
import telco.naree.domain.CustomerBasics;
import telco.naree.service.CardService;
import telco.naree.service.CustomerService;

@Controller
@RequestMapping("card")
public class CardController {
	
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CardService cardService;
	
	/**
	 * 실명번호로 고객명, 고객번호, 직불카드 보유내역 조회
	 * @param realname_num
	 * @return
	 */
	@RequestMapping(value = "findCustomerDebit.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findCustomerDebit(String realname_num){
		System.out.println(realname_num);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//1.고객정보 조회
		CustomerBasics customerBasics = customerService.findCustomerBasics(realname_num);
		if(customerBasics == null){
			result.put("customer_name", "");
			return result;
		}
		
		result.put("customer_name", customerBasics.getCustomer_name());
		result.put("customer_no", customerBasics.getCustomer_no());
		
		//2.직불카드 보유내역 조회
		List<CardDebit> cardDebits = cardService.findCardDebitsByCustomerNo(customerBasics.getCustomer_no());
		result.put("cardDebits", cardDebits);
		
		return result;
	}
	
	/**
	 * 카드발급에서 결제계좌번호 조회(본인의 계좌인지 확인)
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findCustomerBankbook.do", method=RequestMethod.POST)
	@ResponseBody
	public String findCustomerBankbook(String realname_num, String account_num){
		System.out.println(realname_num + " / " + account_num);
		
		//cardService.findCustomerBankbook(account_num);
		//1. 고객 실명번호로 고객번호 조회
		CustomerBasics customerBasics = customerService.findCustomerBasics(realname_num);
		
		//2.고객번호로 계좌번호 조회
		String result = "false";
		System.out.println("고객번호 : " + customerBasics.getCustomer_no());
		List<BankbookInfo> customerBankbooks = cardService.findCustomerBankbooks(customerBasics.getCustomer_no());
		for(BankbookInfo bi : customerBankbooks){
			if(account_num.equals(bi.getAccount_num())){
				result = "true";
			}
		}
		
		return result;
	}

	/**
	 * 직불카드 발급
	 * @return
	 */
	@RequestMapping(value = "issueDcard.do", method=RequestMethod.POST)
	@ResponseBody
	public String issueDcard(String dcard_num, String dcard_code, String dcard_issue_sepa, String dcard_pw, String dcard_use_sepa, String dcard_issue_place
								,String scrcmpn_code, String achlqr_bizrno, String school_code, String student_num, String barcode_num
								,String customer_no, String account_num){
		System.out.println(dcard_num + " / " + dcard_code + " / " + dcard_issue_sepa + " / " + dcard_pw + " / " + dcard_use_sepa + " / " + dcard_issue_place);
		System.out.println(scrcmpn_code + " / " + achlqr_bizrno + " / " + school_code + " / " + student_num + " / " + barcode_num);
		System.out.println(customer_no + " / " + account_num);
		
		//1.직불카드 등록
		CardDebit cardDebit = new CardDebit();
		cardDebit.setDcard_num(dcard_num);
		cardDebit.setDcard_code(dcard_code);
		cardDebit.setDcard_issue_sepa(dcard_issue_sepa);
		cardDebit.setDcard_pw(dcard_pw);
		cardDebit.setDcard_use_sepa(dcard_use_sepa);
		cardDebit.setDcard_issue_place(dcard_issue_place);
		cardDebit.setScrcmpn_code(scrcmpn_code);
		cardDebit.setAchlqr_bizrno(achlqr_bizrno);
		cardDebit.setSchool_code(school_code);
		cardDebit.setStudent_num(student_num);
		cardDebit.setBarcode_num(barcode_num);
		cardDebit.setCustomer_no(customer_no);
		cardDebit.setAccount_num(account_num);
		System.out.println(cardDebit.toString());
		int result1 = cardService.registerCardDebit(cardDebit);
		
		if(result1 != 1){
			return "false";
		}
		return "success";
	}
	
}
