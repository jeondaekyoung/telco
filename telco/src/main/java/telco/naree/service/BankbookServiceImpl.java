package telco.naree.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.BankbookDao;
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

@Service
public class BankbookServiceImpl implements BankbookService {

	@Autowired
	private BankbookDao bankbookDao;
	
	@Override
	public CustomerBasics findCustomer(String realname_num) {
		
		return bankbookDao.selectCustomer(realname_num);
	}

	@Override
	public String nextAccountNum() {
		String nowAccountNum = bankbookDao.selectAccountNum();
		String nextAccountNum = null;
		//현재 날짜 계산
		Calendar cal = java.util.Calendar.getInstance();
		int nYear = cal.get(Calendar.YEAR);
		
		//계좌번호 만들기
		if(nowAccountNum == null){
			nextAccountNum = "".concat(String.valueOf(nYear)).concat(String.format("%07d", 1));
		} else {
			String year = nowAccountNum.substring(0, 4);
			
			if(year.equals(String.valueOf(nYear))){
				String accountNum = nowAccountNum.substring(4);
				//System.out.println(year + " / " + accountNum);
				int number = Integer.parseInt(accountNum);
				nextAccountNum = year.concat(String.format("%07d", number+1));
			} else {		//년도 변경(1월1일)
				nextAccountNum = "".concat(String.valueOf(nYear)).concat(String.format("%07d", 1));
			}
		}
		return nextAccountNum;
	}
	
	@Override
	public int registerBankbook(BankbookInfo bankbookInfo) {
		
		return bankbookDao.insertBankbookInfo(bankbookInfo);
	}

	@Override
	public String nextTradeNo() {
		String nowTradeNo = bankbookDao.selectTradeNo();
		String nextTradeNo = null;
		//현재 날짜 계산
		Calendar cal = java.util.Calendar.getInstance();
		int nYear = cal.get(Calendar.YEAR);
		int nMonth = cal.get(Calendar.MONTH)+1;
		int nDay = cal.get(Calendar.DAY_OF_MONTH);
		String year = String.valueOf(nYear);
		String month = String.valueOf(nMonth);
		String day = String.valueOf(nDay);
		
		if(month.length() == 1){
			month = "0".concat(month);
		}
		if(day.length() == 1){
			day = "0".concat(day);
		}
		//거래번호 만들기
		if(nowTradeNo == null){
			nextTradeNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
		} else {
			String nowYear = nowTradeNo.substring(0, 4);
			String nowMonth = nowTradeNo.substring(4, 6);
			String nowDay = nowTradeNo.substring(6, 8);
			
			if(!year.equals(nowYear)){		//년도 변경
				nextTradeNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!month.equals(nowMonth)){		//월 변경
				nextTradeNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!day.equals(nowDay)){		//일 변경
				nextTradeNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else {
				int no = Integer.parseInt(nowTradeNo.substring(8));
				nextTradeNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", no+1));
			}
		}
		
		return nextTradeNo;
	}

	@Override
	public int registerBankbookTrade(BankbookTrade bankbookTrade) {
		
		return bankbookDao.insertBankbookTrade(bankbookTrade);
	}

	@Override
	public String nextTradeDetailNo() {
		String nowTradeDetailNo = bankbookDao.selectTradeDetailNo();
		String nextTradeDetailNo = null;
		//현재 날짜 계산
		Calendar cal = java.util.Calendar.getInstance();
		int nYear = cal.get(Calendar.YEAR);
		int nMonth = cal.get(Calendar.MONTH)+1;
		int nDay = cal.get(Calendar.DAY_OF_MONTH);
		String year = String.valueOf(nYear);
		String month = String.valueOf(nMonth);
		String day = String.valueOf(nDay);
		
		if(month.length() == 1){
			month = "0".concat(month);
		}
		if(day.length() == 1){
			day = "0".concat(day);
		}
		//거래번호 만들기
		if(nowTradeDetailNo == null){
			nextTradeDetailNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
		} else {
			String nowYear = nowTradeDetailNo.substring(0, 4);
			String nowMonth = nowTradeDetailNo.substring(4, 6);
			String nowDay = nowTradeDetailNo.substring(6, 8);
			
			if(!year.equals(nowYear)){		//년도 변경
				nextTradeDetailNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!month.equals(nowMonth)){		//월 변경
				nextTradeDetailNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!day.equals(nowDay)){		//일 변경
				nextTradeDetailNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else {
				int no = Integer.parseInt(nowTradeDetailNo.substring(8));
				nextTradeDetailNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", no+1));
			}
		}
		
		return nextTradeDetailNo;
	}

	@Override
	public int registerBankbookTradeDetail(BankbookTradeDetail bankbookTradeDetail) {
		
		return bankbookDao.insertBankbookTradeDetail(bankbookTradeDetail);
	}

	@Override
	public int registerEtcAntiMoney(EtcAntiMoneyLaundering etcAntiMoney) {
		
		return bankbookDao.insertEtcAntiMoney(etcAntiMoney);
	}

	@Override
	public String findCustomerName(String account_num) {
		BankbookInfo bankbookInfo = bankbookDao.selectBankbookInfo(account_num);
		if(bankbookInfo == null){
			return null;
		}
		CustomerBasics customerBasics = bankbookDao.selectCustomerByCustomerNo(bankbookInfo.getCustomer_no());
		
		return customerBasics.getCustomer_name();
	}

	@Override
	public BankbookInfo findBankbookInfoByAccountNum(String account_num) {
		
		return bankbookDao.selectBankbookInfo(account_num);
	}

	@Override
	public int updateBankbookInfo(BankbookInfo bankbookInfo) {
		
		return bankbookDao.updateBankbookInfo(bankbookInfo);
	}

	@Override
	public int registerRcpmnyDetail(RcpmnyDetail rcpmnyDetail) {
		
		return bankbookDao.insertRcpmnyDetail(rcpmnyDetail);
	}

	@Override
	public int registerRcpmnyCheck(RcpmnyCheck rcpmnyCheck) {
		
		return bankbookDao.insertRcpmnyCheck(rcpmnyCheck);
	}

	@Override
	public int registerPymntCheck(PymntCheck pymntCheck) {
		
		return bankbookDao.insertPymntCheck(pymntCheck);
	}

	@Override
	public int registerPymntBankTrade(PymntBankTrade pymntBankTrade) {
		
		return bankbookDao.insertPymntBankTrade(pymntBankTrade);
	}

	@Override
	public List<BankbookTrade> findBankbookTrades(String account_num) {
		
		return bankbookDao.selectBankbookTrades(account_num);
	}

	@Override
	public int registerBankbookReissue(BankbookReissue bankbookReissue) {
		
		return bankbookDao.insertBankbookReissue(bankbookReissue);
	}
	
}
