package telco.naree.dao;

import java.util.List;

import telco.naree.domain.JusoBuilding;

public interface CommonDao {
	
	
	/**
	 * 같은 학교의 이름이 있는지 찾아본다.
	 * @param schoolName
	 * @return true일경우 학교이름이 있다.
	 */
	public int searchSchool(String schoolName);

	
	/**
	 * 학교 등록하기
	 * @param schoolName
	 */
	public void registerSchool(String schoolName);
	
	/**
	 * 학교번호 읽어오기
	 * @param schoolName
	 * @return
	 */
	public int selectSchoolNo(String schoolName);
	
	/**
	 * 접속데이터 테이블(access_tb)에서 최근 시퀀스번호 찾기 
	 * @return
	 */
	public String selectAccessNo();
	
	/**
	 * 도로명주소 찾기
	 * @param searchWord 도로명, 건물명
	 * @return
	 */
	public List<JusoBuilding> selectJuso(String searchWord);
}
