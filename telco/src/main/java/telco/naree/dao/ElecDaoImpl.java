package telco.naree.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.ElecMapper;
import telco.naree.domain.ElecInfo;
import telco.naree.domain.ElecInternet;
import telco.naree.domain.ElecPhone;
import telco.naree.domain.SqlFindElec;
import telco.naree.domain.SqlSearchElecs;

@Repository
public class ElecDaoImpl implements ElecDao {

	@Override
	public String selectElecInfoNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String elec_info_no;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elec_info_no = elecMapper.selectElecInfoNo();
		}
		finally {
			sqlSession.close();
		}
		return elec_info_no;
	}

	@Override
	public int insertElecInfo(ElecInfo elecInfo) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.insertElecInfo(elecInfo);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertElecInternet(ElecInternet elecInternet) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.insertElecInternet(elecInternet);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertElecPhone(ElecPhone elecPhone) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.insertElecPhone(elecPhone);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;		
		
	}

	@Override
	public List<SqlSearchElecs> selectElecsByCustomerNo(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		List<SqlSearchElecs> elecs = null;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elecs = elecMapper.selectElecsByCustomerNo(customer_no);
		}
		finally {
			sqlSession.close();
		}
		return elecs;
	}

	@Override
	public ElecInfo findElecInfo(String customer_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		ElecInfo elecInfo = null;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elecInfo = elecMapper.selectElecInfo(customer_no);
		}
		finally {
			sqlSession.close();
		}
		return elecInfo;
		
	}

	@Override
	public int updateElecInfo(ElecInfo elecInfo) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.updateElecInfo(elecInfo);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;		
	}

	@Override
	public ElecInternet selectElecInternet(String elec_internet_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		ElecInternet elecInternet = null;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elecInternet = elecMapper.selectElecInternet(elec_internet_no);
		}
		finally {
			sqlSession.close();
		}
		return elecInternet;
	}

	@Override
	public int cancelElecInternet(ElecInternet elecInternet) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.cancelElecInternet(elecInternet);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;		
	}

	@Override
	public ElecPhone selectElecPhone(String elec_phone_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		ElecPhone elecPhone = null;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elecPhone = elecMapper.selectElecPhone(elec_phone_no);
		}
		finally {
			sqlSession.close();
		}
		return elecPhone;
	}

	@Override
	public int cancelElecPhone(ElecPhone elecPhone) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.cancelElecPhone(elecPhone);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int selectElecId(String elec_id) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.selectElecId(elec_id);
		}
		finally {
			sqlSession.close();
		}
		return result;
	}

	@Override
	public ElecInternet selectElecInternetByElecInfoNo(String elec_info_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		ElecInternet elecInternet = null;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elecInternet = elecMapper.selectElecInternetByElecInfoNo(elec_info_no);
		}
		finally {
			sqlSession.close();
		}
		return elecInternet;
	}

	@Override
	public int updateElecInternet(ElecInternet elecInternet) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.updateElecInternet(elecInternet);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public ElecPhone selectElecPhoneByElecInfoNo(String elec_info_no) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		ElecPhone elecPhone = null;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			elecPhone = elecMapper.selectElecPhoneByElecInfoNo(elec_info_no);
		}
		finally {
			sqlSession.close();
		}
		return elecPhone;
	}

	@Override
	public int updateElecPhone(ElecPhone elecPhone) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			result = elecMapper.updateElecPhone(elecPhone);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public SqlFindElec selectElec(SqlFindElec sqlFindElec) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		
		try{
			ElecMapper elecMapper = sqlSession.getMapper(ElecMapper.class);
			sqlFindElec = elecMapper.selectFindElec(sqlFindElec);
		}
		finally {
			sqlSession.close();
		}
		return sqlFindElec;
	}



}
