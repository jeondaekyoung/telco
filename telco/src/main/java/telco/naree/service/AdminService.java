package telco.naree.service;

import java.util.List;

import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;


public interface AdminService {

	/**
	 * 아이디 중복 조회
	 * @param user_id
	 * @return 사용중일 경우 false
	 */
	public boolean searchUserId(String user_id);
	
	/**
	 * 이용자 등록하기
	 * @param user
	 */
	public void registerUser(User user);
	
	
	/**
	 * 이용자 검색하기
	 * @param searchTerms
	 * @param startDay
	 * @param endDay
	 * @param usersName
	 * @return
	 */
	public List<SqlSearchUsers> searchUsers(String searchTerms, String startDay, String endDay, String usersName);
	
	/**
	 * 이용자 검색하기
	 * @param user_id
	 * @return
	 */
	public User infoUser(String user_id);
	
	/**
	 * 접속 정보 검색하기
	 * @param user_id
	 * @return
	 */
	public List<Access> infoAccess(String user_id);
	
	/**
	 * 비밀번호 초기화하기
	 * @param user_id
	 * @param user_pw
	 * @return
	 */
	public int pwInit(String user_id, String user_pw);
	
	/**
	 * 이용자 정보 수정하기
	 * @param user
	 * @return
	 */
	public int modifyUser(User user);
}
