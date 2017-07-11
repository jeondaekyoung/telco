package telco.naree.dao;

import org.junit.Test;

import telco.naree.domain.User;

public class UserDaoImplTest {
	
	@Test
	public void testSearchUser(){
		UserDao userDao = new UserDaoImpl();
		String user_id = "html";
		
		User resultUser = userDao.searchUser(user_id);
		System.out.println(resultUser.toString());
	}
	
	@Test
	public void testJoin(){
		User user = new User();
		user.setUser_id("JavaScript");
		user.setUser_pw("JavaScript123");
		user.setUser_name("자바스크립트");
		user.setEmail_address("javascript@naver.com");
		//user.setGrade(2);
		user.setAffiliation("프론트");
		//user.setBan(2);
		//user.setNum(5);
		user.setUser_sepa("학생");
		user.setSchool_name("하버드");
		
		UserDao userDao = new UserDaoImpl();
		userDao.join(user);
		
	}

}
