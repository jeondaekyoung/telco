package telco.naree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.CommonDao;
import telco.naree.domain.JusoBuilding;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDao commonDao;
	
	@Override
	public void searchSchool(String schoolName) {
		//학교 검색하여 학교 갯수 확인
		if(commonDao.searchSchool(schoolName) == 0){
			//학교가 없기때문에 학교 저장
			commonDao.registerSchool(schoolName);
		}
	}

	@Override
	public List<JusoBuilding> searchAddr(String searchWord) {
		
		return commonDao.selectJuso(searchWord);
	}

}
