package telco.naree.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.ElecDao;
import telco.naree.domain.ElecInfo;
import telco.naree.domain.ElecInternet;
import telco.naree.domain.ElecPhone;
import telco.naree.domain.SqlFindElec;
import telco.naree.domain.SqlSearchElecs;

@Service
public class ElecServiceImpl implements ElecService {

	@Autowired
	private ElecDao elecDao;

	@Override
	public String nextElecInfoNo() {
		String nowElecInfoNo = elecDao.selectElecInfoNo();
		String nextElecInfoNo = null;
		//현재 날짜 계산
		Calendar cal = java.util.Calendar.getInstance();
		int nYear = cal.get(Calendar.YEAR);
		String year = String.valueOf(nYear);
		//전자금융번호 만들기
		if(nowElecInfoNo == null){
			nextElecInfoNo = "E".concat(year).concat(String.format("%09d", 1));
		} else {
			String nowYear = nowElecInfoNo.substring(1, 5);
			if(!year.equals(nowYear)){		//년도 변경
				nextElecInfoNo = "E".concat(year).concat(String.format("%09d", 1));
			} else {
				int no = Integer.parseInt(nowElecInfoNo.substring(5));
				nextElecInfoNo = "E".concat(year).concat(String.format("%09d", no+1));
			}
		}
		
		return nextElecInfoNo;
	}

	@Override
	public int registerElecInfo(ElecInfo elecInfo) {
		
		return elecDao.insertElecInfo(elecInfo);
	}

	@Override
	public int registerElecInternet(ElecInternet elecInternet) {
		
		return elecDao.insertElecInternet(elecInternet);
	}

	@Override
	public int registerElecPhone(ElecPhone elecPhone) {
		
		return elecDao.insertElecPhone(elecPhone);
	}

	@Override
	public List<SqlSearchElecs> searchElecsByCustomerNo(String customer_no) {
		
		return elecDao.selectElecsByCustomerNo(customer_no);
	}

	@Override
	public ElecInfo findElecInfo(String customer_no) {
		
		return elecDao.findElecInfo(customer_no);
	}

	@Override
	public int modifyElecInfo(ElecInfo elecInfo) {
		
		return elecDao.updateElecInfo(elecInfo);
	}

	@Override
	public ElecInternet findElecInternet(String elec_internet_no) {
		
		return elecDao.selectElecInternet(elec_internet_no);
	}

	@Override
	public int cancelElecInternet(ElecInternet elecInternet) {
		
		return elecDao.cancelElecInternet(elecInternet);
	}

	@Override
	public ElecPhone findElecPhone(String elec_phone_no) {
		
		return elecDao.selectElecPhone(elec_phone_no);
	}

	@Override
	public int cancelElecPhone(ElecPhone elecPhone) {
		
		return elecDao.cancelElecPhone(elecPhone);
	}

	@Override
	public boolean searchElecId(String elec_id) {
		
		int result = elecDao.selectElecId(elec_id);
		if(result == 0){
			return true;
		}		
		return false;
	}

	@Override
	public ElecInternet findElecInternetByElecInfoNo(String elec_info_no) {
		
		return elecDao.selectElecInternetByElecInfoNo(elec_info_no);
	}

	@Override
	public int modifyElecInternet(ElecInternet elecInternet) {
		
		return elecDao.updateElecInternet(elecInternet);
	}

	@Override
	public ElecPhone findElecPhoneByElecInfoNo(String elec_info_no) {
		
		return elecDao.selectElecPhoneByElecInfoNo(elec_info_no);
	}

	@Override
	public int modifyElecPhone(ElecPhone elecPhone) {
		
		return elecDao.updateElecPhone(elecPhone);
	}

	@Override
	public SqlFindElec findElec(SqlFindElec sqlFindElec) {
		
		return elecDao.selectElec(sqlFindElec);
	}

}
