package telco.naree.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.AutomaticMapper;
import telco.naree.domain.Atcng;

@Repository
public class AutomaticDaoImpl implements AutomaticDao {

	@Override
	public int insertAtcng(Atcng atcng) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			AutomaticMapper automaticMapper = sqlSession.getMapper(AutomaticMapper.class);
			result = automaticMapper.insertAtcng(atcng);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public List<Atcng> selectAtcngs(String busi_kind, String account_num) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<Atcng> atcngs = null;
		Map<String, String> terms = new HashMap<String, String>();
		terms.put("busi_kind", busi_kind);
		terms.put("account_num", account_num);
		try{
			AutomaticMapper automaticMapper = sqlSession.getMapper(AutomaticMapper.class);
			atcngs = automaticMapper.selectAtcngs(terms);
		}
		finally {
			sqlSession.close();
		}
		return atcngs;
	}

	@Override
	public Object selectAtcngs(String busi_kind, String account_num, String using_or) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<Atcng> atcngs = null;
		Map<String, String> terms = new HashMap<String, String>();
		terms.put("busi_kind", busi_kind);
		terms.put("account_num", account_num);
		terms.put("using_or", using_or);
		try{
			AutomaticMapper automaticMapper = sqlSession.getMapper(AutomaticMapper.class);
			atcngs = automaticMapper.selectAtcngs(terms);
		}
		finally {
			sqlSession.close();
		}
		return atcngs;
	}

	@Override
	public int cancelAtcng(String seq_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			AutomaticMapper automaticMapper = sqlSession.getMapper(AutomaticMapper.class);
			result = automaticMapper.cancelAtcng(seq_no);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public Atcng selectAtcng(String seq_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		Atcng atcng = null;
		try{
			AutomaticMapper automaticMapper = sqlSession.getMapper(AutomaticMapper.class);
			atcng = automaticMapper.selectAtcng(seq_no);
		}
		finally {
			sqlSession.close();
		}
		return atcng;
	}

	@Override
	public int updateAtcng(Atcng atcng) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			AutomaticMapper automaticMapper = sqlSession.getMapper(AutomaticMapper.class);
			result = automaticMapper.updateAtcng(atcng);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

}
