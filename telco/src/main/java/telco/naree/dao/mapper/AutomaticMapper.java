package telco.naree.dao.mapper;

import java.util.List;
import java.util.Map;

import telco.naree.domain.Atcng;

public interface AutomaticMapper {

	public int insertAtcng(Atcng atcng);

	public List<Atcng> selectAtcngs(Map<String, String> terms);

	public int cancelAtcng(String seq_no);

	public Atcng selectAtcng(String seq_no);

	public int updateAtcng(Atcng atcng);


}
