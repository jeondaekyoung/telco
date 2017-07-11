package telco.naree.service;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.BankbookDao;
import telco.naree.dao.CheckDao;
import telco.naree.domain.BankbookInfo;
import telco.naree.domain.CheckNo;
import telco.naree.domain.CheckPayment;
import telco.naree.domain.CheckPaymentBankTrade;
import telco.naree.domain.CheckPaymentCome;
import telco.naree.domain.CheckPaymentPublish;
import telco.naree.domain.CheckPublish;
import telco.naree.domain.CheckPublishDetail;
import telco.naree.domain.CustomerBasics;

@Service
public class CheckServiceImpl implements CheckService {
	
	@Autowired
	private CheckDao checkDao;
	@Autowired
	private BankbookDao bankbookDao;

	@Override
	public String nextCheckSeq() {
		String nowCheckSeq = checkDao.selectCheckSeq();
		String nextCheckSeq = null;
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
		if(nowCheckSeq == null){
			nextCheckSeq = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
		} else {
			String nowYear = nowCheckSeq.substring(0, 4);
			String nowMonth = nowCheckSeq.substring(4, 6);
			String nowDay = nowCheckSeq.substring(6, 8);
			
			if(!year.equals(nowYear)){	//년도 변경
				nextCheckSeq = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!month.equals(nowMonth)){		//월 변경
				nextCheckSeq = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!day.equals(nowDay)){			//일 변경
				nextCheckSeq = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else {
				int no = Integer.parseInt(nowCheckSeq.substring(8));
				nextCheckSeq = "".concat(year).concat(month).concat(day).concat(String.format("%08d", no+1));
			}
		}
		
		return nextCheckSeq;
	}

	@Override
	public int registerCheckNo(CheckNo checkNo) {
		
		return checkDao.insertCheckNo(checkNo);
	}

	@Override
	public String nextCheckPublishNo() {
		String nowCheckPublishNo = checkDao.selectCheckPublishNo();
		String nextCheckPublishNo = null;
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
		//발행번호 만들기
		if(nowCheckPublishNo == null){
			nextCheckPublishNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
		} else {
			String nowYear = nowCheckPublishNo.substring(0, 4);
			String nowMonth = nowCheckPublishNo.substring(4, 6);
			String nowDay = nowCheckPublishNo.substring(6,8);
			
			if(!year.equals(nowYear)){		//년도 변경
				nextCheckPublishNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!month.equals(nowMonth)){		//월 변경
				nextCheckPublishNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!day.equals(nowDay))	{		//일 변경
				nextCheckPublishNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else {
				int no = Integer.parseInt(nowCheckPublishNo.substring(8));
				nextCheckPublishNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", no+1));
			}
		}
		
		return nextCheckPublishNo;
	}

	@Override
	public int registerCheckPublish(CheckPublish checkPublish) {
		
		return checkDao.insertCheckPublish(checkPublish);
	}

	@Override
	public int registerCheckPublishDetail(CheckPublishDetail checkPublishDetail) {
		
		return checkDao.insertCheckPublishDetail(checkPublishDetail);
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
	public String nextCheckPaymentNo() {
		String nowCheckPaymentNo = checkDao.selectCheckPaymentNo();
		String nextCheckPaymentNo = null;
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
		//수표지급번호 만들기
		if(nowCheckPaymentNo == null){
			nextCheckPaymentNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
		} else {
			String nowYear = nowCheckPaymentNo.substring(0,4);
			String nowMonth = nowCheckPaymentNo.substring(4, 6);
			String nowDay = nowCheckPaymentNo.substring(6, 8);
			
			if(!year.equals(nowYear)){		//년도 변경
				nextCheckPaymentNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d",1));
			} else if(!month.equals(nowMonth)){		//월 변경
				nextCheckPaymentNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else if(!day.equals(nowDay)){		//일 변경
				nextCheckPaymentNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", 1));
			} else {
				int no = Integer.parseInt(nowCheckPaymentNo.substring(8));
				nextCheckPaymentNo = "".concat(year).concat(month).concat(day).concat(String.format("%08d", no+1));
			}
		}
		return nextCheckPaymentNo;
	}

	@Override
	public int registerCheckPayment(CheckPayment checkPayment) {
		
		return checkDao.insertCheckPayment(checkPayment);
	}

	@Override
	public int registerCheckPaymentCome(CheckPaymentCome checkPaymentCome) {
		
		return checkDao.insertCheckPaymentCome(checkPaymentCome);
	}

	@Override
	public int registerCheckPaymentPublish(CheckPaymentPublish checkPaymentPublish) {
		
		return checkDao.insertCheckPaymentPublish(checkPaymentPublish);
	}

	@Override
	public int registerCheckPaymentBankTrade(CheckPaymentBankTrade checkPaymentBankTrade) {
		
		return checkDao.insertCheckPaymentBankTrade(checkPaymentBankTrade);
	}

}
