package telco.naree.service;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.CommonDao;
import telco.naree.dao.UserDao;
import telco.naree.domain.Access;
import telco.naree.domain.User;
import telco.naree.exception.TelcoWebException;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CommonDao commonDao;

	@Override
	public boolean join(User user) {
		if(userDao.searchUser(user.getUser_id()) == null) {
			userDao.join(user);
		} else {
			return false;
		}		
		return true;
	}

	@Override
	public User login(String user_id, String user_pw) {
		User user = userDao.searchUser(user_id);
		if(user != null) {
			if(user.getUser_pw().equals(user_pw)){
				return user;
			} else {
				throw new TelcoWebException("잘못된 패스워드입니다.");
			}
		} else {
			throw new TelcoWebException("존재하지 않는 아이디입니다.");
		}
	}

	@Override
	public void registerAccess(Access access) {
		String accessNo = commonDao.selectAccessNo();
		//System.out.println("쩝" + commonDao.selectAccessNo());
		if(accessNo == null){
			//오늘날짜구하기
			Calendar cal = java.util.Calendar.getInstance();
			StringBuffer today = new StringBuffer();
			int nYear = cal.get(Calendar.YEAR);
			int nMonth = cal.get(Calendar.MONTH)+1;
			int nDay = cal.get(Calendar.DAY_OF_MONTH);
			today.append(nYear);
			if(nMonth<10) today.append("0");
			today.append(nMonth);
			if(nDay<10) today.append("0");
			today.append(nDay);
			today.append("000000001");
			accessNo = today.toString();
			System.out.println(accessNo);
			
		} else {
			String nextNoBefore = accessNo.substring(0, 8);
			String nextNoAfter = accessNo.substring(8);
			int nextNo = Integer.parseInt(nextNoAfter);
			accessNo = nextNoBefore.concat(String.format("%09d", nextNo+1));
			//System.out.println(accessNo);
		}
		access.setSequence_no(accessNo);
		
		userDao.registerAccess(access);

		
	}
}
