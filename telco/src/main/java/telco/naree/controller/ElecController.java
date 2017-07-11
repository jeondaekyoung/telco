package telco.naree.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import telco.naree.domain.CustomerBasics;
import telco.naree.domain.ElecInfo;
import telco.naree.domain.ElecInternet;
import telco.naree.domain.ElecPhone;
import telco.naree.domain.SqlFindElec;
import telco.naree.domain.SqlSearchElecs;
import telco.naree.service.BankbookService;
import telco.naree.service.CustomerService;
import telco.naree.service.ElecService;

@Controller
@RequestMapping("elec")
public class ElecController {

	@Autowired
	private BankbookService bankbookService;
	@Autowired
	private ElecService elecService;
	@Autowired
	private CustomerService customerService;
	
	/**
	 * 전자금융-신규에서 실명번호 조회하기
	 * @param realname_num
	 * @return
	 */
	@RequestMapping("findCustomer.do")
	@ResponseBody
	public Map<String, Object> findCustomer(String realname_num){
		//System.out.println("드루와 - " + realname_num);
		Map<String, Object> result = new HashMap<String, Object>();
		
		CustomerBasics customerBasics = bankbookService.findCustomer(realname_num);
		if(customerBasics == null){
			result.put("customer_name", "");
			result.put("customer_no", "");
		} else {
			result.put("customer_name", customerBasics.getCustomer_name());
			result.put("customer_no", customerBasics.getCustomer_no());
			List<SqlSearchElecs> sqlSearchElecs = elecService.searchElecsByCustomerNo(customerBasics.getCustomer_no());  
			/*for(SqlSearchElecs e : sqlSearchElecs){
			System.out.println(e.toString());
			}*/
			result.put("elecs", sqlSearchElecs);
		}
		
		return result;
	}
	
	/**
	 * 전자금융 등록하기
	 * @return
	 */
	@RequestMapping(value = "register.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> register(String customer_no, String security_media_sepa, String security_media_no
			, boolean elec_internet, boolean elec_phone, String open_branch, String application_sepa
			, String owner_sepa, String sub_name, String sub_num
			, String internet_elec_id, String internet_elec_pw, String internet_elec_transfer_day, String internet_elec_transfer_once
			, String phone_elec_pw, String phone_elec_transfer_day, String phone_elec_transfer_once){
		
		System.out.println(customer_no + " / " + security_media_sepa + " / " + security_media_no);
		System.out.println(elec_internet + " / " + elec_phone + " / " + open_branch + " / " + application_sepa);
		System.out.println(owner_sepa + " / " + sub_name + " / " + sub_num);
		System.out.println(internet_elec_id + " / " + internet_elec_pw + " / " + internet_elec_transfer_day + " / " + internet_elec_transfer_once);
		System.out.println(phone_elec_pw + " / " + phone_elec_transfer_day + " / " + phone_elec_transfer_once);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//고객명
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(customer_no);
		result.put("customer_name", customerBasics.getCustomer_name());		//고객명 응답에 저장
		
		//1.공통전자금융 테이블 등록
		//전자금융번호 생성
		ElecInfo nowElecInfo = elecService.findElecInfo(customer_no);
		int result1 = 0;
		ElecInfo elecInfo = new ElecInfo();
		if(nowElecInfo == null){
			String nextElecInfoNo = elecService.nextElecInfoNo(); 
			elecInfo.setElec_info_no(nextElecInfoNo);
			elecInfo.setCustomer_no(customer_no);
			elecInfo.setSecurity_media_sepa(security_media_sepa);
			elecInfo.setSecurity_media_no(security_media_no);
			//System.out.println(elecInfo.toString());
			result1 = elecService.registerElecInfo(elecInfo);
			result.put("elec_info", elecInfo);		//공통전자금융 응답에 저장
			//2.인터넷뱅킹 등록
			if(elec_internet == true){
				ElecInternet elecInternet = new ElecInternet();
				elecInternet.setElec_info_no(elecInfo.getElec_info_no());
				elecInternet.setOpen_branch(open_branch);
				elecInternet.setElec_id(internet_elec_id);
				elecInternet.setElec_pw(internet_elec_pw);
				elecInternet.setElec_transfer_day(Long.valueOf(internet_elec_transfer_day));
				elecInternet.setElec_transfer_once(Long.valueOf(internet_elec_transfer_once));
				elecInternet.setApplication_sepa(application_sepa);
				elecInternet.setOwner_sepa(owner_sepa);
				elecInternet.setSub_name(sub_name);
				elecInternet.setSub_num(sub_num);
				System.out.println(elecInternet.toString());
				int result2 = elecService.registerElecInternet(elecInternet);
				result.put("elec_internet", elecInternet);		//인터넷뱅킹 응답에 저장
			}
			//3.폰뱅킹 등록
			if(elec_phone == true){
				ElecPhone elecPhone = new ElecPhone();
				elecPhone.setElec_info_no(elecInfo.getElec_info_no());
				elecPhone.setOpen_branch(open_branch);
				elecPhone.setElec_pw(phone_elec_pw);
				elecPhone.setElec_transfer_day(Long.valueOf(phone_elec_transfer_day));
				elecPhone.setElec_transfer_once(Long.valueOf(phone_elec_transfer_once));
				elecPhone.setApplication_sepa(application_sepa);
				elecPhone.setOwner_sepa(owner_sepa);
				elecPhone.setSub_name(sub_name);
				elecPhone.setSub_num(sub_num);
				System.out.println(elecPhone.toString());
				int result3 = elecService.registerElecPhone(elecPhone);
				result.put("elec_phone", elecPhone);		//폰뱅킹 응답에 저장
			}
		} else {		//공통전자금융이 있다.
			ElecInfo modifyInfo = nowElecInfo;
			System.out.println(nowElecInfo.toString());
			modifyInfo.setSecurity_media_sepa(security_media_sepa);
			modifyInfo.setSecurity_media_no(security_media_no);
			System.out.println(modifyInfo.toString());
			result1 = elecService.modifyElecInfo(modifyInfo);
			result.put("elec_info", modifyInfo);		//공통전자금융 응답에 저장
			//2.인터넷뱅킹 등록
			if(elec_internet == true){
				ElecInternet elecInternet = new ElecInternet();
				elecInternet.setElec_info_no(modifyInfo.getElec_info_no());
				elecInternet.setOpen_branch(open_branch);
				elecInternet.setElec_id(internet_elec_id);
				elecInternet.setElec_pw(internet_elec_pw);
				elecInternet.setElec_transfer_day(Long.valueOf(internet_elec_transfer_day));
				elecInternet.setElec_transfer_once(Long.valueOf(internet_elec_transfer_once));
				elecInternet.setApplication_sepa(application_sepa);
				elecInternet.setOwner_sepa(owner_sepa);
				elecInternet.setSub_name(sub_name);
				elecInternet.setSub_num(sub_num);
				//System.out.println(elecInternet.toString());
				int result2 = elecService.registerElecInternet(elecInternet);
				result.put("elec_internet", elecInternet);		//인터넷뱅킹 응답에 저장
			}
			//3.폰뱅킹 등록
			if(elec_phone == true){
				ElecPhone elecPhone = new ElecPhone();
				elecPhone.setElec_info_no(modifyInfo.getElec_info_no());
				elecPhone.setOpen_branch(open_branch);
				elecPhone.setElec_pw(phone_elec_pw);
				elecPhone.setElec_transfer_day(Long.valueOf(phone_elec_transfer_day));
				elecPhone.setElec_transfer_once(Long.valueOf(phone_elec_transfer_once));
				elecPhone.setApplication_sepa(application_sepa);
				elecPhone.setOwner_sepa(owner_sepa);
				elecPhone.setSub_name(sub_name);
				elecPhone.setSub_num(sub_num);
				//System.out.println(elecPhone.toString());
				int result3 = elecService.registerElecPhone(elecPhone);
				result.put("elec_phone", elecPhone);		//폰뱅킹 응답에 저장
			}
		}
		
		/*for(Map.Entry<String, Object> entry : result.entrySet()){
			System.out.println("key : " + entry.getKey() + " - " + entry.getValue());
		}*/
		
		return result;
	}
	
	/**
	 * 해지하기
	 */
	@RequestMapping(value = "cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cancel(String customer_no,String cancel_branch, 
			String sel1, String index_cancel1, String sel2, String index_cancel2){
		System.out.println(customer_no + " / " + cancel_branch);
		System.out.println(sel1 + " / " + index_cancel1 + " / " + sel2 + " / " + index_cancel2);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//고객명
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(customer_no);
		result.put("customer_name", customerBasics.getCustomer_name());		//고객명 응답에 저장
		String security_media1 = "";
		String security_media2 = "";
		
		int result1 = 0 , result2 = 0;
		if(sel1 != null){
			if(sel1.contains("인터넷뱅킹")){
				System.out.println("인터넷뱅킹 해지실행 sel1");
				ElecInternet elecInternet = elecService.findElecInternet(sel1.substring(5));
				elecInternet.setCancel_branch(cancel_branch);
				elecInternet.setUsing_or("N");
				result1 = elecService.cancelElecInternet(elecInternet);
				security_media1 = security_media1.concat("인터넷뱅킹");
			}
			if(sel1.contains("폰뱅킹")){
				System.out.println("폰뱅킹 해지실행 sel1");
				ElecPhone elecPhone = elecService.findElecPhone(sel1.substring(3));
				elecPhone.setCancel_branch(cancel_branch);
				elecPhone.setUsing_or("N");
				result2 = elecService.cancelElecPhone(elecPhone);
				security_media1 = security_media1.concat("폰뱅킹");
			}
			if(index_cancel1.equals("01")){
				//ElecInfo elecInfo = elecService.findElecInfo(customer_no);
				//elecInfo.setSecurity_media_no(null);
				//elecInfo.setSecurity_media_sepa(null);
				//int result3 = elecService.modifyElecInfo(elecInfo);
				security_media1 = security_media1.concat("(인증서폐기)");
			} else {
				security_media1 = security_media1.concat("(인증서폐기안함)");
			}
			result.put("security_media1", security_media1);
		}
		if(sel2 != null){
			if(sel2.contains("인터넷뱅킹")){
				System.out.println("인터넷뱅킹 해지실행 sel2");
				ElecInternet elecInternet = elecService.findElecInternet(sel2.substring(5));
				elecInternet.setCancel_branch(cancel_branch);
				elecInternet.setUsing_or("N");
				result1 = elecService.cancelElecInternet(elecInternet);
				security_media2 = security_media2.concat("인터넷뱅킹");
			}
			if(sel2.contains("폰뱅킹")){
				System.out.println("폰뱅킹 해지실행sel2");
				ElecPhone elecPhone = elecService.findElecPhone(sel2.substring(3));
				elecPhone.setCancel_branch(cancel_branch);
				elecPhone.setUsing_or("N");
				result2 = elecService.cancelElecPhone(elecPhone);
				security_media2 = security_media2.concat("폰뱅킹");
			}
			if(index_cancel2.equals("01")){
				//ElecInfo elecInfo = elecService.findElecInfo(customer_no);
				//elecInfo.setSecurity_media_no(null);
				//elecInfo.setSecurity_media_sepa(null);
				//int result4 = elecService.modifyElecInfo(elecInfo);
				security_media2 = security_media2.concat("(인증서폐기)");
			} else {
				security_media2 = security_media2.concat("(인증서폐기안함)");
			}
			result.put("security_media2", security_media2);
		}
		
		/*for(Map.Entry<String, Object> entry : result.entrySet()){
		System.out.println("key : " + entry.getKey() + " - " + entry.getValue());
		}*/

		return result;
	}
	
	/**
	 * 변경에서 ID 변경클릭시 아이디 사용가능 확인하기
	 */
	@RequestMapping(value = "searchElecId.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean searchElecId(String elec_id){
		System.out.println(elec_id);
		
		boolean result = elecService.searchElecId(elec_id);
		
		return result;
	}
	
	/**
	 * 변경하기
	 */
	@RequestMapping(value = "modify.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> modify(String customer_no, String security_media_sepa, String security_media_no
			, String internet_elec_id, String internet_elec_pw, String internet_elec_transfer_day, String internet_elec_transfer_once
			, String phone_elec_pw, String phone_elec_transfer_day, String phone_elec_transfer_once){
		System.out.println(customer_no + " / " + security_media_sepa + " / " + security_media_no);
		System.out.println(internet_elec_id + " / " + internet_elec_pw + " / " + internet_elec_transfer_day + " / " + internet_elec_transfer_once);
		System.out.println(phone_elec_pw + " / " + phone_elec_transfer_day + " / " + phone_elec_transfer_once);
		Map<String, Object> result = new HashMap<String, Object>();
		
		//고객명
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(customer_no);
		result.put("customer_name", customerBasics.getCustomer_name());		//고객명 응답에 저장
		
		//1.공통전자금융 업데이트
		ElecInfo elecInfo = elecService.findElecInfo(customer_no);
		elecInfo.setSecurity_media_sepa(security_media_sepa);
		elecInfo.setSecurity_media_no(security_media_no);
		int result1 = elecService.modifyElecInfo(elecInfo);
		result.put("elec_info", elecInfo);			//공통전자금융 응답에 저장
		
		
		//2.인터넷뱅킹 업데이트
		if(internet_elec_id != null && internet_elec_pw != null && internet_elec_transfer_day != null && internet_elec_transfer_once != null){
			ElecInternet elecInternet = elecService.findElecInternetByElecInfoNo(elecInfo.getElec_info_no());
			elecInternet.setElec_id(internet_elec_id);
			elecInternet.setElec_pw(internet_elec_pw);
			elecInternet.setElec_transfer_day(Long.valueOf(internet_elec_transfer_day));
			elecInternet.setElec_transfer_once(Long.valueOf(internet_elec_transfer_once));
			int result2 = elecService.modifyElecInternet(elecInternet);
			result.put("elec_internet", elecInternet);			//인터넷뱅킹 응답에 저장
		}
		
		//3.폰뱅킹 업데이트
		if(phone_elec_pw != null && phone_elec_transfer_day != null && phone_elec_transfer_once != null){
			ElecPhone elecPhone = elecService.findElecPhoneByElecInfoNo(elecInfo.getElec_info_no());
			elecPhone.setElec_pw(phone_elec_pw);
			elecPhone.setElec_transfer_day(Long.valueOf(phone_elec_transfer_day));
			elecPhone.setElec_transfer_once(Long.valueOf(phone_elec_transfer_once));
			int result3 = elecService.modifyElecPhone(elecPhone);
			result.put("elec_phone", elecPhone);			//폰뱅킹 응답에 저장
		}
		
		/*for(Map.Entry<String, Object> entry : result.entrySet()){
		System.out.println("key : " + entry.getKey() + " - " + entry.getValue());
		}*/
	
		return result;
	}
	
	/**
	 * 전자금융 조회에서 입력정보 조회하기
	 * @param elec
	 * @param customer_no
	 */
	@RequestMapping(value = "findElec.do", method=RequestMethod.POST)
	@ResponseBody
	public SqlFindElec findElec(String elec, String customer_no){
		System.out.println(elec);
		
		SqlFindElec sqlFindElec = new SqlFindElec();
		if(elec.contains("인터넷뱅킹")){
			sqlFindElec.setElec_sepa("인터넷뱅킹");
		}
		if(elec.contains("폰뱅킹")){
			sqlFindElec.setElec_sepa("폰뱅킹");
		}
		sqlFindElec.setCustomer_no(customer_no);
		//System.out.println(sqlFindElec.toString());
		
		sqlFindElec = elecService.findElec(sqlFindElec);
		//System.out.println(sqlFindElec.toString());
		
		return sqlFindElec;
	}
}
