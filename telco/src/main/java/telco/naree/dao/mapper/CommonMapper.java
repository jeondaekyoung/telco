package telco.naree.dao.mapper;

import java.util.List;

import telco.naree.domain.JusoBuilding;

public interface CommonMapper {

	public int searchSchool(String schoolName);
	
	public void registerSchool(String schoolName);
	
	public int selectSchoolNo(String schoolName);
	
	public String selectAccessNo();
	
	public List<JusoBuilding> selectJuso(String searchWord);
}
