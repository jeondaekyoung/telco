package telco.naree.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import telco.naree.domain.AntiMoneyLaundering;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.CustomerAdd;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.HouseCompany;
import telco.naree.domain.JusoBuilding;
import telco.naree.domain.OfficeWorkspace;
import telco.naree.domain.ThirdContact;
import telco.naree.service.CommonService;
import telco.naree.service.CustomerService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CommonService commonService;
	
	
	/**
	 * 조회화면에서 실명번호로 고객 찾기
	 * @param realname_num
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findCustomer.do")
	public String findCustomer(String realname_num, Model model){
		System.out.println("찾는 고객 - " + realname_num);
		CustomerBasics customerBasics = customerService.findCustomerBasics(realname_num);
		
		if(customerBasics != null){
			model.addAttribute("customerBasics", customerBasics);
			
			HouseCompany houseCompany = customerService.findHouseCompany(customerBasics.getCustomer_no());
			model.addAttribute("houseCompany", houseCompany);
			
			OfficeWorkspace officeWorkspace = customerService.findOfficeWorkspace(customerBasics.getCustomer_no());
			model.addAttribute("officeWorkspace", officeWorkspace);
			
			ThirdContact thirdContact = customerService.findThirdContact(customerBasics.getCustomer_no());
			model.addAttribute("thirdContact", thirdContact);
			
			CustomerAdd customerAdd = customerService.findCustomerAdd(customerBasics.getCustomer_no());
			model.addAttribute("customerAdd", customerAdd);
			
			AntiMoneyLaundering antiMoneyLaundering = customerService.findAntiMoneyLaundering(customerBasics.getCustomer_no());
			model.addAttribute("antiMoneyLaundering", antiMoneyLaundering);
			
			
			List<BankbookInfo> bankbookInfos = customerService.findBankbookInfoByCustomerNo(customerBasics.getCustomer_no());
			model.addAttribute("bankbookInfos", bankbookInfos);
			
		} else {
			model.addAttribute("existCustomer", "nothing");
		}
		return "customer/0200_find";
	}
	
	
	/**
	 * 변경화면에서 실명번호로 고객 찾기
	 * @param realname_num
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findmoCustomer.do")
	public String findmoCustomer(String realname_num, Model model){
		System.out.println("찾는 고객 - " + realname_num);
		CustomerBasics customerBasics = customerService.findCustomerBasics(realname_num);
		
		if(customerBasics != null){
			model.addAttribute("customerBasics", customerBasics);
			
			HouseCompany houseCompany = customerService.findHouseCompany(customerBasics.getCustomer_no());
			model.addAttribute("houseCompany", houseCompany);
			
			OfficeWorkspace officeWorkspace = customerService.findOfficeWorkspace(customerBasics.getCustomer_no());
			model.addAttribute("officeWorkspace", officeWorkspace);
			
			ThirdContact thirdContact = customerService.findThirdContact(customerBasics.getCustomer_no());
			model.addAttribute("thirdContact", thirdContact);
			
			CustomerAdd customerAdd = customerService.findCustomerAdd(customerBasics.getCustomer_no());
			model.addAttribute("customerAdd", customerAdd);
			
			AntiMoneyLaundering antiMoneyLaundering = customerService.findAntiMoneyLaundering(customerBasics.getCustomer_no());
			model.addAttribute("antiMoneyLaundering", antiMoneyLaundering);
		} else {
			model.addAttribute("existCustomer", "nothing");
		}
		
		return "customer/0200_modify";
	}

	
	
	/**
	 * 고객 정보 등록
	 * 1-1. 고객기본정보 등록
	 * @param customerBasics
	 * @return
	 */
	@RequestMapping(value = "registerBasics.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerBasics(CustomerBasics customerBasics){
		//1. 서비스에서 다음 고객번호를 가져옴
		String nextCustomerNo = customerService.nextCustomerNo();
		customerBasics.setCustomer_no(nextCustomerNo);
		//System.out.println(customerBasics.toString());
		
		//실명번호 확인
		boolean existRealnameNum = customerService.seeRealnameNum(customerBasics);
		
		if(existRealnameNum == true){	//실명번호가 존재함
			return "false";
		}
		
		//2.고객기본정보 저장
		int result = customerService.registerCustomerBasics(customerBasics);
		if(result == 1){
			return nextCustomerNo;
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 등록
	 * 1-2. 자택(본사) 등록
	 * @param houseCompany
	 * @return
	 */
	@RequestMapping(value = "registerHouse.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerHouse(HouseCompany houseCompany){
		//System.out.println(houseCompany.toString());
		int result = customerService.registerHouseCompany(houseCompany);
		if(result == 1){
			return houseCompany.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 등록
	 * 1-3.직장(사업장) 등록
	 * @param officeWorkspace
	 * @return
	 */
	@RequestMapping(value = "registerOffice.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerOffice(OfficeWorkspace officeWorkspace){
		//System.out.println(officeWorkspace.toString());
		int result = customerService.registerOfficeWorkspace(officeWorkspace);
		if(result == 1){
			return officeWorkspace.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 등록
	 * 1-4.제3연락처 등록
	 * @param thirdContact
	 * @return
	 */
	@RequestMapping(value = "registerThird.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerThird(ThirdContact thirdContact){
		//System.out.println(thirdContact.toString());
		int result = customerService.registerThirdContact(thirdContact);
		if(result == 1){
			return thirdContact.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 등록
	 * 1-5.고객추가정보 등록
	 * @param customerAdd
	 * @return
	 */
	@RequestMapping(value = "registerAdd.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerAdd(CustomerAdd customerAdd){
		//System.out.println(customerAdd.toString());
		int result = customerService.registerCustomerAdd(customerAdd);
		if(result == 1){
			return customerAdd.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 등록
	 * 1-6.자금세탁방지 등록(끝)
	 * @param antiMoneyLaundering
	 * @return
	 */
	@RequestMapping(value = "registerAntiMoney.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerAntiMoney(AntiMoneyLaundering antiMoneyLaundering){
		//System.out.println(antiMoneyLaundering.toString());
		Map<String, Object> result = new HashMap<String, Object>();
		
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(antiMoneyLaundering.getCustomer_no());
		result.put("customerBasics", customerBasics);
		HouseCompany houseCompany = customerService.findHouseCompany(antiMoneyLaundering.getCustomer_no());
		result.put("houseCompany", houseCompany);
		
		int result1 = customerService.registerAntiMoney(antiMoneyLaundering);
		
		return result;
	}
	
	
	/**
	 * 고객 정보 변경
	 * 2-1.고객기본정보 변경
	 * @param customerBasics
	 * @return
	 */
	@RequestMapping(value = "modifyBasics.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyBasics(CustomerBasics customerBasics){
		System.out.println("고객기본정보 수정 - " + customerBasics.toString());
		int result = customerService.modifyCustomerBasics(customerBasics);
		if(result == 1){
			return customerBasics.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 변경
	 * 2-2. 자택(본사) 변경
	 * @param houseCompany
	 * @return
	 */
	@RequestMapping(value = "modifyHouse.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyHouse(HouseCompany houseCompany){
		//System.out.println(houseCompany.toString());
		int result = customerService.modifyHouseCompany(houseCompany);
		if(result == 1){
			return houseCompany.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 변경
	 * 2-3.직장(사업장) 변경
	 * @param officeWorkspace
	 * @return
	 */
	@RequestMapping(value = "modifyOffice.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyOffice(OfficeWorkspace officeWorkspace){
		//System.out.println(officeWorkspace.toString());
		int result = customerService.modifyOfficeWorkspace(officeWorkspace);
		if(result == 1){
			return officeWorkspace.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 변경
	 * 2-4.제3연락처 변경
	 * @param thirdContact
	 * @return
	 */
	@RequestMapping(value = "modifyThird.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyThird(ThirdContact thirdContact){
		//System.out.println(thirdContact.toString());
		int result = customerService.modifyThirdContact(thirdContact);
		if(result == 1){
			return thirdContact.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 변경
	 * 2-5.고객추가정보 변경
	 * @param customerAdd
	 * @return
	 */
	@RequestMapping(value = "modifyAdd.do", method=RequestMethod.POST)
	@ResponseBody
	public String modifyAdd(CustomerAdd customerAdd){
		//System.out.println(customerAdd.toString());
		int result = customerService.modifyCustomerAdd(customerAdd);
		if(result == 1){
			return customerAdd.getCustomer_no();
		} else {
			return "false";
		}
	}
	
	/**
	 * 고객 정보 변경
	 * 2-6.자금세탁방지 변경(끝)
	 * @param antiMoneyLaundering
	 * @return
	 */
	@RequestMapping(value = "modifyAntiMoney.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> modifyAntiMoney(AntiMoneyLaundering antiMoneyLaundering){
		//System.out.println(antiMoneyLaundering.toString());
		Map<String, Object> result = new HashMap<String, Object>();
	
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(antiMoneyLaundering.getCustomer_no());
		result.put("customerBasics", customerBasics);
		HouseCompany houseCompany = customerService.findHouseCompany(antiMoneyLaundering.getCustomer_no());
		result.put("houseCompany", houseCompany);
		
		int result1 = customerService.modifyAntiMoneyLaundering(antiMoneyLaundering);
		
		return result;
	}
	
	/**
	 * 계좌조회
	 * @param account_num
	 * @return
	 */
	@RequestMapping(value = "findBankbook.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findBankbook(String account_num){
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		BankbookInfo bankbookInfo = customerService.findBankbook(account_num);
		if(bankbookInfo == null){
			return null;
		}
		System.out.println(bankbookInfo.toString());
		CustomerBasics customerBasics = customerService.findCustomerBasicsByNo(bankbookInfo.getCustomer_no());
		System.out.println(customerBasics.toString());
		
		result.put("customer_name", customerBasics.getCustomer_name());
		result.put("customer_qualf_name", customerBasics.getCustomer_qualf_name());
		result.put("open_date", bankbookInfo.getOpen_date());
		result.put("item_name", bankbookInfo.getItem_name());
		result.put("balance", bankbookInfo.getBalance());
		result.put("management_point", bankbookInfo.getManagement_point());
		
		List<BankbookTrade> bankbookTrades = 	customerService.findBankbookTradeByAccountNum(account_num);
		/*for(BankbookTrade bbt : bankbookTrades){
			System.out.println(bbt.toString());
		}*/
		result.put("bankbookTrades", bankbookTrades);
		
		/*for(String key : result.keySet()){
			System.out.println(key + " / " + result.get(key));
		}*/
		return result;
	}
	
	
	/**
	 * 도로명 주소 검색하기
	 * @param searchWord
	 * @return
	 */
	@RequestMapping(value = "searchAddr.do")
	@ResponseBody
	public List<JusoBuilding> searchAddr(String searchWord){
		System.out.println("검색어 - " + searchWord);
		List<JusoBuilding> addrs = commonService.searchAddr(searchWord);
		/*System.out.println(results.size());
		for(JusoBuilding j : results){
			System.out.println(j.toString());
		}*/
		return addrs;
	}
	
}
