package telco.naree.service;

import telco.naree.domain.Access;
import telco.naree.domain.User;


public interface UserService {

	/**
	 * 이용자 가입하기
	 * 이용자 아이디를 중복검사하여 없으면 등록한다.
	 * @param user
	 * @return
	 */
	public boolean join(User user);
	

	/**
	 * 이용자 로그인하기
	 * 이용자아이디가 사용중인지, 비밀번호는 맞는지 확인한다.
	 * @param user_id
	 * @param user_pw
	 * @return
	 */
	public User login(String user_id, String user_pw);
	
	/**
	 * 접속정보 등록하기
	 * @param access
	 */
	public void registerAccess(Access access);
}
