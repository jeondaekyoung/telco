package telco.naree.dao;

import java.util.List;

import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;

public interface AdminDao {
	
	
	/**
	 * 이용자 등록하기
	 * @param user
	 */
	public void registerUser(User user);
	
	/**
	 * 이용자 검색하기(접속일로 조회)
	 * @param startDay
	 * @param endDay
	 * @return
	 */
	public List<SqlSearchUsers> searchUsers(String startDay, String endDay);

	/**
	 * 이용자 검색하기(성명으로 조회)
	 * @param usersName
	 * @return
	 */
	public List<SqlSearchUsers> searchUsers(String usersName);
	
	/**
	 * 이용자 검색하기
	 * @param user_id
	 * @return
	 */
	public User infoUser(String user_id);
	
	/**
	 * 접속정보 검색하기
	 * @param user_id
	 * @return
	 */
	public List<Access> infoAccess(String user_id);
	
	/**
	 * 이용자 비밀번호 초기화하기
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
	public int updateUser(User user);
}
