package telco.naree.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.AdminMapper;
import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public void registerUser(User user) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			adminMapper.registerUser(user);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}

	@Override
	public List<SqlSearchUsers> searchUsers(String startDay, String endDay) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<SqlSearchUsers> sqlSearchUsers;
		Map<String, String> terms = new HashMap<String, String>();
		terms.put("startDay", startDay);
		terms.put("endDay", endDay);
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			sqlSearchUsers = adminMapper.searchUsersMap(terms);
		}
		finally{
			sqlSession.close();
		}
		return sqlSearchUsers;
	}

	@Override
	public List<SqlSearchUsers> searchUsers(String usersName) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<SqlSearchUsers> sqlSearchUsers;
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			sqlSearchUsers = adminMapper.searchUsersName(usersName);
		}
		finally{
			sqlSession.close();
		}
		return sqlSearchUsers;
	}

	@Override
	public User infoUser(String user_id) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		User user;
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			user = adminMapper.infoUser(user_id);
		}
		finally{
			sqlSession.close();
		}
		return user;
	}

	@Override
	public List<Access> infoAccess(String user_id) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<Access> accesss;
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			accesss = adminMapper.infoAccess(user_id);
		}
		finally{
			sqlSession.close();
		}
		return accesss;
	}

	@Override
	public int pwInit(String user_id, String user_pw) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		Map<String, String> items = new HashMap<String, String>();
		items.put("user_id", user_id);
		items.put("user_pw", user_pw);
		int result = 0;
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			result = adminMapper.pwInit(items);
			System.out.println("결과-" + result);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int updateUser(User user) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result = 0;
		try{
			AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
			result = adminMapper.updateUser(user);
			System.out.println("결과-" + result);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
}
