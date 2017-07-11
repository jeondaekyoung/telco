package telco.naree.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;

public class AdminDaoImplTest {

	@Test
	public void testSearchUsers(){
		AdminDao adminDao = new AdminDaoImpl();
		List<SqlSearchUsers> users = adminDao.searchUsers("2015-06-16", "2015-06-20");
		
		for(SqlSearchUsers u : users){
			System.out.println(u.toString());
		}
	}
	
	@Test
	public void testInfoUser(){
		AdminDao adminDao = new AdminDaoImpl();
		User user = adminDao.infoUser("11");
		System.out.println(user.toString());
	}
	
	@Test
	public void testInfoAccess(){
		AdminDao adminDao = new AdminDaoImpl();
		List<Access> accesss = adminDao.infoAccess("11");
		for(Access a : accesss){
			System.out.println(a.toString());
		}
	}
	
	@Test
	public void testPwInit(){
		AdminDao adminDao = new AdminDaoImpl();
		String user_id = "11";
		String user_pw = "44";
		adminDao.pwInit(user_id, user_pw);
	}
	
	@Test
	public void testUpdateUser() throws ParseException{
		AdminDao adminDao = new AdminDaoImpl();
		User user = new User();
		user.setUser_id("11");
		user.setUser_name("7");
		user.setUser_sepa("교사");
		//user.setGrade(7);
		user.setAffiliation("7");
		//user.setBan(7);
		//user.setNum(7);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = format.parse("2015-06-07");
		java.sql.Date sql = new java.sql.Date(parsed.getTime());
		user.setJoin_date(sql);
		
		
		User resultUser = adminDao.infoUser("11");
		System.out.println(resultUser.toString());
		System.out.println(user.toString());
		adminDao.updateUser(user);
		resultUser = adminDao.infoUser("11");
		System.out.println(resultUser.toString());		
	}
	
}
