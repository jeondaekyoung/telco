package telco.naree.dao.mapper;

import telco.naree.domain.CheckNo;
import telco.naree.domain.CheckPayment;
import telco.naree.domain.CheckPaymentBankTrade;
import telco.naree.domain.CheckPaymentCome;
import telco.naree.domain.CheckPaymentPublish;
import telco.naree.domain.CheckPublish;
import telco.naree.domain.CheckPublishDetail;

public interface CheckMapper {

	public String selectCheckSeq();
	
	public int insertCheckNo(CheckNo checkNo);
	
	public String selectCheckPublishNo();
	
	public int insertCheckPublish(CheckPublish checkPublish);

	public int insertCheckPublishDetail(CheckPublishDetail checkPublishDetail);

	public String selectCheckPaymentNo();

	public int insertCheckPayment(CheckPayment checkPayment);

	public int insertCheckPaymentCome(CheckPaymentCome checkPaymentCome);

	public int insertCheckPaymentPublish(CheckPaymentPublish checkPaymentPublish);

	public int insertCheckPaymentBankTrade(CheckPaymentBankTrade checkPaymentBankTrade);
}
