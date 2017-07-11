package telco.naree.dao.mapper;

import java.util.List;
import java.util.Map;

import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;

public interface AdminMapper {

	public void registerUser(User user);
	
	public List<SqlSearchUsers> searchUsersMap(Map<String, String> terms);
	
	public List<SqlSearchUsers> searchUsersName(String usersName);
	
	public User infoUser(String user_id);
	
	public List<Access> infoAccess(String user_id);
	
	public int pwInit(Map<String, String> items);
	
	public int updateUser(User user);
	
}
