package telco.naree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.AdminDao;
import telco.naree.dao.UserDao;
import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;
import telco.naree.exception.TelcoWebException;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public boolean searchUserId(String user_id) {
		User user = userDao.searchUser(user_id);
		if(user == null){
			return true;
		} else {
			return false; 
		}
	}

	@Override
	public void registerUser(User user) {
		adminDao.registerUser(user);
		
	}

	@Override
	public List<SqlSearchUsers> searchUsers(String searchTerms, String startDay, String endDay, String usersName) {
		List<SqlSearchUsers> users;
		if("searchDay".equals(searchTerms)){
			System.out.println("searchDay");
			users = adminDao.searchUsers(startDay, endDay);
		} else {
			System.out.println("searchName");
			users = adminDao.searchUsers(usersName);
		}
		
		for(SqlSearchUsers s : users){
			System.out.println(s.toString());
		}
		return users;
	}

	@Override
	public User infoUser(String user_id) {
		
		return adminDao.infoUser(user_id);
	}

	@Override
	public List<Access> infoAccess(String user_id) {
		
		return adminDao.infoAccess(user_id);
	}

	@Override
	public int pwInit(String user_id, String user_pw) {
		int result = adminDao.pwInit(user_id, user_pw);
		if(result != 1){
			throw new TelcoWebException("실행 중 오류가 발생했습니다.");
		}
		return result;
	}

	@Override
	public int modifyUser(User user) {
		int result = adminDao.updateUser(user);
		if(result != 1){
			throw new TelcoWebException("실행 중 오류가 발생했습니다.");
		}
		return result;
	}
}
