package telco.naree.dao;

import telco.naree.domain.Access;
import telco.naree.domain.User;

public interface UserDao {
	
	/**
	 * 이용자 아이디로 이용자 검색하기
	 * @param user_id
	 * @return
	 */
	public User searchUser(String user_id);
	
	/**
	 * 이용자 등록하기
	 * @param user
	 */
	public void join(User user);
	
	/**
	 * 로그인 접속정보 등록하기
	 * @param access
	 */
	public void registerAccess(Access access);
	
}
