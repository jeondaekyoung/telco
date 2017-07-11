package telco.naree.service;

import java.util.List;

import telco.naree.domain.Atcng;

public interface AutomaticService {

	/**
	 * 자동이체 등록하기
	 * @param atcng
	 * @return
	 */
	public int registerAtcng(Atcng atcng);

	/**
	 * 자동이체 조회하기
	 * @param busi_kind
	 * @param account_num
	 * @return
	 */
	public List<Atcng> findAtcngs(String busi_kind, String account_num);

	/**
	 * 자동이체 조회하기(사용중만 조회)
	 * @param busi_kind
	 * @param account_num
	 * @param using_or
	 * @return
	 */
	public Object findAtcngs(String busi_kind, String account_num, String using_or);

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
	public Atcng findAtcngBySeqNo(String seq_no);

	/**
	 * 자동이체 변경하기
	 * @param atcng
	 * @return
	 */
	public int modifyAtcng(Atcng atcng);

}
