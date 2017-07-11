package telco.naree.dao;

import java.util.List;

import telco.naree.domain.Atcng;

public interface AutomaticDao {

	/**
	 * 자동이체정보 테이블에 삽입하기
	 * @param atcng
	 * @return
	 */
	public int insertAtcng(Atcng atcng);

	/**
	 * 자동이체정보 조회하기
	 * @param busi_kind
	 * @param account_num
	 * @return
	 */
	public List<Atcng> selectAtcngs(String busi_kind, String account_num);

	/**
	 * 자동이체정보 조회하기(사용중만 조회)
	 * @param busi_kind
	 * @param account_num
	 * @param using_or
	 * @return
	 */
	public Object selectAtcngs(String busi_kind, String account_num, String using_or);

	/**
	 * 자동이체 해지하기
	 * @param seq_no
	 * @return
	 */
	public int cancelAtcng(String seq_no);

	/**
	 * 시퀀스 넘버로 자동이체 조회하기
	 * @param seq_no
	 * @return
	 */
	public Atcng selectAtcng(String seq_no);

	/**
	 * 자동이체 변경하기
	 * @param atcng
	 * @return
	 */
	public int updateAtcng(Atcng atcng);

}
