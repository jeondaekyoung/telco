package telco.naree.service;

import java.util.List;

import telco.naree.domain.JusoBuilding;

public interface CommonService {

	
	/**
	 * 학교관련 메소드
	 */
	//학교 검색하여 갯수를 반환
	public void searchSchool(String schoolName);
	
	/**
	 * 도로명주소 검색하기
	 * @param searchWord 도로명, 건물명
	 * @return
	 */
	public List<JusoBuilding> searchAddr(String searchWord);
}
