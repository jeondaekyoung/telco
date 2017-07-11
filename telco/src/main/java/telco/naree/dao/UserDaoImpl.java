package telco.naree.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.UserMapper;
import telco.naree.domain.Access;
import telco.naree.domain.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public User searchUser(String user_id) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		User user = null;
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			user = userMapper.searchUser(user_id);
		}
		finally {
			sqlSession.close();
		}
		return user;
	}

	@Override
	public void join(User user) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.join(user);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
	}

	@Override
	public void registerAccess(Access access) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		try{
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			userMapper.registerAccess(access);
		}
		finally{
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
