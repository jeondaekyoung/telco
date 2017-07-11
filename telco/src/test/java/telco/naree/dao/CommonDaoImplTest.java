package telco.naree.dao;

import java.util.List;

import org.junit.Test;

import telco.naree.domain.JusoBuilding;

public class CommonDaoImplTest {

	@Test
	public void testSearchSchool(){
		CommonDao commonDao = new CommonDaoImpl();
		int resultCnt = commonDao.searchSchool("드림");
		System.out.println("결과 - " + resultCnt);
	}
	
	@Test
	public void testRegisterSchool(){
		CommonDao commonDao = new CommonDaoImpl();
		String schoolName = "드림하이";
		commonDao.registerSchool(schoolName);
	}
	
	@Test
	public void testSelectSchoolNo(){
		CommonDao commonDao = new CommonDaoImpl();
		String schoolName = "드림하이";
		int result = commonDao.selectSchoolNo(schoolName);
		System.out.println("결과 - " + result);
	}
	
	@Test
	public void testSelectAccessNo(){
		CommonDao commonDao = new CommonDaoImpl();
		String nextAccessNo = commonDao.selectAccessNo();
		System.out.println("결과 - *" + nextAccessNo + "*");
	}
	
	@Test
	public void testSelectJuso(){
		CommonDao commonDao = new CommonDaoImpl();
		List<JusoBuilding> results = commonDao.selectJuso("금화");
		
		for(JusoBuilding j : results){
			//System.out.println(j.toString());
		}
		
		System.out.println(results.size());
		
	}
	
}
