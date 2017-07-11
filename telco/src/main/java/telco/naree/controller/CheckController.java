package telco.naree.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CheckNo;
import telco.naree.domain.CheckPayment;
import telco.naree.domain.CheckPaymentBankTrade;
import telco.naree.domain.CheckPaymentCome;
import telco.naree.domain.CheckPaymentPublish;
import telco.naree.domain.CheckPublish;
import telco.naree.domain.CheckPublishDetail;
import telco.naree.service.BankbookService;
import telco.naree.service.CheckService;

@Controller
@RequestMapping("check")
public class CheckController {

	@Autowired
	private CheckService checkService;
	@Autowired
	private BankbookService bankbookService;
	
	/**
	 * 자기앞수표 채번 등록
	 * @param check_no
	 * @return
	 */
	@RequestMapping(value = "registerCheckNo.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerCheckNo(HttpSession session,String check_no, String print_or, String check_sepa1, String number_of_sheet1, String check_num1,
			String check_sepa2, String number_of_sheet2, String check_num2, String check_sepa3, String number_of_sheet3, String check_num3,
			String check_sepa4, String number_of_sheet4, String check_num4, String check_sepa5, String number_of_sheet5, String check_num5){
		
		String user_id = (String)session.getAttribute("userId");
		//System.out.println(user_id + " / " + check_no + " / " + check_sepa1 + " / " + number_of_sheet1 + " / " + check_num1);
		//System.out.println(check_sepa2 + " / " + number_of_sheet2 + " / " + check_num2 + " / " + check_sepa3 + " / " + number_of_sheet3 + " / " + check_num3);
		//System.out.println(check_sepa4 + " / " + number_of_sheet4 + " / " + check_num4 + " / " + check_sepa5 + " / " + number_of_sheet5 + " / " + check_num5);
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> checks = new ArrayList<String>();
		
		String nextCheckSeq = checkService.nextCheckSeq();
		//System.out.println("수표번호 - " + nextCheckSeq);
		
		CheckNo checkNo = new CheckNo();
		checkNo.setCheck_seq(nextCheckSeq);
		checkNo.setCheck_no(check_no);
		checkNo.setPrint_or(print_or);
		if((number_of_sheet1 != null) && (check_num1 != null)){
			checkNo.setCheck_sepa(check_sepa1);
			checkNo.setNumber_of_sheet(Integer.valueOf(number_of_sheet1));
			checkNo.setCheck_num(check_num1);
			checkNo.setUser_id(user_id);
			int result1 = checkService.registerCheckNo(checkNo);
			checks.add(checkSepaByStr(checkNo.getCheck_sepa()) + " / " + checkNo.getNumber_of_sheet() + "매 / " + checkNo.getCheck_num() + 
					"~" + (Integer.valueOf(checkNo.getCheck_num())+checkNo.getNumber_of_sheet()-1));
		}
		if((number_of_sheet2 != null) && (check_num2 != null)){
			checkNo.setCheck_sepa(check_sepa2);
			checkNo.setNumber_of_sheet(Integer.valueOf(number_of_sheet2));
			checkNo.setCheck_num(check_num2);
			checkNo.setUser_id(user_id);
			int result2 = checkService.registerCheckNo(checkNo);
			checks.add(checkSepaByStr(checkNo.getCheck_sepa()) + " / " + checkNo.getNumber_of_sheet() + "매 / " + checkNo.getCheck_num() + 
					"~" + (Integer.valueOf(checkNo.getCheck_num())+checkNo.getNumber_of_sheet()-1));
		}
		if((number_of_sheet3 != null) && (check_num3 != null)){
			checkNo.setCheck_sepa(check_sepa3);
			checkNo.setNumber_of_sheet(Integer.valueOf(number_of_sheet3));
			checkNo.setCheck_num(check_num3);
			checkNo.setUser_id(user_id);
			int result3 = checkService.registerCheckNo(checkNo);
			checks.add(checkSepaByStr(checkNo.getCheck_sepa()) + " / " + checkNo.getNumber_of_sheet() + "매 / " + checkNo.getCheck_num() + 
					"~" + (Integer.valueOf(checkNo.getCheck_num())+checkNo.getNumber_of_sheet()-1));
		}
		if((number_of_sheet4 != null) && (check_num4 != null)){
			checkNo.setCheck_sepa(check_sepa4);
			checkNo.setNumber_of_sheet(Integer.valueOf(number_of_sheet4));
			checkNo.setCheck_num(check_num4);
			checkNo.setUser_id(user_id);
			int result4 = checkService.registerCheckNo(checkNo);
			checks.add(checkSepaByStr(checkNo.getCheck_sepa()) + " / " + checkNo.getNumber_of_sheet() + "매 / " + checkNo.getCheck_num() + 
					"~" + (Integer.valueOf(checkNo.getCheck_num())+checkNo.getNumber_of_sheet()-1));
		}
		if((number_of_sheet5 != null) && (check_num5 != null)){
			checkNo.setCheck_sepa(check_sepa5);
			checkNo.setNumber_of_sheet(Integer.valueOf(number_of_sheet5));
			checkNo.setCheck_num(check_num5);
			checkNo.setUser_id(user_id);
			int result5 = checkService.registerCheckNo(checkNo);
			checks.add(checkSepaByStr(checkNo.getCheck_sepa()) + " / " + checkNo.getNumber_of_sheet() + "매 / " + checkNo.getCheck_num() + 
					"~" + (Integer.valueOf(checkNo.getCheck_num())+checkNo.getNumber_of_sheet()-1));
		}
		result.put("check_no", checkNo.getCheck_no());		//채번번호 응답에 저장
		result.put("checks", checks);			//수표정보 응답에 저장
		return result;
	}
	
	/**
	 * 자기앞수표발행하기(채번발행,개별발행)
	 */
	@RequestMapping(value = "publish.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> publish(Long cash, Long alternative, Long cashier_check, String cashier_nos
			,String client_relation, String client_realname_num, String client_name, String sub_num, String sub_name
			,String check_no1, String check_sepa1, String number_of_sheet1 ,String start_num1, String check_no2, String check_sepa2, String number_of_sheet2, String start_num2
			,String check_no3, String check_sepa3, String number_of_sheet3 ,String start_num3, String check_no4, String check_sepa4, String number_of_sheet4, String start_num4
			,String check_no5, String check_sepa5, String number_of_sheet5 ,String start_num5){
		
		System.out.println(cash + " / " + alternative + " / " + cashier_check + " / " + cashier_nos);
		System.out.println(client_realname_num + " / " + client_name + " / " + client_relation + " / " + sub_name + " / " + sub_num);
		System.out.println(check_no1 + " / " + check_sepa1 + " / " + number_of_sheet1 + " / " + start_num1 + " / " + check_no2 + " / " + check_sepa2 + " / " + number_of_sheet2 + " / " + start_num2);
		System.out.println(check_no3 + " / " + check_sepa3 + " / " + number_of_sheet3 + " / " + start_num3 + " / " + check_no4 + " / " + check_sepa4 + " / " + number_of_sheet4 + " / " + start_num4);
		System.out.println(check_no5 + " / " + check_sepa5 + " / " + number_of_sheet5 + " / " + start_num5);
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> checks = new ArrayList<String>();
		
		//1.자기앞수표발행 내역 저장
		String check_publish_no = checkService.nextCheckPublishNo();
		System.out.println("수표발행번호 - " + check_publish_no);
		
		CheckPublish checkPublish = new CheckPublish();
		checkPublish.setCheck_publish_no(check_publish_no);
		checkPublish.setCash(cash);
		checkPublish.setAlternative(alternative);
		checkPublish.setCashier_check(cashier_check);
		if(cashier_nos != null){
			checkPublish.setCashier_nos(Integer.valueOf(cashier_nos));
		}
		checkPublish.setClient_relation(client_relation);
		checkPublish.setClient_realname_num(client_realname_num);
		checkPublish.setClient_name(client_name);
		checkPublish.setSub_num(sub_num);
		checkPublish.setSub_name(sub_name);
		System.out.println(checkPublish.toString());
		int result0 = checkService.registerCheckPublish(checkPublish);
		result.put("amount", cash + alternative + cashier_check);
		
		//2.자기앞수표발행 상세내역 저장
		CheckPublishDetail checkPublishDetail = new CheckPublishDetail();
		checkPublishDetail.setCheck_publish_no(check_publish_no);
		if((check_no1 == null) && (check_no2 == null) && (check_no3 == null) && (check_no4 == null) && (check_no5 == null)){
			//개별발행
			if((start_num1 != null) && (number_of_sheet1 != null)){
				checkPublishDetail.setCheck_sepa(check_sepa1);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet1));
				checkPublishDetail.setStart_num(start_num1);
				int result1 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매 / " + checkPublishDetail.getStart_num() + 
					"~" + (Integer.valueOf(checkPublishDetail.getStart_num())+checkPublishDetail.getNumber_of_sheet()-1));
			}
			if((start_num2 != null) && (number_of_sheet2 != null)){
				checkPublishDetail.setCheck_sepa(check_sepa2);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet2));
				checkPublishDetail.setStart_num(start_num2);
				int result2 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매 / " + checkPublishDetail.getStart_num() + 
					"~" + (Integer.valueOf(checkPublishDetail.getStart_num())+checkPublishDetail.getNumber_of_sheet()-1));
			}
			if((start_num3 != null) && (number_of_sheet3 != null)){
				checkPublishDetail.setCheck_sepa(check_sepa3);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet3));
				checkPublishDetail.setStart_num(start_num3);
				int result3 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매 / " + checkPublishDetail.getStart_num() + 
					"~" + (Integer.valueOf(checkPublishDetail.getStart_num())+checkPublishDetail.getNumber_of_sheet()-1));
			}
			if((start_num4 != null) && (number_of_sheet4 != null)){
				checkPublishDetail.setCheck_sepa(check_sepa4);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet4));
				checkPublishDetail.setStart_num(start_num4);
				int result4 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매 / " + checkPublishDetail.getStart_num() + 
					"~" + (Integer.valueOf(checkPublishDetail.getStart_num())+checkPublishDetail.getNumber_of_sheet()-1));
			}
			if((start_num5 != null) && (number_of_sheet5 != null)){
				checkPublishDetail.setCheck_sepa(check_sepa5);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet5));
				checkPublishDetail.setStart_num(start_num5);
				int result5 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매 / " + checkPublishDetail.getStart_num() + 
					"~" + (Integer.valueOf(checkPublishDetail.getStart_num())+checkPublishDetail.getNumber_of_sheet()-1));
			}
		} else {
			//채번발행
			if((check_no1 != null) && (number_of_sheet1 != null)){
				checkPublishDetail.setCheck_no(check_no1);
				checkPublishDetail.setCheck_sepa(check_sepa1);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet1));
				int result1 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkPublishDetail.getCheck_no() + " / " + checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매");
			}
			if((check_no2 != null) && (number_of_sheet2 != null)){
				checkPublishDetail.setCheck_no(check_no2);
				checkPublishDetail.setCheck_sepa(check_sepa2);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet2));
				int result2 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkPublishDetail.getCheck_no() + " / " + checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매");
			}
			if((check_no3 != null) && (number_of_sheet3 != null)){
				checkPublishDetail.setCheck_no(check_no3);
				checkPublishDetail.setCheck_sepa(check_sepa3);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet3));
				int result3 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkPublishDetail.getCheck_no() + " / " + checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매");
			}
			if((check_no4 != null) && (number_of_sheet4 != null)){
				checkPublishDetail.setCheck_no(check_no4);
				checkPublishDetail.setCheck_sepa(check_sepa4);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet4));
				int result4 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkPublishDetail.getCheck_no() + " / " + checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매");
			}
			if((check_no5 != null) && (number_of_sheet5 != null)){
				checkPublishDetail.setCheck_no(check_no5);
				checkPublishDetail.setCheck_sepa(check_sepa5);
				checkPublishDetail.setNumber_of_sheet(Integer.valueOf(number_of_sheet5));
				int result5 = checkService.registerCheckPublishDetail(checkPublishDetail);
				checks.add(checkPublishDetail.getCheck_no() + " / " + checkSepaByStr(checkPublishDetail.getCheck_sepa()) + " / " + checkPublishDetail.getNumber_of_sheet() + "매");
			}
		}
		result.put("checks", checks);
		
		/*for(Map.Entry<String, Object> entry : result.entrySet()){
		System.out.println("key : " + entry.getKey() + " - " + entry.getValue());
		}*/
		
		return result;
	}
	
	/**
	 * 자기앞수표지급에서 계좌번호 조회
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findBankbook.do", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String findBankbook(String account_num){
		System.out.println("계좌번호 - " + account_num);

		return checkService.findCustomerName(account_num);
	}
	
	/**
	 * 자기앞수표지급 실행
	 * @return
	 */
	@RequestMapping(value = "payment.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> payment(Long cash, Long check_alternative, Long bank_alternative
			,String client_realname_num, String client_name, String client_relation, String sub_num, String sub_name, String management_point
			,String check_sepa1, String number_of_sheet1, String start_num1, String giro_code1, String check_sepa2, String number_of_sheet2, String start_num2, String giro_code2
			,String check_sepa3, String number_of_sheet3, String start_num3, String giro_code3, String check_sepa4, String number_of_sheet4, String start_num4, String giro_code4
			,String check_sepa5, String number_of_sheet5, String start_num5, String giro_code5
			,String check_no11, String check_sepa11, String number_of_sheet11,String check_no12, String check_sepa12, String number_of_sheet12
			,String check_no13, String check_sepa13, String number_of_sheet13,String check_no14, String check_sepa14, String number_of_sheet14
			,String check_no15, String check_sepa15, String number_of_sheet15
			,String telco_account_num, String telco_summary, Long telco_trade_amount, String anot_bankname, String anot_account_num, String anot_customer_name, String anot_summary, Long anot_trade_amount){
		
		System.out.println(cash + " / " + check_alternative + " / " + bank_alternative);
		System.out.println(client_realname_num + " / " + client_name + " / " + client_relation + " / " + sub_num + " / " + sub_name + " / " + management_point);
		System.out.println(check_sepa1 + " / " + number_of_sheet1 + " / " + start_num1 + " / " + giro_code1 + " / " + check_sepa2 + " / " + number_of_sheet2 + " / " + start_num2 + " / " + giro_code2);
		System.out.println(check_sepa3 + " / " + number_of_sheet3 + " / " + start_num3 + " / " + giro_code3 + " / " + check_sepa4 + " / " + number_of_sheet4 + " / " + start_num4 + " / " + giro_code4);
		System.out.println(check_sepa5 + " / " + number_of_sheet5 + " / " + start_num5 + " / " + giro_code5);
		System.out.println(check_no11 + " / " + check_sepa11 + " / " + number_of_sheet11 + " / " + check_no12 + " / " + check_sepa12 + " / " + number_of_sheet12);
		System.out.println(check_no13 + " / " + check_sepa13 + " / " + number_of_sheet13 + " / " + check_no14 + " / " + check_sepa14 + " / " + number_of_sheet14);
		System.out.println(check_no15 + " / " + check_sepa15 + " / " + number_of_sheet15);
		System.out.println(telco_account_num + " / " + telco_summary + " / " + telco_trade_amount + " / " + anot_bankname + " / 	" + anot_account_num + " / " + anot_customer_name + " / " + anot_summary + " / " + anot_trade_amount);
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> checks = new ArrayList<String>();
		
		//1.자기앞수표지급내역 저장
		CheckPayment checkPayment = new CheckPayment();
		checkPayment.setCheck_payment_no(checkService.nextCheckPaymentNo());
		checkPayment.setCash(cash);
		checkPayment.setCheck_alternative(check_alternative);
		checkPayment.setBank_alternative(bank_alternative);
		checkPayment.setClient_relation(client_relation);
		checkPayment.setClient_realname_num(client_realname_num);
		checkPayment.setClient_name(client_name);
		checkPayment.setSub_num(sub_num);
		checkPayment.setSub_name(sub_name);
		//System.out.println(checkPayment.toString());
		int result1 = checkService.registerCheckPayment(checkPayment);
		result.put("amount", cash + check_alternative + bank_alternative);
		
		//2.수표지급정보 저장(고객에가 받은 것)
		CheckPaymentCome checkPaymentCome = new CheckPaymentCome();
		if((number_of_sheet1 != null) && (start_num1 != null) && (giro_code1 != null)){
			checkPaymentCome.setCheck_payment_no(checkPayment.getCheck_payment_no());
			checkPaymentCome.setCheck_sepa(check_sepa1);
			checkPaymentCome.setNumber_of_sheet(Integer.valueOf(number_of_sheet1));
			checkPaymentCome.setStart_num(start_num1);
			checkPaymentCome.setGiro_code(giro_code1);
			int result2 = checkService.registerCheckPaymentCome(checkPaymentCome);
			checks.add(checkSepaByStr(checkPaymentCome.getCheck_sepa()) + " / " + checkPaymentCome.getNumber_of_sheet() + "매 / " + checkPaymentCome.getStart_num() + 
					"~" + (Integer.valueOf(checkPaymentCome.getStart_num())+checkPaymentCome.getNumber_of_sheet()-1));
		}
		if((number_of_sheet2 != null) && (start_num2 != null) && (giro_code2 != null)){
			checkPaymentCome.setCheck_payment_no(checkPayment.getCheck_payment_no());
			checkPaymentCome.setCheck_sepa(check_sepa2);
			checkPaymentCome.setNumber_of_sheet(Integer.valueOf(number_of_sheet2));
			checkPaymentCome.setStart_num(start_num2);
			checkPaymentCome.setGiro_code(giro_code2);
			int result3 = checkService.registerCheckPaymentCome(checkPaymentCome);
			checks.add(checkSepaByStr(checkPaymentCome.getCheck_sepa()) + " / " + checkPaymentCome.getNumber_of_sheet() + "매 / " + checkPaymentCome.getStart_num() + 
					"~" + (Integer.valueOf(checkPaymentCome.getStart_num())+checkPaymentCome.getNumber_of_sheet()-1));
		}
		if((number_of_sheet3 != null) && (start_num3 != null) && (giro_code3 != null)){
			checkPaymentCome.setCheck_payment_no(checkPayment.getCheck_payment_no());
			checkPaymentCome.setCheck_sepa(check_sepa3);
			checkPaymentCome.setNumber_of_sheet(Integer.valueOf(number_of_sheet3));
			checkPaymentCome.setStart_num(start_num3);
			checkPaymentCome.setGiro_code(giro_code3);
			int result4 = checkService.registerCheckPaymentCome(checkPaymentCome);
			checks.add(checkSepaByStr(checkPaymentCome.getCheck_sepa()) + " / " + checkPaymentCome.getNumber_of_sheet() + "매 / " + checkPaymentCome.getStart_num() + 
					"~" + (Integer.valueOf(checkPaymentCome.getStart_num())+checkPaymentCome.getNumber_of_sheet()-1));
		}
		if((number_of_sheet4 != null) && (start_num4 != null) && (giro_code4 != null)){
			checkPaymentCome.setCheck_payment_no(checkPayment.getCheck_payment_no());
			checkPaymentCome.setCheck_sepa(check_sepa4);
			checkPaymentCome.setNumber_of_sheet(Integer.valueOf(number_of_sheet4));
			checkPaymentCome.setStart_num(start_num4);
			checkPaymentCome.setGiro_code(giro_code4);
			int result5 = checkService.registerCheckPaymentCome(checkPaymentCome);
			checks.add(checkSepaByStr(checkPaymentCome.getCheck_sepa()) + " / " + checkPaymentCome.getNumber_of_sheet() + "매 / " + checkPaymentCome.getStart_num() + 
					"~" + (Integer.valueOf(checkPaymentCome.getStart_num())+checkPaymentCome.getNumber_of_sheet()-1));
		}
		if((number_of_sheet5 != null) && (start_num5 != null) && (giro_code5 != null)){
			checkPaymentCome.setCheck_payment_no(checkPayment.getCheck_payment_no());
			checkPaymentCome.setCheck_sepa(check_sepa5);
			checkPaymentCome.setNumber_of_sheet(Integer.valueOf(number_of_sheet5));
			checkPaymentCome.setStart_num(start_num5);
			checkPaymentCome.setGiro_code(giro_code5);
			int result6 = checkService.registerCheckPaymentCome(checkPaymentCome);
			checks.add(checkSepaByStr(checkPaymentCome.getCheck_sepa()) + " / " + checkPaymentCome.getNumber_of_sheet() + "매 / " + checkPaymentCome.getStart_num() + 
					"~" + (Integer.valueOf(checkPaymentCome.getStart_num())+checkPaymentCome.getNumber_of_sheet()-1));
		}
		result.put("checks", checks);
		
		//3.수표발행 저장(고객에서 주는 것)
		CheckPaymentPublish checkPaymentPublish = new CheckPaymentPublish();
		checkPaymentPublish.setCheck_payment_no(checkPayment.getCheck_payment_no());
		if((check_no11 != null) && (number_of_sheet11 != null)){
			checkPaymentPublish.setCheck_no(check_no11);
			checkPaymentPublish.setCheck_sepa(check_sepa11);
			checkPaymentPublish.setNumber_of_sheet(Integer.valueOf(number_of_sheet11));
			int result7 = checkService.registerCheckPaymentPublish(checkPaymentPublish);
		}
		if((check_no12 != null) && (number_of_sheet12 != null)){
			checkPaymentPublish.setCheck_no(check_no12);
			checkPaymentPublish.setCheck_sepa(check_sepa12);
			checkPaymentPublish.setNumber_of_sheet(Integer.valueOf(number_of_sheet12));
			int result8 = checkService.registerCheckPaymentPublish(checkPaymentPublish);
		}
		if((check_no13 != null) && (number_of_sheet13 != null)){
			checkPaymentPublish.setCheck_no(check_no13);
			checkPaymentPublish.setCheck_sepa(check_sepa13);
			checkPaymentPublish.setNumber_of_sheet(Integer.valueOf(number_of_sheet13));
			int result9 = checkService.registerCheckPaymentPublish(checkPaymentPublish);
		}
		if((check_no14 != null) && (number_of_sheet14 != null)){
			checkPaymentPublish.setCheck_no(check_no14);
			checkPaymentPublish.setCheck_sepa(check_sepa14);
			checkPaymentPublish.setNumber_of_sheet(Integer.valueOf(number_of_sheet14));
			int result10 = checkService.registerCheckPaymentPublish(checkPaymentPublish);
		}
		if((check_no15 != null) && (number_of_sheet15 != null)){
			checkPaymentPublish.setCheck_no(check_no15);
			checkPaymentPublish.setCheck_sepa(check_sepa15);
			checkPaymentPublish.setNumber_of_sheet(Integer.valueOf(number_of_sheet15));
			int result11 = checkService.registerCheckPaymentPublish(checkPaymentPublish);
		}
		
		//4.연동계좌 저장
		CheckPaymentBankTrade checkPaymentBankTrade = new CheckPaymentBankTrade();
		checkPaymentBankTrade.setCheck_payment_no(checkPayment.getCheck_payment_no());
		if(telco_account_num != null){
			checkPaymentBankTrade.setAmount(telco_trade_amount);
			checkPaymentBankTrade.setAccount_num(telco_account_num);
			checkPaymentBankTrade.setBank_name("텔코");
			checkPaymentBankTrade.setCustomer_name(bankbookService.findCustomerName(telco_account_num));
			checkService.registerCheckPaymentBankTrade(checkPaymentBankTrade);
			
			//5.계좌조회(텔코은행만)
			BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(telco_account_num);
			Long paymentBalance = bankbookInfo.getBalance();
			
			BankbookTrade bankbookTrade = new BankbookTrade();
			bankbookTrade.setTrade_no(bankbookService.nextTradeNo());
			bankbookTrade.setAccount_num(telco_account_num);
			bankbookTrade.setTrade_sepa("입금");
			bankbookTrade.setTrade_amount(telco_trade_amount);
			bankbookTrade.setTrade_balance(paymentBalance + telco_trade_amount);
			bankbookTrade.setSummary(telco_summary);
			bankbookTrade.setClient_name(client_name);
			bankbookTrade.setManagement_point(management_point);
			//6.거래내역 저장
			int result12 = bankbookService.registerBankbookTrade(bankbookTrade);
			//7.계좌정보 업데이트
			bankbookInfo.setBalance(paymentBalance + telco_trade_amount);
			int result13 = bankbookService.updateBankbookInfo(bankbookInfo);
			
			
		}
		if(anot_account_num != null){		//타행 송금 저장
			checkPaymentBankTrade.setAmount(anot_trade_amount);
			checkPaymentBankTrade.setAccount_num(anot_account_num);
			checkPaymentBankTrade.setBank_name(anot_bankname);
			checkPaymentBankTrade.setCustomer_name(anot_customer_name);
			checkService.registerCheckPaymentBankTrade(checkPaymentBankTrade);
		}
		
		/*for(Map.Entry<String, Object> entry : result.entrySet()){
			System.out.println("key : " + entry.getKey() + " - " + entry.getValue());
		}*/
		return result;
	}
	
	/**
	 * 수표권종코드에서 문자로
	 * @param check_sepa
	 * @return
	 */
	private String checkSepaByStr(String check_sepa){
		String result = "";
		switch(check_sepa){
		case "01" : result = result.concat("10만원권자기앞수표"); break;
		case "02" : result = result.concat("30만원권자기앞수표"); break;
		case "03" : result = result.concat("50만원권자기앞수표"); break;
		case "04" : result = result.concat("100만원권자기앞수표"); break;
		}
		return result;
	}
}
