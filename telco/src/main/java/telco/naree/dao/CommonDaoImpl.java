package telco.naree.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.CommonMapper;
import telco.naree.domain.JusoBuilding;

@Repository
public class CommonDaoImpl implements CommonDao {

	@Override
	public int searchSchool(String schoolName) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int resultCount = 0;
		try{
			CommonMapper commonMapper = sqlSession.getMapper(CommonMapper.class);
			resultCount = commonMapper.searchSchool(schoolName);
		}
		finally {
			sqlSession.close();
		}
		return resultCount;
	}

	@Override
	public void registerSchool(String schoolName) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		try {
			CommonMapper commonMapper = sqlSession.getMapper(CommonMapper.class);
			commonMapper.registerSchool(schoolName);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}		
	}

	@Override
	public int selectSchoolNo(String schoolName) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int school_no;
		try {
			CommonMapper commonMapper = sqlSession.getMapper(CommonMapper.class);
			school_no = commonMapper.selectSchoolNo(schoolName);
		}
		finally {
			sqlSession.close();
		}
		return school_no;
	}

	@Override
	public String selectAccessNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String nextAccessNo;
		try{
			CommonMapper commonMapper = sqlSession.getMapper(CommonMapper.class);
			nextAccessNo = commonMapper.selectAccessNo();
		}
		finally{
			sqlSession.close();
		}
		return nextAccessNo;
	}

	@Override
	public List<JusoBuilding> selectJuso(String searchWord) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<JusoBuilding> jusos = new ArrayList<JusoBuilding>();
		try{
			CommonMapper commonMapper = sqlSession.getMapper(CommonMapper.class);
			jusos = commonMapper.selectJuso(searchWord);
		}
		finally{
			sqlSession.close();
		}
		return jusos;
	}

}
