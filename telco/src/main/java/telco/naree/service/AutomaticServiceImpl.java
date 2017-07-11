package telco.naree.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import telco.naree.dao.AutomaticDao;
import telco.naree.domain.Atcng;

@Service
public class AutomaticServiceImpl implements AutomaticService {

	@Autowired
	private AutomaticDao automaticDao;
	
	@Override
	public int registerAtcng(Atcng atcng) {
		
		return automaticDao.insertAtcng(atcng);
	}

	@Override
	public List<Atcng> findAtcngs(String busi_kind, String account_num) {
		
		return automaticDao.selectAtcngs(busi_kind, account_num);
	}

	@Override
	public Object findAtcngs(String busi_kind, String account_num, String using_or) {
		
		return automaticDao.selectAtcngs(busi_kind, account_num, using_or);
	}

	@Override
	public int cancelAtcng(String seq_no) {
		
		return automaticDao.cancelAtcng(seq_no);
	}

	@Override
	public Atcng findAtcngBySeqNo(String seq_no) {
		
		return automaticDao.selectAtcng(seq_no);
	}

	@Override
	public int modifyAtcng(Atcng atcng) {
		
		return automaticDao.updateAtcng(atcng);
	}

}
