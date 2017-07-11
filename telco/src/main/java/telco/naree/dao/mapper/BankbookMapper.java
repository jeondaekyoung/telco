package telco.naree.dao.mapper;

import java.util.List;

import telco.naree.domain.BankbookInfo;
import telco.naree.domain.BankbookReissue;
import telco.naree.domain.BankbookTrade;
import telco.naree.domain.BankbookTradeDetail;
import telco.naree.domain.CustomerBasics;
import telco.naree.domain.EtcAntiMoneyLaundering;
import telco.naree.domain.PymntBankTrade;
import telco.naree.domain.PymntCheck;
import telco.naree.domain.RcpmnyCheck;
import telco.naree.domain.RcpmnyDetail;

public interface BankbookMapper {

	public CustomerBasics selectCustomer(String realname_num);
	
	public String selectAccountNum();
	
	public int insertBankbookInfo(BankbookInfo bankbookInfo);
	
	public String selectTradeNo();
	
	public int insertBankbookTrade(BankbookTrade bankbookTrade);
	
	public String selectTradeDetailNo();
	
	public int insertBankbookTradeDetail(BankbookTradeDetail bankbookTradeDetail);
	
	public int insertEtcAntiMoney(EtcAntiMoneyLaundering etcAntiMoney);
	
	public BankbookInfo selectBankbookInfo(String account_num);
	
	public CustomerBasics selectCustomerByCustomerNo(String customer_no);
	
	public int updateBankbookInfo(BankbookInfo bankbookInfo);
	
	public int insertRcpmnyDetail(RcpmnyDetail rcpmnyDetail);
	
	public int insertRcpmnyCheck(RcpmnyCheck rcpmnyCheck);
	
	public int insertPymntCheck(PymntCheck pymntCheck);
	
	public int insertPymntBankTrade(PymntBankTrade pymntBankTrade);

	public List<BankbookTrade> selectBankbookTrades(String account_num);

	public int insertBankbookReissue(BankbookReissue bankbookReissue);
}
