package telco.naree.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import telco.naree.domain.Atcng;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CustomerBasics;
import telco.naree.service.AutomaticService;
import telco.naree.service.BankbookService;

@Controller
@RequestMapping("automatic")
public class AutomaticController {

	@Autowired
	private AutomaticService automaticService;
	@Autowired
	private BankbookService bankbookService;
	
	/**
	 * 계좌번호 찾기
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findBankbook.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String findBankbook(String account_num){
		System.out.println("계좌번호 : " + account_num);
		
		//계좌번호로 예금주 조회하기
		String customer_name = bankbookService.findCustomerName(account_num);
		System.out.println("예금주 : " + customer_name);
		return customer_name;
	}
	
	/**
	 * 자동이체 등록
	 * @return
	 */
	@RequestMapping(value = "register.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> register(String busi_kind, String account_num, String withdrawal_pw, int trs, @RequestParam(value = "datas[]") ArrayList<String> datas){
		System.out.println(busi_kind + " / " + account_num + " / " + withdrawal_pw + " / " + trs);
		System.out.println(datas);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//1.비밀번호 확인
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(!withdrawal_pw.equals(bankbookInfo.getBankbook_pw())){
			result.put("account_num", "pwInvalid");
			return result;
		}
		result.put("account_num", account_num);		//계좌번호 응답에 저장
		List<String> transfer = new ArrayList<String>();
		
		if(trs == 1){		//자동이체 1개 등록시(자바스크립트 리스트전송이 하나와 두개가 결과가 다르다)
			//System.out.println(datas.size());
			/*for(int i=0; i<datas.size(); i++){
				System.out.println(i + " 번째 : " + datas.get(i));
			}*/
			//2.자동이체 등록
			transfer.add(reigsterAtngMake(account_num, withdrawal_pw, busi_kind, datas));
			result.put("transfer", transfer);
		} else {
			for(int i=0; i<datas.size(); i++){
				//System.out.println(datas.get(i));
				String[] dataStr = datas.get(i).split(",");
				//System.out.println("원본 크기 : " + result.length);
				
				ArrayList<String> data = new ArrayList<String>();
				
				for(int j=0; j<dataStr.length; j++){
					data.add(dataStr[j]);
				}
				System.out.print("크기 : " + data.size() + " , 자동이체 정보 : ");
				for(String s : data){
					System.out.print(s + " ");
				}
				System.out.println();
				transfer.add(reigsterAtngMake(account_num, withdrawal_pw, busi_kind, data));
			}
			/*Iterator it = transfer.iterator();
			while(it.hasNext()){
				System.out.println(it.next());
			}*/
			result.put("transfer", transfer);
			
		}
		
		return result;
	}
	
	public String reigsterAtngMake(String account_num, String withdrawal_pw, String busi_kind, ArrayList<String> datas){
		Atcng atcng = new Atcng();
		atcng.setAccount_num(account_num);
		atcng.setWithdrawal_pw(withdrawal_pw);
		atcng.setAtcng_amount(Long.valueOf(datas.get(6)));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedStart = null;
		Date parsedEnd = null;
		try {
			parsedStart = format.parse(datas.get(9));
			parsedEnd = format.parse(datas.get(10));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		atcng.setTransfer_start(new java.sql.Date(parsedStart.getTime()));
		atcng.setTransfer_end(new java.sql.Date(parsedEnd.getTime()));
		atcng.setTransfer_day(datas.get(8));
		atcng.setBusi_kind(busi_kind);
		atcng.setTransfer_bank(datas.get(3));
		atcng.setTransfer_account_num(datas.get(4));
		atcng.setTransfer_customer_name(datas.get(5));
		String transfer_interval = null;
		switch(datas.get(7)){
		case "1개월" : transfer_interval = "01"; break;
		}
		atcng.setTransfer_interval(transfer_interval);
		System.out.println("여기 : " + datas.size());
		if(datas.size() == 12){
			atcng.setTo_summary(datas.get(11));
		} else if(datas.size() == 13){
			atcng.setTo_summary(datas.get(11));
			atcng.setFrom_summary(datas.get(12));
		} else if(datas.size() == 14){
			atcng.setTo_summary(datas.get(11));
			atcng.setFrom_summary(datas.get(12));
			atcng.setSummary(datas.get(13));
		}
		System.out.println(atcng.toString());
		automaticService.registerAtcng(atcng);
		
		String result = atcng.getTransfer_bank() + " / " + atcng.getTransfer_account_num() + " / " + atcng.getTransfer_customer_name() + " / " + atcng.getAtcng_amount() + "원 / 매월 " + atcng.getTransfer_day() + "일";
		return result;
	}
	
	/**
	 * 자동이체 조회
	 * @param busi_kind
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findAtcngs.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Atcng> findAtcngs(String busi_kind, String account_num){
		System.out.println(busi_kind + " / " + account_num);
		List<Atcng> atcngs = automaticService.findAtcngs(busi_kind, account_num);
		/*System.out.println(atcngs.size());
		for(Atcng a : atcngs){
			System.out.println(a.toString());
		}*/
		return atcngs;
	}
	
	/**
	 * 자동이체 조회(예금주명도 함께 조회)
	 * @param account_num
	 * @param busi_kind
	 * @return
	 */
	@RequestMapping(value = "findAtcngsByBankbook.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findAtcngsByBankbook(String account_num, String busi_kind, String using_or){
		System.out.println(account_num + " / " + busi_kind);
		Map<String, Object> result = new HashMap<String, Object>();
		
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(bankbookInfo == null){
			result.put("customer_name", "");
		} else {
			result.put("customer_name", bankbookService.findCustomerName(account_num));
			result.put("atcngs", automaticService.findAtcngs(busi_kind, account_num, using_or));
		}
		return result;
	}
	
	/**
	 * 자동이체 해지하기
	 * @param seq_no
	 * @param account_num
	 * @param withdrawal_pw
	 * @return
	 */
	@RequestMapping(value = "cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cancel(String seq_no, String account_num, String withdrawal_pw){
		System.out.println(seq_no + " / " + withdrawal_pw);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//1.비밀번호 확인
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(!withdrawal_pw.equals(bankbookInfo.getBankbook_pw())){
			result.put("account_num", "pwInvalid");
			return result;
		}
		
		//2.해지하기
		int result1 = automaticService.cancelAtcng(seq_no);
		result.put("account_num", account_num);		//계좌번호 응답에 저장
		result.put("customer_name", bankbookService.findCustomerName(account_num));		//고객명 응답에 저장
		
		return result;
	}

	/**
	 * 시퀀스 넘버로 자동이체 조회하기
	 * @param seq_no
	 * @return
	 */
	@RequestMapping(value = "findAtcngBySeqNo.do", method=RequestMethod.POST)
	@ResponseBody
	public Atcng findAtcngBySeqNo(String seq_no){
		System.out.println(seq_no);
		Atcng atcng = automaticService.findAtcngBySeqNo(seq_no);
		System.out.println(atcng.toString());
		return atcng;
	}

	/**
	 * 변경하기
	 * @return
	 */
	@RequestMapping(value = "modify.do", method=RequestMethod.POST)
	@ResponseBody
	public String modify(String account_num, String withdrawal_pw, String seq_no, String transfer_bank, String transfer_account_num, String transfer_customer_name
								, String transfer_day, String transfer_interval, Long atcng_amount, String transfer_start, String transfer_end
								, String summary, String to_summary, String from_summary){
		System.out.println(account_num + " / " + withdrawal_pw + " / " + seq_no + " / " + transfer_bank + " / " + transfer_account_num + " / " + transfer_customer_name);
		System.out.println(transfer_day + " / " + transfer_interval + " / " + atcng_amount + " / " + transfer_start + " / " + transfer_end);
		System.out.println(summary + " / " + to_summary + " / " + from_summary);
		
		//1.비밀번호 확인
		BankbookInfo bankbookInfo = bankbookService.findBankbookInfoByAccountNum(account_num);
		if(!withdrawal_pw.equals(bankbookInfo.getBankbook_pw())){
			return "pwInvalid";
		}
		
		//2.변경하기
		Atcng atcng = automaticService.findAtcngBySeqNo(seq_no);
		atcng.setWithdrawal_pw(withdrawal_pw);
		atcng.setTransfer_bank(transfer_bank);
		atcng.setTransfer_account_num(transfer_account_num);
		atcng.setTransfer_customer_name(transfer_customer_name);
		atcng.setTransfer_day(transfer_day);
		atcng.setTransfer_interval(transfer_interval);
		atcng.setAtcng_amount(atcng_amount);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedStart = null;
		Date parsedEnd = null;
		try {
			parsedStart = format.parse(transfer_start);
			parsedEnd = format.parse(transfer_end);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		atcng.setTransfer_start(new java.sql.Date(parsedStart.getTime()));
		atcng.setTransfer_end(new java.sql.Date(parsedEnd.getTime()));
		atcng.setSummary(summary);
		atcng.setTo_summary(to_summary);
		atcng.setFrom_summary(from_summary);
		System.out.println(atcng.toString());
		
		int result = automaticService.modifyAtcng(atcng);
		
		if(result != 1){
			return "false";
		}
		return "success";
	}
	
}