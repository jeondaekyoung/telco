package telco.naree.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import telco.naree.dao.factory.ConnectionFactory;
import telco.naree.dao.mapper.CheckMapper;
import telco.naree.domain.CheckNo;
import telco.naree.domain.CheckPayment;
import telco.naree.domain.CheckPaymentBankTrade;
import telco.naree.domain.CheckPaymentCome;
import telco.naree.domain.CheckPaymentPublish;
import telco.naree.domain.CheckPublish;
import telco.naree.domain.CheckPublishDetail;

@Repository
public class CheckDaoImpl implements CheckDao {

	@Override
	public String selectCheckSeq() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String check_seq;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			check_seq = checkMapper.selectCheckSeq();
		}
		finally {
			sqlSession.close();
		}
		return check_seq;
	}
	
	@Override
	public int insertCheckNo(CheckNo checkNo) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckNo(checkNo);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public String selectCheckPublishNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String check_publish_no;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			check_publish_no = checkMapper.selectCheckPublishNo();
		}
		finally {
			sqlSession.close();
		}
		return check_publish_no;
	}

	@Override
	public int insertCheckPublish(CheckPublish checkPublish) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckPublish(checkPublish);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertCheckPublishDetail(CheckPublishDetail checkPublishDetail) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckPublishDetail(checkPublishDetail);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public String selectCheckPaymentNo() {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		String check_payment_no;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			check_payment_no = checkMapper.selectCheckPaymentNo();
		}
		finally {
			sqlSession.close();
		}
		return check_payment_no;
	}

	@Override
	public int insertCheckPayment(CheckPayment checkPayment) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckPayment(checkPayment);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertCheckPaymentCome(CheckPaymentCome checkPaymentCome) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckPaymentCome(checkPaymentCome);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertCheckPaymentPublish(CheckPaymentPublish checkPaymentPublish) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckPaymentPublish(checkPaymentPublish);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

	@Override
	public int insertCheckPaymentBankTrade(CheckPaymentBankTrade checkPaymentBankTrade) {
		SqlSession sqlSession = ConnectionFactory.getInstance().getSqlSession();
		int result;
		try{
			CheckMapper checkMapper = sqlSession.getMapper(CheckMapper.class);
			result = checkMapper.insertCheckPaymentBankTrade(checkPaymentBankTrade);
		}
		finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
	
}
