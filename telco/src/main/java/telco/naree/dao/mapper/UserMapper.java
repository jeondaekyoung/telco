package telco.naree.dao.mapper;

import telco.naree.domain.Access;
import telco.naree.domain.User;

public interface UserMapper {

	public User searchUser(String user_id);
	
	public void join(User user);
	
	public void registerAccess(Access access);
}
